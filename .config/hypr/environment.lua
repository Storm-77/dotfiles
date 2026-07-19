local vars = {
    XDG_CURRENT_DESKTOP = 'Hyprland',
    XDG_SESSION_TYPE = 'wayland',
    XDG_SESSION_DESKTOP = 'Hyprland',
    XDG_CURRENT_SESSION_TYPE = 'wayland',

    GDK_BACKEND = 'wayland',
    QT_QPA_PLATFORM = 'wayland;xcb',
    QT_QPA_PLATFORMTHEME = 'qt5ct',
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1,
    QT_AUTO_SCREEN_SCALE_FACTOR = 1,

    SDL_VIDEODRIVER = 'wayland',
    _JAVA_AWT_WM_NONREPARENTING = 1,
    WLR_NO_HARDWARE_CURSORS = 1,

    MOZ_DISABLE_RDD_SANDBOX = 1,
    MOZ_ENABLE_WAYLAND = 1,

    OZONE_PLATFORM = 'wayland',

    WALLPAPER_DIR = '$HOME/Pictures/wallpapers',

    XCURSOR_SIZE = 24,
    AQ_NO_MODIFIERS = 1,

    HYPRCURSOR_SIZE = 24
}

for key, value in pairs(vars) do
    hl.env(tostring(key), tostring(value))
end

--exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE XDG_CURRENT_SESSION_TYPE
--exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE XDG_CURRENT_SESSION_TYPE
