//
//  CalculatorUI.swift
//  calculator
//
//  Created by Stefano De Pascalis on 12/01/22.
//

import Foundation
import UIKit
import SwiftUI

// TODO: convert this stackview to uiview
public class CalculatorUI : UIStackView {
    
    //    private var rootStackView: UIStackView = UIStackView()
    private var currentCalculationLabel = CustomUILabel()
    private var resultLabel = CustomUILabel()
    private var labelStackView = UIStackView()
    private var buttonsStackView: UIStackView?
    
    private var configuration: UIConfiguration?
    
    private var inProgressCalculation: String = ""
    
    var clickDelegate: ButtonClickDelegate?
    
    func drawUI(_ configuration: UIConfiguration) {
        self.configuration = configuration
        
        // main container stackview
        setupRoot()
        
        // current calculation and result label
        setupLabels()
        
        // Buttons
        setupButtons()
        
        // Add views layout
        labelStackView.addArrangedSubview(currentCalculationLabel)
        labelStackView.addArrangedSubview(resultLabel)
        self.addArrangedSubview(labelStackView)
        self.addArrangedSubview(buttonsStackView!)
        
        setupConstraints()
    }
    
    func updateResult(_ result: String) {
        resultLabel.text = "\(result)"
    }
    
    private func setupRoot() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fill
        self.addBackground(color: .systemGray6)
    }
    
    private func setupLabels() {
        
        if let configuration = configuration {
            let labelBackground : UIColor = .systemBlue
            
            resultLabel.textColor = .white
            resultLabel.backgroundColor = .systemGray
            resultLabel.textAlignment = .right
            resultLabel.font = .systemFont(ofSize: CGFloat(configuration.builder.resultFontSize))
            resultLabel.setMargins(
                top: CGFloat(configuration.builder.labelInternalPadding),
                left: CGFloat(configuration.builder.labelInternalPadding),
                bottom: CGFloat(configuration.builder.labelInternalPadding),
                right: CGFloat(configuration.builder.labelInternalPadding)
            )
            resultLabel.backgroundColor = labelBackground
            resultLabel.autoscaleFont(CGFloat(configuration.builder.labelTextScaleFactor))
            
            
            //        //It will Hide Keyboard
            //        currentCalculationLabel.inputView = UIView()
            //        //It will Hide Keyboard tool bar
            //        currentCalculationLabel.inputAccessoryView = UIView()
            //        //It will Hide the cursor
            //        currentCalculationLabel.tintColor = .white
            
            currentCalculationLabel.textColor = .white
            currentCalculationLabel.backgroundColor = .systemGray
            currentCalculationLabel.textAlignment = .right
            currentCalculationLabel.font = .systemFont(ofSize: CGFloat(configuration.builder.currentCalculationFontSize))
            currentCalculationLabel.setMargins(
                top: CGFloat(configuration.builder.labelInternalPadding),
                left: CGFloat(configuration.builder.labelInternalPadding),
                bottom: CGFloat(configuration.builder.labelInternalPadding),
                right: CGFloat(configuration.builder.labelInternalPadding)
            )
            currentCalculationLabel.backgroundColor = labelBackground
            // font size
            currentCalculationLabel.autoscaleFont(CGFloat(configuration.builder.labelTextScaleFactor))
            
            // add internal margins
            currentCalculationLabel.setMargins(CGFloat(configuration.builder.labelInternalPadding))
            
            labelStackView.addBackground(color: .systemBlue)
            labelStackView.isLayoutMarginsRelativeArrangement = true
        }
    }
    
    private func setupButtons() {
        
        if let configuration = configuration {
            buttonsStackView = createButtonsStackView()
            
            // add external margin to buttons stackview
            buttonsStackView!.layoutMargins = .init(
                top: CGFloat(configuration.builder.buttonsContainerPadding),
                left: CGFloat(configuration.builder.buttonsContainerPadding),
                bottom: CGFloat(configuration.builder.buttonsContainerPadding),
                right: CGFloat(configuration.builder.buttonsContainerPadding)
            )
            buttonsStackView!.isLayoutMarginsRelativeArrangement = true
        }
    }
    
    private func setupConstraints() {
        
        if let configuration = configuration {
            // ignore default constraints
            labelStackView.translatesAutoresizingMaskIntoConstraints = false
            buttonsStackView!.translatesAutoresizingMaskIntoConstraints = false
            currentCalculationLabel.translatesAutoresizingMaskIntoConstraints = false
            resultLabel.translatesAutoresizingMaskIntoConstraints = false
            
            labelStackView.axis = .vertical
            
            // current calculation label
            currentCalculationLabel.topAnchor.constraint(equalTo: labelStackView.topAnchor, constant: 0).isActive = true
            currentCalculationLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor, constant: 0).isActive = true
            currentCalculationLabel.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 0).isActive = true
            currentCalculationLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor, constant: 0).isActive = true
            currentCalculationLabel.heightAnchor.constraint(equalTo: labelStackView.heightAnchor, multiplier:
                                                                CGFloat(configuration.builder.labelCurrentCalculationRatioInContainer)).isActive = true
            
            // result label
            resultLabel.topAnchor.constraint(equalTo: currentCalculationLabel.bottomAnchor, constant: 0).isActive = true
            resultLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor, constant: 0).isActive = true
            resultLabel.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 0).isActive = true
            resultLabel.bottomAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0).isActive = true
            resultLabel.heightAnchor.constraint(equalTo: labelStackView.heightAnchor, multiplier:    CGFloat(configuration.builder.labelResultRationInContainer)).isActive = true
            
            // label stackview
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            labelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            labelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            labelStackView.bottomAnchor.constraint(equalTo: buttonsStackView!.topAnchor, constant: 0).isActive = true
            labelStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:    CGFloat(configuration.builder.labelsContainerScreenRatio)).isActive = true
            
            // button stackview
            buttonsStackView!.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0).isActive = true
            buttonsStackView!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            buttonsStackView!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            buttonsStackView!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            buttonsStackView!.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:    CGFloat(configuration.builder.buttonsContainerScreenRatio)).isActive = true
        }
    }
    
    private func createButtonsStackView() -> UIStackView {
        
        if let configuration = configuration {
            var groups = [UIStackView]()
            
            for subGroup in  configuration.builder.rows {
                let group = createButtons(subGroup)
                let rowStackView = UIStackView(arrangedSubviews: group)
                rowStackView.axis = .horizontal
                rowStackView.distribution = .fillEqually
                rowStackView.spacing =  CGFloat(configuration.builder.buttonsSpacing)
                groups.append(rowStackView)
            }
            
            let buttonsStackView = UIStackView(arrangedSubviews: groups)
            buttonsStackView.axis = .vertical
            buttonsStackView.distribution = .fillEqually
            buttonsStackView.spacing = CGFloat(configuration.builder.buttonsSpacing)
            
            return buttonsStackView
        }
        
        return UIStackView()
    }
    
    private func createButtons(_ subGroup: [DataBean]) -> [UIButton] {
        if let configuration = configuration {
            return subGroup.map { element in
                
                let button = UIButton()
                button.tag = element.id.hashValue
                button.setTitle(element.label, for: .normal)
                button.setTitleColor( .white , for: .normal)
                button.titleLabel?.font =  .systemFont(ofSize: CGFloat(configuration.builder.buttonFontSize))
                button.layer.cornerRadius = CGFloat(configuration.builder.buttonRadius)
                button.titleLabel?.adjustsFontSizeToFitWidth = true;
                
                var backgroundColor : UIColor
                switch(element.type){
                case .operation: backgroundColor = .systemGray4
                case .result:backgroundColor = .systemBlue
                default :backgroundColor = .systemGray6
                }
                
                button.backgroundColor = backgroundColor
                button.addTarget(self, action: #selector(onClick(sender:)), for: .touchUpInside)
                
                return button
            }
        }
        
        return []
        
    }
    
    @objc private func onClick(sender: UIButton?) {
        
        if let configuration = configuration {
            var element: DataBean?
            
            // find element with the specified id
            for subGroup in configuration.builder.rows {
                let founded = subGroup.filter { element in
                    return sender?.tag == element.id.hashValue
                }
                
                if(!founded.isEmpty) {
                    element = founded.first
                    break
                }
            }
            
            if let element = element {
                handleClick(element)
            }
        }
    }
    
    var temp: String = ""
    private func handleClick(_ data: DataBean) {
        switch(data.id) {
            
        case Symbol.delete.id:
            if(!inProgressCalculation.isEmpty) {
                // TODO: update cursor index to last known location
                inProgressCalculation.removeLast()
                
            }
        default:
            inProgressCalculation += data.label
        }
        
        temp = inProgressCalculation
            .replacingOccurrences(of: Operation.multiplication.label, with: Operation.multiplication.id)
            .replacingOccurrences(of: Operation.division.label, with: Operation.division.id)
            .replacingOccurrences(of: MathSymbol.comma.label, with: MathSymbol.comma.mathValue)
        
        currentCalculationLabel.text  = inProgressCalculation
        
        resultLabel.text = ""
        
        clickDelegate?.onButtonClicked(data.id, temp)
    }
}
