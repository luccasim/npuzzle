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
    //Properties
    
    var fileData : String?
    var errorhandle = npuzzleError.success
    var tokens = [Token]()
    
    // Nested Class

    enum tokenId : Int
    {
        case unknow = 0
        case size, line, error
        
        func display() -> String
        {
            switch self {
            case .size:
                return "[size]"
            case .line:
                return "[line]"
            case .error:
                return "[error]"
            default:
                return "[unknow]"
            }
        }
    }
    
    class Token
    {
        var token : String
        var label : tokenId = .unknow
        
        init(String str: String)
        {
            token = str
        }
        
        func display() -> String
        {
            return "\(label.display())[\(token)]"
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
    
    //Initializer
    
    init()
    {
        do
        {
            let open = try Data()
            fileData = open.data
            tokenizer()
            showTokens()
        }
        catch npuzzleError.open {errorhandle = .open}
        catch npuzzleError.argc {errorhandle = .argc}
        catch {errorhandle = .unknow}
    }
    
    //Methods
    
    private func showTokens()
    {
        if tokens.count >= 1
        {
            for elem in tokens
            {
                print("\(elem.display())")
            }
        }
    }
    
    private func trimToken(line str: String) -> String
    {
        if let a = str.range(of: " #"){
            return str.substring(to: a.lowerBound)
            
        }
        else if let b = str.range(of: "#"){
            return str.substring(to: b.lowerBound)
        }
        else {return str}
    }
    
    private func tokenizer()
    {
        if let data = fileData
        {
            let getline = data.components(separatedBy: "\n")
            
            for elem in getline
            {
                let str = trimToken(line: elem)
                tokens.append(Token(String: str))
            }
        }
    }
    
    private func analyze(_ tok: Token)
    {
        if Int(tok.token) != nil{
            tok.label = .size
        }
        else
        {
            let tab = tok.token.components(separatedBy: " ")
            var err = true
        
            for elem in tab
            {
                if Int(elem) == nil {err = false}
            }
            tok.label = (err == true) ? .line : .un
        }
    }
    
    private func lexer()
    {
        for elem in tokens
        {
            analyze(elem)
        }
    }
}
