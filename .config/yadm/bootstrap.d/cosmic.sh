#!/bin/bash
# Sourced by ../bootstrap on COSMIC (Pop!_OS 24.04+) desktops.
#
# COSMIC does not use gsettings/dconf. Its settings are plain files under
# ~/.config/cosmic/<component>/v1/<key>, which yadm tracks directly:
#   - CosmicComp/v1/xkb_config   caps:escape, shift:both_capslock
#   - Super+Tab / Alt+Tab / Super+T are COSMIC defaults (no config needed)
#   - 12h clock: CosmicAppletTime/v1/military_time
# Only things that are not tracked files belong here.

# Clipboard CLI for Wayland (replaces xclip)
sudo apt-get install -y wl-clipboard
