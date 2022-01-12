//
//  Evaluator.swift
//  calculator
//
//  Created by Stefano De Pascalis on 12/01/22.
//

import Foundation
import MathParser

public class EvaluatorController {
    
    private var parsedExpression: Expression?
    
    private var delegate: EvaluatorDelegate
    
    init(_ delegate: EvaluatorDelegate) {
        self.delegate = delegate
    }
    
    func evaluate(_ expression: String) {
        do {
            let configuration = Configuration()
            configuration.operatorSet.interpretsPercentSignAsModulo = false
            
            let e = try Expression(string: expression, configuration: configuration)
            parsedExpression = e
            
            reevaluateExpression()
            
        } catch let e as MathParserError {
            parsedExpression = nil
            delegate.onMathEvaluationError(e)
        } catch let e {
            delegate.onMathEvaluationFatalError(e)
        }
    }
    
    private func reevaluateExpression() {
        // run evaluation in background
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now() , execute: {
                
                guard let expression = self.parsedExpression else { return }
                
                let evaluator = Evaluator.default
                
                do {
                    let result = try evaluator.evaluate(expression)
                    self.delegate.onEvaluation("\(result)")
                } catch let e as MathParserError {
                    self.delegate.onMathEvaluationError(e)
                } catch let e {
                    self.delegate.onMathEvaluationFatalError(e)
                }
            })
        }
    }
}
