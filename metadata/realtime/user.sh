echo "email:" $(git config --global --get user.email)

# exit unless the github.username field is set in the git conf
git config --global --get github.username > /dev/null || exit

echo "github_usernames:"
git config --global --get-all github.username | while read github_username ; do
  echo "-" $github_username
done
