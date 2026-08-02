-----------------------
-------- INPUT --------
-----------------------

hl.config({
	input = {
		kb_layout = "de",
		kb_variant = "nodeadkeys",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0.0,

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.2,
		},
	},

	debug = {
		disable_logs = false,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
