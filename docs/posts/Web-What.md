---
layout: post
title: Web what?
---

> __<span style="color:#ac4142;">TL;DR --</span>__ In this blog post, I share my personal story of how I discovered __web development__ and came to passionately love it. Also about my mistakes and misconceptions along the way. It is not about the "ultimate truth" but rather about my personal observations and perception.
>
> So, it will probably be more interesting to you if you are now in a similar situation to the one I was in at the beginning of the way. It was a long way and it took me at least a year to come to understand what web development was all about. I will be very happy if my story helps you to shorten yours. __:)__ And, of course, your comments are more than welcome.

Hello, Reader. My name is André Roussakoff. At the moment of writing this post, I am 57 and I have never in my life had a blog of my own. I have never realized that it would be so hard to begin. There is so much to say and I have yet no clear understanding of what my blog will finally look like. Only that I have to start.

I have been an application developer for many years, mostly developing the backend applications and SQL databases. Working mostly with .NET and C#. I had no clear notion of the existence of web development as profession. Websites fascinated me by their beauty and style. Creating websites I called __web design__ and I thought that it had everything to do with creative art and Photoshop skills. Being an application developer, I had a feeling that it lay outside of my profession.

Until several years ago. Then one day I was confronted with the necessity to create a website for a good acquaintance of mine.  Somebody mentioned CMS as a tool to create websites and I started my research about CMS. Of course, the most popular were __WordPress__ and __Joomla!__. Unfortunately, both packages were written in PHP and I was in no hurry to learn another programming language even before I have created my first website. I must admit that I failed at the latter anyway because just using the standard menu options, I was never quite satisfied with the results.

### Separation of Concerns

However, that CMS research on the positive side gave me the notion of __separation of concerns__. That when thinking about a website, one has to consider these four notions:

*   __Form__ (structure and presentation)
*   __Style__ (CSS)
*   __Content__ (information)
*   __Behavior__ (UX)

and that these can be treated rather independently of each other. That was a breakthrough because I suddenly saw a bridge to the world of OOP (Object Oriented Programming), which was very familiar to me and that one does not have to do all at once.
With it also came the realization that my understanding of the notion of web design covered but a small piece of the whole story. That in terms of activities related to the website creation, we can distinguish (at least) the following three:

*   __web design__ 
*   __web development__
*   __content management__

Web design has indeed a lot to do with artistic creativity. Web development has to do with tons and tons of programming. And content management is the main responsibility of the actual website owner.

At this point, I decided to look deeper into web development. To my utter amazement the deeper I looked, the more there was to learn and the more confusing it all seemed. In Holland, we have a saying: _"Among all the trees, one does not see the forest"_. That was definitely true to say about me at that moment. Even now to some extent, I must admit, although I begin to have my preferences.

### Web Development

Zooming further in on web development, I discovered there were two major areas of it:

*   __front-end or client side development__
*   __back-end or server side development__

and those developers who are doing both often talk about their work as

*   __full stack website development__

Front-end development has more to do with the visible to visitors part of the website, like menus, animations, complex UX tricks, DOM manipulations, etc.

Back-end development has more to do with the "invisible" activities, like user authentication and authorization, HTTP requests handling, data and database manipulation.

### Websites vs Apps

The next "tree" was the realization that mobile devices like smartphones and tablets often require a special approach and that apps we download for an app store are not the websites we browse on our PC or notebook screen. One can distinguish roughly four types of apps:

*   __web apps__
*   __native apps__
*   __mobile apps__
*   __hybrid apps__

A _web app_ is, in fact, nothing more than a classic website, which we view on a mobile device using any installed browser.

A _native app_ needs first to be registered within an app store like Windows Store, Apple Store or Google Play. Only after that we can download it and install on our mobile device. Thus, a native app is not a website but an application.

A _mobile app_ is a web app that has such look and feel that, when started, it is practically undistinguishable from a native app.

Finally, a _hybrid app_ combines the features of both worlds, web and native, and can access the mobile device's hardware. E.g. imagine an app in an app store, which is a wrapper around a classic website. Or a cross-browser app, which is customized to work on mobile devices independent of its platform.

One special sort of apps is a __SPA__ (Single Page Application). A SPA has look and feel of a website or a native app with many pages and menu et al. Whereas technically it is all the time one and the same page object, only its elements are in-place replaced by new elements depending on the user action. E.g. the next image replaces the previous image or the content of another page replaces the content of the current page. And due to caching this can happen even without communication between the client and the server.

### Different Platforms

The next "tree" came as a shock. Being a .NET developer I was supposed to "hate" all things Java because all Java developers "hate" all things .NET. __:)__ Also, being a Windows developer I was supposed to "hate" all things Android or macOS. Same reason. All this was quite difficult to digest. Yet, maybe 90% of all mobile devices in the world are not on Windows platform. Have I landed in the wrong camp without even noticing it? The obvious answer seems to be "yes", isn't it?

On the other hand, one can ask another question: should I switch camps at the age of 57? Would it be reasonable and feasible? Fortunately for me, Microsoft seems to also have realized this gap and the hard choice that many a Windows developer was facing because of its previous policy.

As of last year, Microsoft came up with a number of new tools. It went open source with ASP.NET 5 (a.k.a. ASP.NET Core), MVC 6 and Entity Framework 7. It became partners with Cordova for the possibility of cross-platform development under Windows. And it brought out a wonderful light-weight code editor, Visual Studio Code (__VSCode__), which is absolutely NOT a clone of Visual Studio but rather a brother of such editors as Atom, Brackets or Sublime Text and even works on Linux and macOS.

