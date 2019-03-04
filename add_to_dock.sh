# adds an application to Dock
# usage: add_app_to_dock "Application Name" 
# example add_app_to_dock "Terminal"
function add_app_to_dock {
    app_name="${1}"
    launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
    app_path=$(${launchservices_path} -dump | grep -o "/.*${app_name}.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/${app_name}" | uniq | sort | head -n1)
    if open -Ra "${app_path}"; then
        echo "$app_path added to the Dock."
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    else
        echo "ERROR: $1 not found." 1>&2
    fi
}

# adds an empty space to Dock
function add_spacer_to_dock {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

# removes all persistent icons from Dock
function clear_dock {
    defaults write com.apple.dock persistent-apps -array
}

# reset Dock to default settings
function reset_dock {
    defaults write com.apple.dock; killall Dock
}

