//
//  Data.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

struct Data{
    var id : String
    var label:String
    var type:DataType=DataType.undefined
    
    internal init(id: String, label: String, type:DataType) {
        self.id = id
        self.label = label
        self.type=type
    }
}

enum DataType {
    case undefined,number, operation, symbol
}

enum Operation {
    case multiplication
    case sum
    case division
    case subtraction
    
    var description : String {
           switch self {
           case .multiplication: return "multiplication"
           case .sum: return "sum"
           case .division: return "division"
           case .subtraction: return "subtraction"
           }
        }
}

var dataSource : [Data] = [
    
    Data(id:"clear", label:"\u{0041}\u{0043}", type: DataType.symbol),
    Data(id:"sqrt", label:"\u{221A}", type: DataType.symbol),
    Data(id:"percentage", label:"\u{0025}", type: DataType.symbol),
    Data(id:Operation.division.description, label:"\u{00F7}", type: DataType.operation),
    
    Data(id:"7", label:"\u{0037}", type: DataType.number),
    Data(id:"8", label:"\u{0038}", type: DataType.number),
    Data(id:"9", label:"\u{0039}", type: DataType.number),
    Data(id:Operation.multiplication.description, label:"\u{00D7}", type: DataType.operation),
    
    Data(id:"4", label:"\u{0034}", type: DataType.number),
    Data(id:"5", label:"\u{0035}", type: DataType.number),
    Data(id:"6", label:"\u{0036}", type: DataType.number),
    Data(id:Operation.subtraction.description, label:"\u{002D}", type: DataType.operation),
    
    Data(id:"1", label:"\u{0031}", type: DataType.number),
    Data(id:"2", label:"\u{0032}", type: DataType.number),
    Data(id:"3", label:"\u{0033}", type: DataType.number),
    Data(id:Operation.sum.description, label:"\u{002B}", type: DataType.operation),
    
    
    Data(id:".", label:"\u{002C}", type: DataType.symbol),
    Data(id:"0", label:"\u{0030}", type: DataType.number),
    Data(id:"delete", label:"\u{232B}", type: DataType.symbol),
    Data(id:"result", label:"\u{003D}", type: DataType.symbol),
]

