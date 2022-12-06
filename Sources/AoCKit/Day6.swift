import Foundation
import Algorithms


public final class Day6: Day {
    let input: [Character]

    public init(input: String) {
        self.input = Array(input)
    }

    public func part1() -> Int {
        let windowedInput = self.input.windows(ofCount: 4)
        for (index,window) in windowedInput.enumerated() {
            if Array(window.uniqued()).count == 4{
                return index+4
            }
        }
        return 0
    }

    public func part2() -> Int {
        let windowedInput = self.input.windows(ofCount: 14)
        for (index,window) in windowedInput.enumerated() {
            if Array(window.uniqued()).count == 14{
                return index+14
            }
        }
        return 0
    }
}

