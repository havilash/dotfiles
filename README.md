# Dotfiles Repository README

This repository uses a **bare Git repository** to manage dotfiles. For details, see the [Dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

---

## 1. Setup

### Clone the Repository

Run the following command to clone your dotfiles repository as a bare Git repository:

```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
```

### Configure `.bashrc`

Add the following to your `.bashrc` or `.zshrc`:

```bash
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
dotfiles config --local status.showUntrackedFiles no
```

Reload the shell configuration:

```bash
source $HOME/.bashrc
```

### Checkout the Dotfiles

Run:

```bash
dotfiles checkout
```

If there are conflicting files, back them up and retry:

```bash
mkdir -p .config-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

dotfiles checkout
```

---

## 2. Installing Dotfiles on a New System

To set up your dotfiles on a new system, use this script:

```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
mkdir -p .config-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | while read -r file; do
    mkdir -p "$(dirname ".config-backup/$file")"
    mv "$file" ".config-backup/$file"
  done
fi;
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

---

## 3. Usage

Use the `dotfiles` alias to manage your configuration files:

- Check the repository status:

  ```bash
  dotfiles status
  ```

- Add and commit files:

  ```bash
  dotfiles add <file>
  dotfiles commit -m "Your commit message"
  ```

- Push changes:

  ```bash
  dotfiles push
  ```

For more details, see the [Dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).
