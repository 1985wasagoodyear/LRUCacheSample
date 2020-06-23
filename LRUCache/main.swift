import Foundation

// MARK: - Executable Tests

struct Tests {
    
    func test1() {
        let cache: LRUCache = LRUCache<Int, Int>(2)
        
        print("\nTest 1\n=====================")
        cache.put(1, 1)
        cache.put(2, 2)
        cache.getAndPrint(1)        // returns 1
        cache.put(3, 3)             // evicts key 2
        cache.getAndPrint(2)        // returns nil (not found)
        cache.put(4, 4)             // evicts key 1
        cache.getAndPrint(1)        // returns nil (not found)
        cache.getAndPrint(3)        // returns 3
        cache.getAndPrint(4)        // returns 4
    }
    
    /*
     Input
        ["LRUCache","put","put","get","put","put","get"]
        [[2],[2,1],[2,2],[2],[1,1],[4,1],[2]]
     Output
        [null,null,null,2,null,null,-1]
     */
    func test2() {
        let cache: LRUCache = LRUCache<Int, Int>(2)
        
        print("\nTest 2\n=====================")
        cache.put(2, 1)
        cache.put(2, 2)
        cache.getAndPrint(2)        // returns 2
        cache.put(1, 1)
        cache.put(4, 1)
        cache.getAndPrint(2)        // returns nil
        
    }
    
    /*
     Input
        ["LRUCache","get","put","get","put","put","get","get"]
        [[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
     Output
        [null,-1,null,-1,null,null,2,6]
     */
    func test3() {
        let cache: LRUCache = LRUCache<Int, Int>(2)
        
        print("\nTest 3\n=====================")
        cache.getAndPrint(2)         // returns nil
        cache.put(2, 6)
        cache.getAndPrint(1)         // returns nil
        cache.put(1, 5)
        cache.put(1, 2)
        cache.getAndPrint(1)         // returns 2
        cache.getAndPrint(2)         // returns 6
    }
    
    
    /*
     Input
        ["LRUCache","put","put","get"]
        [[1,5],[1,2],[1]]
     Output
        [null,5,2]
     */
    func test4() {
        let cache: LRUCache = LRUCache<Int, Int>(2)
        
        print("\nTest 4\n=====================")
        cache.put(1, 5)
        cache.put(1, 2)
        cache.getAndPrint(1)         // returns 2
    }
}

let tests = Tests()

tests.test1() // [1, nil, nil, 3, 4]
tests.test2() // [2, nil]
tests.test3() // [nil, nil, 2, 6]
tests.test4() // [2]

print("\n\nDone.")

