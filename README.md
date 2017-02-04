## ASDKDemo

`AsyncDisplayKit` is quite popular right now, there are so many articles talking about it recently. In some talks by fb engineers, they mentioned that ASDK leverage on rendering the UI in background thread(wtf???) to minimize the workload of main thread so to improve the performance.

First time I heard of it, it was quite silly because we all knew that Apple suggests us to do all the UI staffs on main thread, how can fb engineers did it??? I had so many questions in my mind but first of all...let's try it.

In this demo, I simply created a two dimensional gallery

![](https://github.com/calvinchankf/ASDKDemo/blob/master/demo.gif?raw=true)

P.S. the gif is minimized. To see the actual comparison, download and run it.

### What I can see in the demo?
- less laggy ( dropped frames )
- images are loaded before they appear on screen
- no more `horizontal-scrolling cells` and `image-changing cells` ( actually I didn't do it in UIKit part, because I wanted to try if ASDK would handle it...and surprisingly ASDK did it for me =] )

### What I can benefit from ASDK in a developer perspective?

##### Using CSS concept to compose user interfaces

- For some complex layouts, it is definitely handy. e.g. no more constraints, no more math...etc

##### No more `storyboards` !!!

- When you are working in a big application, you might encounter [so many problems](https://www.youtube.com/watch?v=g6yz5oX5iWc) if you use storyboards.

##### About TableView

- No more `heightForRowAtIÂndexPath` !!! ASDK calculates it for you in each node once you implemented `layoutSpecThatFits`.

- No more `prepareForReuse`

- No `reuseIdentifier`

##### Of cox there are so much more

- progressive image loading
- view hierarchy flattening
- ...

### Conclusion
I will use ASDK from now on =]
