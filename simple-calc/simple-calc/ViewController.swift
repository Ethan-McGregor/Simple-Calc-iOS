//
//  ViewController.swift
//  simple-calc
//
//  Created by studentuser on 4/18/17.
//  Copyright © 2017 Ethan McGregor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UITextField!
    
    @IBOutlet weak var displayOn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

    var inputs = [String]()
    var toggle: Bool = false
    var operation: String = ""
    var temp: String = ""
    
    
    
    func factorial(n: Int) -> Int{
        if n==1{
            
            return 1
        }
        return n*factorial(n:(n-1))
    }
    
    
    @IBAction func pressed_reset(_ sender: AnyObject) {
        inputs = [String]()
        operation = ""
        display.text = ""
        displayOn.text = "off"
        toggle = false
        temp = ""
        
    }
    
    
    func functions(inputs: [String], operation: String) -> String{
        
        if operation == "count"{
            return String(inputs.count)
        }
        
        if operation == "avg"{
            var sum = Double(0)
            
            for i in inputs{
                sum += Double(i)!
            }
            return String(sum/Double(inputs.count))
        }
        
        if operation == "fact" && inputs.count == 1{
            return String(factorial(n:Int(inputs[0])!))
        }
        
        return ""
    }
    
    
    
    func calculate(inputs: [String], operation:String) -> String{
        
        if operation == "+"{
            var answer = 0.0
            
            for i in inputs{
                answer += Double(i)!
            }
            return String(answer)
            
        }
        
        if operation == "-"{
            
            var answer = 0.0
            var cur = 0.0
            for i in inputs{
                
                if(cur != 0.0){
                    answer = (cur - Double(i)!)
                }
                cur = Double(i)!
            }
            
            return String(answer)
        }
        
        if operation == "*"{
            var answer = 1.0
            for i in inputs{
                answer *= Double(i)!
            }
            
            return String(answer)
            
        }
        
        if operation == "/"{
            
            var answer = Double(inputs[0])!
            var i = 1
            while i < inputs.count{
                answer /= Double(inputs[i])!
                i += 1
            }
            return String(answer)
            
        }
        
        if operation == "%"{
            var answer = Double(inputs[0])!
            var i = 1
            while i < inputs.count{
                answer = answer.truncatingRemainder(dividingBy: Double(inputs[i])!)
                i += 1
            }
            return String(answer)
            
        }
        return ""
        
    }
    
    
    @IBAction func add(_ sender: AnyObject) {
        if temp==""{
            temp = "+"
            display.text = temp
        }
            
        else{
            
            inputs.append(temp)
            temp = ""
            if toggle == true{
                display.text = calculate(inputs: inputs, operation: "+")
                
            }
                
            else{
                operation = "+"
                display.text = operation
                
            }
            
        }
        
    }
    
    
    
    @IBAction func avg(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        if toggle == true{
            
            display.text = functions(inputs: inputs, operation: "avg")
        }
            
        else{
            
            operation = "avg"
        }
        
          }
    
    
    
    @IBAction func mod(_ sender: AnyObject) {
        
        inputs.append(temp)
        temp = ""
        if toggle == true{
            
            display.text = calculate(inputs: inputs, operation: "%")
        }
            
        else{
            
            operation = "%"
        }
    }
    
    
    
    @IBAction func equals(_ sender: AnyObject) {
        
        if toggle == false{
            
            if operation=="count" || operation == "fact" || operation == "avg"{
                if temp != "" {inputs.append(temp)}
                display.text = functions(inputs: inputs, operation: operation)
                
            }
                
            else if inputs.count >= 1 && temp != ""{
                
                inputs.append(temp)
                
                display.text = calculate(inputs: inputs, operation: operation)
                
            }
                
            else{
                
                display.text = "need to add math function"
                
            }
        }
    }
    

    @IBAction func count(_ sender: AnyObject) {
        
        inputs.append(temp)
        temp = ""
        if toggle == true{
            
            display.text = functions(inputs: inputs, operation: "count")
        }
            
        else{
            operation = "count"
            display.text = operation
            
        }
    }
    
    @IBAction func subtract(_ sender: AnyObject) {
        
        if temp=="" {
            temp = "-"
            display.text = temp
        }
            
 
        else{
           
            inputs.append(temp)
            
            temp = ""
            if toggle == true{
                display.text = calculate(inputs: inputs, operation: "-")
                
            }
                
            else{

                operation = "-"
                display.text = operation
                
            }
            
        }
        
    }
    
    
    
    @IBAction func enter(_ sender: AnyObject) {
        
        if toggle == true{
            inputs.append(temp)
            temp = ""
            display.text = temp
        }
        
    }
    
    
    
    @IBAction func mult(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        
        if toggle == true{
            display.text = calculate(inputs: inputs, operation: "*")
        }
            
        else{
            operation = "*"
            display.text = operation
        }
    }
    
    
    
    @IBAction func toggle(_ sender: AnyObject) {
        if(toggle == true){
            displayOn.text = "off"
            toggle = false
        }else{
            toggle = true
            displayOn.text = "on"
            
        }
    }
    
    
    @IBAction func dot(_ sender: AnyObject) {
        
        if temp==""{
            temp = String("0.")
        }
        else{
            temp += String(".")
        }
        display.text = temp

    }
    
    @IBAction func div(_ sender: AnyObject) {

        inputs.append(temp)
        temp = ""
        if toggle == true{
            
            display.text = calculate(inputs: inputs, operation: "/")
 
        }
            
        else{
            
            operation = "/"
            display.text = operation
        }
    }
    
    
    
    @IBAction func fact(_ sender: AnyObject) {
        inputs.append(temp)
        temp = ""
        if toggle == true{
            display.text = functions(inputs: inputs, operation: "fact")
        }
        else{
            operation = "fact"

            display.text = operation
            
        }
        
         }
    
    
    
    @IBAction func zero(_ sender: AnyObject) {
        
        temp += String(0)
        display.text = temp
        
    }
    
    @IBAction func one(_ sender: AnyObject) {
        
        temp += String(1)
        display.text = temp
        
    }
    
    @IBAction func two(_ sender: AnyObject) {
        
        temp += String(2)
        display.text = temp
        
    }
    
    
    
    @IBAction func three(_ sender: AnyObject) {
        
        temp += String(3)
        display.text = temp
        
    }
    
    @IBAction func four(_ sender: AnyObject) {
        
        temp += String(4)
        display.text = temp
        
    }

    @IBAction func five(_ sender: AnyObject) {
        
        temp += String(5)
        display.text = temp
        
    }
    @IBAction func six(_ sender: AnyObject) {
        
        temp += String(6)
        display.text = temp
        
    }
    @IBAction func seven(_ sender: AnyObject) {
        
        temp += String(7)
        display.text = temp
        
    }

    @IBAction func eight(_ sender: AnyObject) {
        
        temp += String(8)
        display.text = temp
        
    }
    
    @IBAction func nine(_ sender: AnyObject) {
        
        temp += String(9)
        display.text = temp
        
    } 
}
