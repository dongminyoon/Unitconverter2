//
//  main.swift
//  unitConverter2
//
//  Created by 윤동민 on 2018. 9. 13..
//  Copyright © 2018년 윤동민. All rights reserved.
//

import Foundation

let convertcmTomValue : Float = 100
let convertcmToinchValue : Float = 0.393
let convertcmToYardValue : Float = 0.0109
let convertkgTogValue : Float = 1000
let convertoztokgValue : Float = 0.0283
let convertlbtokgValue : Float = 0.4535


func centimeterToMeter(_ originNumber : Float) -> Float{                                                    // cm -> m
    return originNumber / convertcmTomValue
}

func meterTocentimeter(_ originNumber : Float) -> Float{                                                    // m -> cm
    return originNumber * convertcmTomValue
}

func centimeterToinch(_ originNumber : Float) -> Float{                                                     // cm -> inch
    return originNumber * convertcmToinchValue
}

func inchTocentimeter(_ originNumber : Float) -> Float{                                                     // inch -> cm
    return originNumber / convertcmToinchValue
}

func centimeterToyard(_ originNumber : Float) -> Float{                                                     // cm -> yard
    return originNumber * convertcmToYardValue
}

func yardTocentimeter(_ originNumber : Float) -> Float{                                                     // yard -> cm
    return originNumber / convertcmToYardValue
}

func kgTog(_ originNumber : Float) -> Float{
    return originNumber * convertkgTogValue
}

func gTokg(_ originNumber : Float) -> Float{
    return originNumber / convertkgTogValue
}

func ozTokg(_ originNumber : Float) -> Float{
    return originNumber * convertoztokgValue
}

func kgTooz(_ originNumber : Float) -> Float{
    return originNumber / convertoztokgValue
}

func lbTokg(_ originNumber : Float) -> Float{
    return originNumber * convertlbtokgValue
}

func kgTolb(_ originNumber : Float) -> Float{
    return originNumber / convertlbtokgValue
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
    case("kg", "g"):
        convertNumber = kgTog(Float(originnumber)!)
        print("\(convertNumber)g")
    case("g", "kg"):
        convertNumber = gTokg(Float(originnumber)!)
        print("\(convertNumber)kg")
    case("kg", "oz"):
        convertNumber = kgTooz(Float(originnumber)!)
        print("\(convertNumber)oz")
    case("oz", "kg"):
        convertNumber = ozTokg(Float(originnumber)!)
        print("\(convertNumber)kg")
    case("kg", "lb"):
        convertNumber = kgTolb(Float(originnumber)!)
        print("\(convertNumber)lb")
    case("lb", "kg"):
        convertNumber = lbTokg(Float(originnumber)!)
        print("\(convertNumber)kg")
    case("g", "oz"):
        convertNumber = kgTooz(gTokg(Float(originnumber)!))
        print("\(convertNumber)oz")
    case("oz", "g"):
        convertNumber = kgTog(ozTokg(Float(originnumber)!))
        print("\(convertNumber)g")
    case("g", "lb"):
        convertNumber = kgTolb(gTokg(Float(originnumber)!))
        print("\(convertNumber)lb")
    case("lb", "g"):
        convertNumber = kgTog(lbTokg(Float(originnumber)!))
        print("\(convertNumber)g")
    case("yard", "m"):
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
    case("yard", _):
        convertNumber = centimeterToMeter(yardTocentimeter(Float(originnumber)!))
        print("\(convertNumber)m")
    case("kg", _):
        convertNumber = kgTog(Float(originnumber)!)
        print("\(convertNumber)g")
    case("g", _):
        convertNumber = gTokg(Float(originnumber)!)
        print("\(convertNumber)kg")
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












