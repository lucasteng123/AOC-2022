import XCTest
@testable import AoCKit
import class Foundation.Bundle

final class AoCTests: XCTestCase {
    
    // MARK: - Day 1
    let day1Input = """
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
    
    func testDay1Part1() {
        XCTAssertEqual(Day1(input: day1Input).part1(), 24000)
    }
    
    func testDay1Part2() {
        XCTAssertEqual(Day1(input: day1Input).part2(), 45000)
    }
    
    // MARK: - Day 2
    
}
