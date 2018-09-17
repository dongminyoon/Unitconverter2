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

func unitConvert(_ originnumber : String, _ UnitOne : String, _ UnitTwo : String) -> String{                          // 단위 변환해주는 함수
    
    var convertNumber : Float
    var convertedNumberUnit : String
    
    if Float(originnumber) == nil{                                                                                    // 변환할 숫자를 잘못 입력한 경우! Ex) 1cm m --> 공백이 X
        convertedNumberUnit = "지원하지 않는 단위입니다."
        return convertedNumberUnit
    }
    
    switch UnitTwo{
    case "cm":                                                                                                          // cm 단위로 변환하는 경우
        if UnitOne == "m"{
            convertNumber = meterTocentimeter(Float(originnumber)!)
        }
        else if UnitOne == "inch"{
            convertNumber = inchTocentimeter(Float(originnumber)!)
        }
        else if UnitOne == "yard"{
            convertNumber = yardTocentimeter(Float(originnumber)!)
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "cm"
        
    case "m":                                                                                                           // m 단위로 변환하는 경우
        if UnitOne == "cm"{
            convertNumber = centimeterToMeter(Float(originnumber)!)
        }
        else if UnitOne == "inch"{
            convertNumber = centimeterToMeter(inchTocentimeter(Float(originnumber)!))
        }
        else if UnitOne == "yard"{
            convertNumber = centimeterToMeter(yardTocentimeter(Float(originnumber)!))
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "m"
        
    case "inch":                                                                                                        // inch 단위로 변환하는 경우
        if UnitOne == "cm"{
            convertNumber = centimeterToinch(Float(originnumber)!)
        }
        else if UnitOne == "m"{
            convertNumber = centimeterToinch(meterTocentimeter(Float(originnumber)!))
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "inch"
        
    case "yard":                                                                                                        // yard 단위로 변환하는 경우
        if UnitOne == "cm"{
            convertNumber = centimeterToyard(Float(originnumber)!)
        }
        else if UnitOne == "m"{
            convertNumber = centimeterToyard(meterTocentimeter(Float(originnumber)!))
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "yard"
        
    case "kg":                                                                                                          // kg 단위로 변환하는 경우
        if UnitOne == "g"{
            convertNumber = gTokg(Float(originnumber)!)
        }
        else if UnitOne == "oz"{
            convertNumber = ozTokg(Float(originnumber)!)
        }
        else if UnitOne == "lb"{
            convertNumber = lbTokg(Float(originnumber)!)
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "kg"
        
    case "oz":                                                                                                          // oz 단위로 변환하는 경우
        if UnitOne == "g"{
            convertNumber = kgTooz(gTokg(Float(originnumber)!))
        }
        else if UnitOne == "kg"{
            convertNumber = kgTooz(gTokg(Float(originnumber)!))
        }
        else if UnitOne == "lb"{
            convertNumber = kgTooz(gTokg(Float(originnumber)!))
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "oz"
        
    case "lb":
        if UnitOne == "g"{
            convertNumber = kgTolb(gTokg(Float(originnumber)!))
        }
        else if UnitOne == "kg"{
            convertNumber = kgTolb(Float(originnumber)!)
        }
        else if UnitOne == "oz"{
            convertNumber = kgTolb(ozTokg(Float(originnumber)!))
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
        convertedNumberUnit = String(convertNumber) + "lb"
        
    default:                                                                                                            // 변환받을 단위를 입력하지 않은 예외의 경우 Ex) 1 m
        if UnitOne == "cm"{                                                                                             // , 1 cm, 1 yard
            convertNumber = centimeterToMeter(Float(originnumber)!)
            convertedNumberUnit = String(convertNumber) + "m"
        }
        else if UnitOne == "m"{
            convertNumber = meterTocentimeter(Float(originnumber)!)
            convertedNumberUnit = String(convertNumber) + "cm"
        }
        else if UnitOne == "yard"{
            convertNumber = centimeterToMeter(yardTocentimeter(Float(originnumber)!))
            convertedNumberUnit = String(convertNumber) + "cm"
        }
        else{
            convertedNumberUnit = "지원하지 않는 단위입니다."
            return convertedNumberUnit
        }
    }
    
    return convertedNumberUnit
}

while true{
    let numberUnitSet = enterUserInput()
    
    if(numberUnitSet.number == "q" || numberUnitSet.number == "quit"){
        break
    }
    
    print(unitConvert(numberUnitSet.number, numberUnitSet.UnitOne, numberUnitSet.UnitTwo))
}












