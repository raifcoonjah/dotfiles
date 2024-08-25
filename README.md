## install

Ensure you have `ansible` installed.

Run this:

```sh
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

```shell
ansible-playbook --diff script/bootstrap.yml
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`. 

To note: When running the playbook, the following `task` will remove any previous files:

```yaml
    - name: Remove previous conf
      ansible.builtin.file:
        path: 
          - ~/.zshrc
          - ~/.tmux.conf
          - ~/.local/bin
        state: absent
```

So please, be careful :warning:

---

### `bin`

`seach-alias` => This very simple, i tend to forget aliases a lot... So to make it easier to find them, try:

```shell
search-alias git
```
