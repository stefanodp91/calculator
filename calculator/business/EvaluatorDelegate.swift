//
//  EvaluatorDelegate.swift
//  calculator
//
//  Created by Stefano De Pascalis on 12/01/22.
//

import MathParser

protocol EvaluatorDelegate {
    
    func onEvaluation(_ result: String)
    
    func onMathEvaluationError(_ error: MathParserError)
    
    func onMathEvaluationFatalError(_ error: Error)
    
}
