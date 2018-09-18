//
//  main.swift
//  unitConverter2
//
//  Created by 윤동민 on 2018. 9. 13..
//  Copyright © 2018년 윤동민. All rights reserved.
//

import Foundation

let convertlengthUnitValue : [String : Float] = ["cm" : 100, "m" : 1, "inch" : 39.370, "yard" : 1.093]
let convertweigthUnitValue : [String : Float] = ["kg" : 1, "g" : 1000, "oz" : 35.274, "lb" : 2.2046]



func enterUserInput() -> (number : String, UnitOne : String, UnitTwo : String, count : Int){                             // 사용자 입력 받는부분

    let enterNumberUnit : String = readLine()!
    var numberUnitSet = enterNumberUnit.components(separatedBy: [" ", ","])
    
    if(numberUnitSet.count == 2){
        return (numberUnitSet[0], numberUnitSet[1], "", 2)
    }
    else if(numberUnitSet.count == 3){
        return (numberUnitSet[0], numberUnitSet[1], numberUnitSet[2], 3)
    }
    else{
        return ("", "", "", -1)
    }
    
}

func recieveOneUnit(_ originnumber : Float, _ UnitOne : String) -> String{
    var convertNumber : Float
    var resultValue : String = ""
    
    switch UnitOne {
    case "cm":
        convertNumber = originnumber / convertlengthUnitValue[UnitOne]! * convertlengthUnitValue["m"]!
        resultValue = String(convertNumber) + "m"
    case "m":
        convertNumber = originnumber / convertlengthUnitValue[UnitOne]! * convertlengthUnitValue["cm"]!
        resultValue = String(convertNumber) + "cm"
    case "yard":
        convertNumber = originnumber / convertlengthUnitValue[UnitOne]! * convertlengthUnitValue["m"]!
        resultValue = String(convertNumber) + "m"
    default:
        resultValue = "지원하지 않는 단위입니다."
    }

    return resultValue
}

func recieveTwoUnit(_ originnumber : Float, _ UnitOne : String, _ UnitTwo : String) -> String{
    var convertNumber : Float
    var resultValue : String = ""
    
    if convertlengthUnitValue[UnitOne] != nil && convertlengthUnitValue[UnitTwo] != nil{
        convertNumber = originnumber / convertlengthUnitValue[UnitOne]! * convertlengthUnitValue[UnitTwo]!
        resultValue = String(convertNumber) + UnitTwo
    }
    else if convertweigthUnitValue[UnitOne] != nil && convertweigthUnitValue[UnitTwo] != nil{
        convertNumber = originnumber / convertweigthUnitValue[UnitOne]! * convertweigthUnitValue[UnitTwo]!
        resultValue = String(convertNumber) + UnitTwo
    }
    else{
        resultValue = "지원하지 않는 단위입니다."
    }
    

    return resultValue
}

func unitConvert(_ originnumber : String, _ UnitOne : String, _ UnitTwo : String, _ count : Int) -> String{                          // 단위 변환해주는 함수
    
    var convertNumber : Float
    var convertedNumberUnit : String = ""
    
    if let tempNumber = Float(originnumber){
        convertNumber = tempNumber
    }
    else{
        convertedNumberUnit = "숫자를 다시 입력해주세요."
        return convertedNumberUnit
    }
    
    if count == -1{
        convertedNumberUnit = "지원하지 않는 단위 입니다."
    }
    else if count == 2{
        convertedNumberUnit = recieveOneUnit(convertNumber, UnitOne)
    }
    else if count == 3{
        convertedNumberUnit = recieveTwoUnit(convertNumber, UnitOne, UnitTwo)
    }
    
    
    return convertedNumberUnit
}

let availableConvertUnit : [String] = ["cm -> m, inch, yard", "m -> cm, inch, yard", "inch -> cm, m", "yard -> cm, m"]      // 변환 가능한 단위들 목록
print("변환 가능한 단위")
for temp in availableConvertUnit{
    print(temp)
}

while true{
    let numberUnitSet = enterUserInput()
    
    if(numberUnitSet.number == "q" || numberUnitSet.number == "quit"){
        break
    }
    
    print(unitConvert(numberUnitSet.number, numberUnitSet.UnitOne, numberUnitSet.UnitTwo, numberUnitSet.count))
}













