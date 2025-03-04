## Tutorials

[<img src="https://i.imgur.com/sVEktDn.png">](https://youtu.be/CPLdltN7wgE)

- [15 Lazygit Features in 15 Minutes](https://youtu.be/CPLdltN7wgE)
- [Basics Tutorial](https://youtu.be/VDXvbHZYeKY)
- [Rebase Magic Tutorial](https://youtu.be/4XaToVut_hs)

## Usage

Call `lazygit` in your terminal inside a git repository.

```sh
$ lazygit
```

If you want, you can
also add an alias for this with `echo "alias lg='lazygit'" >> ~/.zshrc` (or
whichever rc file you're using).

### Keybindings

You can check out the list of keybindings [here](/docs/keybindings).

### Changing Directory On Exit

If you change repos in lazygit and want your shell to change directory into that repo on exiting lazygit, add this to your `~/.zshrc` (or other rc file):

```
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
```

Then `source ~/.zshrc` and from now on when you call `lg` and exit you'll switch directories to whatever you were in inside lazygit. To override this behaviour you can exit using `shift+Q` rather than just `q`.

### Undo/Redo

See the [docs](/docs/Undoing.md)

## Configuration

Check out the [configuration docs](docs/Config.md).

### Custom Pagers

See the [docs](docs/Custom_Pagers.md)

### Custom Commands

If lazygit is missing a feature, there's a good chance you can implement it yourself with a custom command!

See the [docs](docs/Custom_Command_Keybindings.md)

### Git flow support

Lazygit supports [Gitflow](https://github.com/nvie/gitflow) if you have it installed. To understand how the Gitflow model works check out Vincent Driessen's original [post](https://nvie.com/posts/a-successful-git-branching-model/) explaining it. To view Gitflow options from within Lazygit, press `i` from within the branches view.

## Contributing

We love your input! Please check out the [contributing guide](CONTRIBUTING.md).
For contributor discussion about things not better discussed here in the repo, join the [discord channel](https://discord.gg/ehwFt2t4wt)

<a href="https://discord.gg/ehwFt2t4wt"><img src='../assets/discord.png' width='75'></a>

Check out this [video](https://www.youtube.com/watch?v=kNavnhzZHtk) walking through the creation of a small feature in lazygit if you want an idea of where to get started.

### Debugging Locally

Run `lazygit --debug` in one terminal tab and `lazygit --logs` in another to view the program and its log output side by side

## Donate

If you would like to support the development of lazygit, consider [sponsoring me](https://github.com/sponsors/jesseduffield) (github is matching all donations dollar-for-dollar for 12 months)

## FAQ

### What do the commit colors represent?

- Green: the commit is included in the master branch
- Yellow: the commit is not included in the master branch
- Red: the commit has not been pushed to the upstream branch

## Shameless Plug

If you want to see what I (Jesse) am up to in terms of development, follow me on
[twitter](https://twitter.com/DuffieldJesse) or check out my [blog](https://jesseduffield.com/)

## Alternatives

If you find that lazygit doesn't quite satisfy your requirements, these may be a better fit:

- [GitUI](https://github.com/Extrawurst/gitui)
- [tig](https://github.com/jonas/tig)
- 