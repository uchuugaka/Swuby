//
//  SwubyTests.swift
//  SwubyTests
//
//  Created by Michael Eisel on 6/20/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import XCTest

class StringSwubyTests: XCTestCase {
	func testCount() {
		XCTAssert("asdf".count == 4)
		XCTAssert("a".count == 1)
		XCTAssert("".count == 0)
	}

	func testRegexSubscripting () {
		XCTAssert("asdf"[/".*"] == "asdf")
		XCTAssert("asdf"[/"[0-9]"] == "")
		XCTAssert("asdf"[/"."] == "a")
	}
}
