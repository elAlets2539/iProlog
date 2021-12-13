//
//  Query.swift
//  
//
//  Created by Alejandro Sosa Carrillo on 09/12/21.
//

import Foundation

class Query {
    
    private static var answers = Dictionary<String, String>()
    
    static func ask(_ name: String, _ args: [String]) -> Bool {
        
        if (theresAVariable(args)) {
            
            return solveVariable(name, args)
            
        } else {
            
            var i = 0
            
            while (i<KnowledgeBase.size()) {
                
                let element = KnowledgeBase.getElement(at: i)
                
                if (element.name == name && element.atoms == args) {
                    return true
                }
                
                i += 1
                
            }
            
        }
        
        return false
        
    }
    
    private static func theresAVariable(_ atoms: [String]) -> Bool {
        
        for i in atoms {
            
            if isAVariable(i) {
                return true
            }
            
        }
        
        return false
        
    }
    
    private static func isAVariable(_ atom: String) -> Bool {
        
        let index = atom.index(atom.startIndex, offsetBy: 0)
        
        if atom[index].isUppercase {
            return true
        }
        
        return false
        
    }
    
    private static func solveVariable(_ name: String, _ args: [String]) -> Bool {
        
        var indexes = getVariablesIndexes(args)
        answers = [:]
        var i = 0
        
        while (i<KnowledgeBase.size()) {
            
            let element = KnowledgeBase.getElement(at: i)
            
            if (element.name == name && element.atoms.count == args.count) {
                
                
                for j in 0..<args.count {
                    
                    if (!isAVariable(args[j]) && element.atoms[j] != args[j]) {
                        answers = [:]
                        break
                    }
                    if (j == indexes.first) {
                        
                        answers[args[j]] = element.atoms[j]
                        indexes.removeFirst()
                        
                    }
                    
                }
                
            }
            
            i += 1
            
        }
        
        print(answers)
        return true
        
    }
    
    private static func getVariablesIndexes(_ args: [String]) -> [Int] {
        
        var indexes = [Int]()
        var j = 0
        
        for i in args {
            
            let index = i.index(i.startIndex, offsetBy: 0)
            
            if i[index].isUppercase {
                indexes.append(j)
            }
            
            j += 1
            
        }
        
        return indexes
        
    }
    
    static func getVariables() -> Dictionary<String, String> {
        
        return answers
        
    }
    
}
