//
//  ViewController.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

import UIKit
import MathParser

class ViewController: UIViewController {
    
    @IBOutlet weak var rootStackView: UIStackView!
    
    private var inProgressCalculation: String = ""
    
    private var currentCalculationLabel = CustomUILabel()
    private var resultLabel = CustomUILabel()
    private var labelStackView = UIStackView()
    private var buttonsStackView : UIStackView?
    
    // DDMathParser
    var parsedExpression: Expression?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // main container stackview
        setupRoot()
        
        // current calculation and result label
        setupLabels()
        
        // Buttons
        setupButtons()
        
        // Add views layout
        labelStackView.addArrangedSubview(currentCalculationLabel)
        labelStackView.addArrangedSubview(resultLabel)
        rootStackView.addArrangedSubview(labelStackView)
        rootStackView.addArrangedSubview(buttonsStackView!)
        
        setupConstraints()
    }
    
    private func setupRoot() {
        rootStackView.axis = .vertical
        rootStackView.alignment = .center
        rootStackView.distribution = .fill
        rootStackView.addBackground(color: .systemGray6)
    }
    
    private func setupLabels() {
        
        let labelBackground : UIColor = .systemBlue
        
        resultLabel.textColor = .white
        resultLabel.backgroundColor = .systemGray
        resultLabel.textAlignment = .right
        resultLabel.font = .systemFont(ofSize: Config.RESULT_FONT_SIZE)
        resultLabel.setMargins(
            top: Config.LABEL_INTERNAL_PADDING,
            left: Config.LABEL_INTERNAL_PADDING,
            bottom: Config.LABEL_INTERNAL_PADDING,
            right: Config.LABEL_INTERNAL_PADDING
        )
        resultLabel.backgroundColor = labelBackground
        resultLabel.autoscaleFont()
        
        
//        //It will Hide Keyboard
//        currentCalculationLabel.inputView = UIView()
//        //It will Hide Keyboard tool bar
//        currentCalculationLabel.inputAccessoryView = UIView()
//        //It will Hide the cursor
//        currentCalculationLabel.tintColor = .white
        
        currentCalculationLabel.textColor = .white
        currentCalculationLabel.backgroundColor = .systemGray
        currentCalculationLabel.textAlignment = .right
        currentCalculationLabel.font = .systemFont(ofSize: Config.CURRENT_CALCULATION_FONT_SIZE)
        currentCalculationLabel.setMargins(
            top: Config.LABEL_INTERNAL_PADDING,
            left: Config.LABEL_INTERNAL_PADDING,
            bottom: Config.LABEL_INTERNAL_PADDING,
            right: Config.LABEL_INTERNAL_PADDING
        )
        currentCalculationLabel.backgroundColor = labelBackground
        // font size
        currentCalculationLabel.autoscaleFont()

        // add internal margins
        currentCalculationLabel.setMargins(margin: Config.LABEL_INTERNAL_PADDING)
        
        labelStackView.addBackground(color: .systemBlue)
        labelStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func setupButtons() {
        
        buttonsStackView = createButtonsStackView()
        
        // add external margin to buttons stackview
        buttonsStackView!.layoutMargins = .init(
            top: Config.BUTTONS_CONTAINER_PADDING,
            left: Config.BUTTONS_CONTAINER_PADDING,
            bottom: Config.BUTTONS_CONTAINER_PADDING,
            right: Config.BUTTONS_CONTAINER_PADDING
        )
        buttonsStackView!.isLayoutMarginsRelativeArrangement = true
        
    }
    
    private func setupConstraints() {
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
        currentCalculationLabel.heightAnchor.constraint(equalTo: labelStackView.heightAnchor, multiplier: Config.LABEL_CURRENT_CALCULATION_RATIO_IN_CONTAINER).isActive = true
        
        // result label
        resultLabel.topAnchor.constraint(equalTo: currentCalculationLabel.bottomAnchor, constant: 0).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor, constant: 0).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 0).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0).isActive = true
        resultLabel.heightAnchor.constraint(equalTo: labelStackView.heightAnchor, multiplier: Config.LABEL_RESULT_RATIO_IN_CONTAINER).isActive = true
        
        // label stackview
        labelStackView.topAnchor.constraint(equalTo: rootStackView.topAnchor, constant: 0).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: 0).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 0).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: buttonsStackView!.topAnchor, constant: 0).isActive = true
        labelStackView.heightAnchor.constraint(equalTo: rootStackView.heightAnchor, multiplier: Config.LABEL_CONTAINER_SCREEN_RATIO).isActive = true
        
        // button stackview
        buttonsStackView!.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0).isActive = true
        buttonsStackView!.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: 0).isActive = true
        buttonsStackView!.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 0).isActive = true
        buttonsStackView!.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 0).isActive = true
        buttonsStackView!.heightAnchor.constraint(equalTo: rootStackView.heightAnchor, multiplier: Config.BUTTONS_CONTAINER_SCREEN_RATIO).isActive = true
    }
    
    private func createButtonsStackView() -> UIStackView {
        
        var groups = [UIStackView]()
        
        for subGroup in dataSource {
            let group = createButtons(subGroup: subGroup)
            let rowStackView = UIStackView(arrangedSubviews: group)
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = Config.BUTTON_SPACING
            groups.append(rowStackView)
        }
        
        let buttonsStackView = UIStackView(arrangedSubviews: groups)
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = Config.BUTTON_SPACING
        
        return buttonsStackView
    }
    
    func createButtons(subGroup: [Data]) -> [UIButton]{
        return subGroup.map { element in
            let button = UIButton()
            button.tag = element.id.hashValue
            button.setTitle(element.label, for: .normal)
            button.setTitleColor( .white , for: .normal)
            button.titleLabel?.font =  .systemFont(ofSize: Config.BUTTON_FONT_SIZE)
            button.layer.cornerRadius = Config.BUTTON_RADIUS
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
    
    @objc func onClick(sender: UIButton?) {
        var element: Data?
        
        // find element with the specified id
        for subGroup in dataSource {
            let founded = subGroup.filter { element in
                return sender?.tag == element.id.hashValue
            }
            
            if(!founded.isEmpty) {
                element = founded.first
                break
            }
        }
        
        if let element = element {
            handleClick(data: element)
        }
    }
    
    var temp: String = ""
    private func handleClick(data: Data) {
        switch(data.id) {
            
        case Symbol.delete.id:
            if(!inProgressCalculation.isEmpty) {
                // TODO: update cursor index to last known location
                // inProgressCalculation.remove(at: currentCalculationLabel.getCurrentIndex())
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
        
        analyzeString(temp)
    }
    
    func analyzeString(_ string: String) {
        resultLabel.text = ""
        
        do {
            let operatorSet = OperatorSet(interpretsPercentSignAsModulo: false)
            let e = try Expression(string: string, operatorSet: operatorSet)
            parsedExpression = e
            
            reevaluateExpression()
            
        } catch let e as MathParserError {
            parsedExpression = nil
            // analyzerDelegate?.analyzerViewController(self, wantsErrorPresented: e)
            print("error", e)
        } catch let other {
            fatalError("Unknown error parsing expression: \(other)")
        }
    }
    
    func reevaluateExpression() {
        guard let expression = parsedExpression else { return }
        // analyzerDelegate?.analyzerViewController(self, wantsErrorPresented: nil)
        
        let evaluator = Evaluator.default
        do {
            let result = try evaluator.evaluate(expression)
            resultLabel.text = "\(result)"
        } catch let e as MathParserError {
            // analyzerDelegate?.analyzerViewController(self, wantsErrorPresented: e)
            print("error", e)
        } catch let e {
            fatalError("Unknown error evaluating expression: \(e)")
        }
    }
}
