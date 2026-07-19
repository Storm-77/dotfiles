local defs = require("definitions")

function IsLidOpen()
    local handle, err = io.popen("cat /proc/acpi/button/lid/*/state")
    if err then
        error(err)
        return false
    end
    if handle == nil then
        error("Path not found. Computer probably has no lid")
        return false
    end

    local result = handle:read("*a")
    handle:close()

    return result:find("open") ~= nil
end

function IsWifiRadioEnabled()
    local handle, err = io.popen("nmcli radio wifi")
    if err then
        error(err)
        return false
    end
    if handle == nil then
        error("nmcli errored out")
        return false
    end

    local result = handle:read("*a")
    handle:close()

    return result:find("enabled") ~= nil
end

function IsLaptopScreenEnabled()
    return hl.get_monitor(defs.device.laptopMonitor) ~= nil
end

hl.bind(defs.keys.mainMod .. "+F11", function()
    if IsWifiRadioEnabled() then
        hl.exec_cmd("nmcli radio wifi off && notify-send 'Wifi just turned off'")
    else
        hl.exec_cmd("nmcli radio wifi on && notify-send 'Wifi just turned on'")
    end
end)


if not IsLidOpen() then
    hl.monitor({ output = defs.device.laptopMonitor, disabled = true })
end

hl.bind('switch:on:Lid Switch', function()
    hl.monitor({
        output = defs.device.laptopMonitor,
        disabled = true
    })
end)

-- using reload for now as workaround because enabling monitor like it's disabled above doesn'e work
hl.bind('switch:off:Lid Switch', hl.dsp.exec_cmd('hyprctl reload'))


hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd('brightness --inc'))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd('brightness --dec'))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd('brightness --inc'))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd('brightness --dec'))


local notifyBattery = [[notify-send -a battery "$(acpi -b | grep -oE ':[a-zA-Z ]+, [0-9]+%' | awk '{ gsub(":", ""); print }')"]]
hl.bind(defs.keys.mainMod .. ' + I', hl.dsp.exec_cmd(notifyBattery))


-- toggle laptop screen when docked
hl.bind(defs.keys.mainMod .. "+HOME", function()
    if IsLidOpen() then
        hl.monitor({ output = defs.device.laptopMonitor, disabled = IsLaptopScreenEnabled() })
    end
end)
