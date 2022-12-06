import Foundation

enum Error: Swift.Error {
    case invalidInput
}

public protocol Day {
    init(input: String) throws
    associatedtype Solution
    func part1() throws -> Solution
    func part2() throws -> Solution
}
