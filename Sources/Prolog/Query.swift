//
//  Query.swift
//  
//
//  Created by Alejandro Sosa Carrillo on 09/12/21.
//

import Foundation

class Query {
    
    private static var answers = [Dictionary<String, String>]()
    private static var ruleFlag = false
    
    static func ask(_ name: String, _ args: [String]) -> Bool {
        
        answers = []
        ruleFlag = false
        
        /// ------------------------------------------------------------------------------------- Check facts
        
        if (factIsTrue(name, args)) {
            return true
        }
        
        /// ------------------------------------------------------------------------------------- Check rules
        
        answers = []
        var i = 0
        
        while (i < KnowledgeBase.rulesSize()) {
            
            var answer = Dictionary<String, String>()
            let element = KnowledgeBase.getRule(at: i)
            ruleFlag = true
            
            if (element.name == name && element.atoms.count == args.count) {
                
                var conditionAnswers = [Dictionary<String, String>]()
                
                for condition in element.conditions {
                    
                    if (!conditionAnswers.isEmpty) {
                        
                        for possibleAnswer in conditionAnswers {
                            
                            var newArgs = [String]()
                            
                            for atom in condition.atoms {
                                if possibleAnswer.keys.contains(atom) {
                                    newArgs.append(possibleAnswer[atom]!)
                                } else if (element.atoms.contains(atom)) {
                                    newArgs.append(args[element.atoms.firstIndex(of: atom)!])
                                } else {
                                    newArgs.append(atom)
                                }
                            }
                            print("-----")
                            print(condition.name)
                            print(newArgs)
                            print("-----")
                            if (!ask(condition.name, newArgs)) {
                                answer = [:]
                                break
                            } else {
                                conditionAnswers = getVariables()
                                print("xxxx")
                                print(conditionAnswers)
                            }
                            
                        }
                        
                    } else {
                        
                        var argsIndexes = [String]()
                        
                        for atom in condition.atoms {
                            if (element.atoms.contains(atom)) {
                                argsIndexes.append(args[element.atoms.firstIndex(of: atom)!])
                            } else {
                                argsIndexes.append(atom)
                            }
                        }
                        print("----------------------")
                        print(condition.name)
                        print(argsIndexes)
                        print("----------------------")
                        if (!ask(condition.name, argsIndexes)) {
                            answer = [:]
                            break
                        } else {
                            print(argsIndexes[0] + " es el gfe de " + argsIndexes[1])
                            conditionAnswers = getVariables()
                            answer["A"] = "A"
                            //print("****")
                            //print(conditionAnswers)
                        }
                        
                    }
                    
                }
                
            }
            
            if (!answer.isEmpty) {
                
                answers.append(answer)
                print("ñññ")
                print(answers)
                return true
                //if (!isAVariable(answer.values.first!)) {
                    //print(answer)
                //}
                
            }
            
            i += 1
            
        }
        
        /// ------------------------------------------------------------------------------------- Check if there are any answers
        
        if (!answers.isEmpty) {
            return true
        } else {
            return false
        }
        
    }
    
    private static func factIsTrue(_ name: String, _ args: [String]) -> Bool {
        
        let varIndexList = getVariablesIndexes(args)
        let atomIndexList = getAtomsIndexes(args)
        
        var i = 0
        
        while (i < KnowledgeBase.factsSize()) {
            
            var varIndexes = varIndexList
            var atomIndexes = atomIndexList
            
            var answer = Dictionary<String, String>()
            let element = KnowledgeBase.getFact(at: i)
            
            if (element.name == name && element.atoms == args) {
                return true
            }
            
            if (element.name == name && element.atoms.count == args.count) {
                
                for j in 0..<args.count {
                    
                    if (!isAVariable(args[j]) && !isAVariable(element.atoms[j]) && element.atoms[j] != args[j]) {
                        answer = [:]
                        break
                    }
                    if (j == varIndexes.first) {
                        
                        answer[args[j]] = element.atoms[j]
                        varIndexes.removeFirst()
                        
                    } else if (isAVariable(element.atoms[j]) && j != atomIndexes.first) {
                        
                        answer[args[j]] = element.atoms[j]
                        atomIndexes.removeFirst()
                        
                    } else if (element.atoms[j] == args[j]) {
                        
                        continue
                        
                    } else {
                        answer = [:]
                    }
                    
                }
                
            }
            
            if (!answer.isEmpty) {
                
                answers.append(answer)
                
                if (!isAVariable(answer.values.first!) && !ruleFlag) {
                    print(answer)
                }
                
            }
            
            i += 1
            
        }
        
        if (!answers.isEmpty) {
            return true
        } else {
            return false
        }
        
        
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
    
    private static func getAtomsIndexes(_ args: [String]) -> [Int] {
        
        var indexes = [Int]()
        var j = 0
        
        for i in args {
            
            let index = i.index(i.startIndex, offsetBy: 0)
            
            if i[index].isLowercase {
                indexes.append(j)
            }
            
            j += 1
            
        }
        
        return indexes
        
    }
    
    static func getVariables() -> [Dictionary<String, String>] {
        
        return answers
        
    }
    
}
