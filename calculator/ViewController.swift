//
//  ViewController.swift
//  calculator
//
//  Created by Stefano De Pascalis on 04/01/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ClickProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var currentOperation:String=""
    private var total:String=""
    
    private var previousNumber: Double = 0
    private var isOperationInProgess = false
    private var operation :String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.item != 0) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CustomCollectionViewCell
            cell.setData(data: dataSource[indexPath.item - 1])
            cell.delegate = self
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexPath as IndexPath) as! LabelCollectionViewCell
            cell.setCurrentOperation(currentOperation: self.currentOperation)
            cell.setTotal(total: self.total)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dataSource.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        
        
        if(indexPath.item == 0) {
            return CGSize(width: width, height: height * 0.33)
        } else {
            return CGSize(width: width * 0.2, height: height * 0.1)
            
        }
    }
    
    func onClick(data: Data?) {
        
        switch(data?.id) {
        case "0", "1",  "2", "3", "4",  "5", "6", "7", "8", "9":
            
            if (isOperationInProgess) {
                total = data!.id
                total = data!.id
                isOperationInProgess=false
            } else {
                total += data!.id
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
        case ".":
            if(!total.isEmpty && !total.contains(data!.label)) {
                total += data!.label
            }
        case "delete":
            if(!total.isEmpty){
                total.removeLast()
                
            }
        case "result":
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
        
        print("previousNumber", previousNumber)
        print("total", total)
        
        collectionView.reloadData()
        
    }
}
