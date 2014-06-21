//
//  Int+Swuby.swift
//  Swuby
//
//  Created by Michael Eisel on 6/20/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import Foundation
/*func %(lhs: Int, rhs: Int) -> Int {
}*/

extension Int {
	func times (closure: () -> ()) {
		for i in 0..self {
			closure()
		}
	}

	func upto(limit: Int, closure: (i: Int) -> ()) {
		for i in self...limit {
			closure(i: i)
		}
	}

	func downTo(limit: Int, closure: (i: Int) -> ()) {
		for i in limit...self {
			closure(i: i)
		}
	}

}