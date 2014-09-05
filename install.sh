#!/bin/sh
set -e
dir=$(cd $(dirname $0); pwd)

# Make sure the DBC folder for links to executables is available
mkdir -p "$HOME/.dbc/bin"

# Create symbolic links to ruby-shim and process-run-data
ln -sf /usr/local/opt/student-activity-logger/ruby-shim $HOME/.dbc/bin/ruby
ln -sf /usr/local/opt/student-activity-logger/uploader/process-activity-data.sh $HOME/.dbc/bin/process-activity-data

# Add new PATH to .bash_profile so our ruby-shim is seen before the real ruby
cat  >> ~/.bash_profile <<EOL

# Add ruby-shim to path
#   see: https://github.com/devbootcamp/student-activity-logger
test -d \$HOME/.dbc/bin && PATH=\$HOME/.dbc/bin:\$PATH
EOL

# Install the plist file as a system daemon
sudo cp -rf $dir/com.devbootcamp.student-activity-logger.plist /Library/LaunchDaemons

# Load the plist file
sudo launchctl load /Library/LaunchDaemons/com.devbootcamp.student-activity-logger.plist
