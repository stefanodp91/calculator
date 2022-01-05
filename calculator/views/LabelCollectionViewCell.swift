//
//  LabelCollectionViewCell.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var currentOperation: UILabel!
    @IBOutlet var total: UILabel!
    
    func setCurrentOperation(currentOperation:String?) {
        self.currentOperation.text = currentOperation ?? ""
    }
    
    func setTotal(total:String?) {
        self.total.text = total ?? ""
    }
}
