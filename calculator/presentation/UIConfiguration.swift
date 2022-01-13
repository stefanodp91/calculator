//
//  UIConfiguration.swift
//  calculator
//
//  Created by Stefano De Pascalis on 12/01/22.
//

import Foundation

public struct UIConfiguration {
    var builder: UIConfigurationBuilder
    
    init(_ builder: UIConfigurationBuilder) {
        self.builder = builder
    }
}

public class UIConfigurationBuilder {
    
    private(set) var rows: Array<[DataBean]> = []
    
    private(set) var labelsContainerScreenRatio: Float = 0.5
    private(set) var buttonsContainerScreenRatio: Float = 0.5
    private(set) var labelResultRationInContainer: Float = 0.2
    private(set) var labelCurrentCalculationRatioInContainer: Float = 0.8
    private(set) var labelTextScaleFactor: Float = 0.2
    private(set) var labelRadius: Float = 16
    private(set) var labelContainerPadding: Float = 8
    private(set) var labelInternalPadding: Float = 25
    private(set) var buttonsContainerPadding: Float = 8
    private(set) var buttonsSpacing: Float = 12
    private(set) var resultFontSize: Float = 60
    private(set) var currentCalculationFontSize: Float = 100
    private(set) var buttonFontSize: Float = 40
    private(set) var buttonRadius: Float = 16
    
    func addRow(_ row: [DataBean]) -> UIConfigurationBuilder {
        rows.insert(row, at: rows.count)
        return self
    }
    
    func setLabelsContainerScreenRatio(_ labelsContainerScreenRatio: Float ) -> UIConfigurationBuilder {
        self.labelsContainerScreenRatio = labelsContainerScreenRatio
        return self
    }
    
    func setButtonsContainerScreenRatio(_ buttonsContainerScreenRatio: Float ) -> UIConfigurationBuilder {
        self.buttonsContainerScreenRatio = buttonsContainerScreenRatio
        return self
    }
    
    func setLabelResultRationInContainer(_ labelResultRationInContainer: Float ) -> UIConfigurationBuilder {
        self.labelResultRationInContainer = labelResultRationInContainer
        return self
    }
    
    func setLabelCurrentCalculationRatioInContainer(_ labelCurrentCalculationRatioInContainer: Float ) -> UIConfigurationBuilder {
        self.labelCurrentCalculationRatioInContainer = labelCurrentCalculationRatioInContainer
        return self
    }
    
    func setLabelTextScaleFactor(_ labelTextScaleFactor: Float ) -> UIConfigurationBuilder {
        self.labelTextScaleFactor = labelTextScaleFactor
        return self
    }
    
    func setLabelRadius(_ labelRadius: Float ) -> UIConfigurationBuilder {
        self.labelRadius = labelRadius
        return self
    }
    
    func setLabelContainerPadding(_ labelContainerPadding: Float ) -> UIConfigurationBuilder {
        self.labelContainerPadding = labelContainerPadding
        return self
    }
    
    func setLabelInternalPadding(_ labelInternalPadding: Float ) -> UIConfigurationBuilder {
        self.labelInternalPadding = labelInternalPadding
        return self
    }
    
    func setButtonsContainerPadding(_ buttonsContainerPadding: Float ) -> UIConfigurationBuilder {
        self.buttonsContainerPadding = buttonsContainerPadding
        return self
    }
    
    func setButtonsSpacing(_ buttonsSpacing: Float ) -> UIConfigurationBuilder {
        self.buttonsSpacing = buttonsSpacing
        return self
    }
    
    func setResultFontSize(_ resultFontSize: Float ) -> UIConfigurationBuilder {
        self.resultFontSize = resultFontSize
        return self
    }
    
    func setCurrentCalculationFontSize(_ currentCalculationFontSize: Float ) -> UIConfigurationBuilder {
        self.currentCalculationFontSize = currentCalculationFontSize
        return self
    }
    
    func setButtonFontSize(_ buttonFontSize: Float ) -> UIConfigurationBuilder {
        self.buttonFontSize = buttonFontSize
        return self
    }
    
    func setButtonRadius(_ buttonRadius: Float ) -> UIConfigurationBuilder {
        self.buttonRadius = buttonRadius
        return self
    }
    
    func build() -> UIConfiguration {
        return UIConfiguration(self)
    }
}
