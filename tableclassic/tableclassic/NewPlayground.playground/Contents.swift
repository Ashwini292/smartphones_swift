import UIKit

func modifyValues (val : Int? , name: String) -> Int {
    

    guard let val = val else{return 0}
    print("Hello, \(name) your input value is \(val)")
    
    return val * 5
}

var num = modifyValues(val: nil , name: "Ashwini")
print("result is \(num)")

num = modifyValues(val: 10, name: "Ashwini")
print("result is \(num)")
