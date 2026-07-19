-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/
-- Please note not all available settings / options are set here.
-- For a full list, see the wiki
-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")
------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
--hl.monitor({output = "", mode = "1920x1080", position = "auto", scale = 1.25})
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = 1.25,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    mirror = "eDP-1",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "ghostty"
local fileManager = "nautilus"
local menu = "vicinae vicinae://toggle"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    -- hl.exec_cmd(terminal)
    -- hl.exec_cmd("nm-applet")
    -- hl.exec_cmd("waybar & hyprpaper & firefox")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swayosd-server")
    -- hl.exec_cmd("vicinae server")
    hl.exec_cmd("ibus start")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("hypridle")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

hl.env("XMODIFIERS", "@im=ibus")
hl.env("IBUS_USE_PORTAL", "1")

hl.env("GTK_IM_MODULE", "")
hl.env("QT_IM_MODULE", "")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- fix for file picker
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORM", "wayland")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in = 2.5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border = {
                colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
                angle = 45
            },
            inactive_border = "rgba(595959aa)"
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling"
    },

    decoration = {
        rounding = 5,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a
        },

        blur = {enabled = true, size = 5, passes = 1, vibrancy = 0.1696}
    },

    animations = {enabled = true},

    xwayland = {force_zero_scaling = true}
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Curves
hl.curve("niri_motion",
         {type = "spring", mass = 1, stiffness = 200, dampening = 25})

hl.curve("niri_fast", {type = "bezier", points = {{0.25, 1}, {0.5, 1}}})

hl.curve("niri_fade", {type = "bezier", points = {{0.0, 0.0}, {0.1, 1.0}}})

-- Windows: slide in from top, out to bottom (niri-like)
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 2.5,
    spring = "niri_motion",
    style = "slide top"
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 2.5,
    spring = "niri_motion",
    style = "slide top"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.5,
    bezier = "niri_fast",
    style = "slide bottom"
})

-- Fades: quick, barely noticeable
hl.animation({leaf = "fade", enabled = true, speed = 2, bezier = "niri_fade"})

hl.animation({leaf = "fadeIn", enabled = true, speed = 2, bezier = "niri_fade"})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.5,
    bezier = "niri_fade"
})

-- Border
hl.animation({leaf = "border", enabled = true, speed = 3, bezier = "niri_fast"})

-- Workspaces: vertical slide (niri's defining trait)
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2.5,
    spring = "niri_motion",
    style = "slidevert"
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 2.5,
    spring = "niri_motion",
    style = "slidevert"
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 2.5,
    spring = "niri_motion",
    style = "slidevert"
})

-- Layers (waybar, rofi, etc.): fade in/out
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 2,
    bezier = "niri_fast",
    style = "fade"
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 2,
    bezier = "niri_fast",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "niri_fade",
    style = "fade"
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
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

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true -- You probably want this
    }
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({master = {new_status = "master"}})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = false,

        -- default width for "normal" apps
        column_width = 0.65,

        follow_focus = true,
        focus_fit_method = 0,
        follow_min_visible = 0,

        wrap_focus = true,
        wrap_swapcol = true,

        direction = "right",

        explicit_column_widths = "0.35, 0.5, 0.65, 0.8, 1.0"
    }
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true -- If true disables the random hyprland logo / anime girl background. :(
    }
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 0,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {natural_scroll = true}
    }
})

hl.gesture({fingers = 3, direction = "vertical", action = "workspace"})

hl.gesture({fingers = 3, direction = "horizontal", action = "scroll_move"})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({name = "epic-mouse-v1", sensitivity = -0.5})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + ALT + j", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout --protocol layer-shell"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(
            "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + N", hl.dsp
            .exec_cmd("vicinae 'vicinae://launch/clipboard/history?toggle=true'"))
hl.bind(mainMod .. " + semicolon", hl.dsp
            .exec_cmd(
            "vicinae 'vicinae://launch/core/search-emojis?toggle=true'"))
hl.bind(mainMod .. " + J", hl.dsp
            .exec_cmd(
            "vicinae 'vicinae://launch/wm/switch-windows?toggle=true'"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.layout("togglesplit"))    -- dwindle only
-- hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind(mainMod .. " + o", hl.dsp.exec_cmd("hyprpicker| wl-copy"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({direction = "l"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({direction = "r"}))
hl.bind(mainMod .. " + up", hl.dsp.focus({direction = "u"}))
hl.bind(mainMod .. " + down", hl.dsp.focus({direction = "d"}))

-- Move focus with mainMod + h,j,k,l -- dwindle
--[[hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "d" }))--]]

-- Move focus with mainMod + h,j,k,l -- scrolling
hl.bind(mainMod .. " + comma", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + period", hl.dsp.layout("focus r"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + C", function()
    local special = hl.get_active_special_workspace()
    if special then
        local current = hl.get_active_workspace()
        hl.dispatch(hl.dsp.window.move({workspace = tonumber(current.id)}))
    else
        hl.dispatch(hl.dsp.window.move({workspace = "special:magic"}))
    end
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})

