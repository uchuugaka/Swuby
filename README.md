# The Swuby (Swift + Ruby) Project
#### Apple made a great language. But Apple has never been great at designing APIs. Let's shamelessly steal Ruby's!

By taking all of Ruby's well thought-out APIs (or as many as possible), we can give Swift an impressive and versatile set of tools. Note that this wasn't nearly as feasible with Objective-C. However, Swift introducted 3 key Ruby-esque things:
* Operator overloading and custom operators
* Concise first-class functions (closures)
* Primitives as objects (Int, Bool, etc.)

Here are some examples from the existing code base:
```swift
//run this snippet 10 times
10.times {
	println("hi!")
}

//first-class regex
var r: Regex = /"^[^@]+@[0-9A-Za-z]\.[A-Za-z]{2,4}$"

//find a substring matching a regex
var firstName: String = name[/"^[A-Za-z]+"]

//find the Point object with the largest x value
var maxPoint: Point = points.maxBy {$0.x}

/*
 * from an array of users, create an sorted array of sorted arrays, each one of which
 * holds all of the people who share the same first letter of their name. think of a contacts table
 */
users.sortBy({$0.name}).partition({$0.name[0]})
```

And so much more! Contributors welcome :)
## Contributing - A great way to learn Swift
Most of the methods have very simple logic but will teach you the ins and outs of the syntax. There's lots of code to be written, so you can pick the perfect spot for what you want to do. But before you go off writing code, make sure to pick something in the "To Do" section on Trello: https://trello.com/b/t2WyTK5M/tasks
