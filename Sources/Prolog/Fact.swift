//
//  Fact.swift
//  
//
//  Created by Alejandro Sosa Carrillo on 09/12/21.
//

import Foundation

struct Fact {
    
    let name : String
    let atoms : [String]
    
    init(_ name: String, _ args: [String]) {
        
        self.name = name
        atoms = args
        
    }
    
}
