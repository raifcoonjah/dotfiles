## install

Ensure you have `ansible` installed.

Run this:

```shell
git clone https://github.com/rc0j/dotfiles.git ~/.dotfiles
```

```shell
ansible-playbook --diff script/bootstrap.yml
```

This will create symlink the appropriate files in `.dotfiles` to your home directory.

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

No bins yet.
