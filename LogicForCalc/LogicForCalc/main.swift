//
//  main.swift
//  LogicForCalc
//
//  Created by Александр Макаров on 03.09.2022.
//

import Foundation

// MARK: - Enum with operation types
enum Operations {
    case noAction
    case addition
    case subtraction
    case multiplication
    case division
}
// MARK: - Variables
var isRunning = true
var currentNumber = "0"
var firstNumber = 0.0
var secondNumber = 0.0
var result = ""
var currentOperation = Operations.noAction


// MARK: - Program points
func runLoop() {
    while isRunning {
        start()
    }
}

func start() {
    print("Do you want to make calculation")
    print("Enter \"yes\" or \"no\":")
    let answer = readLine()?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
   
    if answer == "yes" {
        updateDisplay(text: "Enter first number:")
        guard let firstEnter = readLine() else {
            print("Wrong format")
            return
        }
        currentNumber = firstEnter
        updateDisplay(text: "Enter operation type (+ - / *): ")
        let operationEnter = readLine()
        switch operationEnter {
        case "+":
            addition()
        case "-":
            subtraction()
        case "*":
            multiplication()
        case "/":
            division()
        default:
            break
        }
        updateDisplay(text: "Enter second number:")
        guard let secondEnter = readLine() else {
            print("Wrong format")
            return
        }
        currentNumber = secondEnter
        makeResult()
        updateDisplay(text:
        """
        ________________________________
        "Result of calculation: \(result)"
        \n
        """
        )
        acAction()
    } else {
        finish()
    }
}

func finish() {
    print("Program is ended.")
    isRunning = false
}

//MARK: - Functions
func updateDisplay(text: String) {
    print(text)
}
func makeCalculation(operation: Operations) {
    if currentOperation != .noAction {
        if currentNumber != "" {
            secondNumber = Double(currentNumber) ?? 0.0
            switch operation {
            case .addition:
                result = String(firstNumber + secondNumber)
            case .subtraction:
                result = String(firstNumber - secondNumber)
            case .multiplication:
                result = String(firstNumber * secondNumber)
            case .division:
                guard secondNumber != 0 else {
                    return
                }
                result = String(firstNumber / secondNumber)
            default:
                break
            }
        }
    } else {
        firstNumber = Double(currentNumber) ?? 0.0
        currentNumber = ""
        updateDisplay(text: currentNumber)
        currentOperation = operation
    }
    print(
    """
    \n
    ________________________________
    current number = \(currentNumber)
    first number = \(firstNumber)
    second number = \(secondNumber)
    result = \(result)
    ________________________________
    \n
    """
    )
    
    
}
func addition() {
    makeCalculation(operation: .addition)
}

func subtraction() {
    makeCalculation(operation: .subtraction)
}

func multiplication () {
    makeCalculation(operation: .multiplication)
}

func division () {
    makeCalculation(operation: .division)
}

func makeResult() {
    makeCalculation(operation: currentOperation)
}

func acAction() {
    currentNumber = "0"
    firstNumber = 0.0
    secondNumber = 0.0
    result = ""
    currentOperation = Operations.noAction
}

//MARK: - ProgrammFlow
print("SimpleCalc program.")
print("Welcome to SimpleCalc. \n")
runLoop()

