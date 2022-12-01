import Foundation
import AoCKit

final class AOC {
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 3
        formatter.minimumSignificantDigits = 3

        return formatter
    }()

    init(args: [String] = CommandLine.arguments) {
        if args.count != 2 {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: Date())
            let day = dateComponents.day!

            if dateComponents.year == Config.year && dateComponents.month == 12 && day < 25 {
                run(day: day)
            } else {
                run(day: 1)
            }
        } else {
            let day = Int(args[1])!
            run(day: day)
        }
    }

    private func run(day number: Int) {
        let days: [Int: Day.Type] = [
            1: Day1.self,
        ]

        guard let input = self.input(for: number) else {
            let message = "Could not load input for day \(number)"
            assertionFailure(message)
            print(message)
            return
        }

        let day: Day

        do {
            guard let tryDay = try days[number]?.init(input: input) else {
                let message = "Day \(number) is not yet implemented"
                assertionFailure(message)
                print(message)
                return
            }

            day = tryDay
        } catch {
            let message = "Day \(number) failed with \(error)"
            assertionFailure(message)
            print(message)
            return
        }

        #if DEBUG
        let target = "debug"
        #else
        let target = "release"
        #endif

        print("Running Day \(number) as \(target)")

        var date = Date()
        let part1: Int

        do {
            part1 = try day.part1()
            let part1Time = formatter.string(from: NSNumber(value: Date().timeIntervalSince(date))) ?? "N/A"

            print("Day \(number) Part 1 took \(part1Time) seconds")
        } catch {
            let message = "Day \(number) Part 1 failed with \(error)"
            assertionFailure(message)
            print(message)
            return
        }

        date = Date()
        let part2: Int

        do {
            part2 = try day.part2()
            let part2Time = formatter.string(from: NSNumber(value: Date().timeIntervalSince(date))) ?? "N/A"

            print("Day \(number) Part 2 took \(part2Time) seconds")
        } catch {
            let message = "Day \(number) Part 2 failed with \(error)"
            assertionFailure(message)
            print(message)
            return
        }

        print("Part 1: \(part1)")
        print("Part 2: \(part2)")
    }

    func input(for day: Int) -> String? {
        let currentFolder = FileManager.default.currentDirectoryPath
        guard let fileURL = URL(string: "file://\(currentFolder)/day\(day).txt") else { return nil }

        if let input = try? String(contentsOf: fileURL) {
            return input
        } else if let input = get(day: day) {
            try? input.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            return input
        }

        return nil
    }

    func get(day: Int) -> String? {
        guard let url = URL(string: "https://adventofcode.com/\(Config.year)/day/\(day)/input") else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        request.addValue("session=\(Config.session)", forHTTPHeaderField: "Cookie")
        request.addValue("https://github.com/lucasteng123/AOC-2022 by lucasteng@icloud.com", forHTTPHeaderField: "User-Agent")

        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)

        var input: String?
        let semaphore = DispatchSemaphore(value: 0)

        let task = session.dataTask(with: request) { data, _, error in
            if let error = error {
                print("URL Session Task Failed: %@", error.localizedDescription)
            } else if let data = data {
                input = String(data: data, encoding: .utf8)
            }

            semaphore.signal()
        }

        task.resume()
        session.finishTasksAndInvalidate()

        if semaphore.wait(timeout: .now() + 10) == .success {
            return input
        } else {
            return nil
        }
    }
}

_ = AOC()
