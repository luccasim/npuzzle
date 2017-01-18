//
//  Manager.swift
//  npuzzle
//
//  Created by luc Casimir on 17/01/2017.
//  Copyright © 2017 Owee. All rights reserved.
//

import Foundation

class Manager
{
    var errorHandle = npuzzleError.success
    
    var exitValue : Int32{
        return (Int32(errorHandle.hashValue))
    }
    
    func makePuzzle()
    {
        print("call makePuzzle() methodc called")
    }
    
    func resolvePuzzle()
    {
        print("call resolvePuzzle() method called")
    }
    
    func displayPuzzle()
    {
        print("call displayPuzzle() method called")
    }
}
