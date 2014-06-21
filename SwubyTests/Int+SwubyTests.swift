//
//  Int+Swuby.swift
//  Swuby
//
//  Created by Michael Eisel on 6/21/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import Foundation
import XCTest

class IntSwubyTests: XCTestCase {
	func testTimes() {
		var a: Int = 0
		0.times {
			a++
		}
		XCTAssert(a == 0)

		1.times {
			a++
		}
		XCTAssert(a == 1)

		a = 0
		10.times {
			a++
		}
		XCTAssert(a == 10)

		a = 0
		-1.times {
			a++
		}
		XCTAssert(a == 0)
	}

	func testUpto() {
		
	}
}
