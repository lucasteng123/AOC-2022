import Foundation


enum Outcome: Int {
    case win = 6;
    case draw = 3;
    case lose = 0;
}

enum Shape: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

let translation = [
    "X": Shape.rock,
    "Y": Shape.paper,
    "Z": Shape.scissors,
    "A": Shape.rock,
    "B": Shape.paper,
    "C": Shape.scissors
]


public final class Day2: Day {
    let input: [String]
    

    public init(input: String) {
        self.input = input.components(separatedBy: "\n")
    }

    public func part1() -> Int {
        return self.input.map{return interpretRound(round: $0)}.reduce(0,+)
    }

    public func part2() -> Int {
        let pt2Translate = [
            "X": Outcome.lose,
            "Y": .draw,
            "Z": .win
        ]
        
        
        return self.input.map{ round in
            if round == "" {
                return 0
            }
            let shapes = round.components(separatedBy: " ")
            let opponent = translation[shapes[0]]!
            let desiredOutcome = pt2Translate[shapes[1]]!
            
            var myShape: Shape = opponent;
            
            if (desiredOutcome == .win) {
                switch opponent {
                case .rock:
                    myShape = .paper
                case .paper:
                    myShape = .scissors
                case .scissors:
                    myShape = .rock
                }
            }
            if (desiredOutcome == .lose) {
                switch opponent {
                case .rock:
                    myShape = .scissors
                case .paper:
                    myShape = .rock
                case .scissors:
                    myShape = .paper
                }
            }
            
            return desiredOutcome.rawValue + myShape.rawValue
        }.reduce(0,+)
    }
    
    func interpretRound(round: String) -> Int{
        if(round == ""){
            return 0
        }
        let shapes: [Shape] = round.components(separatedBy: " ").map{ inputShape in
            return translation[inputShape]!;
        }
        
        var state: Outcome = .win
        
        if shapes[0] == shapes[1]{
            state = .draw
        }
        if (shapes[0] == .rock && shapes[1] == .scissors){
            state = .lose
        }
        if (shapes[0] == .scissors && shapes[1] == .paper){
            state = .lose
        }
        if (shapes[0] == .paper && shapes[1] == .rock){
            state = .lose
        }
        
        return state.rawValue + shapes[1].rawValue
        
    }
}


