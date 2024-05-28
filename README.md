# worktree-make 🐙

An easier way to make [git worktrees](https://git-scm.com/docs/git-worktree) and branches for projects that have multiple repositories.

- [Installation](#installation)
  - [Quick Install](#quick-install)
  - [Local Install](#local-install)
- [Basic Usage](#basic-usage)
- [Multiple Repositories](#multiple-repositories)
- [Clean up](#clean-up-worktrees--branches)

## Installation

Review the [install.sh](install.sh) and [worktree-make.sh](worktree-make.sh) files before installing.

### Quick Install

For easy installation. Run the following curl statement to add the `worktree-make` function to your shell configuration file. Append the statement with the name of the target configuration file.

For example, if using Bash on Linux:

```sh
curl https://raw.githubusercontent.com/joematthews/worktree-make/main/install.sh | bash -s -- ~/.bashrc
```

Or, if using Zsh on macOS:

```sh
curl https://raw.githubusercontent.com/joematthews/worktree-make/main/install.sh | bash -s -- ~/.zshrc
```

Then run `source` on the configuration file (~/.zshrc in this example):

```sh
source ~/.zshrc
```

### Local Install

Clone the repository and run the [install.sh script](install.sh). Append the statement with your shell configuration file (~/.zshrc in this example):

```sh
git clone git@github.com:joematthews/worktree-make.git
./install.sh ~/.zshrc
source ~/.zshrc
```

## Basic Usage

To quickly create a worktree within a git repository, enter a branch name:

```sh
cd project-repository
worktree-make feat/555-products-backorder
```

This will create a new directory at `../worktrees/feat/555-products-backorder/project-repository` and then change to that directory automatically with `pushd`. The `feat/555-products-backorder` branch will already by checked out.

To return to the original repository use `popd`.

## Specify 'From Branch'

By default, worktree-make branches off of `main`, to branch off of a different branch, append the branch name to the end:

```sh
worktree-make feat/555-products-backorder master
```

## Multiple Repositories

The generated directory structure is helpful because some projects have multiple repositories (ex: backend and frontend).

If the same exact branch name is chosen (ex: `chore/666-refactor-users`), then multiple repositories will reside within the directory for that branch. For example:

```sh
# terminal 1
cd project-frontend
worktree-make chore/666-refactor-users

# terminal 2
cd project-backend
worktree-make chore/666-refactor-users
```

...will generate the following directories:

```
../worktrees/chore/666-refactor-users/project-frontend

../worktrees/chore/666-refactor-users/project-backend
```

## Clean up worktrees & branches

To clean up the worktrees simply delete the parent branch directory:

```sh
rm -r worktrees/chore/666-refactor-users
```

And then for each related repository, prune the worktrees:

```sh
# within project-frontend & project-backend
git worktree prune
```

And then finally, delete the branch:

```sh
# within project-frontend & project-backend
git branch -d chore/666-refactor-users
```
