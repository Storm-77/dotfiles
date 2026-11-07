return {
    apps = {
        terminal = "kitty",
        fileManager = "nautilus",
        menu = 'wofi --show drun -i -M multi-contains --allow-images --hide-scroll -L 11 --width 25% --prompt="Launch an app" --define=drun-print_desktop_file=true',
        webBrowser = 'librewolf',
        webBrowserSecondary = 'chromium --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-crash-reporter',
        webBrowserPrivate = 'chromium --incognito --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-crash-reporter'
    },
    keys = {
        mainMod = 'SUPER'
    },
    screenshot = {
        mainKey = "+Print",
        saveMod = "+SHIFT",
        editMod = "+CTRL",
        saveCatalog = os.getenv("HOME") .. "/Pictures/scr"
    },
    device = {
        laptopMonitor = "eDP-1"
    }
}


