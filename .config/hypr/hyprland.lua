-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

hl.monitor({
    output = "eDP-1",
    mode = "2880x1800@120.0",
    position = "0x0",
    scale = "1.333333"
})

-- hl.monitor({
--     output = "DP-1",
--     mode = "2560x1440@100.0",
--     position = "auto",
--     scale = "1"
-- })

hl.monitor({
    output = "desc:Iiyama North America PL2797Q 12501535C7444",
    mode = "2560x1440@100.0",
    position = "auto",
    scale = "1"
})

hl.monitor({
    output = "desc:ASUSTek COMPUTER INC ASUS PA279CV S5LMTF074732",
    mode = "3840x2160@60.0",
    position = "auto",
    scale = "1.2"
})

require('keymap')
require('workspace_keymap')
BindMainKeymapWorkspaceShortcuts()

require('laptop')
require('environment')
require('styling')
require("screenshot")
require("autostart")




-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.config({
    misc = {
        force_default_wallpaper = 0,     -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "pl",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad     = {
            natural_scroll = true,

        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
