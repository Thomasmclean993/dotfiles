# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Setup on a new machine

1. Install chezmoi:
   ```
   brew install chezmoi
   ```

2. Point chezmoi at this repo as its source directory. Create
   `~/.config/chezmoi/chezmoi.toml` with:
   ```toml
   sourceDir = "/Users/<you>/dotfiles"
   ```
   (This repo is expected to live at `~/dotfiles`. Clone it there first:
   `gh repo clone Thomasmclean993/dotfiles ~/dotfiles`.)

3. Apply:
   ```
   chezmoi apply
   ```
   This creates the managed files/symlinks in your home directory.

## Claude Code config and .taskrc

`~/.claude/commands`, `~/.claude/agents`, `~/.claude/settings.json`,
`~/.claude/skills/security-review-precommit`, and `~/.taskrc` are tracked as
**symlinks** (chezmoi's `symlink_` source attribute), not plain copies.

The real file content lives under `.dotfiles_src/` in this repo (a
dot-prefixed directory, so chezmoi ignores it as an apply target and only
uses it as backing storage for the symlink entries). Because these are true
symlinks, editing the live files at e.g. `~/.taskrc` or
`~/.claude/settings.json` edits the repo content directly — no `chezmoi
add`/`re-add` step needed. Just `git add`, commit, and push from `~/dotfiles`
as usual.

Other files under `~/.claude` (e.g. the `caveman` and `find-skills` skills)
are intentionally left unmanaged and are not part of this repo.

### Adding a new symlinked file/directory

To add another file this way (from within `~/dotfiles`):

```sh
# 1. Move the real file/dir into the backing store
mv ~/.claude/some-new-thing .dotfiles_src/claude/some-new-thing

# 2. Create a symlink_ template entry pointing at it (name mirrors the
#    destination path, prefixed with symlink_ and suffixed with .tmpl)
printf '%s' '{{ .chezmoi.sourceDir }}/.dotfiles_src/claude/some-new-thing' \
  > dot_claude/symlink_some-new-thing.tmpl

# 3. Apply, then commit
chezmoi apply --dry-run --verbose ~/.claude/some-new-thing   # sanity check
chezmoi apply ~/.claude/some-new-thing
git add -A && git commit -m "add some-new-thing" && git push
```
