//
//  StringUtils.swift
//  calculator
//
//  Created by Stefano De Pascalis on 10/01/22.
//

extension StringProtocol {
    var double: Double? { Double(self) }
    var float: Float? { Float(self) }
    var integer: Int? { Int(self) }
}

func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

func stringToDouble(stringVal : String) ->  Double {
    return Double(stringVal) ?? 0
}

func doubleToString(doubleVal: Double) -> String {
    return String(doubleVal)
}
