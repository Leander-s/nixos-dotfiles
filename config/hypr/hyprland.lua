require("modules.monitors")
require("modules.env")
require("modules.autostart")
require("modules.keybinds")
require("modules.decorations")
require("modules.layout")
require("modules.animations")
require("modules.devices")
require("modules.misc")
require("modules.input")
require("modules.rules")

-----------------
---- THEMING ----
-----------------

-- Set GTK theme and color scheme for GNOME applications
hl.exec_cmd([[gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"]])
hl.exec_cmd([[gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"]])
