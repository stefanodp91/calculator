//  CustomCollectionViewCell.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

import UIKit


protocol ClickProtocol : AnyObject {
    func onClick(data:Data?)
}

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var button: UIButton!
    
    private var data:Data?
    
    public weak var delegate: ClickProtocol?
    
    func setData(data:Data) {
        self.data = data
        button.setTitle(data.label, for: .normal)
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    @objc func onClick() {
        print("\(String(describing: data))")
        
        delegate?.onClick(data: data)
        
    }
}
