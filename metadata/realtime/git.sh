echo "git:"
echo "  is_repo: "      "$([ -d .git ] && git rev-parse --is-inside-work-tree)"

if test $(git rev-parse --show-toplevel 2> /dev/null); then
  echo "  repo:"     "$( (basename `git rev-parse --show-toplevel`) 2> /dev/null )"
  echo "  branch:"      "$(git branch | grep -e '^\*' | awk '{print $2}')"
  echo "  remote: "     "$(git remote -v  2> /dev/null | head -1 | awk '{print $2}')"
fi
