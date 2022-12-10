import Foundation

enum Error: Swift.Error {
    case invalidInput
}

public protocol Day {
    init(input: String) throws
    associatedtype Solution1
    func part1() throws -> Solution1
    associatedtype Solution2
    func part2() throws -> Solution2
}
