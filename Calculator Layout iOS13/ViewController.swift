//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Display: UILabel!
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var newCalculation = false
    var operation = 0
    var reverseVal: Double = 0
    var exponentNumber: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Display.text = "0"
        // Do any additional setup after loading the view.
    }

    @IBAction func Numbers(_ sender: UIButton) {
        
        if performingMath == true {
            Display.text = String(sender.tag - 1)
            currentNumber = Double(Display.text!)!
            performingMath = false
        }else{
            if Display.text == "0" || newCalculation == true {
                Display.text = ""
            }
            if sender.tag == 19{
                Display.text = Display.text! + "."
            }else{
                Display.text = Display.text! + String(sender.tag - 1)
            }
            currentNumber = Double(Display.text!)!
            newCalculation = false
        }
    }
    
    @IBAction func Operators(_ sender: UIButton) {
        
        if(Display.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18 && sender.tag != 21 && sender.tag != 22){
            
            previousNumber = Double(Display.text!)!
            
            switch sender.tag {
            case 14:
                Display.text = "÷"
            case 15:
                Display.text = "×"
            case 16:
                Display.text = "-"
            case 17:
                Display.text = "+"
            case 19:
                Display.text = "X^"
            case 20:
                Display.text = "X√ X"
            default:
                Display.text = "Error! Check the entry!"
            }
            operation = sender.tag
            performingMath = true
            
        }else if sender.tag == 18{
            switch operation{
            case 14:
                Display.text = String(previousNumber/currentNumber)
            case 15:
                Display.text = String(previousNumber*currentNumber)
            case 16:
                Display.text = String(previousNumber - currentNumber)
            case 17:
                Display.text = String(previousNumber + currentNumber)
            case 19:
                Display.text = String(pow(previousNumber, currentNumber))
            default:
                Display.text = "Error! Check the entry!"
            }
        }else if sender.currentTitle == "AC"{
            Display.text = "0"
            previousNumber = 0
            currentNumber = 0
            operation = 0
            
            
        }else if sender.currentTitle == "%"{
            Display.text = String(currentNumber / 100)
            
        }else if sender.currentTitle == "+/-"{
            Display.text = String(currentNumber * -1)
            
    //   enhancements finds the sqr root power by 2
        }else if sender.currentTitle == "X^2"{
            Display.text = String(currentNumber * currentNumber)
        }else if sender.currentTitle == "√"{
            Display.text = String(sqrt(currentNumber))
        }
        
        
    }
    
}

