//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
// Editited Bryan on 03/12/2022
// enhamcents made
// math calaculations
// percentage
// All Clear
// Postive Negative
// Bryan 4/5/2022 New enhamecents
// added Power function by 2 or by any number
// added Square Root function by 2
// added Log function

import UIKit

class ViewController: UIViewController {
// delcaring needed variables and UI elements
    
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
        //creates the  number currently on display
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
        
        if(Display.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18 && sender.tag != 20 && sender.tag != 21){
            //stores preivous number
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
                // Determines if the user is determining the power of
            case 19:
                Display.text = "X^"
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
                // calaculates users preivous number (base) by the power of current number (power)
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
            
            // does the log10 funcrion on the number currently displayed
        }else if sender.currentTitle == "ln"{
            Display.text = String(log10(currentNumber))
        }
        
        
    }
    
}

