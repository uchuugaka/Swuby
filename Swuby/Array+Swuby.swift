//
//  Array+Swuby.swift
//  Swuby
//
//  Created by Michael Eisel on 6/20/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import Foundation

extension Array {
	func maxBy<U: Comparable>(closure: (T) -> U) -> T! {
		if self.count == 0 {
			return nil
		}
		var maxElement: T = self[0]
		var maxValue: U = closure(maxElement)
		for e in self[1..self.count] {
			let value: U = closure(e)
			if value > maxValue {
				maxElement = e
				maxValue = value
			}
		}
		return maxElement
	}


	var first: T? {
		return self.count == 0  ?  nil  :  self[0]
	}

	var last: T? {
    	return self.count == 0  ?  nil  :  self[self.count - 1]
	}

	func minBy<U: Comparable>(closure: (T) -> U) -> T! {
		if self.count == 0 {
			return nil
		}
		var minElement: T = self[0]
		var minValue: U = closure(minElement)
		for e in self[1..self.count] {
			let value: U = closure(e)
			if value < minValue {
				minElement = e
				minValue = value
			}
		}
		return minElement
	}

	func sortyBy<U: Comparable>(closure: (T) -> U) -> Array<T> {
		var copy: Array<T> = self.copy()
		copy.sort({closure($0) > closure($1)})
		return copy
	}

	func partitionBy<U: Equatable>(closure: (T) -> U) -> Array<Array<T>>? {
		if self.count == 0 {
    		return nil
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
}