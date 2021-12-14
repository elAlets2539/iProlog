public struct Prolog {
    public private(set) var text = "Hello, World!"

    public init() {
        /*
        print()
        
        let man = Fact("man", ["tom"])
        KnowledgeBase.add(man)
        KnowledgeBase.add(Fact("man", ["matt"]))
        KnowledgeBase.add(Fact("likes", ["tom", "susan"]))
        KnowledgeBase.add(Fact("likes", ["tom", "susan", "sam", "matt", "karen"]))
        
        KnowledgeBase.displayKB()
        
        print()
        
        print(Query.ask("man", ["tom"]))
        print(Query.ask("man", ["susan"]))
        print(Query.ask("likes", ["tom", "susan"]))
        print(Query.ask("likes", ["tom", "Who"]))
        print(Query.ask("likes", ["tom", "S", "sam", "X", "K"]))
        */
        print()
        
        KnowledgeBase.add(Fact("male", ["james1"]))
        KnowledgeBase.add(Fact("male", ["charles1"]))
        KnowledgeBase.add(Fact("male", ["charles2"]))
        KnowledgeBase.add(Fact("male", ["james2"]))
        KnowledgeBase.add(Fact("male", ["george1"]))

        KnowledgeBase.add(Fact("female", ["catherine"]))
        KnowledgeBase.add(Fact("female", ["elizabeth"]))
        KnowledgeBase.add(Fact("female", ["sophia"]))

        KnowledgeBase.add(Fact("parent", ["charles1", "james1"]))
        KnowledgeBase.add(Fact("parent", ["elizabeth", "james1"]))
        KnowledgeBase.add(Fact("parent", ["charles2", "charles1"]))
        KnowledgeBase.add(Fact("parent", ["catherine", "charles1"]))
        KnowledgeBase.add(Fact("parent", ["james2", "charles1"]))
        KnowledgeBase.add(Fact("parent", ["sophia", "elizabeth"]))
        KnowledgeBase.add(Fact("parent", ["george1", "sophia"]))
        
        //KnowledgeBase.displayKB()
        
        //print(Query.ask("parent", ["charles1", "george1"]))
        print(Query.ask("parent", ["charles1", "X"]))
        
        print()
        
    }
    
}
