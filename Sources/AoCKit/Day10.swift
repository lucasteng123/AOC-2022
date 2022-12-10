import Foundation

enum EInstruction {
    case noop
    case addx
}

struct AOCInstruction {
    let instruction: EInstruction
    var value: Int?
    
    init(_ input: String){
        if (input == "noop") {
            self.instruction = .noop
        }
        else {
            self.instruction = .addx
            self.value = Int(input.components(separatedBy: " ")[1])
        }
    }
}

class Computer {
    let program: [AOCInstruction]
    
    var buffer: Int = 1
    var clockCycle: Int = 0
    
    var p1output: Int = 0
    let clock: (Int, Int) -> Void

    init (_ program: [AOCInstruction], clock: @escaping (Int, Int)->Void ){
        self.program = program
        self.clock = clock
    }
    
    func increaseClock(){
        clockCycle += 1
        clock(buffer, clockCycle)
        
    }
    
    func run(){
        for instruction in self.program {
            switch instruction.instruction{
            case .noop:
                noop()
            case .addx:
                addx(instruction.value!)
            }
        }
    }
    
    func noop(){
        increaseClock()
    }
    
    func addx(_ val: Int) {
        increaseClock()
        increaseClock()
        self.buffer += val
    }
}

public final class Day10: Day {
    let input: [AOCInstruction]
    

    public init(input: String) {
        self.input = input
            .components(separatedBy: "\n")
            .filter{!$0.isEmpty}
            .map{AOCInstruction($0)}
    }

    public func part1() -> Int {
        var output = 0
        let computer = Computer(input) { (buffer, clockCycle) in
            if ((clockCycle-20) % 40 == 0){
                output += (clockCycle * buffer)
            }
        }
        computer.run()
        return output
    }

    public func part2() -> String {
        var pixels = [Bool]()
        var output = "";
        let computer = Computer(input) { (buffer, clockCycle) in
            let pixel = (buffer-1) <= (clockCycle-1) % 40 && (clockCycle-1) % 40 <= (buffer + 1)
            pixels.append(pixel)
            output.append(pixel ? "🎄" : "▫️")
            if(clockCycle%40 == 0){
                output.append("\n")
            }
            
        }
        computer.run()
        print(output)
        return pixels.map{ !$0 ? "." : "#" }.joined()
    }
}
