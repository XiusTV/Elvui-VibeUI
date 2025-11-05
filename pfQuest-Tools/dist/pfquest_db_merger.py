#!/usr/bin/env python3
"""
pfQuest Database Merger
Monitors Ascension.exe and automatically merges captured quest data into pfDB addon files when the game closes.
"""

import os
import time
import psutil
import re
from pathlib import Path
from datetime import datetime

# Configuration
GAME_EXE = "Ascension.exe"
GAME_PATH = r"E:\Games\Ascension\Live"
ADDON_PATH = r"E:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk"
SAVED_VARS_PATTERN = r"E:\Games\Ascension\Live\WTF\Account\*\SavedVariables\pfQuest-wotlk.lua"
CHECK_INTERVAL = 5  # Check every 5 seconds
COOLDOWN_AFTER_CLOSE = 10  # Wait 10 seconds after game closes before processing

# Note: This script is in Interface/pfQuest-Tools but works with AddOns/pfQuest-wotlk

def log(message):
    """Print timestamped log message"""
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")

def is_game_running():
    """Check if Ascension.exe is currently running"""
    for proc in psutil.process_iter(['name']):
        try:
            if proc.info['name'] == GAME_EXE:
                return True
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            pass
    return False

def find_saved_variables():
    """Find the pfQuest-wotlk SavedVariables file"""
    import glob
    
    # Search for SavedVariables file in all accounts
    pattern = os.path.join(GAME_PATH, "WTF", "Account", "*", "SavedVariables", "pfQuest-wotlk.lua")
    files = glob.glob(pattern)
    
    if files:
        # Return the most recently modified file
        return max(files, key=os.path.getmtime)
    return None

def parse_lua_table(content, var_name):
    """
    Parse a Lua table from SavedVariables content
    Returns a dict representation
    """
    # Find the variable declaration
    pattern = rf'{var_name}\s*=\s*(\{{.*?\n\}})'
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        return None
    
    table_content = match.group(1)
    
    # This is a simplified parser - for production, consider using a proper Lua parser
    # For now, we'll extract the raw content and preserve it
    return table_content

