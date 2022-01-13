//
//  ViewController.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

import UIKit
import MathParser

class ViewController: UIViewController, EvaluatorDelegate, ButtonClickDelegate {
    
    
    @IBOutlet weak var rootStackView: UIStackView!
    
    
    private var evaluatorController: EvaluatorController?
    private var calculatorUI: CalculatorUI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup ui
        setupCalculatorUI()
        
        // setup evaluator
        evaluatorController = EvaluatorController(self)
        
    }
    
    private func createConfiguration() -> UIConfiguration {
        return UIConfigurationBuilder()
            .addRow([
                // DataBean(id: Symbol.clear.id, label: Symbol.clear.label, type: DataType.symbol),
                DataBean(id: MathSymbol.leftParentheses.id, label: MathSymbol.leftParentheses.label, type: DataType.symbol),
                DataBean(id: MathSymbol.rightParentheses.id, label: MathSymbol.rightParentheses.label, type: DataType.symbol),
                DataBean(id: MathSymbol.percentage.id, label: MathSymbol.percentage.label, type: DataType.symbol),
                DataBean(id: Operation.division.id, label: Operation.division.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.seven.id, label: Cipher.seven.label, type: DataType.number),
                DataBean(id: Cipher.eight.id, label: Cipher.eight.label, type: DataType.number),
                DataBean(id: Cipher.nine.id, label: Cipher.nine.label, type: DataType.number),
                DataBean(id: Operation.multiplication.id, label: Operation.multiplication.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.four.id, label: Cipher.four.label, type: DataType.number),
                DataBean(id: Cipher.five.id, label: Cipher.five.label, type: DataType.number),
                DataBean(id: Cipher.six.id, label: Cipher.six.label, type: DataType.number),
                DataBean(id: Operation.subtraction.id, label: Operation.subtraction.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.one.id, label: Cipher.one.label, type: DataType.number),
                DataBean(id: Cipher.two.id, label: Cipher.two.label, type: DataType.number),
                DataBean(id: Cipher.three.id, label: Cipher.three.label, type: DataType.number),
                DataBean(id: Operation.sum.id, label: Operation.sum.label, type: DataType.operation),
            ])
            .addRow([
                DataBean(id: Cipher.zero.id, label: Cipher.zero.label, type: DataType.number),
                DataBean(id: MathSymbol.comma.id, label: MathSymbol.comma.label, type: DataType.symbol),
                DataBean(id: Symbol.delete.id, label: Symbol.delete.label, type: DataType.symbol),
                DataBean(id: MathSymbol.result.id, label: MathSymbol.result.label, type: DataType.result),
            ])
            .setLabelsContainerScreenRatio(0.5)
            .setButtonsContainerScreenRatio(0.5)
            .setLabelResultRationInContainer(0.2)
            .setLabelCurrentCalculationRatioInContainer(0.8)
            .setLabelTextScaleFactor(0.2)
            .setLabelRadius(16)
            .setLabelContainerPadding(8)
            .setLabelInternalPadding(25)
            .setButtonsContainerPadding(8)
            .setButtonsSpacing(12)
            .setResultFontSize(60)
            .setCurrentCalculationFontSize(100)
            .setButtonFontSize(40)
            .setButtonRadius(16)
            .build()
    }
    
    private func setupCalculatorUI() {
        // setup root
        rootStackView.axis = .vertical
        rootStackView.alignment = .center
        rootStackView.distribution = .fill
        
        // setup calculator
        calculatorUI = CalculatorUI()
        calculatorUI!.drawUI(createConfiguration())
        calculatorUI!.clickDelegate = self
        
        // add calculator to layout
        rootStackView.addArrangedSubview(calculatorUI!)
        
        // setup constraints
        calculatorUI!.translatesAutoresizingMaskIntoConstraints = false
        calculatorUI!.topAnchor.constraint(equalTo: rootStackView.topAnchor, constant: 0).isActive = true
        calculatorUI!.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: 0).isActive = true
        calculatorUI!.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 0).isActive = true
        calculatorUI!.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 0).isActive = true
    }
    
    func onButtonClicked(_ buttonId: String, _ expression: String) {
        evaluatorController?.evaluate(expression)
    }
    
    func onEvaluation(_ result: String) {
        calculatorUI?.updateResult("\(result)")
    }
    
    func onMathEvaluationError(_ error: MathParserError) {
        // print("onMathEvaluationError", error)
    }
    
    func onMathEvaluationFatalError(_ error: Error) {
        fatalError("Unknown error parsing expression: \(error)")
    }
}
