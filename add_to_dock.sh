function add_app_to_dock {
    app_path="/Applications/$(echo ${1// /\ }).app"
    if open -Ra "${app_path}"; then
        echo "$app_path"
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    fi
}

function add_spacer_to_dock {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

function clear_dock {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

# WARNING: clears existing dock
clear_dock
add_app_to_dock "System Preferences"
add_spacer_to_dock
add_app_to_dock "Microsoft Outlook"
add_app_to_dock "Google Chrome"
add_app_to_dock "Microsoft Excel"
add_app_to_dock "Microsoft Word"
add_app_to_dock "Microsoft Powerpoint"
add_app_to_dock "kitty"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "SelfControl"
add_app_to_dock "Skype"

killall Dock
