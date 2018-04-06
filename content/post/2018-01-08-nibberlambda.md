---
title: Running a Go Telegram bot on AWS Lambda
date: 2018-01-08T01:13:45+01:00
draft: false
---

I don't have any *bad* habit.

I don't smoke or drink enough to blackout, but the only thing I can not stop doing is **hosting my own server** whenever I can.

This obviously means that I run a public-facing server - which is just a **ThinkPad** - at my home, using the IPv4[^1] address that my ISP kindly provided.

[^1]: no IPv6, sadly

I'm an avid Telegram Messenger user too, and I've wrote a couple of bots to help me automate some tasks on the go, without the need of a CLI even on a smartphone.

<!--more-->

But what I really love about this amazing platform is that it takes shitposting your friends *on a whole new level*.

I **had to** have my personal shitposting bot, and after a couple hours and some pull requests [nibberbot](https://github.com/gsora/nibberbot) was born.

In a nutshell, nibberbot is a Go Telegram bot that takes a string as its input, and maps it to a string which has some (if not all) characters swapped with an emoji that resembles its shape.

For example, the letter 'b' has been replaced with the '🅱️' emoji[^2].

[^2]: for extra dank-ness the letter 'g' maps to '🅱️', too

Everything worked perfectly fine for a couple months, but one day the hard Truth knocked on my door and remembered me that my ISP had **no 99.9% SLA policy**.

All my sweet sweet bots, down.

I could not shitpost my friends.

I knew I had to find a permanent placement for them[^3] once and for all, and I decided that the best place for a high-quality shitposting software was on Amazon's server.

[^3]: yes, *them*. They are human, like us!

Or better, with no server at all!

## The server*less* experience

Initially, I thought the word "serverless" was just another buzzword, just like "*blockchain-based*" or "*powered by machine learning*", but I must admit that to some degree the idea of not having to care about deploying and maintaining your servers **can** work.

Obviously this use case is just a small-scale example, but I think a serverless setup would be perfectly fine for a small/medium mobile app startup[^4].

[^4]: which usually doesn't have money for sysadmins...

I chose AWS Lambda over e.g. Google Cloud Platform because even though I am tech-savy enough to write, deploy and maintain my own servers and applications running on them, I couldn't understand **how to run software, or even spin up a VM on their infrastructures**: the UI is just too much of a mess right now to even bother running something on GCP.

If I wanted to tinker, I would have just rented a VPS.

## How I did it

Of course, I didn't do everything on my own.

The only drawback of AWS Lambda is that it doesn't support Go out of the box[^5], so I needed to find a way to port an already existing codebase to it, with *minimal* adaptation.

[^5]: although, they're in the process of adding it 

And that's where [`aws-lambda-go-shim`](https://github.com/eawsy/aws-lambda-go-shim) came to the rescue!

It requires Go 1.8 because it uses the [plugin system](https://golang.org/doc/go1.8#plugin) to integrate and load your code faster than older methods, which usually involved executing the complete Go binary using NodeJS/Python's `system()` analogue.

From a Go perspective this means that your *Lambda function* must not contain any reference to the `main()` function, because the shim will make sure to load everything for you.

The cool thing about this library is that it natively bridges `log` package function calls to CloudWatch logs, so you can leave your logging routines right where they are, they'll just work.

A simple `aws-lambda-go-shim`-compatible function would be

```go
func Handle(evt interface{}, ctx *runtime.Context) (string, error) {
    return "Hello, World!", nil
}
```

Notice how the `Handle()` function accepts an empty interface type `evt` parameter, and a context.

The function must return something, but because nibberbot doesn't really spit out any data I'll just make sure to return an empty string, and log every error.

After having sorted out how I had to modify the existing sources, it was time to understand *how to bridge* Telegram to AWS Lambda.

I'm using that convenient concept called WebHook to have user queries pushed to my bot via an HTTP POST request, and running on Lambda shouldn't be no different than using a **conventional server**.

After adding an [API Gateway](https://aws.amazon.com/api-gateway/) entry that accepts POST requests and redirects them to the Lambda function, I was basically done.

The only thing that I had to do by hand was telling Telegram to redirect all the user queries to the URL that API Gateway promptly gives you when you push that beautiful "deploy" button.

After that, it just worked.

## nibberbot modifications

I had to modify nibberbot's code a little bit.

The original implementation accepted quite a few parameters to setup things like TSL certs, domain, port, and running on Lambda means that I can promptly forget about all of it.

The bot now reads two environment variables:

* `POST_URL`, which is the URL API Gateway gave you
* `BOT_KEY`, the Telegram bot API key

Remember that empty interface type argument, `evt`, that I illustrated before?

Well, that's your POST request content.

`aws-lambda-go-shim` cannot know what kind of data you might need in your application, so they did the only sensible thing you could do in Go, handling everything as an `interface{}`.

In my case, futher investigation[^6] revealed that the JSON Telegram pushes via the WebHook has been unmarshaled into a map.

[^6]: also known as `fmt.Println(evt)`

This means that to maintain my code as much unmodified as possible, I had to get my hands dirty a little bit:

```go
tgObjJSON, err := json.Marshal(evt)
if err != nil {
    log.Println(err)
    return "", err
}

var u tgbotapi.Update
err = json.Unmarshal(tgObjJSON, &u)
if err != nil {
    log.Println(err)
    return "", err
}

handleUpdate(u, bot)
```

By converting `evt` into a JSON string again, I could leverage the [`telegram-bot-api`](https://github.com/go-telegram-bot-api/telegram-bot-api) types and methods which I was **already** doing in the non-Lambda version of nibberbot, thus reducing the rewrite effort to nearly 0.

The porting effort was finally done, [`nibberlambda`](https://github.com/gsora/nibberlambda) was alive!

## Wrapping up

This was indeed an interesting experince, mainly because I love to tinker and love to get my hands dirty.

But this time I decided that having a reliable service with nearly 100% SLA handling most of the ugly stuff for me was the better choice, not just because it is basically free[^7], but because I learned an important lesson: **writing an awesome service means nothing if you're the only one using it**.

[^7]: thanks, free tier!

Even worse, if nobody uses it because you made *bad* hosting choices.
