# LOVE 2D and LUA

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Topics

- **LUA Basics**
    - An overview of how LUA works, as much as you need to make a simple game
- **LÖVE 2D**
    - Installation of LOVE 2D
    - Making a simple game to demonstrate the core concepts
- **Principles and further learning**
    - Higher level advice on game development
    - Resources for further learning and communities where you can find help

# Feedback

Please leave feedback if you have participated in this workshop!  It helps us tweak and improve the future iterations of this workshop, close up any holes in the presentations, and generally continue to provide awesome learning experiences to the community.

# Contributing

If you want to get involved, please see the rules and guildelines in the [CONTRIBUTING.md](CONTRIBUTING.md) file before getting started.

## Building the Presentation

The presentation is built with [zola][zola], which you can [install][install-zola] with a package manager on your system.  The presentation also requries [bower][bower] in order to set up [reveal.js][reveal.js].

Once zola and bower are installed, there are only two steps required to build the presentation:

```
$ cd path-to-repository
$ bower install
$ zola serve
```

## Adding slides

Inside of `content/slides`, there are a bunch of markdown files and a `slides.json` file.  The `slides.json` file specifies which slides are going to appear in the presentation and looks something like so:

```
[
    ["outline"],
    ["install/love", "install/windows", "install/mac", "install/linux"]
]
```

The outer level `[]` is the list of horizontal slides, and each list contained within it is the set of [vertical slides][reveal.js-vertical-slides] which appear for that slide.  The `presentation.md` file is the title slide.

The slides are markdown files specified by their relative file path in the `content/slides` directory, _without_ the extension.

The order of the slides can be changed without opening any slide files, which is very useful in practice.

Due to the limitations of [zola][zola], the presentation server must be killed and restarted when the presentation is changed.

_Note:_ The title slide specifies the directory which conains the slides and specifies the path to the slide list, which means it is also possible to maintain multiple presentations in the same project, and even share files among different presentations.

[zola]: https://getzola.org
[install-zola]: https://www.getzola.org/documentation/getting-started/installation/
[bower]: https://bower.io/
[reveal.js]: https://github.com/hakimel/reveal.js
[reveal.js-vertical-slides]: https://github.com/hakimel/reveal.js#markup
