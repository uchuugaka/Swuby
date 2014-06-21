//
//  String.swift
//  Swuby
//
//  Created by Michael Eisel on 6/20/14.
//  Copyright (c) 2014 Michael Eisel. All rights reserved.
//

import Foundation

extension String {
	var count: Int {
    	return countElements(self)
	}
	subscript (regex: Regex) -> String? {
    	get {
			return regex.matchesIn(self).first
    	}
    	set(string) {
			regex.replaceFirstMatch(self, withString: string)
    	}
	}
}