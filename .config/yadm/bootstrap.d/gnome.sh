#!/bin/bash
# Sourced by ../bootstrap on GNOME desktops.

# Remap caps to escape, both shift to caps
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape','shift:both_capslock']"

# Set up keyboard shortcuts
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>T']"

# Configure desktop
gsettings set org.gnome.desktop.interface clock-format "12h"

# Disable software updater popup
gsettings set com.ubuntu.update-notifier no-show-notifications true

# Configure dock (auto-hide, position bottom)
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

# Configure touchpad
# Disable tap-to-click on touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
# Set scroll direction like a sane person
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
# Enable two-finger right click
gsettings set org.gnome.desktop.peripherals.touchpad click-method "fingers"

# Configure screen blanking to 30 minute timeout (not available in GUI)
gsettings set org.gnome.desktop.session idle-delay 1800
gsettings set org.gnome.desktop.screensaver lock-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled true

# File browser settings
gsettings set org.gtk.Settings.FileChooser show-hidden true

# Configure terminal profile
TERM_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default)
TERM_PROFILE=${TERM_PROFILE:1:-1}
TERM_GSETTING="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$TERM_PROFILE/"
gsettings set $TERM_GSETTING use-theme-transparency false
gsettings set $TERM_GSETTING background-color 'rgb(46,52,54)'
gsettings set $TERM_GSETTING foreground-color 'rgb(211,215,207)'
gsettings set $TERM_GSETTING palette "['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"
gsettings set $TERM_GSETTING use-transparent-background true
gsettings set $TERM_GSETTING background-transparency-percent 5

# Clipboard CLI for X11/GNOME
sudo apt-get install -y xclip
