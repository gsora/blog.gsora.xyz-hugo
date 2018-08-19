---
title: "OpenBSD on the Desktop: some thoughts"
date: 2018-08-18T23:36:19+02:00
draft: false
---
I've been using OpenBSD on my ThinkPad X230 for some weeks now, and the experience has been peculiar in some ways.

<!--more-->

The OS itself in my opinion is not ready for widespread desktop usage, and the development team is not trying to push it in the throat of anybody who wants a Windows or macOS alternative[^1].

[^1]: no Canonical, no Red Hat, no SUSE

You need to understand a little bit of how \*NIX systems work, because you'll use CLI more than UI. 

That's not necessarily bad, and I'm sure I learned a trick or two that could translate easily to Linux or macOS[^2].

[^2]: for example, never assume `bash` is in `/bin/bash`, always use `#!/usr/bin/env bash`!

Their development process is purely based on developers that love to contribute and hack around, just because **it's fun**.

Even the mailing list is a cool place to hang on!

Code correctness and security are a must, nothing gets committed if it doesn't get reviewed thoroughly first - nowadays the first two properties should be enforced in every major operating system.

I like the idea of a platform that continually evolves.

`pledge(2)` and `unveil(2)` are the proof that with a little effort, you can secure existing software better than ever.

I like the "sensible defaults" approach, having an OS ready to be used - UI included if you selected it during the setup process - is great.

Just install a browser and you're ready to go.

Manual pages on OpenBSD are real manuals, not an extension of the "--help" command found in most CLI softwares.

They help you understand inner workings of the operating system, no internet connection needed.

There are some trade-offs, too.

Performance is not first-class, mostly because of all the security mitigations and checks done at runtime[^3].

[^3]: OpenBSD is the first operating system that disables Intel's HyperThreading technology [out of the box](https://www.mail-archive.com/source-changes@openbsd.org/msg99141.html)

I write Go code in `neovim`, and sometimes you can feel a slight slowdown when you're compiling and editing multiple files at the same time, but usually I can't notice any meaningful difference.

Browsers are a different matter though, you can definitely feel something differs from the experience you can have on mainstream operating systems. 

But again, trade-offs.

To use OpenBSD on the desktop you must be ready to sacrifice some of the goodies of mainstream OSes, but if you're searching for a *zen* place to do your computing stuff, it's the best you can get right now.

