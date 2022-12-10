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

final class AoCDay4: XCTestCase {
    
    // MARK: - Day 4
    let input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""
    
    func testPart1() {
        XCTAssertEqual(Day4(input: input).part1(), 2)
    }
    
    func testPart2() {
        XCTAssertEqual(Day4(input: input).part2(), 4)
    }

}

final class AoCDay5: XCTestCase {
    
    // MARK: - Day 5
    let input = """
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""
    
    func testPart1() {
        XCTAssertEqual(Day5(input: input).part1(), "CMZ")
    }
    
    func testPart2() {
        XCTAssertEqual(Day5(input: input).part2(), "MCD")
    }

}

final class AoCDay6: XCTestCase {
    
    // MARK: - Day 6
    let input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
    
    func testPart1() {
        XCTAssertEqual(Day6(input: input).part1(), 7)
    }
    
    func testPart2() {
        XCTAssertEqual(Day6(input: input).part2(), 19)
    }

}


final class AoCDay8: XCTestCase {
    
    // MARK: - Day 8
    let input = """
30373
25512
65332
33549
35390
"""
    
    func testPart1() {
        XCTAssertEqual(Day8(input: input).part1(), 21)
    }
    
    func testPart2() {
        XCTAssertEqual(Day8(input: input).part2(), 8)
    }

}

final class AoCDay10: XCTestCase {
    
    // MARK: - Day 8
    let input = """
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop
"""
    
    func testPart1() {
        XCTAssertEqual(Day10(input: input).part1(), 13140)
    }
    
    func testPart2() {
        XCTAssertEqual(Day10(input: input).part2(), "##..##..##..##..##..##..##..##..##..##..###...###...###...###...###...###...###.####....####....####....####....####....#####.....#####.....#####.....#####.....######......######......######......###########.......#######.......#######.....")
    }

}
