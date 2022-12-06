import Foundation
import RegexBuilder


struct Instruction {
    let quantity: Int
    let from: Int
    let to: Int
    
    init(_ instruction: String){
        let rawInput = instruction.components(separatedBy: " ");
        self.quantity = Int(rawInput[1])!
        self.from = Int(rawInput[3])!
        self.to = Int(rawInput[5])!
    }
}

public final class Day5: Day {
    let stacks: [Int: [Character]]
    let instructions: [Instruction]

    public init(input: String) {
        let inputs = input.components(separatedBy: "\n\n")
        
        let state = inputs[0].components(separatedBy: "\n").filter{ !$0.isEmpty }
        let rawInstruction = inputs[1].components(separatedBy: "\n").filter{ !$0.isEmpty }
        
        var stacks = [Int: [Character]]()
        for line in state {
            for (index, ch) in line.enumerated(){
                if ch.isNumber || ch == " " { continue }
                if (index-1).isMultiple(of: 4){
                    let item = 1 + (index - 1) / 4
                    stacks[item, default: []].append(ch)
                }
            }
        }
        self.stacks = stacks.mapValues{
            $0.reversed()
        };
        
        self.instructions = rawInstruction.map{Instruction($0)}
    }

    public func part1() -> String {
        return move(instructions: self.instructions, multiple: false)
            .sorted{ $0.key < $1.key}
            .compactMap{$0.value.last}
            .map{String($0)}
            .joined()
    }

    public func part2() -> String {
        return move(instructions: self.instructions, multiple: true)
            .sorted{ $0.key < $1.key}
            .compactMap{$0.value.last}
            .map{String($0)}
            .joined()
    }
    
    private func move(instructions: [Instruction], multiple: Bool) -> [Int: [Character]]{
        var updatedStacks = stacks
        for instruction in instructions {
            let stack = updatedStacks[instruction.from]!
            updatedStacks[instruction.from] = stack.dropLast(instruction.quantity)
            var itemsToMove = Array(stack.suffix(instruction.quantity))
            if (!multiple) {
                itemsToMove = Array(itemsToMove.reversed())
            }
            updatedStacks[instruction.to, default: []].append(contentsOf: itemsToMove)
        }
        return updatedStacks
    }
}