At the same time, I have found out that I can run some traditional Linux/macOS tools under Windows like Nodejs.

As a developer, having all these tools at my disposal,  I don't feel in any way limited by Windows platform as to the kind of web development I can do, now or in future.

Yippee! I don't have to switch the platform! __:)__

### JavaScript, the Language of the Web

Turning around, the next "tree" was JavaScript. JavaScript for me started at the very early stage of CMS research when my web world consisted of WordPress and Joomla!. As soon as I saw some basic __jQuery__ scripting, I almost immediately came across this advice (in my free interpretation):

> Avoid using jQuery or JavaScript as much as possible, because inadequate code can completely ruin the website performance.

At first, it sounded reasonable and for some time I did indeed avoid anything to do with it. Probably for a non-developer, it is a reasonable thing to do. But for me, the more I saw of JavaScript here and there, the more I came to love it and the more wonderful things I saw it can make rather than break. So, I learned myself some JavaScript.

And with that, I perceived a whole new world previously completely unknown to me. I am talking about myriad of different JavaScript frameworks and libraries, like __Nodejs__, __Angular__, __Aurelia__, __React__, __Backbone__, __Underscore__ and __Lodash__, __Express__ and __Hapi__, __Gulp__, __Grunt__, __Ionic__, __Signalr__, __Karma__, __Jasmine__, __Mocha__, __Selenium__ - you name it. Even the names themselves are beautiful to say nothing of what these tools are capable of!

The most important discovery was that it is practically unthinkable to do web development without HEAVY use of JavaScript. Talking about that advice to avoid it as much as possible! __:)__

### MVC and REST API

In this final part of the article, I want to talk about the concept of __separation of concerns__ that I have mentioned earlier and in a very different context. When talking about CMS, this separation was related to Form, Style, Content and Behavior. Now, I realize that on a lower, more technical level this "external" separation of concerns can be hard coupled with the beautiful __MVC__ (Model-View-Controller) paradigm. MVC relates to the way we structure our code in terms of responsibilities and it determines the division between:

*   __Model__ (representation of the data structure)
*   __View__ (the way to present the information to the user)
*   __Controller__ (application logic behind the scenes which binds Views and Models together)

__On the client side__, everything can be written in plain JavaScript but it is probably much easier to use some specialized JavaScript framework of library. My impression is that at the moment, the most popular framework for client side development seems to be __Angular__ with __React__ only a half step behind, although my personal beauty prize goes to __Aurelia__.

__Angular__ has also such advantage that, in combination with __Ionic__ framework, it makes it easier to create cross-platform apps. And as to __React__, it is the Facebook's main development tool.

In the earlier versions of ASP.NET MVC, Microsoft used out-of-the-box no JavaScript for client side development. The clients had to send AJAX requests to the server. The response was composed on the server and after that sent to the client. With the corresponding performance penalty. On the other hand, the standard tool for the development of views is __Razor__. This fantastic tool makes it possible to combine HTML code with C# snippets, so that we can manipulate HTML tags based on C# variables and use conditional logic and loops. Recently, I came across a wonderful __Umbraco__ CMS, which became my second love in the world of web development, the first being __Aurelia__. Umbraco CMS is free, is based on ASP.NET MVC 4, and it uses Angular on the client side.

__On the server side__, I have discovered the wonderful world of __RESTful API__. Simply explained, it is a two-way translation between the URL string composition and the corresponding action that has to be executed. Here is a couple of trivial examples how a __RESTful API__ could look like:

*   [http://website.com](http://website.com)  - show home page
*   [http://website.com/articles](http://website.com/articles)  - show list of articles
*   [http://website.com/articles/1](http://website.com/articles/1)  - show or update article with id = 1

__RESTful API__ can be implemented in a lot of different ways: with _JavaScript_ (e.g. Nodejs + Express) or with _C#/ASP.NET_.

Also, it is now possible to develop with JavaScript inside the Visual Studio 2015, or alternatively develop completely outside of Visual Studio using VSCode on any platform, Windows, Linux or macOS, and even run natively C# code on all of them using OmniSharp!

### Round up

Surprisingly, it has become quite a big article, over 2000 words. I have told you about the different steps I had gone through before I had discovered the "forest" of web development as my new love. Although there are so many different puzzle pieces in the web development picture, there some important binding concepts that keep it all together and give me the feeling of beauty.

*   the most important central notion of __separation of concerns__ (both in CMS and MVC)
*   the possibility to use __same toolset__ for different aims (different apps and SPAs), so everything become more accessible and understandable
*   __Microsoft going open source__ with the latest release of ASP.NET, MVC and Entity Framework and its support for traditional Linux/macOS tooling as well, so no necessity to switch to Java camp
*   __huge open source community__ behind all of this, which made it possible for me to come this far and maybe even inspired me to write this article

This is by far not the end of the way! It is only the first step. From complete illiteracy to learning to read and understand something of what I have read. A much more difficult step is the next one: learning to write. Meaning developing complete projects from A to Z and thus using the tools I have learned.

I believe I have yet to add a link here and there in case somebody becomes interested to go into more details on some tool or framework, although Google search also can help.

Thank you, the Reader, for coming this far. If there is anything at all that you could add as feedback on this article, please do. Be it positive or negative. I will accept it thankfully.
