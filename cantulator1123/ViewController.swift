//
//  ViewController.swift
//  cantulator1123
//
//  Created by s20171103193 on 2018/11/23.
//  Copyright © 2018 s20171103193. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    public struct Stack<T>{
        fileprivate var array = [T]()
        public var isEmpty:Bool{
            return array.isEmpty
        }
        public var count:Int{
            return array.count
        }
        public mutating func push(_element:T){
            array.append(_element)
        }
        public mutating func pop()->T?{
            return array.popLast()
        }
        public var peek:T?{
            return array.last
        }
    }
    
    var number = Stack<Double>()
    var oper = Stack<Int>()
    var temple = Stack<Double>()
    var templeoper = Stack<Int>()
    var str = ""
    var judge = 0
    var temp:Double = 0
    var left:Double = 0
    var right:Double = 0
    
    
    
    @IBOutlet var result: UITextField!
    
    @IBAction func button1(_ sender: Any) {
        result.text = result.text! + "1"
        str = str + "1"
    }
    @IBAction func button2(_ sender: Any) {
        result.text = result.text! + "2"
        str = str + "2"
    }
    @IBAction func button3(_ sender: Any) {
        result.text = result.text! + "3"
        str = str + "3"
    }
    @IBAction func button4(_ sender: Any) {
        result.text = result.text! + "4"
        str = str + "4"
    }
    @IBAction func button5(_ sender: Any) {
        result.text = result.text! + "5"
        str = str + "5"
    }
    @IBAction func button6(_ sender: Any) {
        result.text = result.text! + "6"
        str = str + "6"
    }
    @IBAction func button7(_ sender: Any) {
        result.text = result.text! + "7"
        str = str + "7"
    }
    @IBAction func button8(_ sender: Any) {
        result.text = result.text! + "8"
        str = str + "8"
    }
    @IBAction func button9(_ sender: Any) {
        result.text = result.text! + "9"
        str = str + "9"
    }
    @IBAction func button0(_ sender: Any) {
        result.text = result.text! + "0"
        str = str + "0"
    }
    
    @IBAction func buttonadd(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "+"
        oper.push(_element: 1)
        
    }
    
    @IBAction func buttonsub(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "-"
        oper.push(_element: 2)
        
    }
    
    @IBAction func buttonmult(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "×"
        oper.push(_element: 3)
        
    }
    
    @IBAction func buttondiv(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "÷"
        oper.push(_element: 4)
        
    }
    
    @IBAction func buttonresult(_ sender: Any) {
        
        temp = Double(str)!
        number.push(_element: temp)
        right = number.pop()!
        left = number.pop()!
        while oper.isEmpty != true{
            judge = oper.pop()!
            
            if judge == 3||judge == 4{
                if judge == 3{
                    temp = left * right
                    right = temp
                    if oper.isEmpty != true{
                        left = number.pop()!
                    }
                }
                else{
                    temp = left / right
                    right = temp
                    if oper.isEmpty != true{
                        left = number.pop()!
                    }
                }
                
            }
            else{
                temple.push(_element: right)
                right = left
                if oper.isEmpty != true{
                    left = number.pop()!
                }else{
                    temple.push(_element: right)
                }
                templeoper.push(_element: judge)
            }
            
        }
        while temple.isEmpty != true{
            number.push(_element: temple.pop()!)
        }
        while templeoper.isEmpty != true{
            oper.push(_element: templeoper.pop()!)
        }
        if oper.isEmpty != true{
            right = number.pop()!
            left = number.pop()!
            while oper.isEmpty != true{
                judge = oper.pop()!
                
                if judge == 1{
                    temp = left + right
                    right = temp
                    if oper.isEmpty != true{
                        left = number.pop()!
                    }
                    
                }
                else{
                    temp = left - right
                    right = temp
                    if oper.isEmpty != true{
                        left = number.pop()!
                    }
                }
            }
        }
        
        result.text = "\(temp)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

