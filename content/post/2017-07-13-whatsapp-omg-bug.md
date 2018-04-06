---
title: "Regarding WhatsApp IP \"leakage habit\""
date: 2017-07-13T17:30:25+02:00
draft: false
---

Recently [Colin Hardy](https://twitter.com/cybercdh) posted a [video](https://www.youtube.com/watch?v=yELed8lfuRw&feature=youtu.be) where he demonstrated how the WhatsApp web client leaks the user's IP address when computing URL previews.

All of the sudden the entire web freaked out because of this behavior, while in my opinion there isn't much to be scared of.

<!--more-->

Before reading this post, check out Colin's video to see the issue yourself.

From the outside, it might seem that WhatsApp thrown away every possible privacy measure out of the window just because of a cool feature - that nobody even asked for.

There are three main points to make regarding this situation:

 - if they're employing end-to-end encryption, how it is possible to create URL previews?
 - why don't they create them on their servers?
 - why are they "leaking" the user's IP address?

To be honest, I don't think they're leaking anything.

Colin showed how WhatsApp made all the requests needed to create previews on the **client**, which obviously will show its IP in the web server's log along with a custom user agent, exactly like a browser would do.

This kind of "privacy concern" is not something new, we knew this already: you cannot hide your activity online unless you employ some sort of **VPN**, or **TOR**.

Obviously, the "ping the URL for each new character added" is *not* how it should be done, but the situation is the same.

They're **enforcing** E2E encryption but they're adding functionality, while preserving user's messages privacy.

About E2E encryption, [Wikipedia](https://en.wikipedia.org/wiki/End-to-end_encryption) says:

```
End-to-end encryption (E2EE) is a system of communication where only the communicating users can read the messages. In principle, it prevents potential eavesdroppers – including telecom providers, Internet providers, and even the provider of the communication service – from being able to access the cryptographic keys needed to decrypt the conversation.
```

They're not leaking encryption keys, encrypted message blobs or anything, thus E2EE is still there.

To offer this kind of functionality they **need** to have access to the URL in the first place, which **they can't** because of E2EE: they're *forced* to fetch informations client-side because of the **inability** to read messages server-side.

System administrator will maintain access logs for a variety of reasons, and the fact that WhatsApp is pinging the URL on the client is not something that will lead to a catastrophic privacy violation from them.

The only correlation that you can have with this kind of data is that someone with a given IP address is writing an URL which points to a server you control on a WhatsApp chat.

The worst-case scenario would be a world where every server facing the Internet is controlled and scraped by a global survelliance agency, capable of making more sophisticated correlation than that, but in reality there isn't much use for this metadata.

On the other side of the boat there's **Telegram** - which I use and prefer to WhatsApp - that doesn't "leak" anything just because their service works in a *different* way.

Telegram offers standard chats/groups and secret chats - E2EE is present only on the latter.

I've replicated Colin's experiment with my own server with both chat types and the results were not that surprising:

 - in standard chats, URL previews are proxied by "TelegramBot" - since they're not using E2EE here, makes sense
 - in secret chats, URL previews are completely disabled

This situation resembles an evergreen in Software Engineering where to offer a service and make the user, trade-offs needs to be made. 

This time, they needed the client to make extra requests on behalf of the user.

While Telegram choice is not questionable, neither is WhatsApp's: message content is preserved from evasedropping, which is what really matters.
