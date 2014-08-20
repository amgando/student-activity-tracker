# Capture script name (ie. unshimmed ruby)
script="$1"

# Capture script arguments
script_args="${@: 2 : 9}"

echo "activity:"
echo "  script:"             "$script"
echo "  script_args:"        "$script_args"
