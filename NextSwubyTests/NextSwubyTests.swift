//
//  NextSwubyTests.swift
//  NextSwubyTests
//
//  Created by Michael Eisel on 7/2/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import XCTest

func generatorMaxBy<T, U: Comparable, Y: Sequence>(seq: Y, closure: (Y.GeneratorType.Element) -> U) -> Y.GeneratorType.Element? {
	var generator = seq.generate()
	var maxValue: U
	var element: T
	if var maxElement: Y.GeneratorType.Element = generator.next() {
		maxValue = closure(maxElement)
		while let element = generator.next() {
			let value: U = closure(element)
			if value > maxValue {
				maxElement = element
				maxValue = value
			}
		}
		return maxElement
	} else {
		return nil
	}
}

func generatorFirst<Y: Sequence>(seq: Y) -> Y.GeneratorType.Element? {
	var generator = seq.generate()
	return generator.next()
}

func generatorLast<Y: Sequence>(seq: Y) -> Y.GeneratorType.Element? {
	var generator = seq.generate()
	if var previous = generator.next() {
		var current: Y.GeneratorType.Element
		while let current = generator.next() {
			//keep going...
		}
		return previous
	} else {
		return nil
	}
}

extension Array {
    func minBy<U: Comparable>(closure: (T) -> U) -> T? {
		var s: Sequence = SequenceOf<T>(self)
    	return generatorMinBy(s, closure)
    }
}

func generatorMinBy<T, U: Comparable>(sequence: Y, closure: (Y.GeneratorType.Element) -> U) -> Y.GeneratorType.Element? {
	var generator = sequence.generate()
	var minValue: U
	var element: T
	if var minElement: Sequence.GeneratorType.Element = generator.next() {
		minValue = closure(minElement)
		while let element = generator.next() {
			let value: U = closure(element)
			if value < minValue {
				minElement = element
				minValue = value
			}
		}
		return minElement
	} else {
		return nil
	}
}

func generatorSortBy<U: Comparable, Y: Sequence>(sequence: Y, closure: (Y.GeneratorType.Element) -> U) -> Y {
	var generator = sequence.generate()
	var copy: Array<Y.GeneratorType.Element> = []
	while let element = generator.next() {
		copy.append(element)
	}
	copy.sort({closure($0) > closure($1)})
	//var seq2: Sequence = sequence.
	//return copy
	return sequence //NOT CORRENT
}

extension Array {
	mutating func maxBy<U: Comparable>(closure: (T) -> U) -> T! {
		if self.count == 0 {
			return nil
		}
		var maxElement: T = self[0]
		var maxValue: U = closure(maxElement)
		for e in self[1..self.count].generate() {
			let value: U = closure(e)
			if value > maxValue {
				maxElement = e
				maxValue = value
			}
		}
		return maxElement
	}

	var first: T? {
	return generatorFirst(self)
	}

	var last: T? {
	return generatorLast(self)
	}

	func sortBy<U: Comparable>(closure: (T) -> U) -> Array<T> {
		var copy: Array<T> = self.copy()
		copy.sort({closure($0) > closure($1)})
		return copy
	}

	func partitionBy<U: Equatable>(closure: (T) -> U) -> Array<Array<T>> {
		if self.count == 0 {
			return []
		}
		var partitions: Array<Array<T>> = [[self[0]]]
		var previousValue: U = closure(self[0])
		for e in self[1..self.count] {
			var value = closure(e)
			if value == previousValue {
				partitions[partitions.count - 1] += e
			} else {
				partitions += [e]
			}
		}
		return partitions
	}

	func all(closure: (T) -> Bool) -> Bool {
		for e in self {
			if !closure(e) {
				return false
			}
		}
		return true
	}

	func any(closure: (T) -> Bool) -> Bool {
		for e in self {
			if closure(e) {
				return true
			}
		}
		return false
	}

	func each(closure: (T) -> ()) {
		for e in self {
			closure(e)
		}
	}

	func each(closure: () -> ()) {
		for e in self {
			closure()
		}
	}
}

class NextSwubyTests: XCTestCase {

	var ints: Array<Int> = []
	var emptyArray: Array<Int> = []

    override func setUp() {
        super.setUp()
		ints = [2, 5, 3]
    }

    /*override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }*/

	func testFirst() {
		XCTAssertNil(emptyArray.first)
		XCTAssertEqual(ints.first!, 2)
	}

	func testLast() {
		XCTAssertNil(emptyArray.last)
		XCTAssertEqual(ints.last!, 3)
	}

	func testSortBy() {
		XCTAssert(emptyArray.sortBy{$0} == [])
		XCTAssert(ints.sortBy({$0}) == [5, 3, 2])
		XCTAssert(ints.sortBy({-$0}) == [2, 3, 5])
		XCTAssert(ints.sortBy({$0 % 4}) == [3, 2, 5])
	}

	func testPartitionBy() {
		XCTAssert(emptyArray.partitionBy({$0}) == [])
		//NEEDS MORE TESTS
	}

	func testMinBy() {
		XCTAssertNil(emptyArray.maxBy({$0}))
		XCTAssert(ints.minBy({$0 % 4}) == 5)
		XCTAssert(ints.minBy({-$0}) == 5)
		XCTAssert(ints.minBy({$0}) == 2)
	}

	func testMaxBy() {
		XCTAssertNil(emptyArray.maxBy({$0}))
		XCTAssert(ints.maxBy({$0 % 4}) == 3)
		XCTAssert(ints.maxBy({-$0}) == 2)
		XCTAssert(ints.maxBy({$0}) == 5)
    }

	func testAll() {
		XCTAssert(ints.all({$0 % 2 == 0}) == false)
		XCTAssert(ints.all({$0 % 3 == 0}) == false)
		XCTAssert(ints.all({$0 < 6}) == true)
		XCTAssert(ints.all({$0 > 0}) == true)
	}

	func testAny() {
		XCTAssert(ints.any({$0 % 2 == 0}) == true)
		XCTAssert(ints.any({$0 % 3 == 0}) == true)
		XCTAssert(ints.any({$0 > 6}) == false)
		XCTAssert(ints.any({$0 < 0}) == false)
	}

	func testEach() {
		var sum = 0
		ints.each {
			sum += $0
		}
		XCTAssert(sum == 10)

		var product = 1
		ints.each {
			product *= $0
		}
		XCTAssert(product == 30)

		emptyArray.each {
			// tests that this method works even without a parameter passed in
		}

		sum = 0
		/*ints.each {
			sum++
		}
		XCTAssert(sum == 3)*/
	}
}