//
//  CustomUILabel.swift
//  calculator
//
//  Created by Stefano De Pascalis on 05/01/22.
//

import UIKit

class CustomUILabel: UILabel {
    
    private var top: CGFloat = 0
    private var left: CGFloat = 0
    private var bottom: CGFloat = 0
    private var right: CGFloat = 0
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    func setMargins(top: CGFloat = 0,left: CGFloat = 0, bottom: CGFloat = 0,right: CGFloat = 0) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
        setNeedsDisplay()
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right:right)
        super.drawText(in: rect.inset(by: insets))
    }
    
}
