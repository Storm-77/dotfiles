hl.config({
    binds = {
        disable_keybind_grabbing = true
    }
})

local defs = require('definitions')
local apps, mainMod = defs.apps, defs.keys.mainMod

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd('uwsm-app ' .. apps.terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid |tr -d 'pid:' | xargs kill -15"))
hl.bind(mainMod .. " + SHIFT + ALT + M", hl.dsp.exit())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("uwsm-app -s a -- " .. apps.webBrowser))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("uwsm-app -s a -- " .. apps.webBrowserSecondary))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("uwsm-app -s a -- " .. apps.webBrowserPrivate))
hl.bind(mainMod .. " + P",
    hl.dsp.exec_cmd(
        "uwsm-app -s a -- brave --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-crash-reporter"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm-app -s a -- " .. apps.fileManager))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd('hyprfinder'))
hl.bind(mainMod .. " + End", hl.dsp.exec_cmd('powermenu'))
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd('powerprofmenu'))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd('D=$(' .. apps.menu .. ') ; [ -n "$D" ] && uwsm app -- "$D"'))
hl.bind(mainMod .. " + O", hl.dsp.window.float({ action = "toggle" }))

-- # bind = $mainMod, N, togglesplit, # dwindle

-- # Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "up" }))

hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd('random-wallpaper'))
hl.bind(mainMod .. "+ RETURN", hl.dsp.dpms({ action = "on" }))

-- blue light filter
hl.bind(mainMod .. "+ F12", hl.dsp.exec_cmd("hypr-night-light"))

-- notification with a clock
hl.bind(mainMod .. "+ C", hl.dsp.exec_cmd('notify-send -a clock "$(date +"%H:%M %A %d.%m.%Y")"'))


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd('volume --inc'))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd('volume --dec'))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd('volume --mute'))

hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("select-audio-output"))

hl.bind(mainMod .. "+V", hl.dsp.exec_cmd([[cliphist list | grep -v '\[\[ binary data' |  wofi --dmenu | cliphist decode | wl-copy]]))
hl.bind(mainMod .. "+CTRL + V", hl.dsp.exec_cmd("cliphist-wofi-img | wl-copy"))
