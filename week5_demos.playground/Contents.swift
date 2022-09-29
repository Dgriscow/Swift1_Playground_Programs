import UIKit



let date = Date()
let calender = Calendar.current
let hour_start = calender.component(.hour, from: date)
let minute_start = calender.component(.minute, from: date) //date and calender section help gathered from stackoverflow
var hours = hour_start
var minutes = minute_start
var seconds = 0
let clockStatement = true
while clockStatement{
    sleep(1)
    seconds += 1
    if seconds >= 60{
        minutes += 1
        seconds = 0
    }
    else if minutes >= 60{
        hours += 1
        minutes = 0
    }
    print("\(hours):\(minutes):\(seconds)")
    }




