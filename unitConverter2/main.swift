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
enum enterUnitCount : Int{
    case enterOneUnit = 2
    case enterTwoUnit = 3
    case enterOutOfRange = -1
}

func enterUserInput() -> (originNumber : String, unitOne : String, unitTwo : String, count : Int){                             // 사용자 입력 받는부분
    
    let enterNumberUnit : String = readLine()!
    var numberUnitSet = enterNumberUnit.components(separatedBy: [" "])
    
    if(numberUnitSet.count == enterUnitCount.enterOneUnit.rawValue){
        return (numberUnitSet[0], numberUnitSet[1], "", enterUnitCount.enterOneUnit.rawValue)
    }
    else if(numberUnitSet.count == enterUnitCount.enterTwoUnit.rawValue){
        return (numberUnitSet[0], numberUnitSet[1], numberUnitSet[2], enterUnitCount.enterTwoUnit.rawValue)
    }
    else{
        return ("", "", "", enterUnitCount.enterOutOfRange.rawValue)
    }
}

func recieveOneUnit(_ originNumber : Float, _ unitOne : String) -> String{
    var convertNumber : Float
    var resultValue : String = ""
    
    switch unitOne {
    case "cm":
        convertNumber = originNumber / convertlengthUnitValue[unitOne]! * convertlengthUnitValue["m"]!
        resultValue = String(convertNumber) + "m"
    case "m":
        convertNumber = originNumber / convertlengthUnitValue[unitOne]! * convertlengthUnitValue["cm"]!
        resultValue = String(convertNumber) + "cm"
    case "yard":
        convertNumber = originNumber / convertlengthUnitValue[unitOne]! * convertlengthUnitValue["m"]!
        resultValue = String(convertNumber) + "m"
    default:
        resultValue = "지원하지 않는 단위입니다."
    }

    return resultValue
}

func recieveTwoUnit(_ originNumber : Float, _ unitOne : String, _ unitTwo : String) -> String{
    var convertNumber : Float
    var resultValue : String = ""
    
    if convertlengthUnitValue[unitOne] != nil && convertlengthUnitValue[unitTwo] != nil{
        convertNumber = originNumber / convertlengthUnitValue[unitOne]! * convertlengthUnitValue[unitTwo]!
        resultValue = String(convertNumber) + unitTwo
    }
    else if convertweigthUnitValue[unitOne] != nil && convertweigthUnitValue[unitTwo] != nil{
        convertNumber = originNumber / convertweigthUnitValue[unitOne]! * convertweigthUnitValue[unitTwo]!
        resultValue = String(convertNumber) + unitTwo
    }
    else{
        resultValue = "지원하지 않는 단위입니다."
    }
    
    return resultValue
}

func unitConvert(_ numberUnitSet : (originNumber : String, unitOne : String, unitTwo : String, count : Int)) -> String{
    
    var convertNumber : Float
    var convertedNumberUnit : String = ""
    
    if let tempNumber = Float(numberUnitSet.originNumber){
        convertNumber = tempNumber
    }
    else{
        convertedNumberUnit = "숫자를 다시 입력해주세요."
        return convertedNumberUnit
    }
    
    if numberUnitSet.count == enterUnitCount.enterOutOfRange.rawValue{
        convertedNumberUnit = "지원하지 않는 단위 입니다."
    }
    else if numberUnitSet.count == enterUnitCount.enterOneUnit.rawValue{
        convertedNumberUnit = recieveOneUnit(convertNumber, numberUnitSet.unitOne)
    }
    else if numberUnitSet.count == enterUnitCount.enterTwoUnit.rawValue{
        convertedNumberUnit = recieveTwoUnit(convertNumber, numberUnitSet.unitOne, numberUnitSet.unitTwo)
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
    
    if(numberUnitSet.originNumber == "q" || numberUnitSet.originNumber == "quit"){
        break
    }
    print(unitConvert(numberUnitSet))
}













