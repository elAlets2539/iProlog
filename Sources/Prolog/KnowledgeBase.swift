//
//  KnowledgeBase.swift
//  
//
//  Created by Alejandro Sosa Carrillo on 09/12/21.
//

import Foundation

class KnowledgeBase {

    static private var facts : [Fact] = []
    static private var rules : [Rule] = []
    
    static func add(_ fact: Fact) {
        facts.append(fact)
    }
    
    static func add(_ rule: Rule) {
        rules.append(rule)
    }
    
    static func getFact(at: Int) -> Fact {
        return facts[at]
    }
    
    static func getRule(at: Int) -> Rule {
        return rules[at]
    }
    
    static func factsSize() -> Int {
        return facts.count
    }
    
    static func rulesSize() -> Int {
        return rules.count
    }
    
    static func displayKB() {
        
        for i in facts {
            
            print(i.name + getAtomsString(i.atoms) + ".")

        }
        
        print()
        
        for i in rules {
            
            print(i.name + getAtomsString(i.atoms) + " :-")
            
            var conditions = ""
            
            for j in i.conditions {
                conditions += "\t" + j.name + getAtomsString(j.atoms) + ",\n"
            }
            
            var index = conditions.index(conditions.endIndex, offsetBy: -1)
            conditions.remove(at: index)
            index = conditions.index(conditions.endIndex, offsetBy: -1)
            conditions.remove(at: index)
            conditions += ".\n"
            
            print(conditions)

        }
        
    }
    
    private static func getAtomsString(_ atoms: [String]) -> String {
        
        var string = "("
        
        for i in atoms {
            string += i + ", "
        }
        
        var index = string.index(string.endIndex, offsetBy: -1)
        string.remove(at: index)
        index = string.index(string.endIndex, offsetBy: -1)
        string.remove(at: index)
        string += ")"
        
        return string
        
    }
    
    static func resetKnowledgeBase() {
        
        facts = []
        rules = []
        
    }

}
