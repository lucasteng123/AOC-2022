import Foundation
import Algorithms

@available(macOS 13.0, *)
public final class Day3: Day {
    let input: [String]

    public init(input: String) {
        self.input = input.components(separatedBy: "\n").filter{!$0.isEmpty}
            
    }

    public func part1() -> Int {
        return self.input.map{parseBag(input: $0)}.reduce(0, +);
    }

    public func part2() -> Int {
        return self.input.chunks(ofCount: 3).map{parseBag(inputArray: Array($0))}.reduce(0, +)
    }
    
    func getPriority(input:Character) -> Int{
        if(input.isLowercase){
            return Int(input.asciiValue!) - 0x60
        } else {
            return (Int(input.asciiValue!) - 0x41) + 27
        }
    }
    func parseBag(input: String)->Int{
        let items = Array(input);
        let firstCompartment = items[0..<items.count/2];
        let secondCompartment = items[items.count/2 ..< items.count];
        
        let commonItem = firstCompartment.filter(secondCompartment.contains)[0];
        
        return getPriority(input: commonItem)
    }
    
    func parseBag(inputArray: [String])->Int{
        let firstBag = Array(inputArray[0])
        let secondBag = Array(inputArray[1])
        let thirdBag = Array(inputArray[2])
        
        let commonItem = firstBag.filter(secondBag.filter(thirdBag.contains).contains)[0]
        return getPriority(input: commonItem)
    }
    
    
    
}


