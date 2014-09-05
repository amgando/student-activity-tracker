# Confirm the launchd plist file is installed
test -f /Library/LaunchDaemons/com.devbootcamp.student-activity-logger.plist

# Confirm the symbolic links have been setup for the shim and batch processor
test -L $HOME/.dbc/bin/ruby
test -L $HOME/.dbc/bin/process-activity-data

# Confirm that the path has been updated
# source ~/.bash_profile # reload .bash_profile first, then test?  how is this done?
test "$HOME/.dbc/bin/ruby" = "$(which ruby)"
