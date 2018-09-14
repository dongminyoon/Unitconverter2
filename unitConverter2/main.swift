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


func centimeterToMeter(_ originNumber : Float) -> Float{                                                    // cm -> m
    return originNumber / convertValuecmTom
}

func meterTocentimeter(_ originNumber : Float) -> Float{                                                    // m -> cm
    return originNumber * convertValuecmTom
}

func centimeterToinch(_ originNumber : Float) -> Float{                                                     // cm -> inch
    return originNumber * convertcmToinchValue
}

func inchTocentimeter(_ originNumber : Float) -> Float{                                                     // inch -> cm
    return originNumber / convertcmToinchValue
}

func centimeterToyard(_ originNumber : Float) -> Float{                                                     // cm -> yard
    return originNumber * convertcmToYard
}

func yardTocentimeter(_ originNumber : Float) -> Float{                                                     // yard -> cm
    return originNumber / convertcmToYard
}

func enterUserInput() -> (number : String, UnitOne : String, UnitTwo : String){                             // 사용자 입력 받는부분

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

func unitConvert(_ originnumber : String, _ UnitOne : String, _ UnitTwo : String){                          // 단위 변환해주는 함수
    
    var convertNumber : Float
    
    switch (UnitOne, UnitTwo){
    case("yard", "m"):
        convertNumber = centimeterToMeter(yardTocentimeter(Float(originnumber)!))
        print("\(convertNumber)m")
    case("yard", _):
        convertNumber = centimeterToMeter(yardTocentimeter(Float(originnumber)!))
        print("\(convertNumber)m")
    case("m", "yard"):
        convertNumber = centimeterToyard(meterTocentimeter(Float(originnumber)!))
        print("\(convertNumber)yard")
    case("m", "inch"):
        convertNumber = centimeterToinch(meterTocentimeter(Float(originnumber)!))
        print("\(convertNumber)inch")
    case("inch", "m"):
        convertNumber = centimeterToMeter(inchTocentimeter(Float(originnumber)!))
        print("\(convertNumber)m")
    case("inch", "cm"):
        convertNumber = inchTocentimeter(Float(originnumber)!)
        print("\(convertNumber)cm")
    case("cm", "inch"):
        convertNumber = centimeterToinch(Float(originnumber)!)
        print("\(convertNumber)inch")
    case("cm", _):
        convertNumber = centimeterToMeter(Float(originnumber)!)
        print("\(convertNumber)m")
    case("m", _):
        convertNumber = meterTocentimeter(Float(originnumber)!)
        print("\(convertNumber)cm")
    case(_, _):
        print("지원하지 않는 단위 입니다.")
    }
}

while true{
    let numberUnitSet = enterUserInput()
    
    if(numberUnitSet.number == "q" || numberUnitSet.number == "quit"){
        break
    }
    
    unitConvert(numberUnitSet.number, numberUnitSet.UnitOne, numberUnitSet.UnitTwo)
}












