# Vim
I use vim as my primary code editor because it's universally accessible for
most unix distributions. Vim is quick to start, and supports a wide array of
programming languages through plugins.

## Clone this repo
This project uses Git submodules for plugins. When you clone this project, by default you'll get the directories
that contain submodules, but none of the files within them. You'll want to clone the project with submodules initialized.

`git clone --recurse-submodules https://github.com/wtroughton/.vim.git`

If you forgot this step, that's okay, we'll have to initialize and update the submodules manually.

```
git clone https://github.com/wtroughton/.vim.git
git submodule init
git submodule update
```

## Need help with configuration?
See the Wiki for information related to commands, custom settings and plugin management.
