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

 func stringToDouble(stringVal : String) ->  Double {
    return Double(stringVal) ?? 0
}

 func doubleToString(doubleVal: Double) -> String {
    return String(doubleVal)
}
