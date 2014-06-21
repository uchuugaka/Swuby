//
//  Regex.swift
//  Swuby
//
//  Created by Michael Eisel on 6/20/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import Foundation

operator prefix / {}
@prefix func /(string: String) -> Regex {
	return Regex(string: string)
}

class Regex {
	var string: String
	init(string: String) {
		self.string = string
	}

	func matchesIn(string: String) -> Array<String> {
		/*var regex: NSRegularExpression = NSRegularExpression(pattern: string, options: nil, error: nil)
    	var strings: Array<String> = []
		var options: NSMatchingOptions = NSMatchingOptions(0)
		var range: NSRange = NSMakeRange(0, 2)
		var matches: Array<AnyObject?> = regex.matchesInString(string, options:options, range:range)
    	for object:AnyObject? in matches {
			var match: NSTextCheckingResult = object as NSTextCheckingResult!
    		for i in 0...match.numberOfRanges {
    			var range: NSRange = match.rangeAtIndex(i);
    			var substring: String = string.substringWithRange(range);
    			strings += substring
    		}
    	}
		return strings*/
		return []
	}

	func replaceFirstMatch(string: String, withString: String?) {
		
	}
}