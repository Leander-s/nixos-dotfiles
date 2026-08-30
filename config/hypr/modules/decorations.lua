-----------------------
----- DECORATIONS -----
-----------------------

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 1,

		col = {
			active_border = {
				colors = { "rgba(cc6666ff)", "rgba(222266ff)" },
				angle = 90,
			},
			inactive_border = "rgba(00000000)",
		},

		resize_on_border = true,
		allow_tearing = false,
	},

	cursor = {
		inactive_timeout = 2,
	},

	decoration = {
		rounding = 8,
		rounding_power = 2.0,

		active_opacity = 1.0,
		inactive_opacity = 0.9,
		fullscreen_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 10,
			render_power = 10,
			color = "rgba(77777711)",
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 4,
			new_optimizations = true,
			ignore_opacity = true,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})
