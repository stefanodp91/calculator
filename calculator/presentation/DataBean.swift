//
//  DataBean.swift
//  calculator
//
//  Created by Stefano De Pascalis on 12/01/22.
//

struct DataBean {
    var id: String
    var label: String
    var type: DataType = DataType.undefined
    
    internal init(id: String = "", label: String="", type: DataType = DataType.undefined) {
        self.id = id
        self.label = label
        self.type = type
    }
}
