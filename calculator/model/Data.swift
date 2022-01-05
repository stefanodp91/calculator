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
    case undefined,number, operation, symbol, result
}

enum Operation {
    case multiplication, sum, division,subtraction
    
    var description : String {
        switch self {
        case .multiplication: return "multiplication"
        case .sum: return "sum"
        case .division: return "division"
        case .subtraction: return "subtraction"
        }
    }
}

enum Symbol {
    case clear ,percentage, delete, sign, dot, comma, result
    
    var description : String {
        switch self {
        case .clear: return "clear"
        case .percentage: return "percentage"
        case .delete: return "delete"
        case .sign: return "sign"
        case .dot: return "dot"
        case .comma: return "comma"
        case .result: return "result"
        }
    }
}

var dataSource =  [
    
    [
        Data(id:Symbol.clear.description, label:"\u{0041}\u{0043}", type: DataType.symbol),
        //         Data(id:"sqrt", label:"\u{221A}", type: DataType.symbol),
        Data(id:Symbol.percentage.description, label:"\u{0025}", type: DataType.symbol),
        Data(id:Symbol.delete.description, label:"\u{232B}", type: DataType.symbol),
        Data(id:Operation.division.description, label:"\u{00F7}", type: DataType.operation),
    ],
    
    [
        Data(id:"7", label:"\u{0037}", type: DataType.number),
        Data(id:"8", label:"\u{0038}", type: DataType.number),
        Data(id:"9", label:"\u{0039}", type: DataType.number),
        Data(id:Operation.multiplication.description, label:"\u{00D7}", type: DataType.operation),
    ],
    
    [
        Data(id:"4", label:"\u{0034}", type: DataType.number),
        Data(id:"5", label:"\u{0035}", type: DataType.number),
        Data(id:"6", label:"\u{0036}", type: DataType.number),
        Data(id:Operation.subtraction.description, label:"\u{002D}", type: DataType.operation),
    ],
    
    [
        Data(id:"1", label:"\u{0031}", type: DataType.number),
        Data(id:"2", label:"\u{0032}", type: DataType.number),
        Data(id:"3", label:"\u{0033}", type: DataType.number),
        Data(id:Operation.sum.description, label:"\u{002B}", type: DataType.operation),
    ],
    
    [
        Data(id:Symbol.sign.description, label:"\u{00B1}", type: DataType.symbol),
        Data(id:"0", label:"\u{0030}", type: DataType.number),
        Data(id:Symbol.dot.description, label:"\u{002C}", type: DataType.symbol),  // @TODO cambiare virgola in punto
        //        Data(id:"delete", label:"\u{232B}", type: DataType.symbol),
        Data(id:Symbol.result.description, label:"\u{003D}", type: DataType.result),
    ]
]

