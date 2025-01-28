//
//  main.swift
//  Berlin Clock
//
//  Created by Damir Kamalov on 22.01.2025.
//
import Foundation
print("""
Welcome to the Berlin Clock project!
Please, enter the time - hours:minutes:seconds
""")
guard let timeString=readLine(strippingNewline: true) else {
    fatalError("wrong")
}

let parts = timeString.components(separatedBy: ":")
var hours: Int = 0
var minutes: Int = 0
var seconds: Int = 0

if parts.count == 3 {
    if let h = Int(parts[0]), let m = Int(parts[1]), let s = Int(parts[2]) {
        hours = h
        minutes = m
        seconds = s
    }
    
    else {
        print("Invalid time format")
    }
}

else {
    print("Invalid time format")
}

switch (hours, minutes, seconds) {
case let (h, _, _) where h > 24:
    print("Invalid: too much hours")
    break
case let (_, m, _) where m >= 60:
    print("Invalid: too much minutes")
    break
case let (_, _, s) where s >= 60:
    print("Invalid: too much seconds")
    break
default:
    if (seconds%2 == 0) {
        print("Y")
    }
    else {
        print("O")
    }
    for _ in 0..<4 {
        if (hours>=5){
            print("R", terminator: " ")
            hours-=5
        }
        else {
            print("O", terminator: " ")
        }
    }
   print("")
    for _ in 0..<4 {
        if (hours>=1){
            print("R", terminator: " ")
            hours-=1
        }
        else {
            print("O", terminator: " ")
        }
    }
    print("")
    var cnt=0
    for _ in 0..<11 {
        if (minutes>=5){
            cnt+=1
            if(cnt%3==0){
                print("R", terminator: " ")
            }
            else {
                print("Y", terminator: " ")
            }
            minutes-=5
        }
        else {
            print("O", terminator: " ")
        }
    }
    print("")
    for _ in 0..<4 {
        if (minutes>=1){
            print("Y", terminator: " ")
            minutes-=1
        }
        else {
            print("O", terminator: " ")
        }
    }
    print("")


}
