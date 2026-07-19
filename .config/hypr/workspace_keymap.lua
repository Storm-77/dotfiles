local def = require("definitions")
local mainMod = def.keys.mainMod

function KeyFromIndex(index)
    local mod = index % 10

    if index > 10 then
        return 'grave'
    end

    return mod
end

function GlobalWorkspaceShortcutsBind()
    for i = 1, 11 do
        local key = KeyFromIndex(i)

        -- move workspace
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))

        -- custom handler to swap workspaces between monitors in case workspace is somewhere else
        hl.bind(mainMod .. " + " .. key, function()
            -- local targetWorkspace = hl.get_workspace(tostring(i))
            -- if targetWorkspace == nil or targetWorkspace.monitor == hl.get_active_monitor() or not targetWorkspace.visible then
                hl.dispatch(
                    hl.dsp.focus({
                        workspace = i,
                        on_current_monitor = true
                    })
                )
            -- else
            --     hl.dispatch(
            --         hl.dsp.workspace.swap_monitors({
            --             monitor1 = hl.get_active_monitor(),
            --             monitor2 = targetWorkspace.monitor
            --         })
            --     )
            -- end
        end)
    end

    hl.bind(mainMod .. "+ z", hl.dsp.focus({ workspace = 'previous' }))

    local notifyCmd = 'notify-send -a workspace_notify ' .. "$(hyprctl activeworkspace -j | jq '.id')"
    hl.bind(mainMod .. "+ w", hl.dsp.exec_cmd(notifyCmd))
end

function BindMainKeymapWorkspaceShortcuts()
    GlobalWorkspaceShortcutsBind()
    -- Scroll through existing workspaces with mainMod + scroll
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

    -- Example special workspace (scratchpad)
    hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
end

function BindVmSubmap()
    hl.define_submap("vm", "reset", GlobalWorkspaceShortcutsBind)
end
