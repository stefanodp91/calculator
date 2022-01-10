//
//  MathUtils.swift
//  calculator
//
//  Created by Stefano De Pascalis on 05/01/22.
//

func sum(x : Double, y : Double) -> Double {
    return x + y
}

func difference(x : Double, y : Double) -> Double {
    return x - y
}

func multiply(x : Double, y : Double) -> Double {
    return x * y
}

func divide(x : Double, y : Double) -> Double {
    return x / y
}

func isInteger(doubleVal: Double) -> Bool {
    return floor(doubleVal) == doubleVal // true
}

// tokenize a string and convert each integer to double
func normalize(expression: String) -> String {
    let regex = #"(?<matrix>(?:\[[^\]]+\])|(?:<[^>]+>)|(?:\{[^\}]+\}))|(?<function>\w+(?=\())|(\d+[eE][-+]\(d+)|(\d*\.?\d+)|(?<operand>\w+)|(?<operator>[-+\/*%])|(?<symbol>.)"#
    
    var chunks : [String] = matches(for: regex, in: expression)
    var str : String = ""
    
    
    for chunk in chunks {
        if let myValue = chunk.double  {
            str+=doubleToString(doubleVal: myValue)
        } else {
            str = str + String(describing: chunk)
        }
    }
    
    return str
    
}
