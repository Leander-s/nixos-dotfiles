-- Converted from the user's Hyprland 0.56 Hyprlang configuration.
-- Intended for ~/.config/hypr/hyprland.lua
-- Current configuration documentation: https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- "highres@highrr" is preserved from the old config. It is not shown as a
-- combined value in the current wiki; use an explicit WIDTHxHEIGHT@RATE mode
-- if a future Hyprland version rejects it or chooses an unexpected mode.
hl.monitor({
    output   = "DP-1",
    mode     = "highres@highrr",
    position = "1920x0",
    scale    = "auto",
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "highres@highrr",
    position = "0x0",
    scale    = "auto",
})

hl.monitor({
    output   = "",
    mode     = "highres@highrr",
    position = "auto",
    scale    = 1,
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- GPU configuration
hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", "0")

hl.env("GDK_SCALE", "1")

-- Cursor theme and size
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- Qt theme
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = 'ghostty -e "tmux-startup"'
local fileManager = "dolphin"
local menu        = "vicinae toggle"
local browser     = "zen"
local mainMod     = "SUPER"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("vicinae server")
    hl.exec_cmd("mako")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")

    -- Portal environment for screen sharing
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    hl.exec_cmd("hypridle")

    -- Create/focus the initial workspaces on their assigned monitors.
    -- This preserves the two old `exec-once = hyprctl dispatch workspace ...` lines.
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))
    hl.dispatch(hl.dsp.focus({ workspace = 2 }))
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },

    general = {
        gaps_in     = 1,
        gaps_out    = 2,
        border_size = 3,

        col = {
            active_border = {
                colors = { "rgba(cc6666ff)", "rgba(222266ff)" },
                angle  = 90,
            },
            inactive_border = "rgba(00000000)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    cursor = {
        inactive_timeout = 2,
    },

    decoration = {
        rounding       = 1,
        -- Preserved from the old config. The current wiki documents 2.0-10.0.
        rounding_power = 1.0,

        active_opacity     = 1.0,
        inactive_opacity   = 0.9,
        fullscreen_opacity = 1.0,

        blur = {
            enabled           = true,
            size              = 2,
            passes            = 2,
            new_optimizations = true,
            ignore_opacity    = true,
            vibrancy          = 0.1696,
        },

        -- The old shadow section was commented out, so it remains disabled here.
        -- shadow = {
        --     enabled      = true,
        --     range        = 4,
        --     render_power = 3,
        --     color        = "rgba(1a1a1aee)",
        -- },
    },

    animations = {
        enabled = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    input = {
        kb_layout  = "de",
        kb_variant = "nodeadkeys",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0.0,

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 0.2,
        },
    },

    debug = {
        disable_logs = false,
    },
})

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 }    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 }    } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },       { 1, 1 }       } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 },   { 0.75, 1.0 }  } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 },    { 0.1, 1 }     } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = false })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })

-------------------------
---- WORKSPACE RULES ----
-------------------------

hl.workspace_rule({ workspace = "name:1",  monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:2",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:3",  monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:4",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:5",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:6",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:7",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:8",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:9",  monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:10", monitor = "DP-1" })

-- The old smart-gap examples were commented out. Lua equivalents:
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-----------------
---- DEVICES ----
-----------------

hl.device({
    name        = "logitech-g305-1",
    sensitivity = -1.0,
})

hl.device({
    name        = "logitech-b330/m330/m331-1",
    sensitivity = -1.0,
})

hl.device({
    name        = "sony-interactive-entertainment-dualsense-wireless-controller-touchpad",
    sensitivity = 0.0,
})

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + C",      hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd("shutdown now"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("pkill vicinae && vicinae server"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("pkill waybar"))
hl.bind(mainMod .. " + T",      hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + CTRL + L",  hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + I",      hl.dsp.exec_cmd("hypridle"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("pkill hypridle"))
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle

-- Move focus with mainMod + H/J/K/L
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + H/J/K/L
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces and move the active window with mainMod + [0-9].
for i = 1, 10 do
    local key = i % 10 -- workspace 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspaces / scratchpads
hl.bind(mainMod .. " + M",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + SPACE",         hl.dsp.workspace.toggle_special("chet"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:chet" }))

-- Screenshots and recording
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd([[wf-recorder -y -g "$(slurp)" -p preset=veryfast -D -f ~/Videos/screenrecording-$(date +%Y-%m-%d_%H-%M-%S).mp4 --audio]])
)
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("killall -s SIGINT wf-recorder"))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness: old `bindel` = locked + repeating
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl set 5%+"),                          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl set 5%-"),                          { locked = true, repeating = true })

-- Media controls: old `bindl` = locked
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

---------------------
---- LAYER RULES ----
---------------------

hl.layer_rule({
    name    = "no_anim_for_selection",
    match   = { namespace = "selection" },
    no_anim = true,
})

hl.layer_rule({
    name         = "vicinae-blur",
    match        = { namespace = "vicinae" },
    blur         = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name    = "vicinae-no-animation",
    match   = { namespace = "vicinae" },
    no_anim = true,
})

-- These two old window-rule examples were already disabled. Their current Lua
-- equivalents are kept here in case you want to re-enable them later.
-- hl.window_rule({
--     name  = "suppress-maximize-events",
--     match = { class = ".*" },
--     suppress_event = "maximize",
-- })
--
-- hl.window_rule({
--     name = "fix-xwayland-drags",
--     match = {
--         class      = "^$",
--         title      = "^$",
--         xwayland   = true,
--         float      = true,
--         fullscreen = false,
--         pin        = false,
--     },
--     no_focus = true,
-- })

-----------------
---- THEMING ----
-----------------

-- The old config used `exec`, not `exec-once`, so these intentionally run when
-- the Lua file is evaluated/reloaded. Both commands are idempotent.
hl.exec_cmd([[gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"]])
hl.exec_cmd([[gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"]])
