//
//  main.swift
//  npuzzle
//
//  Created by luc Casimir on 17/01/2017.
//  Copyright © 2017 Owee. All rights reserved.
//

import Foundation

print("Je suis la branche master")

let a = npuzzleError.success
//let a = npuzzleError.fail

print(a.what())

exit(Int32(a.hashValue))
