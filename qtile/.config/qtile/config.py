# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, extension
from typing import List  # noqa: F401

###############
# keys
#

mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "Right", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),
    Key([mod], "Left", lazy.layout.up()),
    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),
    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),
    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("qterminal")),
    # Tqtileqtileoggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "control"], "w", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),
    # Key([mod], "p", lazy.spawn("dmenu_run")),
    Key(
        [mod],
        "p",
        lazy.run_extension(
            extension.DmenuRun(
                dmenu_prompt="",
                dmenu_font=None,
                fontsize=16,
                background="#0a0a0a",
                foreground="#8b3626",
                selected_background="#8b3626",
                selected_foreground="#fff",
                # dmenu_height=24, funktioniert nicht
                dmenu_ignorecase=True,
                dmenu_lines=20,
            )
        ),
    ),
    Key([mod], "o", lazy.spawn("my-menu.sh")),
    Key([mod], "f", lazy.window.toggle_floating()),
    # Toggle "monocle" mode (fullscreen)
    Key([mod], "m", lazy.window.toggle_fullscreen()),
    Key([mod, "mod1"], "h", lazy.spawn("st -e htop")),
    Key([mod, "mod1"], "f", lazy.spawn("st -e lf")),
    # Key('M-<Up>', lazy.spawn("my-menu.sh")),
    Key([], "Print", lazy.spawn("scrot")),
]

###############
# groups
#

# groups = [Group(i) for i in "23456"]
# groups.append(Group("1", matches=[Match(wm_class=["Chromium"])]))
# groups.append(Group("7", matches=[Match(wm_class=["pavucontrol-qt"])]))
# groups.append(Group("8", matches=[Match(wm_class=["Tor Browser", "Transmission-gtk"])]))

groups = [
    Group("1"),
    Group("2", matches=[Match(wm_class=["Chromium"])]),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7", matches=[Match(wm_class=["pavucontrol-qt"])]),
    Group("8", matches=[Match(wm_class=["Tor Browser", "Transmission-gtk"])]),
]

# another way would be:
# groups = []
# goup_names = ["1", "2", "3"]
# group_labels = ["", "www", "@"]
# group_layouts = ["max", "float", "max"]
# for i in range(len(group_names)):
#     groups.append(
#         Group(
#             name=group_names[i],
#             layout=group_labels[i].lowwer(),
#             label=group_labels[i],
#         ))

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            # mod1 + shift + letter of group = switch to & move focused window to
            # group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )

###############
# layout
#


def init_layout_theme():
    return {
        "margin": 5,
        "border_width": 2,
        "border_focus": "#ff000f",  # "#6790E8"
        "border_normal": "#4c566a",
    }


layout_theme = init_layout_theme()

layouts = [
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2, **layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    layout.Zoomy(),
]

###############
# widgets - extensions - screens
#

widget_defaults = dict(font="sans", fontsize=12, padding=3,)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                # widget.CurrentLayout(foreground='#8b3826'),
                widget.CurrentLayoutIcon(foreground="8b3826"),
                widget.GroupBox(),
                widget.Prompt(foreground="#a30d53", background="#666666", prompt="$ "),
                widget.WindowName(),
                widget.Notify(),
                # widget.TextBox("default config", name="default",
                # foreground='#8b3626'),
                widget.Net(
                    interface="enp37s0", foreground="#666666", format=" {down} ↓↑ {up}"
                ),
                widget.Systray(),
                widget.ThermalSensor(),
                widget.Clock(format=" %a %d.%m  %H:%M %p", foreground="#8b3626"),
                widget.Pomodoro(prefix_inactive="P "),
                # widget.QuickExit(foreground='#8b3626'),
            ],
            28,
            background="#0a0a0a",
        ),
    ),
]

###############
# mouse
#

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
        {"wmclass": "dragon"},
    ]
)

##############################

auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
