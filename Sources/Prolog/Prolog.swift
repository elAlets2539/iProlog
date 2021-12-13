public struct Prolog {
    public private(set) var text = "Hello, World!"

    public init() {
        
        print()
        
        let man = Fact("man", ["tom"])
        KnowledgeBase.add(man)
        KnowledgeBase.add(Fact("man", ["matt"]))
        KnowledgeBase.add(Fact("likes", ["tom", "susan"]))
        KnowledgeBase.add(Fact("likes", ["tom", "susan", "sam", "matt", "karen"]))
        
        KnowledgeBase.displayKB()
        
        print()
        
        //print(Query.ask("man", ["susan"]))
        //print(Query.ask("likes", ["tom", "susan"]))
        print(Query.ask("likes", ["tom", "Who"]))
        print(Query.ask("likes", ["tom", "S", "sam", "X", "K"]))
        
        print()
        
    }
    
}