-- Scroll through existing workspaces
-- Smart workspace navigation: go to next/prev, or create new if at boundary
local function workspace_next()
    local current = hl.get_active_workspace()
    local current_id = tonumber(current.id)
    local max_id = 0
    local workspaces = hl.get_workspaces()
    for _, ws in ipairs(workspaces) do
        local id = tonumber(ws.id)
        if id > 0 and id > max_id then max_id = id end
    end
    local windows = hl.get_workspace_windows(current.id)
    -- go next if: current has windows (may create new), or there are workspaces ahead
    if #windows > 0 or current_id < max_id then
        hl.dispatch(hl.dsp.focus({workspace = current.id + 1}))
    end
end

local function workspace_prev()
    local current = hl.get_active_workspace()
    local current_id = tonumber(current.id)
    if current_id > 1 then
        hl.dispatch(hl.dsp.focus({workspace = current.id - 1}))
    end
end

hl.bind(mainMod .. " + u", workspace_next)
hl.bind(mainMod .. " + i", workspace_prev)
hl.bind(mainMod .. " + mouse_down", workspace_prev)
hl.bind(mainMod .. " + mouse_up", workspace_next)

-- Move windows with keyboard -- dwindle
--[[hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))--]]

-- Move windows with keyboard
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.layout("swapcol r"))

-- Move windows to left/right workspace
local function window_workspace_next()
    local current = hl.get_active_workspace()
    local current_id = tonumber(current.id)
    local max_id = 0
    local workspaces = hl.get_workspaces()
    for _, ws in ipairs(workspaces) do
        local id = tonumber(ws.id)
        if id > 0 and id > max_id then max_id = id end
    end
    local windows = hl.get_workspace_windows(current.id)
    -- go next if: current has windows (may create new), or there are workspaces ahead
    if #windows > 1 or current_id < max_id then
        hl.dispatch(hl.dsp.window.move({workspace = current.id + 1}))
    end
end

local function window_workspace_prev()
    local current = hl.get_active_workspace()
    local current_id = tonumber(current.id)
    if current_id > 1 then
        hl.dispatch(hl.dsp.window.move({workspace = current.id - 1}))
    end
end
hl.bind(mainMod .. " + bracketright", window_workspace_next)
hl.bind(mainMod .. " + bracketleft", window_workspace_prev)

-- Resize window with arrows - dwindle
--[[hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 20,  y = 0,  relative = true }))
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -20, y = 0,  relative = true }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0,   y = -20, relative = true }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0,   y = 20, relative = true }))--]]

-- Vim keys - dwindle
--[[hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.resize({ x = 20,  y = 0,  relative = true }))
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.resize({ x = -20, y = 0,  relative = true }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.resize({ x = 0,   y = -20, relative = true }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.resize({ x = 0,   y = 20, relative = true }))--]]

-- fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window
            .fullscreen_state({internal = 1, client = 0, action = "toggle"}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- i3wm like groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind("CTRL + SHIFT + L", hl.dsp.group.next())
hl.bind("CTRL + SHIFT + H", hl.dsp.group.prev())
hl.bind("CTRL + SHIFT + G", hl.dsp.window.move({out_of_group = true}))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.lock_active())
hl.bind("SHIFT + ALT + J", hl.dsp.group.move_window({direction = "d"}))
hl.bind("SHIFT + ALT + k", hl.dsp.group.move_window({direction = "u"}))
hl.bind("SHIFT + ALT + l", hl.dsp.group.move_window({direction = "r"}))
hl.bind("SHIFT + ALT + h", hl.dsp.group.move_window({direction = "l"}))

-- toggle waybar
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- swaync
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + D", function()
    local handle = io.popen("swaync-client -D")
    local enabled = handle:read("*a"):gsub("%s+", "")
    handle:close()

    hl.exec_cmd("swaync-client -d")

    if enabled == "true" then
        hl.exec_cmd(
            [[swayosd-client --custom-message "󰂚   Notifications On"]])
    else
        hl.exec_cmd([[swayosd-client --custom-message "󰂛   Do Not Disturb"]])
    end
end)

