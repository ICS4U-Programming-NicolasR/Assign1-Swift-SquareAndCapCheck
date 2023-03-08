//
// SquareAndCapCheck.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-03-08
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Checks if a square and checks if a rectangle
import Foundation
import Glibc
// Function for checking if the shape is a square
func squareCheck(length: Double, width: Double) -> Bool {
    var square = false
    // if the length equals the width it must be a square
    if length == width {
        square = true
    }
    return square
}
// Function for checking if the first character inputted is a capital
func capitalCheck(characterCh: Int) -> Bool {
    var capital = false
    if characterCh >= 65 && characterCh <= 90 {
        capital = true
    }
    return capital
}
var tryAgain = true
// Loop that replays if the user presses enter
repeat {
    // Asks which program the user wants to read
    print("What is the program you would like to do? 1. for square checker, 2. for case checker")
    let program = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    // Square program
    if program == "1" {
        // take the two inputs
        print("What is your width(in)?")
        if let widthUsr = Double(readLine()!) {
            print("What is your length(in)?")
            if let lengthUsr = Double(readLine()!) {
                if lengthUsr > 0 && widthUsr > 0 {
                    // call the function to check if the shape is a square
                    let squareCheckVar = squareCheck(length: lengthUsr,
                                         width: widthUsr)
                    // if it is a square display that it is a square
                    if (squareCheckVar) {
                        print("You have a square!")
                    } else {
                        print("You have a rectangle!")
                    }
                } else {
                    print("You have entered a negative number")
                }
            } else {
                print("You have entered an invalid input")
            }
        } else {
            print("You have entered an invalid input")
        }
    // Capital program
    } else if program == "2" {
        // ask the user for a character
        print("Please enter in your character")
        // get the characcter as a string then take the first point and try to convert to character
        if let characterInput = readLine(), let character = characterInput.first {
            // convert to unicode
            let chValue = String(character).unicodeScalars
            let asciiValue = chValue[chValue.startIndex].value
            // check if it is even a letter
            if asciiValue >= 65 && asciiValue <= 90 || asciiValue >= 97 && asciiValue <= 122 {
                // call the capital function
                let characterCheck = capitalCheck(characterCh: Int(asciiValue))
                // display whether a capital or not
                if characterCheck {
                    print("You entered a capital!")
                } else {
                    print("You entered a lowercase letter!")
                }
            } else {
                print("You have entered a non letter value")
            }
        } else {
            print("You have entered an invalid input")
        }
    } else {
        print("You have not entered a valid program")
    }
    // get the user to try again unless they enter Q
    print("To play again please press <enter>. If you want to quit press Q")
    let restartInput = readLine()!.uppercased()
    if restartInput == "Q" {
        tryAgain = false
    }
} while tryAgain == true
