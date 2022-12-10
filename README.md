# AoC-2022

## Project Layout
I am basing the layout of this heavily on mikezs' fantastic 2021 repository found here (https://github.com/mikezs/AoC-2021)
The command line tool is originally his, however, as I am using this to get more familiar with Swift as a whole, I will be using this opportunity to re-factor and re-write this, not for lack of any features or improvements I would like to make, more for my own understanding of what is happening behind the curtain.

Once I understand it better, I will be describing how to get this up and running for your own purposes, but at the moment, your guess is as good as mine 😬

## Days

### Day 1
I knew going into this that string manipulation would be a big throughline on each challenge, and I also knew that day 1 would be logically quite easy. I spent some time before the event opened getting to know the string manipulation tools that were available to me, settling on `.comonents(seperatedBy:)`. It threw me for a bit of a loop when, for the first time since I have been participating in this, there was a slight wrinkle in that. We had to split the numbers into groups, delineated by an extra space between. My first thought would to be to create one array that I would then split into multiple by the empty cells left by the extra `\n`, but decided to instead seperate the strings twice. First by `\n\n`, then split each item in the resulting array by the original `\n`. While I was already iterating over the array, I figured I might as well reduce the items then too, as I was fairly confident that both parts would be using a very similar way of processing the data
Part two was quite easy, I was able to just sort the array then reduce the first 3 items in the array. Probably would have worked for number one, but sorting would be significantly slower than just iterating over the array once, checking against whether it was the highest. 

> Edit: why not sort it when the data is being initialized. Then each actual calculation can be much simpler, and much easier to read

### Day 2

## EW.

For some reason this one was quite difficult for me, I ended up just hard coding a lot, and the direction I went down for Part 1 definitely didn't pay off in the long run. The code runs, and it is legible, but I am sure there is some way to make this cleaner. The first thing that comes in mind is figuring out how to subtract from enums in swift, as just moving up or down that list by one would make for an easy solution to #2 ( assuming you wrap back to the top)

The other option would be creating some sort of object for each `shape` that lists what it wins & loses against, but I say again, `Ew.`

This is going to be one to come back to and clean up. 
> Edit: No, seems like that was the strategy.


### Day 3

This one was fine, part 2 could use some clean up, but I was quite proud of the ascii table (even though it was wrong for a while because I was normalizing both lowercase and uppercase to start at 1........).
- [ ] I would like to return to this solution and make it recursive, being able to take any subsets of the data and compare them. Might be able to make effective use of reduce? 

Regardless, it's late, that's a problem for future Lucas

### Day 4
This is the first time I really felt swift fight me. That was quite rough. In JS I would have just regexed each pairing of elves, and then deconstructed them in a single line. Using regexes in Swift seems like a horrible experience. The logic of today I think was pretty solid, but so much of my time was spent bashing my head against swift to make it work. 
Oh well, this is why I am using a different language than my main day to day language, see what it is like on the other side of the fence. 

- [x] Learn NSRegularExpression: The real tech was the RegexBuilder

### Day 5
![Very Accurate](https://preview.redd.it/6a7a2o5fz24a1.jpg?width=640&crop=smart&auto=webp&s=3c9df1a19abdff5e6280eb24b2c1f0039d44cebd)

I was so excited to use Regex after learning the RegexBuilder, however the `Reference<Int>` datatype that it returned made for an incredibly difficult time. The logic for the crane was easy, pop the top `quantity` of items off of one array, reverse them (or not), and put them on another, then rip the top off each array. Parsing that input in and making it work was so much more complex. 
Very interesting puzzle, and I have learned a lot from today, but it is so hard to google for information or documentation on the `Reference<T>` type.
Got there in the end, and with a fairly readable code in the end. 

Also, I like how protocols work in swift, the `associatedtype` generic is quite useful.

### Day 6
It was fantastic to have a bit of a day off with this one. It was made really simple by [Swift Algorithms'](https://github.com/apple/swift-algorithms) windowed function. Iterated through each window until an appropriate answer was found. I used the uniqued() function to reduce down the size of each window by removing any duplicated element, and then counting if the resulting array was the same size. An interesting approach I saw on peer solutions was to use a Set, which would do a very similar thing on instantiation. Wonder if there is a performance improvement by going with that one.
See you again tomorrow!

### Day 7
This needs to be postponed to the weekend


### Day 8
Finally, no more looking at those if statements. 

Today was a lot of logic bugs, where the tests were not sufficient to catch my errors. It turned out to be, at least for part 2 where I had the majority of my issues, a missing else / if on one of the conditions. 
Biggest takeaway from today is if you are reliant on unit testing, make sure your unit testing catches all of the edge cases.


### Day 10
Back at it again! 
Today's was a lot of fun. Went heavily into an object oriented approach, creating a class for the `Computer` that would run the instructions. Not particularily efficent memory-wise for this precise problem, however it will be quite useful later if this concept comes back (Thinking back to IntCode from a couple years ago.)
Closures are really nice in Swift, it was pretty easy to implement a hook for the clock cycle. The bigger thing that stood out to me this time around though was the breakpoints. They are so incredible.