hl.bind(mainMod .. " + SHIFT + I", function()
    local handle = io.popen("pgrep hypridle")
    local running = handle:read("*a"):gsub("%s+", "")
    handle:close()

    if running ~= "" then
        -- Disable hypridle
        hl.exec_cmd("pkill hypridle")
        hl.exec_cmd([[swayosd-client --custom-message "󰒳  Stay Awake"]])
    else
        -- Enable hypridle
        hl.exec_cmd("hypridle &")
        hl.exec_cmd([[swayosd-client --custom-message "󰒲  Auto Lock On"]])
    end
end)

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl dispatch centerwindow"))

-- scrolling
-- move view left/right
hl.bind(mainMod .. " + h", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + l", hl.dsp.layout("move +col"))

-- resize columns
hl.bind(mainMod .. " + CTRL + h", hl.dsp.layout("colresize -0.05"))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.layout("colresize +0.05"))

-- fit active window nicely
hl.bind(mainMod .. " + Tab", hl.dsp.layout("fit active"))

-- promote window into its own column
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.layout("promote"))

hl.bind("Print",
    hl.dsp.exec_cmd("~/dotfiles/config/scripts/screenshot output"))

hl.bind(mainMod .. " + Print",
    hl.dsp.exec_cmd("~/dotfiles/config/scripts/screenshot window"))

hl.bind(mainMod .. " + S",
    hl.dsp.exec_cmd("~/dotfiles/config/scripts/screenshot region"))

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("~/dotfiles/config/scripts/screenshot annotate"))

-- Laptop multimedia keys for volume and LCD brightness
local scripts = os.getenv("HOME") .. "/dotfiles/config/scripts"

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/volume --inc"),
        {locked = true, repeating = true})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/volume --dec"),
        {locked = true, repeating = true})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/volume --toggle"),
        {locked = true, repeating = true})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scripts .. "/volume --toggle-mic"),
        {locked = true, repeating = true})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/brightness --inc"),
        {locked = true, repeating = true})

hl.bind("XF86MonBrightnessDown",
        hl.dsp.exec_cmd(scripts .. "/brightness --dec"),
        {locked = true, repeating = true})

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {locked = true})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),
        {locked = true})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"),
        {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {locked = true})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = {class = ".*"},

    suppress_event = "maximize"
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },

    no_focus = true
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Window Rules
hl.window_rule({
    name = "move-hyprland-run",
    match = {class = "hyprland-run"},
    move = "20 monitor_h-120",
    float = true
})
hl.window_rule({
    name = "firefox-width",
    match = {class = "firefox"},
    scrolling_width = 1.0
})
hl.window_rule({
    name = "helium-width",
    match = {class = "helium"},
    scrolling_width = 1.0
})
hl.window_rule({
    name = "vscode-width",
    match = {class = "code"},
    scrolling_width = 1.0,
    --opacity = "0.9"
})
hl.window_rule({
    name = "telegram-width",
    match = {class = "org.telegram.desktop"},
    scrolling_width = 1.0,
    opacity = "0.9"
})
hl.window_rule({
    name = "video-player-width",
    match = {class = "org.gnome.Showtime"},
    scrolling_width = 1.0
})
hl.window_rule({
    name = "ghostty-width",
    match = {class = "com.mitchellh.ghostty"},
    scrolling_width = 0.65,
    opacity = "0.85 0.75"
})
hl.window_rule({
    name = "nautilus-width",
    match = {class = "org.gnome.Nautilus"},
    scrolling_width = 0.65
})
hl.workspace_rule({
    workspace = "special:magic",
    gaps_out = {top = 70, bottom = 70, left = 50, right = 50}
})
hl.window_rule({
    name = "helium-crx-float",
    match = {class = "^chrome-.*-Default$"},
    float = true
})
hl.window_rule({
    name = "helium-popup-float",
    match = {class = "helium", initial_title = "^Untitled - Helium$"},
    float = true
})
hl.window_rule({
    name = "picture-in-picture-float",
    match = {title = "^Picture in picture$"},
    float = true,
    pin = true
})
hl.window_rule({
    name = "satty-float",
    match = {class = "com.gabm.satty"},
    float = true
})
hl.window_rule({
    name = "obs-screen-picker-float",
    match = {title = "^Select what to share$"},
    float = true,
    center = true,
    size = "400 300"
})
hl.window_rule({
    name = "firefox-activate",
    match = {class = "firefox"},
    focus_on_activate = true
})
hl.window_rule({
    name = "helium-activate",
    match = {class = "helium"},
    focus_on_activate = true
})
hl.window_rule({
    name = "blueman-float",
    match = {
        title = "^Bluetooth Devices$"
    },
    float = true,
    center = true,
    size = "600 500"
})
