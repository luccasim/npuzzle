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
    // Properties
    
    var errorHandle : npuzzleError
    
    // Computed Properties
    
    var printError : Int32
    {
        if errorHandle != .success
        {
            print(errorHandle.what())
        }
        return (Int32(errorHandle.hashValue))
    }
    
    // Initializers
    
    init()
    {
        errorHandle = .success
    }
    
    // Methods
    
    func makePuzzle()
    {
        print("call makePuzzle() method called")
        let parser = Parser()
        errorHandle = parser.errorhandle
//        if let file = parser.fileData{
//            print("Contenue du fichier : \(file)")
//        }
    }
    
    func resolvePuzzle()
    {
        print("call resolvePuzzle() method called")
    }
    
    func displayPuzzle()
    {
        print("call displayPuzzle() method called")
    }
    
    func exitPuzzle()
    {
        exit(printError)
    }
}
