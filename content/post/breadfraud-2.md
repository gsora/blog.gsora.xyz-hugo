+++
title = "breadfraud 2"
date = "2016-12-06T13:00:59+01:00"

+++

Seems like someone is still trying to scam innocent Bitcoin users through fake Breadwallet clones published on the Apple AppStore.

This time, they got smarter: they're using a number of destination addresses instead of one, thus doing some kind of "mixing".

But still they're hardcoding them in plain C strings, so the method I used in my [first post](http://blog.gsora.xyz/Dissecting-a-fake-breadwallet-iOS-app/) is still working :-)

This time, you can find all the data I worked on on my [GitHub](https://github.com/gsora/btcfraud-2), unencrypted binaries included!

Have fun!
