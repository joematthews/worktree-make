if [ ! $1 ]; then
    echo 'Please provide a destination'
    echo "example: './install.sh ~/.bashrc'"
    exit 1
elif [ ! -f $1 ]; then
    echo 'Could not find destination specified. Please try another'
    echo "example: './install.sh ~/.zshrc'"
    exit 1
else
    declare destination=$1
fi

if [ -f worktree-make.sh ]; then
    declare worktree_make_output=$(cat worktree-make.sh)
else
    declare worktree_make_output=$(curl https://raw.githubusercontent.com/joematthews/worktree-make/main/worktree-make.sh | cat)
fi

cat <<EOF >>$destination

$worktree_make_output
EOF

echo ""
echo "Restart shell or run 'source $destination'"