def extract_injected_data(saved_vars_file):
    """Extract pfQuest_InjectedData from SavedVariables file"""
    try:
        with open(saved_vars_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Find pfQuest_InjectedData table
        pattern = r'pfQuest_InjectedData\s*=\s*(\{.*?\n\})\s*(?:\n|$)'
        match = re.search(pattern, content, re.DOTALL)
        
        if not match:
            log("No pfQuest_InjectedData found in SavedVariables")
            return None
        
        data_block = match.group(1)
        
        # Parse the structure to extract quests and units
        result = {
            'quests': {'loc': {}, 'data': {}},
            'units': {'loc': {}, 'data': {}}
        }
        
        # Extract quest IDs from the data
        quest_ids = set()
        npc_ids = set()
        
        # Find all quest IDs in quests.loc
        loc_pattern = r'\["loc"\]\s*=\s*\{([^}]*)\}'
        loc_match = re.search(loc_pattern, data_block, re.DOTALL)
        if loc_match:
            loc_content = loc_match.group(1)
            quest_id_pattern = r'\[(\d+)\]'
            quest_ids.update(re.findall(quest_id_pattern, loc_content))
        
        # Find all NPC IDs in units.loc
        units_pattern = r'\["units"\].*?\["loc"\]\s*=\s*\{([^}]*)\}'
        units_match = re.search(units_pattern, data_block, re.DOTALL)
        if units_match:
            units_content = units_match.group(1)
            npc_id_pattern = r'\[(\d+)\]'
            npc_ids.update(re.findall(npc_id_pattern, units_content))
        
        result['raw_data'] = data_block
        result['quest_ids'] = list(quest_ids)
        result['npc_ids'] = list(npc_ids)
        
        return result
        
    except Exception as e:
        log(f"Error reading SavedVariables: {e}")
        return None

def parse_injected_data_detailed(content):
    """
    Parse pfQuest_InjectedData in detail to extract individual quest and NPC data
    """
    result = {
        'quests': {'loc': {}, 'data': {}},
        'units': {'loc': {}, 'data': {}}
    }
    
    # Extract the full pfQuest_InjectedData block
    pattern = r'pfQuest_InjectedData\s*=\s*(\{.*?\n\})\s*(?:\n|$)'
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        return None
    
    data_block = match.group(1)
    
    # Parse quests.loc entries
    quests_loc_pattern = r'\["quests"\].*?\["loc"\]\s*=\s*\{(.*?)\}.*?\["data"\]'
    quests_loc_match = re.search(quests_loc_pattern, data_block, re.DOTALL)
    
    if quests_loc_match:
        loc_content = quests_loc_match.group(1)
        # Extract individual quest locale entries
        quest_entry_pattern = r'\[(\d+)\]\s*=\s*\{(.*?)\}(?:,|\s*\[|\s*\})'
        for qid_match in re.finditer(quest_entry_pattern, loc_content, re.DOTALL):
            qid = qid_match.group(1)
            entry_content = qid_match.group(2)
            result['quests']['loc'][qid] = '{' + entry_content + '}'
    
    # Parse quests.data entries
    quests_data_pattern = r'\["data"\]\s*=\s*\{(.*?)\}.*?\},\s*\["units"\]'
    quests_data_match = re.search(quests_data_pattern, data_block, re.DOTALL)
    
    if quests_data_match:
        data_content = quests_data_match.group(1)
        # Extract individual quest data entries
        quest_data_pattern = r'\[(\d+)\]\s*=\s*\{(.*?)\}(?:,|\s*\[|\s*\})'
        for qid_match in re.finditer(quest_data_pattern, data_content, re.DOTALL):
            qid = qid_match.group(1)
            entry_content = qid_match.group(2)
            result['quests']['data'][qid] = '{' + entry_content + '}'
    
    # Parse units.loc entries
    units_loc_pattern = r'\["units"\].*?\["loc"\]\s*=\s*\{(.*?)\}.*?\["data"\]'
    units_loc_match = re.search(units_loc_pattern, data_block, re.DOTALL)
    
    if units_loc_match:
        loc_content = units_loc_match.group(1)
        # Extract individual unit locale entries
        unit_entry_pattern = r'\[(\d+)\]\s*=\s*"([^"]*)"'
        for npc_match in re.finditer(unit_entry_pattern, loc_content):
            npc_id = npc_match.group(1)
            npc_name = npc_match.group(2)
            result['units']['loc'][npc_id] = npc_name
    
    # Parse units.data entries
    units_data_pattern = r'\["units"\].*?\["data"\]\s*=\s*\{(.*?)\}\s*\}'
    units_data_match = re.search(units_data_pattern, data_block, re.DOTALL)
    
    if units_data_match:
        data_content = units_data_match.group(1)
        # Extract individual unit data entries
        unit_data_pattern = r'\[(\d+)\]\s*=\s*\{(.*?coords.*?)\}(?:,|\s*\[|\s*\})'
        for npc_match in re.finditer(unit_data_pattern, data_content, re.DOTALL):
            npc_id = npc_match.group(1)
            entry_content = npc_match.group(2)
            result['units']['data'][npc_id] = '{' + entry_content + '}'
    
    return result

def generate_captured_db_file(injected_data, saved_vars_file):
    """Generate a pfDB-compatible Lua file from injected data"""
    
    # Read the full SavedVariables to parse properly
    with open(saved_vars_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    parsed_data = parse_injected_data_detailed(content)
    
    if not parsed_data:
        log("Failed to parse injected data")
        return None
    
    # Generate the output file
    output = []
    output.append("-- pfQuest Captured Quest Database")
    output.append("-- Auto-generated from player-captured quest data")
    output.append(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append("")
    output.append("-- Quest Locale Data")
    output.append('pfDB = pfDB or {quests = {loc = {}, data = {}}, units = {loc = {}, data = {}}}')
    output.append('pfDB["quests"] = pfDB["quests"] or {}')
    output.append('pfDB["quests"]["loc"] = pfDB["quests"]["loc"] or {}')
    output.append("")
    
    # Add quest locale data
    for qid, loc_data in parsed_data['quests']['loc'].items():
        output.append(f'pfDB["quests"]["loc"][{qid}] = {loc_data}')
    
    output.append("")
    output.append("-- Quest Metadata")
    output.append('pfDB["quests"]["data"] = pfDB["quests"]["data"] or {}')
    output.append("")
    
    # Add quest metadata
    for qid, quest_data in parsed_data['quests']['data'].items():
        output.append(f'pfDB["quests"]["data"][{qid}] = {quest_data}')
    
    output.append("")
    output.append("-- NPC Locale Data")
    output.append('pfDB["units"] = pfDB["units"] or {}')
    output.append('pfDB["units"]["loc"] = pfDB["units"]["loc"] or {}')
    output.append("")
    
    # Add NPC locale data
    for npc_id, npc_name in parsed_data['units']['loc'].items():
        output.append(f'pfDB["units"]["loc"][{npc_id}] = "{npc_name}"')
    
    output.append("")
    output.append("-- NPC Data")
    output.append('pfDB["units"]["data"] = pfDB["units"]["data"] or {}')
    output.append("")
    
    # Add NPC data
    for npc_id, npc_data in parsed_data['units']['data'].items():
        output.append(f'pfDB["units"]["data"][{npc_id}] = {npc_data}')
    
    return '\n'.join(output)

def merge_into_pfdb(saved_vars_file):
    """Merge captured quest data into pfDB addon files"""
    
    log("Reading SavedVariables...")
    injected_data = extract_injected_data(saved_vars_file)
    
    if not injected_data:
        log("No captured quest data to merge")
        return False
    
    quest_count = len(injected_data.get('quest_ids', []))
    npc_count = len(injected_data.get('npc_ids', []))
    
    log(f"Found {quest_count} captured quests and {npc_count} NPCs")
    
    if quest_count == 0:
        log("No quests to merge")
        return False
    
    # Generate the captured database file
    log("Generating pfDB-compatible file...")
    db_content = generate_captured_db_file(injected_data, saved_vars_file)
    
    if not db_content:
        log("Failed to generate database content")
        return False
    
    # Create db/captured directory if it doesn't exist
    db_dir = os.path.join(ADDON_PATH, "db", "captured")
    os.makedirs(db_dir, exist_ok=True)
    
    # Write the captured database file
    output_file = os.path.join(db_dir, "quests.lua")
    
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(db_content)
        
        log(f"Successfully wrote captured quests to: {output_file}")
        
        # Update the .toc file to include the new database file
        update_toc_file(output_file)
        
        log(f"✓ Merged {quest_count} quests and {npc_count} NPCs into pfDB")
        return True
        
    except Exception as e:
        log(f"Error writing database file: {e}")
        return False

def update_toc_file(db_file):
    """Add the captured database file to the .toc if not already present"""
    toc_file = os.path.join(ADDON_PATH, "pfQuest-wotlk.toc")
    
    if not os.path.exists(toc_file):
        log("Warning: .toc file not found")
        return
    
    # Check if already included
    with open(toc_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    include_line = "db\\captured\\quests.lua"
    
    if include_line in content or "db/captured/quests.lua" in content:
        log(".toc already includes captured database")
        return
    
    # Add before the main init files
    lines = content.split('\n')
    insert_index = -1
    
    for i, line in enumerate(lines):
        if line.strip().startswith('init\\'):
            insert_index = i
            break
    
    if insert_index == -1:
        # Add at the end
        lines.append(include_line)
    else:
        # Add before init files
        lines.insert(insert_index, include_line)
    
    # Write back
    try:
        with open(toc_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))
        log("Updated .toc file to include captured database")
    except Exception as e:
        log(f"Error updating .toc file: {e}")

def monitor_game():
    """Main monitoring loop"""
    log("pfQuest Database Merger started")
    log(f"Monitoring for: {GAME_EXE}")
    log(f"Game path: {GAME_PATH}")
    log(f"Addon path: {ADDON_PATH}")
    log("")
    
    was_running = False
    last_merge_time = 0
    
    while True:
        try:
            is_running = is_game_running()
            
            if is_running and not was_running:
                log(f"✓ {GAME_EXE} started")
                was_running = True
            
            elif not is_running and was_running:
                log(f"✓ {GAME_EXE} closed")
                
                # Wait cooldown period for files to finish writing
                log(f"Waiting {COOLDOWN_AFTER_CLOSE} seconds for files to save...")
                time.sleep(COOLDOWN_AFTER_CLOSE)
                
                # Check if we should merge (avoid duplicate merges)
                current_time = time.time()
                if current_time - last_merge_time > 60:  # At least 1 minute between merges
                    # Find SavedVariables file
                    saved_vars = find_saved_variables()
                    
                    if saved_vars:
                        log(f"Found SavedVariables: {saved_vars}")
                        if merge_into_pfdb(saved_vars):
                            last_merge_time = current_time
                            log("✓ Merge complete!")
                        else:
                            log("No changes to merge")
                    else:
                        log("Warning: Could not find SavedVariables file")
                else:
                    log("Skipping merge (too soon since last merge)")
                
                was_running = False
                log("Waiting for game to start again...")
            
            time.sleep(CHECK_INTERVAL)
            
        except KeyboardInterrupt:
            log("\nShutting down...")
            break
        except Exception as e:
            log(f"Error: {e}")
            time.sleep(CHECK_INTERVAL)

if __name__ == "__main__":
    import sys
    
    # Check if paths exist
    if not os.path.exists(GAME_PATH):
        print(f"ERROR: Game path not found: {GAME_PATH}")
        print("Please update GAME_PATH in the script")
        exit(1)
    
    if not os.path.exists(ADDON_PATH):
        print(f"ERROR: Addon path not found: {ADDON_PATH}")
        print("Please update ADDON_PATH in the script")
        exit(1)
    
    # Check for manual merge flag
    if len(sys.argv) > 1 and sys.argv[1] == "--manual-merge":
        log("Manual merge mode")
        saved_vars = find_saved_variables()
        
        if saved_vars:
            log(f"Found SavedVariables: {saved_vars}")
            if merge_into_pfdb(saved_vars):
                log("✓ Manual merge complete!")
            else:
                log("No changes to merge")
        else:
            log("ERROR: Could not find SavedVariables file")
    else:
        monitor_game()

