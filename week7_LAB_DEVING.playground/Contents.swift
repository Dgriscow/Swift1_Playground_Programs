import UIKit


func prntcurrentTime(){
    let date = Date()
    let calender = Calendar.current
    let hour_start = calender.component(.hour, from: date)
    let minute_start = calender.component(.minute, from: date) //date and calender section help gathered from stackoverflow
    if hour_start > 12{
        var pmhour = hour_start - 12
        print("\(pmhour):\(minute_start)PM")
    } else {
        print("\(hour_start):\(minute_start)AM")
    }
}


prntcurrentTime()

func calculatedTime(hourChange: Int, minChange: Int, aos: String) -> String{
    let date = Date()
    let calender = Calendar.current
    let hr = calender.component(.hour, from: date) //will be hour accessor
    let min = calender.component(.minute, from: date) // will be minutes accessor//date and calender section help gathered from stackoverflow
    
    var newHour = 0
    var newMinute = 0
    var pmed = false
    var returnedStatement = ""
    if aos == "Add"{
        newHour = hr + hourChange
        newMinute = min + minChange
        if newMinute >= 60{
            var holder = newMinute - 60
            newMinute = holder
        }
        
        if newHour > 12{ //converts to pm
            newHour = newHour - 12
            pmed = true
        }
        
        
        if pmed == true{
            returnedStatement = "In \(hourChange) Hours and \(minChange) Minutes,  The time will be \(newHour):\(newMinute) PM"
        } else{
            returnedStatement = "In \(hourChange) Hours and \(minChange) Minutes,  The time will be \(newHour):\(newMinute) AM"
        }
        
    } // for add
    
    if aos == "Subtract"{
        newHour = hr - hourChange
        newMinute = min - minChange
        if newMinute >= 60{
            var holder = newMinute - 60
            newMinute = holder
        }
        
        if newHour > 12{ //converts to pm
            newHour = newHour - 12
            pmed = true
        }
        
        if newMinute < 0{
            newMinute = newMinute * -1
            
        }
        
        
        if pmed == true{
            returnedStatement = "In \(hourChange) Hours and \(minChange) Minutes,  The time will be \(newHour):\(newMinute) PM"
        } else{
            returnedStatement = "In \(hourChange) Hours and \(minChange) Minutes,  The time will be \(newHour):\(newMinute) AM"
        }
        
    } // for subtract
    
    
    
    
    return returnedStatement
}
print(calculatedTime(hourChange: 5, minChange: 0, aos: "Add"))
