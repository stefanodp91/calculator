//
//  ViewController.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rootStackView: UIStackView!
    
    private var currentOperation: String = ""
    private var total: String = ""
    private var previousNumber: Double = 0
    private var isOperationInProgess = false
    private var operation: String = ""
    
    private var totalUILabel: CustomUILabel = CustomUILabel()
    private var labelStackView: UIStackView = UIStackView()
    private var buttonsStackView : UIStackView?
    
    private let LABEL_MULTIPLIER : CGFloat = 0.3
    private let BUTTONS_CONTAINER_MULTIPLIER : CGFloat = 0.7
    private let BUTTONS_CONTAINER_PADDING : CGFloat  = 8
    private let LABEL_CONTAINER_PADDING : CGFloat  = 8
    private let BUTTON_SPACING : CGFloat  = 12
    private let LABEL_FONT_SIZE : CGFloat  = 100
    private let BUTTON_FONT_SIZE : CGFloat  = 50
    private let LABEL_RADIUS : CGFloat  = 16
    private let BUTTON_RADIUS : CGFloat  = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // main container stackview
        setupRoot()
        
        // label
        setupLabel()
        
        // Buttons
        setupButtons()
        
        // Add views layout
        labelStackView.addArrangedSubview(totalUILabel)
        rootStackView.addArrangedSubview(labelStackView)
        rootStackView.addArrangedSubview(buttonsStackView!)
        
        setupConstraints()
    }
    
    private func setupRoot() {
        rootStackView.axis = .vertical
        rootStackView.alignment = .center
        rootStackView.distribution = .fill
        rootStackView.addBackground(color: .systemGray)
    }
    
    private func setupLabel() {
        totalUILabel.textColor = .black
        totalUILabel.backgroundColor = .white
        totalUILabel.textAlignment = .right
        totalUILabel.font = .systemFont(ofSize: LABEL_FONT_SIZE)
        totalUILabel.setMargins(top: 0, left: 0, bottom: 0, right: 25)
        
        
        // radius
        totalUILabel.layer.cornerRadius = LABEL_RADIUS
        totalUILabel.layer.masksToBounds = true
        
        // add shadow
        totalUILabel.layer.shadowColor = UIColor.black.cgColor
        totalUILabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        totalUILabel.layer.shadowRadius = 4.0
        totalUILabel.layer.shadowOpacity = 0.4
        totalUILabel.layer.shouldRasterize = true
        totalUILabel.layer.rasterizationScale = UIScreen.main.scale
        
        // add internal margins
        totalUILabel.setMargins(margin: 20)
        
        // add external margin to label stackview
        labelStackView.layoutMargins = .init(top: LABEL_CONTAINER_PADDING, left: LABEL_CONTAINER_PADDING, bottom: LABEL_CONTAINER_PADDING, right: LABEL_CONTAINER_PADDING)
        labelStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func setupButtons() {
        
        buttonsStackView = createButtonsStackView()
        
        // add external margin to buttons stackview
        buttonsStackView!.layoutMargins = .init(top: BUTTONS_CONTAINER_PADDING, left: BUTTONS_CONTAINER_PADDING, bottom: BUTTONS_CONTAINER_PADDING, right: BUTTONS_CONTAINER_PADDING)
        buttonsStackView!.isLayoutMarginsRelativeArrangement = true
        
    }
    
    private func setupConstraints() {
        // ignore default constraints
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView!.translatesAutoresizingMaskIntoConstraints = false
        
        // label stackview
        labelStackView.topAnchor.constraint(equalTo: rootStackView.topAnchor, constant: 0).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: 0).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 0).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: buttonsStackView!.topAnchor, constant: 0).isActive = true
        labelStackView.heightAnchor.constraint(equalTo: rootStackView.heightAnchor, multiplier: LABEL_MULTIPLIER).isActive = true
        
        // button stackview
        buttonsStackView!.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 0).isActive = true
        buttonsStackView!.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: 0).isActive = true
        buttonsStackView!.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 0).isActive = true
        buttonsStackView!.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 0).isActive = true
        buttonsStackView!.heightAnchor.constraint(equalTo: rootStackView.heightAnchor, multiplier: BUTTONS_CONTAINER_MULTIPLIER).isActive = true
    }
    
    private func createButtonsStackView() -> UIStackView{
        
        var groups = [UIStackView]()
        
        for subGroup in dataSource {
            let group = createButtons(subGroup: subGroup)
            let rowStackView = UIStackView(arrangedSubviews: group)
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = BUTTON_SPACING
            groups.append(rowStackView)
        }
        
        let buttonsStackView = UIStackView(arrangedSubviews: groups)
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        // buttonsStackView.addBackground(color: .systemGray2)
        buttonsStackView.spacing = BUTTON_SPACING
        
        return buttonsStackView
    }
    
    
    func createButtons(subGroup: [Data]) -> [UIButton]{
        return subGroup.map { element in
            let button = UIButton()
            button.tag = element.id.hashValue
            button.setTitle(element.label, for: .normal)
            button.setTitleColor( .white , for: .normal)
            button.titleLabel?.font =  .systemFont(ofSize: BUTTON_FONT_SIZE)
            button.layer.cornerRadius = BUTTON_RADIUS
            
            // add shadow
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 4.0
            button.layer.shadowOpacity = 0.4
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            
            var backgroundColor : UIColor
            switch(element.type){
            case .operation: backgroundColor = .systemGray3
            case .result:backgroundColor = .systemBlue
            default :backgroundColor = .systemGray2
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
    
    private func handleClick(data: Data) {
        switch(data.id) {
        case "0", "1",  "2", "3", "4",  "5", "6", "7", "8", "9":
            
            if (isOperationInProgess) {
                total = data.id
                total = data.id
                isOperationInProgess=false
            } else {
                total += data.id
            }
        case Operation.multiplication.description:
            if(!total.isEmpty){
                operation = Operation.multiplication.description
                previousNumber = stringToDouble(stringVal: total)
                isOperationInProgess = true
            }
        case Operation.subtraction.description:
            if(!total.isEmpty){
                operation = Operation.subtraction.description
                previousNumber = stringToDouble(stringVal: total)
                isOperationInProgess = true
            }
        case Operation.sum.description:
            if(!total.isEmpty){
                operation = Operation.sum.description
                previousNumber = stringToDouble(stringVal: total)
                isOperationInProgess = true
            }
        case Operation.division.description:
            if(!total.isEmpty){
                operation = Operation.division.description
                previousNumber = stringToDouble(stringVal: total)
                isOperationInProgess = true
            }
        case Symbol.dot.description:
            if(!total.isEmpty && !total.contains(data.label)) {
                total += data.label
            }
        case Symbol.delete.description:
            if(!total.isEmpty){
                total.removeLast()
                
            }
        case Symbol.result.description:
            switch(operation) {
            case Operation.multiplication.description:
                total = String(multiply(x: previousNumber, y: stringToDouble(stringVal: total)))
            case Operation.subtraction.description:
                total = String(difference(x: previousNumber, y: stringToDouble(stringVal: total)))
            case Operation.sum.description:
                total = String(sum(x: previousNumber, y: stringToDouble(stringVal: total)))
            case Operation.division.description:
                total = String(divide(x: previousNumber, y: stringToDouble(stringVal: total)))
            default: break
            }
            isOperationInProgess = false
        default:break
            
        }
        
        totalUILabel.text  = total
        
        
        
        print("previousNumber", previousNumber)
        print("total", total)
        
    }
}
