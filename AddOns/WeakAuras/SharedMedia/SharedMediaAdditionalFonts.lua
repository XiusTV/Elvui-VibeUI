--[[

----
---- PLEASE READ BEFORE DOING ANYTHING ----
----

Only fonts should be added to this addon. If you wish to add textures, sounds,
... create your own addon or use an existing one if there is one.
All fonts must be able to display special characters such as é, è, à, ü, É, Ç,
... Remember that not all the users use the English client!

Don't add a font that you did not test. All fonts must be tested in game before
upload.

Thanks for your cooperation! ;-)
AllInOneMighty

]]

-- registrations for media from the client itself belongs in LibSharedMedia-3.0

if not SharedMediaAdditionalFonts then return end
local revision = tonumber(string.sub("$Revision: 63551 $", 12, -3))
SharedMediaAdditionalFonts.revision = (revision > SharedMediaAdditionalFonts.revision) and revision or SharedMediaAdditionalFonts.revision

-- -----
-- FONT
-- -----
SharedMediaAdditionalFonts:Register("font", "Accidental Presidency", [[Interface\Addons\WeakAuras\Media\Fonts\Accidental Presidency.ttf]])
SharedMediaAdditionalFonts:Register("font", "ACTION MAN", [[Interface\Addons\WeakAuras\Media\Fonts\ActionMan.ttf]])
SharedMediaAdditionalFonts:Register("font", "Alba Super", [[Interface\Addons\WeakAuras\Media\Fonts\ALBAS___.ttf]])
SharedMediaAdditionalFonts:Register("font", "Arm Wrestler", [[Interface\Addons\WeakAuras\Media\Fonts\ArmWrestler.ttf]])
SharedMediaAdditionalFonts:Register("font", "Baar Sophia", [[Interface\Addons\WeakAuras\Media\Fonts\BAARS___.TTF]])
SharedMediaAdditionalFonts:Register("font", "Blazed", [[Interface\Addons\WeakAuras\Media\Fonts\Blazed.ttf]])
SharedMediaAdditionalFonts:Register("font", "Boris Black Bloxx", [[Interface\Addons\WeakAuras\Media\Fonts\BorisBlackBloxx.ttf]])
SharedMediaAdditionalFonts:Register("font", "Boris Black Bloxx Dirty", [[Interface\Addons\WeakAuras\Media\Fonts\BorisBlackBloxxDirty.ttf]])
SharedMediaAdditionalFonts:Register("font", "Collegiate", [[Interface\Addons\WeakAuras\Media\Fonts\COLLEGIA.ttf]])
SharedMediaAdditionalFonts:Register("font", "Continuum Medium", [[Interface\Addons\WeakAuras\Media\Fonts\ContinuumMedium.ttf]])
SharedMediaAdditionalFonts:Register("font", "DejaVu Sans", [[Interface\Addons\WeakAuras\Media\Fonts\DejaVuSans.ttf]])
SharedMediaAdditionalFonts:Register("font", "DejaVu Sans, Bold", [[Interface\Addons\WeakAuras\Media\Fonts\DejaVuSans-Bold.ttf]])
SharedMediaAdditionalFonts:Register("font", "DieDieDie", [[Interface\Addons\WeakAuras\Media\Fonts\DieDieDie.ttf]])
SharedMediaAdditionalFonts:Register("font", "Diogenes", [[Interface\Addons\WeakAuras\Media\Fonts\DIOGENES.ttf]])
SharedMediaAdditionalFonts:Register("font", "Disko", [[Interface\Addons\WeakAuras\Media\Fonts\Disko.ttf]])
SharedMediaAdditionalFonts:Register("font", "Expressway, Bold", [[Interface\Addons\WeakAuras\Media\Fonts\Expressway-Bold.ttf]])
SharedMediaAdditionalFonts:Register("font", "Frakturika Spamless", [[Interface\Addons\WeakAuras\Media\Fonts\FRAKS___.ttf]])
SharedMediaAdditionalFonts:Register("font", "Homespun TT BRK", [[Interface\Addons\WeakAuras\Media\Fonts\Homespun.ttf]])
SharedMediaAdditionalFonts:Register("font", "Impact", [[Interface\Addons\WeakAuras\Media\Fonts\impact.ttf]])
SharedMediaAdditionalFonts:Register("font", "Liberation Sans", [[Interface\Addons\WeakAuras\Media\Fonts\LiberationSans-Regular.ttf]])
SharedMediaAdditionalFonts:Register("font", "Liberation Serif", [[Interface\Addons\WeakAuras\Media\Fonts\LiberationSerif-Regular.ttf]])
SharedMediaAdditionalFonts:Register("font", "Mystic Orbs", [[Interface\Addons\WeakAuras\Media\Fonts\MystikOrbs.ttf]])
SharedMediaAdditionalFonts:Register("font", "Pokemon Solid", [[Interface\Addons\WeakAuras\Media\Fonts\Pokemon Solid.ttf]])
SharedMediaAdditionalFonts:Register("font", "PT Sans Narrow, Bold", [[Interface\Addons\WeakAuras\Media\Fonts\PTSansNarrow-Bold.ttf]])
SharedMediaAdditionalFonts:Register("font", "Rock Show Whiplash", [[Interface\Addons\WeakAuras\Media\Fonts\Rock Show Whiplash.ttf]])
SharedMediaAdditionalFonts:Register("font", "SF Diego Sans", [[Interface\Addons\WeakAuras\Media\Fonts\SF Diego Sans.ttf]])
SharedMediaAdditionalFonts:Register("font", "Solange", [[Interface\Addons\WeakAuras\Media\Fonts\Solange.ttf]])
SharedMediaAdditionalFonts:Register("font", "Star Cine", [[Interface\Addons\WeakAuras\Media\Fonts\starcine.ttf]])
SharedMediaAdditionalFonts:Register("font", "Trashco", [[Interface\Addons\WeakAuras\Media\Fonts\trashco.ttf]])
SharedMediaAdditionalFonts:Register("font", "Ubuntu Condensed", [[Interface\Addons\WeakAuras\Media\Fonts\Ubuntu-C.ttf]])
-- Should be "Ubuntu, Light", but has historically bee named this way.
SharedMediaAdditionalFonts:Register("font", "Ubuntu Light", [[Interface\Addons\WeakAuras\Media\Fonts\Ubuntu-L.ttf]])
-- Should be "Waltograph UI, Bold", but has historically bee named this way.
SharedMediaAdditionalFonts:Register("font", "Waltograph UI", [[Interface\Addons\WeakAuras\Media\Fonts\waltographUI.ttf]])
SharedMediaAdditionalFonts:Register("font", "X360", [[Interface\Addons\WeakAuras\Media\Fonts\X360.ttf]])
SharedMediaAdditionalFonts:Register("font", "Yanone Kaffeesatz Regular", [[Interface\Addons\WeakAuras\Media\Fonts\YanoneKaffeesatz-Regular.ttf]])
