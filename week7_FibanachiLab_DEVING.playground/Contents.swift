import UIKit


func fibbed(numToChange: Int) -> Int{
    if numToChange == 0{
        return 0
    }
    if numToChange == 1 {
        return 1
    } else {
        return fibbed(numToChange: (numToChange - 1)) + fibbed(numToChange: (numToChange - 2))
    }
    
}

var stopTracker = 0
var num1 = 0
while stopTracker < 1000{
    stopTracker = fibbed(numToChange: num1)
    print(stopTracker)
    num1 += 1
    
}

