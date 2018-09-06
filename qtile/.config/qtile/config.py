from libqtile import bar, hook, layout, widget
from libqtile.command import lazy
from libqtile.config import Click, Drag, Group, Key, Screen

wmname = "qtile"

mod = "mod4"

# from https://github.com/qtile/qtile-examples/blob/608cbcd1ea642bbe96cc13f2bde852c792e5456b/ramnes.py
def window_to_prev_screen():
    """Move window to the previous screen"""
    @lazy.function
    def __inner(qtile):
        i = qtile.screens.index(qtile.currentScreen)
        if i != 0:
            group = qtile.screens[i - 1].group.name
            qtile.currentWindow.togroup(group)
    return __inner

def window_to_next_screen():
    """Move window to the next screen"""
    @lazy.function
    def __inner(qtile):
        i = qtile.screens.index(qtile.currentScreen)
        if i != len(qtile.screens):
            group = qtile.screens[i + 1].group.name
            qtile.currentWindow.togroup(group)
    return __inner

class Theme(object):
    colors = {
        "bg": "1D252C",
        "base0": "10151C",
        "base1": "171D22",
        "base2": "20282F",
        "base3": "28323B",
        "base4": "384551",
        "base5": "56697A",
        "base6": "688094",
        "base7": "7FA0B7",
        "base8": "9CAABB",
        "fg": "728CA0",
        "blue": "5EC4FF"
    }

    font = "Iosevka"

    layout_style = {
        "margin": 10,
        "border_normal": colors["base3"],
        "border_focus": colors["blue"]
    }


theme = Theme()

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.up()),
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "l", lazy.layout.right()),

    # Move windows around
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up()),

    # Change window size
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle fullscreen and floating windows
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

    # Launch applications
    Key([mod], "Return", lazy.spawn("alacritty")),
    Key([mod], "e", lazy.spawn("emacs")),

    # Toggle between different layouts
    Key([mod], "Tab", lazy.next_layout()),

    # Switch between monitors
    Key([mod], "Right", lazy.next_screen()),
    Key([mod], "Left", lazy.prev_screen()),
    Key([mod, "control"], "l", lazy.next_screen()),
    Key([mod, "control"], "h", lazy.prev_screen()),

    # Move windows between monitors
    Key([mod, "shift"], "Right", window_to_next_screen()),
    Key([mod, "shift"], "Left", window_to_prev_screen()),
    Key([mod, "control", "shift"], "l", window_to_next_screen()),
    Key([mod, "control", "shift"], "h", window_to_prev_screen()),

    # Commands
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    # Key([mod], "r", lazy.spawncmd()),
    Key([mod, "control"], "w", lazy.window.kill()),
    Key([mod], "w", lazy.spawn(f"rofi -show window -font '{theme.font} 14'")),
    Key([mod], "r", lazy.spawn(f"rofi -show run -font '{theme.font} 14'")),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
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
])
auto_fullscreen = True
focus_on_window_activation = "smart"

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.Max(),
    layout.Stack(num_stacks=2,**theme.layout_style),
    layout.MonadTall(**theme.layout_style),
    layout.MonadWide(**theme.layout_style),
]

class Bars(object):
    def __groupbox():
        """GroupBox widget to be used on all bars."""
        return widget.GroupBox(
            highlight_method="block",
            this_current_screen_border=theme.colors["blue"],
            this_screen_border=theme.colors["base6"],
            inactive=theme.colors["base6"],
            active=theme.colors["fg"]
        )

    left=bar.Bar(
        widgets=[
            __groupbox(),
            widget.CurrentLayout(),
            widget.Prompt(),
            widget.WindowTabs(),
            widget.TextBox("cpu: ", name="cpu"),
            widget.CPUGraph(),
            widget.TextBox(" mem:", name="mem"),
            widget.Memory(),
            widget.Systray(),
            widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
        ],
        size=24,
        background=[theme.colors["base0"]],
    )

    mid=bar.Bar(
        widgets=[
            __groupbox(),
            widget.Prompt(),
            widget.WindowTabs(),
            widget.CurrentLayout(),
            widget.Clock(format="%I:%M %p"),
        ],
        size=24,
        background=[theme.colors["base0"]],
    )

    right=bar.Bar(
        widgets=[
            __groupbox(),
            widget.Prompt(),
            widget.WindowTabs(),
            widget.CurrentLayout(),
            widget.Clock(format="%I:%M %p"),
        ],
        size=24,
        background=[theme.colors["base0"]],
    )


widget_defaults = dict(
    font=theme.font,
    fontsize=14,
    padding=1,
)
extension_defaults = widget_defaults.copy()

bars = Bars()
screens = [
    Screen(top=bars.left),
    Screen(top=bars.mid),
    Screen(top=bars.right),
]

def main(qtile):
    """ This function is called when Qtile starts. """
    pass
