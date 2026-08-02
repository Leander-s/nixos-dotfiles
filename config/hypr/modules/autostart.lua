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
	hl.dispatch(hl.dsp.focus({ workspace = 2 }))
	hl.dispatch(hl.dsp.focus({ workspace = 1 }))
end)
