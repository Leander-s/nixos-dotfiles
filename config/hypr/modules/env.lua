-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- GPU configuration
hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", "0")
hl.env("__GL_GSYNC_ALLOWED", "0")
hl.env("AQ_NO_ATOMIC", "0")

-- Clutter
hl.env("CLUTTER_BACKEND", "wayland")

-- SDL
hl.env("SDL_VIDEODRIVER", "wayland")

-- GTK
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GDK_SCALE", "1")

-- Cursor theme and size
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- Qt theme
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
