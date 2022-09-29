import UIKit

let target = 25.0

var monday = 5.5

var tuesday = 0.0

var wednesday = 5.0

var thursday = 0.0

var friday = 5.0

var saturday = 6.0


var sunday = 6.0

var total_workhours = monday + tuesday + wednesday + thursday + friday + saturday + sunday


if total_workhours >= target{
    print("You worked \(total_workhours) hours this week, Good pay week")
}
else{
    print("you worked for \(total_workhours) hours, not as good pay week")
}
