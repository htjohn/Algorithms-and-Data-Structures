import UIKit

var str = "Hello, playground"


//Given an adjacency list, and the number of nodes n write 3 solutions:
//a dfs with recursion,  a dfs with stack and bfs with queue to count the number of nodes in starting from node 0.


//MARK: 1.1 DFS Recursion

var nodeCounterDFS = 0
var adjListDSF:[Int:[Int]] = [:]
func countNumberOfNodesDFSRecursion(adjList:[Int:[Int]], startingPoint: Int) -> Int {
    adjListDSF = adjList
    if adjList.count == 0 {
        return 0
    }
    
    nodeCounterDFSRecursion(0)
    
    return nodeCounterDFS
}

func nodeCounterDFSRecursion(_  node: Int) {
    nodeCounterDFS += 1
    let neighbors = adjListDSF[node]!
    
    for neighbor in neighbors {
        nodeCounterDFSRecursion(neighbor)
    }
}



//MARK:1.2 DFS Stack

func countNumberOfNodesDFSStack(adjList:[Int:[Int]], startingPoint: Int) -> Int {
    var nodeCounter = 0
    
    if adjList.count == 0 {
        return 0
    }
    
    var stack = [startingPoint]
    
    while !stack.isEmpty {
        nodeCounter += 1
        let currentNode = stack.removeLast()
        let neighbors = adjList[currentNode]!
        for neighbor in neighbors {
            stack.append(neighbor)
        }
    }
    
    return nodeCounter
}

//MARK: 1.3 BFS
func countNumberOfNodesBFS(adjList: [Int:[Int]], startingPoint: Int) -> Int{
    
    var nodeCounter = 0
    
    if adjList.count == 0 {
        return 0
    }
    
    var queue = [startingPoint]
    
    while !queue.isEmpty {
        nodeCounter += 1
        let currentNode = queue.removeFirst()
        let neighbors = adjList[currentNode]!
        for neighbor in neighbors {
            queue.append(neighbor)
        }
    }
    
    return nodeCounter
}


//MARK: 2.1

func isConnectedGraphDFSRecursion(adjList:[Int:[Int]], startingPoint: Int) {
    adjListDSF = adjList
    
    nodeCounterDFSRecursion(0)
    
    let isConnected = nodeCounterDFS == adjList.count ? "YES" : "NO"
    
    print(isConnected)
}


//MARK: 2.2
func isConnectedGraphDFSStack(adjList:[Int:[Int]], startingPoint: Int) {
    var nodeCounter = 0
       
       if adjList.count == 0 {
           print("NO")
       }
       
       var stack = [startingPoint]
       
       while !stack.isEmpty {
           nodeCounter += 1
           let currentNode = stack.removeLast()
           let neighbors = adjList[currentNode]!
           for neighbor in neighbors {
               stack.append(neighbor)
           }
       }
       
    let isConnected = nodeCounter == adjList.count ? "YES" : "NO"
    
    print(isConnected)
}

//MARK: 2.3
func isConnectedGraphBFS(adjList: [Int:[Int]], startingPoint: Int) {
    var nodeCounter = 0
       
       if adjList.count == 0 {
           print("NO")
       }
       
       var queue = [startingPoint]
       
       while !queue.isEmpty {
           nodeCounter += 1
           let currentNode = queue.removeFirst()
           let neighbors = adjList[currentNode]!
           for neighbor in neighbors {
               queue.append(neighbor)
           }
       }
       
    let isConnected = nodeCounter == adjList.count ? "YES" : "NO"
    
    print(isConnected)
}

//MARK: 3.1

var directions: [[Int]] = [[1,0],[-1,0],[0,1],[0,-1]]
var matrixGrid: [[Int]] = []
var cellCount = 0
var visitedGrid: [[Bool]] = []
func countNumberOfCellsInMatrixDFSRecursion(grid:[[Int]]) -> Int {
    let rows = grid.count
    let columns = grid[0].count
    matrixGrid = grid
    let visitedRow = Array(repeating: false, count: matrixGrid.count)
    let visited:[[Bool]] = Array(repeating: visitedRow, count: grid[0].count)
    visitedGrid = visited
    for row in 0..<rows {
        for column in 0..<columns {
            if grid[row][columns] == 1 {
                cellCounterDFSRecursion(row: row, column: column)
            }
        }
    }
    
    return cellCount
}

func cellCounterDFSRecursion(row: Int, column: Int) {
    
    cellCount += 1
    visitedGrid[row][column] = true

    for direction in directions {
        let newRow = row + direction[0]
        let newColumnn = column + direction[1]
        if visitedGrid[row][column] == false && validateCell(row: newRow, column: newColumnn) {
            cellCounterDFSRecursion(row: newRow, column: newColumnn)
        }
    }
}

func validateCell(row: Int, column: Int) -> Bool {
    if row < 0 || column < 0 || row >= matrixGrid.count || column >= matrixGrid[0].count {
        return false
    }
    
    if matrixGrid[row][column] != 1 {
        return false
    }
    
    return true
    
}

//MARK: 3.2

