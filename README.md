# AoC-2022

## Project Layout
I am basing the layout of this heavily on mikezs' fantastic 2021 repository found here (https://github.com/mikezs/AoC-2021)
The command line tool is originally his, however, as I am using this to get more familiar with Swift as a whole, I will be using this opportunity to re-factor and re-write this, not for lack of any features or improvements I would like to make, more for my own understanding of what is happening behind the curtain.

Once I understand it better, I will be describing how to get this up and running for your own purposes, but at the moment, your guess is as good as mine 😬

## Days

### Day 1
I knew going into this that string manipulation would be a big throughline on each challenge, and I also knew that day 1 would be logically quite easy. I spent some time before the event opened getting to know the string manipulation tools that were available to me, settling on `.comonents(seperatedBy:)`. It threw me for a bit of a loop when, for the first time since I have been participating in this, there was a slight wrinkle in that. We had to split the numbers into groups, delineated by an extra space between. My first thought would to be to create one array that I would then split into multiple by the empty cells left by the extra `\n`, but decided to instead seperate the strings twice. First by `\n\n`, then split each item in the resulting array by the original `\n`. While I was already iterating over the array, I figured I might as well reduce the items then too, as I was fairly confident that both parts would be using a very similar way of processing the data
Part two was quite easy, I was able to just sort the array then reduce the first 3 items in the array. Probably would have worked for number one, but sorting would be significantly slower than just iterating over the array once, checking against whether it was the highest. 
