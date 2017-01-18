//
//  Parser.swift
//  npuzzle
//
//  Created by Luc CASIMIR on 1/18/17.
//  Copyright © 2017 Owee. All rights reserved.
//

import Foundation

class Parser
{
    var fileData : String?
    var errorhandle = npuzzleError.success
    
    enum tokenId : Int
    {
        case unknow = 0
        case size, line, error
    }
    
    class Token
    {
        var token : String
        var label : tokenId = .unknow
        
        init(String str: String)
        {
            token = str
        }
    }
    
    class Data
    {
        var data : String
        
        init() throws
        {
            guard CommandLine.argc == 2 else{
                throw npuzzleError.argc
            }
            guard let open = try? String(contentsOfFile: CommandLine.arguments[1]) else{
                throw npuzzleError.open
            }
            data = open
        }
        
        init(String data: String)
        {
            self.data = data
        }
    }
    
    init()
    {
        do
        {
            let open = try Data()
            fileData = open.data
        }
        catch npuzzleError.open {errorhandle = .open}
        catch npuzzleError.argc {errorhandle = .argc}
        catch {errorhandle = .unknow}
    }
}
