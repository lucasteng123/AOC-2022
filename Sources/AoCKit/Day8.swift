import Foundation


public final class Day8: Day {
    let input: [String]
    let grid: [[Int]]

    public init(input: String) {
        self.input = input
            .components(separatedBy: "\n")
            .filter{!$0.isEmpty}
        self.grid = self.input.map{Array($0).map{char in char.wholeNumberValue!}}
    }

    public func part1() -> Int {
        let outsideTrees = self.grid.count*2 + (self.grid[0].count-2)*2
        var count = 0
        
        for y in 1...self.grid.count-2{
            for x in 1...self.grid[0].count-2{
                if (checkTreesToOutside(x: x, y: y)) { count += 1 }
            }
        }
        
        return outsideTrees + count
    }
    
    func checkTreesToOutside(x: Int, y: Int) -> Bool{
        let currentTreeHeight = grid[y][x];
        //up
        var visible = true;
        for index in (0...y-1).reversed() {
            if grid[index][x]>=currentTreeHeight{
                visible = false
                break
            }
        }
        if visible { return true }
        visible = true
        //down
        for index in y+1...grid.count-1 {
            if grid[index][x]>=currentTreeHeight{
                visible = false
                break
            }
        }
        if visible { return true }
        visible = true
        //left
        for index in (0...x-1).reversed() {
            if grid[y][index]>=currentTreeHeight{
                visible = false
                break
            }
        }
        if visible { return true }
        visible = true
        //right
        for index in x+1...grid[0].count-1 {
            if grid[y][index]>=currentTreeHeight{
                visible = false
                break
            }
        }
        if visible { return true }
        return false
    }
    
    public func part2() -> Int {
        var highScore = 0
        
        for y in 0..<self.grid.count{
            for x in 0..<self.grid[0].count{
                let score = checkScenicScore(x: x, y: y)
                if (score > highScore) { highScore=score }
            }
        }
        
        return highScore
    }
    
    func checkScenicScore(x: Int, y:Int) -> Int {
        let currentTreeHeight = grid[y][x];
        
        var upScore = 0
        var downScore = 0
        var leftScore = 0
        var rightScore = 0
        
        for up in (0..<y).reversed() {
            if grid[up][x] < currentTreeHeight {
                upScore += 1
            }
            else if grid[up][x] >= currentTreeHeight {
                upScore += 1
                break
            } else {
                break
            }
        }
        
        for down in (y+1..<grid.count){
            if grid[down][x] < currentTreeHeight {
                downScore += 1
            } else if grid[down][x] >= currentTreeHeight {
                downScore += 1
                break
            } else {
                break
            }
        }
        
        for _l in (0 ..< x).reversed() {
            if grid[y][_l] < currentTreeHeight {
                leftScore += 1
            } else if grid[y][_l] >= currentTreeHeight {
                leftScore += 1
                break
            } else {
                break
            }
        }
        
        for _right in (x+1 ..< grid[0].count){
            if grid[y][_right] < currentTreeHeight {
                rightScore += 1
            } else if grid[y][_right] >= currentTreeHeight {
                rightScore += 1
                break
            } else {
                break
            }
        }
        
        return upScore * downScore * leftScore * rightScore
    }
}
