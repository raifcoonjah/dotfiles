## dotfiles

---

### install

> **Prerequisite:** Ensure you have `ansible` installed.

1. Clone the repository:
   ```sh
   git clone https://github.com/rc0j/dotfiles.git ~/.dotfiles
   ```

2. Run the bootstrap playbook:
   ```sh
   ansible-playbook --diff ~/.dotfiles/script/bootstrap.yml
   ```

   This will symlink the appropriate configuration files from `.dotfiles` into your home directory.

---

## info

During the playbook run, the following task **removes any existing configuration files** before creating new ones:

```yaml
- name: Remove previous conf
  ansible.builtin.file:
    path: 
      - ~/.zshrc
      - ~/.tmux.conf
      - ~/.local/bin
    state: absent
```

Make sure to back up anything important beforehand.

---

### 📂 `bin`

No custom scripts added yet
