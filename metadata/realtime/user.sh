# We could also capture git usernames with something like
#   git config --global --get-all github.username

# Grab pair names
pair_names="$(git config --global user.name)"

# Store IFS to split string on custom character then restore IFS
oIFS=$IFS; IFS='&'; names=($pair_names); IFS=$oIFS

# Grab pair accounts
pair_github="$(git config --global user.email | sed -e s/^.*\+// -e s/@.*$//)"
github=(${pair_github//./ })


echo "pair:"
echo "  user-a:"
echo "    name:"    "${names[0]}"
echo "    github:"  "${github[0]}"
echo "  user-b:"
echo "    name:"    "${names[1]}"
echo "    github:"  "${github[1]}"
