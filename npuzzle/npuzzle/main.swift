//
//  main.swift
//  npuzzle
//
//  Created by luc Casimir on 17/01/2017.
//  Copyright © 2017 Owee. All rights reserved.
//

import Foundation

let obj = Manager()

obj.makePuzzle()
obj.resolvePuzzle()
obj.displayPuzzle()

exit(obj.exitValue)
