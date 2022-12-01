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
            .sorted(by: >)
    }

    public func part1() -> Int {
        return self.input.first!
    }

    public func part2() -> Int {
        return self.input[..<3].reduce(0,+)
    }
}
