# exit if not in a git repo
[ -d .git ] && [ $(git rev-parse --is-inside-work-tree) = "true" ] || exit

echo "git:"
echo "  repo_folder:"  "$(basename $(git rev-parse --show-toplevel))"
echo "  branch:"       "$(git branch | grep -e '^\*' | awk '{print $2}')"
echo "  remote:"       "$(git remote -v | head -1 | awk '{print $2}')"
