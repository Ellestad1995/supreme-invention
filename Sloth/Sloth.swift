//
//  Sloth.swift
//
//  Created by Joakim Nereng Ellestad on 22.12.2016.
//  Copyright © 2016 Joakim Ellestad. All rights reserved.
//

import Foundation

func isValidEmail(email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
}

func isValidRegNumber(withRegNumber: String) -> Bool{
    let regnRegEx = "[a-z][a-z]\\d{5}"
    let regNTest = NSPredicate(format: "SELF MATCHES %@", regnRegEx)
    return regNTest.evaluate(with: withRegNumber)
}
func isValidPhoneNumber(withPhoneNumber: String) -> Bool{
    let regnRegEx = "\\d{8}"
    let regNTest = NSPredicate(format: "SELF MATCHES %@", regnRegEx)
    return regNTest.evaluate(with: withPhoneNumber)
}
func isValidPostalNumber(withPostalNumber: String) -> Bool{
    let regnRegEx = "\\d{4}"
    let regNTest = NSPredicate(format: "SELF MATCHES %@", regnRegEx)
    return regNTest.evaluate(with: withPostalNumber)
}

func isValidISBNNumber(with ISBN: String)-> (Bool, ISBNType){
    let ISBNRegEx13 = "[0-9]{13}"
    let ISBNRegEx10 = "[0-9]{10}"
    
    let ISBN13Test = NSPredicate(format: "SELF MATCHES %@", ISBNRegEx13)
    if(ISBN13Test.evaluate(with: ISBN)){
        //It's 13 digits long, but is it a ISBN?
        
        let numbers = ISBN.characters.flatMap{Int(String($0))}
        var sum: Int = 0
        var counter = 0
        for numb in numbers {       //Looping up to 12
            counter += 1
            let multiplier = (((counter % 2) == 0) ? 3:1)
            sum += numb*multiplier
            if(counter == 12){break;}
        }
        if(10-sum == numbers[12]){
            //Yeah...The checksum is OK.
            //This is a valid ISBN13 number
            return (true,ISBNType.EAN13)
        }else{
            return (false, ISBNType.none)
        }
        
    }
    
    let ISBN10Test = NSPredicate(format: "SELF MATCHES %@", ISBNRegEx10)
    if(ISBN10Test.evaluate(with: ISBN)){
        //Might make a valid test here later
        
        return (true, ISBNType.EAN10)
    }
    return (false, ISBNType.none)
}
