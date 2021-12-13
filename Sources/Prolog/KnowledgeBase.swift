//
//  KnowledgeBase.swift
//  
//
//  Created by Alejandro Sosa Carrillo on 09/12/21.
//

import Foundation

class KnowledgeBase {

    static private var kb : [Fact] = []
    
    static func add(_ fact: Fact) {
        
        kb.append(fact)
        
    }
    
    static func getElement(at: Int) -> Fact {
        return kb[at]
    }
    
    static func size() -> Int {
        return kb.count
    }
    
    static func displayKB() {
        
        for i in kb {
            
            var atoms = "("
            
            for j in i.atoms {
                atoms += j + ", "
            }
            
            var index = atoms.index(atoms.endIndex, offsetBy: -1)
            atoms.remove(at: index)
            index = atoms.index(atoms.endIndex, offsetBy: -1)
            atoms.remove(at: index)
            atoms += ")."
            
            print(i.name + atoms)

        }
        
    }

}
