# The Swuby (Swift + Ruby) Project
### With Objective-C, we had a low-level language that behaved in many ways like Ruby, and now with Swift, we are even closer to the perfect blend of Ruby's flexibility and fast, reliable performance. However, what Swift is missing is a good set of APIs!

That's where Swuby comes in. By shamelessly copying all of Ruby's well thought-out APIs (or as many as possible), we can give Swift an impressive and versatile set of tools. Note that this wasn't nearly as feasible with Objective-C. However, Swift introducted 3 key Ruby-esque things:
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
