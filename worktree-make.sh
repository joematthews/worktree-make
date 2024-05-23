# https://github.com/joematthews/worktree-make
# An easier way to make worktrees and branches for projects that have multiple repositories.
worktree-make() {
    declare branch_create=$1 branch_from=${2:=main} repo_name=$(basename $PWD)

    if [ -z $branch_create ]; then
        echo 'Please provide branch name to create'
        return
    fi

    git worktree add -b $branch_create ../worktrees/$branch_create/$repo_name $branch_from &&
        pushd ../worktrees/$branch_create/$repo_name
}
