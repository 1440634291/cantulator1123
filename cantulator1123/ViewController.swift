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
    var flag = 0
    var temp:Double = 0
    var left:Double = 0
    var right:Double = 0
    var temp1 = 0
    var judge1 = 0
    var a:Double = 0
    
    
    
    @IBOutlet var result: UITextField!
    
    @IBAction func button1(_ sender: Any) {
        result.text = result.text! + "1"
        str = str + "1"
        flag = flag + 1
    }
    @IBAction func button2(_ sender: Any) {
        result.text = result.text! + "2"
        str = str + "2"
        flag = flag + 1
    }
    @IBAction func button3(_ sender: Any) {
        result.text = result.text! + "3"
        str = str + "3"
        flag = flag + 1
    }
    @IBAction func button4(_ sender: Any) {
        result.text = result.text! + "4"
        str = str + "4"
        flag = flag + 1
    }
    @IBAction func button5(_ sender: Any) {
        result.text = result.text! + "5"
        str = str + "5"
        flag = flag + 1
    }
    @IBAction func button6(_ sender: Any) {
        result.text = result.text! + "6"
        str = str + "6"
        flag = flag + 1
    }
    @IBAction func button7(_ sender: Any) {
        result.text = result.text! + "7"
        str = str + "7"
        flag = flag + 1
    }
    @IBAction func button8(_ sender: Any) {
        result.text = result.text! + "8"
        str = str + "8"
        flag = flag + 1
    }
    @IBAction func button9(_ sender: Any) {
        result.text = result.text! + "9"
        str = str + "9"
        flag = flag + 1
    }
    @IBAction func button0(_ sender: Any) {
        result.text = result.text! + "0"
        str = str + "0"
        flag = flag + 1
    }
    
    @IBAction func buttonAC(_ sender: Any) {
        result.text = ""
        str = ""
        temp = 0
        left = 0
        right = 0
        judge = 0
        flag = 0
        temp1 = 0
    }
    @IBAction func buttondelete(_ sender: Any) {
        let mystr = result.text
        
        if str == ""{
            oper.pop()
            flag = flag - 1
            a = number.pop()!
            str = "\(a)"
        }
        else{
            number.push(_element: Double(str)!)
            if judge1 == 0 {
                temp = number.pop()!
                if temp != 0{
                    temp1 = Int(temp) / 10
                    number.push(_element: Double(temp1))
                    if temp1 == 0{
                        str = ""
                        number.pop()
                    }
                }
                judge1 = 1
            }
            else{
                temp = number.pop()!
                if temp != 0{
                    temp1 = Int(temp) / 10
                    number.push(_element: Double(temp1))
                    if temp1 == 0{
                        str = ""
                        number.pop()
                        
                    }
                }
            }
            
            flag = flag - 1
        }
        
        let index2 = mystr!.index(str.startIndex, offsetBy: flag)
        result.text = mystr?.substring(to: index2)
    }
    @IBAction func buttonpoint(_ sender: Any) {
        result.text = result.text! + "."
        str = str + "."
    }
    
    @IBAction func buttonadd(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "+"
        oper.push(_element: 1)
        flag = flag + 1
        
    }
    
    @IBAction func buttonsub(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "-"
        oper.push(_element: 2)
        flag = flag + 1
        
    }
    
    @IBAction func buttonmult(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "×"
        oper.push(_element: 3)
        flag = flag + 1
        
    }
    
    @IBAction func buttondiv(_ sender: Any) {
        number.push(_element: Double(str)!)
        str = ""
        result.text = result.text! + "÷"
        oper.push(_element: 4)
        flag = flag + 1
        
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
                    temp = left * right
                    temple.push(_element: temp)
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

