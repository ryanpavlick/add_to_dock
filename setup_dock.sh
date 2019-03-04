source ./add_to_dock.sh

# WARNING: clears existing dock
clear_dock

add_app_to_dock "System Preferences"
add_app_to_dock "Activity Monitor"
add_spacer_to_dock
add_app_to_dock "Microsoft Outlook"
add_app_to_dock "Google Chrome"
add_app_to_dock "Microsoft Excel"
add_app_to_dock "Microsoft Word"
add_app_to_dock "Microsoft PowerPoint"
add_app_to_dock "kitty"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "SelfControl"
add_app_to_dock "Skype"
add_spacer_to_dock

killall Dock
