import Foundation


public final class Day4: Day {
    let input: [String]

    public init(input: String) {
        self.input = input.components(separatedBy: "\n")
    }

    public func part1() -> Int {
        return self.input.filter{ pair in
            if(pair.isEmpty) { return false }
            let elves = pair.components(separatedBy: ",").map{$0.components(separatedBy: "-").map{Int($0)!}}
            return (
                elves[0][0] <= elves[1][0]
                && elves[0][1] >= elves[1][1]
            ) || (
                elves[0][0] >= elves[1][0]
                && elves[0][1] <= elves[1][1]
            )
        }.count
        
    }

    public func part2() -> Int {
        return self.input.filter{ pair in
            if(pair.isEmpty) { return false }
            let elves = pair.components(separatedBy: ",").map{$0.components(separatedBy: "-").map{Int($0)!}}
            return (
                elves[0][0] >= elves[1][0]
                && elves[0][0] <= elves[1][1]
            ) || (
                elves[1][0] >= elves[0][0]
                && elves [1][0] <= elves[0][1]
            )
        }.count
    }
}
