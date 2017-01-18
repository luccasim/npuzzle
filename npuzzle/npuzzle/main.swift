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

obj.exitPuzzle()
//
//let str = "Toto aime les # bits !"
//
//let a = str.range(of: " #")
//let b = str.rangeOfCharacter(from: CharacterSet.init(charactersIn: "#"))
//let c = str.trimmingCharacters(in: CharacterSet.init(charactersIn: "#"))
//let d = str.substring(to: (a?.lowerBound)!)
//
//print(a?.lowerBound)
//print(b?.lowerBound)
//print(c)
//print(d)

