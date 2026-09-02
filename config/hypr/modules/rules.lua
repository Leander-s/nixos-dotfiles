-----------------------
-------- RULES --------
-----------------------

hl.workspace_rule({ workspace = "name:1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:6", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:7", monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:8", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "name:9", monitor = "DP-1" })
hl.workspace_rule({ workspace = "name:10", monitor = "HDMI-A-1" })

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

---------------------
---- LAYER RULES ----
---------------------

hl.layer_rule({
	name = "vicinae-blur",
	match = { namespace = "vicinae" },
	blur = true,
	ignore_alpha = 1,
})

hl.layer_rule({
	name = "fuzzel-blur",
	match = { namespace = "fuzzel" },
	blur = true,
	ignore_alpha = 0.2,
})
