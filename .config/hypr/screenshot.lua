local def = require("definitions")

hl.env("HYPRSHOT_DIR", def.screenshot.saveCatalog)

-- Capture area and put to clipboard
hl.bind(def.screenshot.mainKey, hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Capture area and save to file
hl.bind(def.screenshot.saveMod .. def.screenshot.mainKey, hl.dsp.exec_cmd("hyprshot -m region"))

-- Capture area and open in little editor
hl.bind(def.screenshot.editMod .. def.screenshot.mainKey, hl.dsp.exec_cmd("hyprshot -m region --raw | swappy -f -"))

-- Capture active screen and put to clipboard
hl.bind(def.keys.mainMod .. def.screenshot.mainKey, hl.dsp.exec_cmd("hyprshot -m output -m active --clipboard-only"))

-- Capture active screen and save to file
hl.bind(def.keys.mainMod .. def.screenshot.saveMod .. def.screenshot.mainKey, hl.dsp.exec_cmd("hyprshot -m output -m active"))
