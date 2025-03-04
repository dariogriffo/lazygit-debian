[Demo](https://youtu.be/NICqQPxwJWw)


## Usage

Call `lazygit` in your terminal. I personally use this a lot so I've made an alias for it like so:

```
echo "alias lzd='lazygit'" >> ~/.zshrc
```

(you can substitute .zshrc for whatever rc file you're using)

- Basic video tutorial [here](https://youtu.be/NICqQPxwJWw).
- List of keybindings
  [here](/docs/keybindings).

## Cool features

everything is one keypress away (or one click away! Mouse support FTW):

- viewing the state of your docker or docker-compose container environment at a glance
- viewing logs for a container/service
- viewing ascii graphs of your containers' metrics so that you can not only feel but also look like a developer
- customising those graphs to measure nearly any metric you want
- attaching to a container/service
- restarting/removing/rebuilding containers/services
- viewing the ancestor layers of a given image
- pruning containers, images, or volumes that are hogging up disk space

## Contributing

There is still a lot of work to go! Please check out the [contributing guide](CONTRIBUTING.md).
For contributor discussion about things not better discussed here in the repo, join the discord channel

<a href="https://discord.gg/ehwFt2t4wt"><img src='/docs/resources/discord.png' width='75'></a>

## Donate

If you would like to support the development of lazygit, consider [sponsoring me](https://github.com/sponsors/jesseduffield) (github is matching all donations dollar-for-dollar for 12 months)

## Social

If you want to see what I (Jesse) am up to in terms of development, follow me on
[twitter](https://twitter.com/DuffieldJesse) or watch me program on
[twitch](https://www.twitch.tv/jesseduffield)

## FAQ

### How do I edit my config?

By opening lazygit, clicking on the 'project' panel in the top left, and pressing 'o' (or 'e' if your editor is vim). See [Config Docs](/docs/Config.md)

### How do I get text to wrap in my main panel?

In the future I want to make this the default, but for now there are some CPU issues that arise with wrapping. If you want to enable wrapping, use `gui.wrapMainPanel: true`

### How do you select text?

Because we support mouse events, you will need to hold option while dragging the mouse to indicate you're trying to select text rather than click on something. Alternatively you can disable mouse events via the `gui.ignoreMouseEvents` config value.

Mac Users: See [Issue #190](https://github.com/jesseduffield/lazygit/issues/190) for other options.

### Why can't I see my container's logs?

By default we only show logs from the last hour, so that we're not putting too much strain on the machine. This may be why you can't see logs when you first start lazygit. This can be overwritten in the config's `commandTemplates`

If you are running lazygit in Docker container, it is a know bug, that you can't see logs or CPU usage.

## Alternatives

- [docui](https://github.com/skanehira/docui) - Skanehira beat me to the punch on making a docker terminal UI, so definitely check out that repo as well! I think the two repos can live in harmony though: lazygit is more about managing existing containers/services, and docui is more about creating and configuring them.
- [Portainer](https://github.com/portainer/portainer) - Portainer tries to solve the same problem but it's accessed via your browser rather than your terminal. It also supports docker swarm.
- See [Awesome Docker list](https://github.com/veggiemonk/awesome-docker/blob/master/README.md#terminal) for similar tools to work with Docker.

