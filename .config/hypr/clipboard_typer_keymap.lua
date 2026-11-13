local def = require("definitions")
local mainMod = def.keys.mainMod

function BindClipboardTyperKeys()
    -- clipboard typer
    hl.bind(mainMod .. " + equal",
        hl.dsp.exec_cmd('sleep 1; ydotool type -d 25 "$(wl-paste)"'),
        { release = true }
    )

    hl.bind(mainMod .. " + minus", hl.dsp.exec_cmd("pkill -x ydotool"))
end
