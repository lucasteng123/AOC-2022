import XCTest
@testable import AoCKit
import class Foundation.Bundle

final class AoCDay1: XCTestCase {
    
    // MARK: - Day 1
    let input = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""
    
    func testPart1() {
        XCTAssertEqual(Day1(input: input).part1(), 24000)
    }
    
    func testPart2() {
        XCTAssertEqual(Day1(input: input).part2(), 45000)
    }
    
    
}

final class AoCDay2: XCTestCase {
    
    // MARK: - Day 2
    let input = """
A Y
B X
C Z
"""
    
    func testPart1() {
        XCTAssertEqual(Day2(input: input).part1(), 15)
    }
    
    func testPart2() {
        XCTAssertEqual(Day2(input: input).part2(), 12)
    }

}

@available(macOS 13.0, *)
final class AoCDay3: XCTestCase {
    
    // MARK: - Day 3
    let input = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
    
    func testPart1() {
        XCTAssertEqual(Day3(input: input).part1(), 157)
    }
    
    func testPart2() {
        XCTAssertEqual(Day3(input: input).part2(), 70)
    }

}
