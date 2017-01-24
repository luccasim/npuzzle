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
    
    var taquin : (Int, [String:Int])?
    private var fileData : String?
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
            lexer()
            showTokens()
            try parsing()
            showPuzzle()
        }
        catch npuzzleError.open {errorhandle = .open}
        catch npuzzleError.argc {errorhandle = .argc}
        catch npuzzleError.size {errorhandle = .size}
        catch npuzzleError.sizeline {errorhandle = .sizeline}
        catch npuzzleError.nbline {errorhandle = .nbline}
        catch npuzzleError.unvalidline {errorhandle = .unvalidline}
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
    
    private func stringToInt(str: String) -> [Int]
    {
        let tab = str.components(separatedBy: " ")
        var res = [Int]()

        for elem in tab
        {
            if let nb = Int(elem){
                res.append(nb)
            }
        }
        return res
    }
    
    private func parsing() throws
    {
        if tokens.count >= 1
        {
            var size = 0
            var flag = 0
            for elem in tokens
            {
                guard elem.label != .error else {throw npuzzleError.unvalidline}
                if size == 0 && elem.label == .size
                {
                    size = Int(elem.token)!
                    flag = flag + 1
                }
            }
            guard flag == 1 else {throw npuzzleError.size}

            flag = 0
            var i = 0;
            var dict = [String: Int]()
            for elem in tokens
            {

                if elem.label == .line
                {
                    let line = stringToInt(str: elem.token)
            
                    guard size == line.count else {throw npuzzleError.sizeline}
                    for nb in line
                    {
                        dict[String(i)] = nb
                        i = i + 1
                    }
                    flag = flag + 1
                }
            }
            guard flag == size else {throw npuzzleError.nbline}
            self.taquin = (size, dict)
        }
    }
    
    private func showPuzzle()
    {
        if let puz = taquin
        {
            print("size = \(puz.0) number = \(puz.1.count)")
            
            for (key, value) in (puz.1)
            {
                print("\(key) = \(value)")
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
        else {
            return str.trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
        }
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
        let tab = tok.token.components(separatedBy: " ")
        
        if tab.count == 1 {
            if Int(tok.token) != nil{
                tok.label = .size
            }
            else if tok.token != "" {tok.label = .error}
        }
        else
        {
            var err = true

            for elem in tab
            {
                if Int(elem) == nil {err = false}
            }
            tok.label = (err == true) ? .line : .error
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
