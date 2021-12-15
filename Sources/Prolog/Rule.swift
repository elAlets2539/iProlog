//
//  Rule.swift
//  
//
//  Created by Alejandro Sosa Carrillo on 09/12/21.
//

import Foundation

struct Rule {
    
    let name : String
    let atoms : [String]
    let conditions : [Fact]
    
    init(_ name: String, _ args: [String], _ conditions: [Fact]) {
        
        self.name = name
        atoms = args
        self.conditions = conditions
        
    }
    
}
