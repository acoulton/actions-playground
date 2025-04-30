#!/bin/bash
set -o errexit
set -o nounset

if [ "$PR_EXISTS" == 'false' ]; then
    echo "Creating branch $BRANCH_NAME"
    git checkout -b "$BRANCH_NAME"
fi

echo "Creating commit"
git add -u
git -c user.name='github-actions[bot]' \
    -c user.email='41898282+github-actions[bot]@users.noreply.github.com' \
    commit \
    -m "$COMMIT_MSG"

echo "Authenticating and pushing"
gh auth status
GH_DEBUG=1 gh auth setup-git
git remote -v
git config --global --list
gh auth status
git push -u origin "$BRANCH_NAME"

if [ "$PR_EXISTS" == 'false' ]; then
    echo "Creating new PR"
    gh pr create --title="$PR_TITLE" --body="Automated update"
else
    echo "Updating PR title"
    gh pr edit --title="$PR_TITLE" --body="Automated update"
fi
