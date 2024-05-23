# worktree-make

An easier way to make worktrees and branches for projects that have multiple repositories.

- [Installation](#installation)
  - [Quick Install](#quick-install)
  - [Local Install](#local-install)
- [Basic Usage](#basic-usage)
- [Multiple Repositories](#multiple-repositories)

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
cd project_repository
worktree-make feat/555-products-backorder
```

This will create a new directory at `../worktrees/feat/555-products-backorder/project_repository` and then change to that directory automatically with `pushd`. The `feat/555-products-backorder` branch will already by checked out.

To return to the original repository use `popd`.

## Multiple Repositories

The generated directory structure is helpful because some projects have multiple repositories (ex: backend and frontend).

If the same exact branch name is chosen (ex: `chore/666-refactor-users`), then multiple repositories will reside within the directory for that branch. For example:

```sh
# terminal 1
cd project_frontend
worktree-make chore/666-refactor-users

# terminal 2
cd project_backend
worktree-make chore/666-refactor-users
```

Will generate the following directories:

```
../worktrees/chore/666-refactor-users/project_frontend

../worktrees/chore/666-refactor-users/project_backend
```
