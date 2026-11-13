require('workspace_keymap')
require('clipboard_typer_keymap')

local def = require("definitions")
local mainMod = def.keys.mainMod

function BindVmSubmap()
    hl.define_submap("vm", "reset", function()
        GlobalWorkspaceShortcutsBind()
        BindClipboardTyperKeys()
    end)

    hl.define_submap("vm", function()
        hl.bind(mainMod .. " + Q", function()
            hl.dispatch(hl.dsp.send_key_state({
                mods = "", key = "Alt_L", state = "down",
            }))
            hl.dispatch(hl.dsp.send_shortcut({
                mods = "ALT", key = "F4",
            }))
            hl.dispatch(hl.dsp.send_key_state({
                mods = "", key = "Alt_L", state = "up",
            }))
        end)
    end)
end

BindVmSubmap()

-- when in remmina conneciton or vm change keymap to one which binds workspace controls only
hl.on("window.active", function(w)
    local isRemote = w
        and w.class == "org.remmina.Remmina"
        and not w.title:find("Remmina Remote Desktop Client", 1, true)

    local isVirtManager = w
        and w.class == "virt-manager"
        and w.title:find("on", 1, true)

    if isRemote or isVirtManager then
        hl.dispatch(hl.dsp.submap("vm"))
    else
        hl.dispatch(hl.dsp.submap("reset"))
    end
end)
