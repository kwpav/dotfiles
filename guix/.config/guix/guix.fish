# from:
# https://www.reddit.com/r/GUIX/comments/1di8r4o/source_guix_profileetcprofile_with_fish_shell/
# https://gist.github.com/Pinjontall94/4dfbf1e1b1a8327f10b010ee06f413d1

# Source this file to define all the relevant environment variables in Fish
# for this profile. An easy way to do this is to place this file in 
# $XDG_CONFIG_HOME/fish/conf.d/
#
# You may want to define the 'GUIX_PROFILE' environment
# variable to point to the "visible" name of the profile, like this:
#
#
# When GUIX_PROFILE is undefined, the various environment variables refer
# to this specific profile generation.
set -gx GUIX_PROFILE ~/.guix-profile
fish_add_path "$GUIX_PROFILE/bin"
set -gax XDG_DATA_DIRS "$GUIX_PROFILE/share"
set -gx GUILE_LOAD_COMPILED_PATH "$GUIX_PROFILE/lib/guile/3.0/site-ccache $GUIX_PROFILE/share/guile/site/3.0"
set -gx GUILE_LOAD_PATH "$GUIX_PROFILE/share/guile/site/3.0"
set -gx GUIX_LOCPATH "$GUIX_PROFILE/lib/locale"