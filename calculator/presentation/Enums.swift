//
//  Enums.swift
//  calculator
//
//  Created by Stefano De Pascalis on 12/01/22.
//

enum Cipher {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var id: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        }
    }
    
    var label: String {
        switch self {
        case .zero: return "\u{0030}"
        case .one: return "\u{0031}"
        case .two: return "\u{0032}"
        case .three: return "\u{0033}"
        case .four: return "\u{0034}"
        case .five: return "\u{0035}"
        case .six: return "\u{0036}"
        case .seven: return "\u{0037}"
        case .eight: return "\u{0038}"
        case .nine: return "\u{0039}"
        }
    }
}

enum DataType {
    case undefined, number, operation, symbol, result
}

enum Operation {
    case multiplication, sum, division, subtraction
    
    var id: String {
        switch self {
        case .multiplication: return "*"
        case .sum: return "+"
        case .division: return "/"
        case .subtraction: return "-"
        }
    }
    
    var label: String {
        switch self {
        case .multiplication: return "\u{00D7}"
        case .sum: return "\u{002B}"
        case .division: return "\u{00F7}"
        case .subtraction: return "\u{002D}"
        }
    }
    
}

enum MathSymbol {
    case sqrt, percentage, dot, comma, result, leftParentheses, rightParentheses
    
    var id: String {
        switch self {
        case .sqrt: return "sqrt"
        case .percentage: return "percentage"
        case .dot: return "dot"
        case .comma: return "comma"
        case .result: return "result"
        case .leftParentheses: return "leftParentheses"
        case .rightParentheses: return "rightParentheses"
        }
    }
    
    var label: String {
        switch self {
        case .sqrt: return "\u{221A}"
        case .percentage: return "\u{0025}"
        case .dot: return "\u{002E}"
        case .comma: return "\u{002C}"
        case .result: return "\u{003D}"
        case .leftParentheses: return "\u{0028}"
        case .rightParentheses: return "\u{0029}"
        }
    }
    
    var mathValue: String {
        switch self {
        case .sqrt: return "sqrt"
        case .percentage: return "%"
        case .dot: return "."
        case .comma: return "."
        case .result: return "="
        case .leftParentheses: return "("
        case .rightParentheses: return ")"
        }
    }
}

enum Symbol {
    case clear, delete, sign
    
    var id: String {
        switch self {
        case .clear: return "clear"
        case .delete: return "delete"
        case .sign: return "sign"
        }
    }
    
    var label: String {
        switch self {
        case .clear: return "\u{0041}\u{0043}"
        case .delete: return "\u{232B}"
        case .sign: return "\u{00B1}"
            
        }
    }
}
