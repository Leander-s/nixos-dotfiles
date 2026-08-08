---------------------
---- MY PROGRAMS ----
---------------------

local terminal = 'ghostty -e "tmux-startup"'
local fileManager = "dolphin"
local menu = "vicinae toggle"
local browser = "zen"
local mainMod = "SUPER"

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/work-mode"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd("shutdown now"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("pkill vicinae && vicinae server"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("pkill waybar"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hypridle"))
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
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspaces / scratchpads
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + SPACE", hl.dsp.workspace.toggle_special("chet"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:chet" }))

-- Screenshots and recording
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd(
		[[wf-recorder -y -g "$(slurp)" -p preset=veryfast -D -f ~/Videos/screenrecording-$(date +%Y-%m-%d_%H-%M-%S).mp4 --audio]]
	)
)
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("killall -s SIGINT wf-recorder"))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness: old `bindel` = locked + repeating
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- Media controls: old `bindl` = locked
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
