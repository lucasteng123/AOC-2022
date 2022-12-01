import Foundation


public final class Day1: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input
            .components(separatedBy: "\n\n")
            .map{
                $0
                    .components(separatedBy: "\n")
                    .compactMap{Int($0)}.reduce(0,+)
            }
        
    }

    public func part1() -> Int {
        var highest = 0
        for calories in input {
            if highest < calories{
                highest = calories
            }
        }
        return highest
    }

    public func part2() -> Int {
        return input.sorted(by: >)[..<3].reduce(0,+)
    }
}