func countNumberOfCellsInMatrixDFSStack(grid:[[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    
    let rows = grid.count
    let columns = grid[0].count
    let visitedRow = Array(repeating: false, count: columns)
    let visited:[[Bool]] = Array(repeating: visitedRow, count: rows)
    var count = 0
    
    for row in 0..<rows {
        for column in 0..<columns {
            if visited[row][column] == false && grid[row][column] == 1 {
                var stack:[[Int]] = [[row,column]]
            
                while !stack.isEmpty {
                    let currentCell = stack.removeLast()
                    
                    for direction in directions {
                        let newRow = direction[0] + currentCell[0]
                        let newColumn = direction[1] + currentCell[1]
                        if isValidateed(row: newRow, column: newColumn, grid: grid) && visited[newRow][newColumn] == false {
                            count += 1
                            visited[newRow][newColumn] == true
                        }
                        
                    }
                }
                
            }
        }
    }
    
    return count
}

func isValidateed(row: Int, column: Int, grid: [[Int]]) -> Bool {
    if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count {
        return false
    }
    
    return true
}

//MARK: 3.3
func countNumberOfCellsInMatrixBFS(grid:[[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    
    let rows = grid.count
    let columns = grid[0].count
    let visitedRow = Array(repeating: false, count: columns)
    let visited:[[Bool]] = Array(repeating: visitedRow, count: rows)
    var count = 0
    
    for row in 0..<rows {
        for column in 0..<columns {
            if visited[row][column] == false && grid[row][column] == 1 {
                var queue:[[Int]] = [[row,column]]
            
                while !queue.isEmpty {
                    let currentCell = queue.removeFirst()
                    
                    for direction in directions {
                        let newRow = direction[0] + currentCell[0]
                        let newColumn = direction[1] + currentCell[1]
                        if isValidateed(row: newRow, column: newColumn, grid: grid) && visited[newRow][newColumn] == false {
                            count += 1
                            visited[newRow][newColumn] == true
                        }
                        
                    }
                }
                
            }
        }
    }
    
    return count
}

//MARK: 4.1

func countConnectedComponentsDFS(adjList:[Int:[Int]], startingPoint: Int) -> Int {
    var componentCounter = 0
    var visited: [Int: Bool] = [:]
       if adjList.count == 0 {
           print("NO")
       }
       
       var stack = [startingPoint]
       
       while !stack.isEmpty {
           componentCounter += 1
           let currentNode = stack.removeLast()
           let neighbors = adjList[currentNode]!
        
        visited[currentNode, default: false] = true
           for neighbor in neighbors {
            if visited[neighbor] == true {
                continue
            }
               stack.append(neighbor)
           }
       }
       
    return componentCounter
}

//MARK: 4.2
func countConnectedComponentsBFS(adjList: [Int:[Int]], startingPoint: Int) -> Int {
    var componentCounter = 0
    var visited: [Int: Bool] = [:]
       if adjList.count == 0 {
           print("NO")
       }
       
       var queue = [startingPoint]
       
       while !queue.isEmpty {
           componentCounter += 1
           let currentNode = queue.removeFirst()
           let neighbors = adjList[currentNode]!
           visited[currentNode] = true
           for neighbor in neighbors {
            if visited[neighbor] == true {
                continue
            }
               queue.append(neighbor)
           }
       }
       
    return componentCounter
}

//MARK: 4.3

public class UnionFind {
    var parent: [Int]
    var count: Int
    
    init(adjacencyList: [Int: [Int]]) {
        //Loop through and populate parents
        parent = []
        count = 0
        for (key,neigbors) in adjacencyList {
            self.parent.append(key)
            for i in 0..<neigbors.count {
                count += 1
            }
            
        }
        
    }
    
    //Find the parent of the value
    public func find(_ p: Int) -> Int {
        var p = p
        while p != self.parent[p] {
            self.parent[p] = self.parent[self.parent[p]]
            p = self.parent[p]
        }
        return p
    }
    
    //Combine the values
    public func union(p: Int, q: Int) {
           let i = find(p)
           let j = find(q)
           
           if i == j {
               return
           }
           self.parent[i] = j
           self.count -= 1
    }
}

func countConnectedComponentsDisjointSetUnion(adjList: [Int:[Int]]) -> Int {
    let uf = UnionFind(adjacencyList: adjList)
    return uf.parent.count
}


//MARK:5.1

func countLeaves(adjList: [Int:[Int]], n: Int, startingPoint: Int) -> Int {
    var leafCounter = 0
    var referenceCount: [Int:Int] = [:] //I need to keep track of the amount of times each node is refererenced
    
    
    var queue: [Int] = [startingPoint]
    
    while !queue.isEmpty {
        var currentNode = queue.removeFirst()
        
        let neighbors = adjList[currentNode]!
        
        for neighbor in neighbors {
            referenceCount[neighbor,default: 0] += 1
            queue.append(neighbor)
        }
    }
    
    for (key, value) in referenceCount {
        if value == 1 {
            leafCounter += 1
        }
    }
    
    return leafCounter
}

//MARK: 5.2

func countEdges(adjList: [Int: [Int]], n: Int, startingPoint:Int) -> Int {
    return adjList.count - 1
}



