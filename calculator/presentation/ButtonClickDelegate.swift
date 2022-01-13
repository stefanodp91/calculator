//
//  ButtonClickDelegate.swift
//  calculator
//
//  Created by Stefano De Pascalis on 13/01/22.
//

import Foundation

protocol ButtonClickDelegate {
    
    func onButtonClicked(_ buttonId: String, _ expression: String)
    
}
