//
//  main.swift
//  unitConverter2
//
//  Created by 윤동민 on 2018. 9. 13..
//  Copyright © 2018년 윤동민. All rights reserved.
//

import Foundation

let convertValuecmTom : Float = 100
let convertcmToinchValue : Float = 0.393
let convertcmToYard : Float = 0.0109


func centimeterToMeter(_ originNumber : Float) -> Float{
    return originNumber / convertValuecmTom
}

func meterTocentimeter(_ originNumber : Float) -> Float{
    return originNumber * convertValuecmTom
}

func centimeterToinch(_ originNumber : Float) -> Float{
    return originNumber * convertcmToinchValue
}

func inchTocentimeter(_ originNumber : Float) -> Float{
    return originNumber / convertcmToinchValue
}

func centimeterToyard(_ originNumber : Float) -> Float{
    return originNumber * convertcmToYard
}

func yardTocentimeter(_ originNumber : Float) -> Float{
    return originNumber / convertcmToYard
}

func enterUserInput() -> (number : String, UnitOne : String, UnitTwo : String){
    
    let enterNumberUnit : String = readLine()!
    var numberUnitSet = enterNumberUnit.components(separatedBy: " ")
    
    if(numberUnitSet.count == 2){
        return (numberUnitSet[0], numberUnitSet[1], "")
    }
    else if(numberUnitSet.count == 3){
        return (numberUnitSet[0], numberUnitSet[1], numberUnitSet[2])
    }
    else if(numberUnitSet.count == 1){
        return (numberUnitSet[0], "", "")
    }
    else{
        return ("", "", "")
    }
}

while true{
    let numberUnitSet = enterUserInput()
    var convertNumber : Float
    
    if(numberUnitSet.number == "q" || numberUnitSet.number == "quit"){
        break;
    }

    switch (numberUnitSet.UnitOne, numberUnitSet.UnitTwo){
    case("yard", "m"):
        convertNumber = centimeterToMeter(yardTocentimeter(Float(numberUnitSet.number)!))
        print("\(convertNumber)m")
    case("yard", _):
        convertNumber = centimeterToMeter(yardTocentimeter(Float(numberUnitSet.number)!))
        print("\(convertNumber)m")
    case("m", "yard"):
        convertNumber = centimeterToyard(meterTocentimeter(Float(numberUnitSet.number)!))
        print("\(convertNumber)yard")
    case("m", "inch"):
        convertNumber = centimeterToinch(meterTocentimeter(Float(numberUnitSet.number)!))
        print("\(convertNumber)inch")
    case("inch", "m"):
        convertNumber = centimeterToMeter(inchTocentimeter(Float(numberUnitSet.number)!))
        print("\(convertNumber)m")
    case("inch", "cm"):
        convertNumber = inchTocentimeter(Float(numberUnitSet.number)!)
        print("\(convertNumber)cm")
    case("cm", "inch"):
        convertNumber = centimeterToinch(Float(numberUnitSet.number)!)
        print("\(convertNumber)inch")
    case("cm", _):
        convertNumber = centimeterToMeter(Float(numberUnitSet.number)!)
        print("\(convertNumber)m")
    case("m", _):
        convertNumber = meterTocentimeter(Float(numberUnitSet.number)!)
        print("\(convertNumber)cm")
    case(_, _):
        print("지원하지 않는 단위 입니다.")
    }
}












