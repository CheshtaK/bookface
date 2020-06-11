# Contributing Guidelines

_See also: [Flutter's code of conduct](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#code-of-conduct)_

* Fork `https://github.com/CheshtaK/bookface` into your own GitHub account. If you already have a fork, and are now installing a 
development environment on a new machine, make sure you've updated your fork.
* Choose an open issue from the issue list and claim it in the comments.
* Create a branch specific to the issue you're working on, so that you send a PR from that branch instead of the base branch on your fork.
* If you’d like to create a new issue, please go through our issue list first (open as well as closed) and make sure the issues you are reporting do not replicate the existing issues. 
* Follow the Issue and PR Templates provided.
* If you're on VSCode, press `Alt+Shift+F` before creating a pull request.

## Configure remotes
When a repository is cloned, it has a default remote called `origin` that points to your fork on GitHub, not the original repository it was forked from. To keep track of the original repository, you should add another remote named `upstream`:

1. Set the `upstream`:

   `git remote add upstream https://github.com/CheshtaK/bookface.git`
  
2. To update your local copy with remote changes, run the following:

   `git fetch upstream`

   `git rebase upstream/master`

   This will give you an exact copy of the current remote, make sure you don't have any local changes.


## Contributing Code
To start working on a patch:

- Make sure repo is up to date `git fetch upstream`
- Create a new branch with a meaningful name `git checkout upstream/master -b <name_of_your_branch>`
- Hack away
- Add the files you changed `git add <file_name>` (avoid `git add .`)
- Commit your changes `git commit -m "<your informative commit message>"`
- Push to your repo `git push origin <name_of_your_branch>`
- Go into the [Github repo](https://github.com/CheshtaK/bookface) and create a pull request against the `SCI-2020` branch
- If you are requested to make changes, edit your commit using `git commit --amend`, push again and the pull request will edit automatically

