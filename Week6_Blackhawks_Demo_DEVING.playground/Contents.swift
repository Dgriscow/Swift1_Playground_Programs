import UIKit

var blackhawksPlayersNumbers: Dictionary<Int, String> = [89:"ANDREAS ATHANASIOU", 26: "EVAN BARRATT", 43:"COLIN BLACKWELL", 28:"COLTON DACH", 13:"MAX DOMI", 58:"MACKENZIE ENTWISTLE", 70:"Cole Guttman", 86:"MIKE HARDMAN", 52:"REESE JOHNSON", 90:"TYLER JOHNSON", 88:"PATRICK KANE", 14:"BORIS KATCHOUK", 16:"JUJHAR KHAIRA", 23:"PHILIPP KURASHEV", 24:"SAM LAFFERTY", 25:"JALEN LUYPEN", 39:"LUKE PHILP", 59:"JAKUB POUR", 11:"TAYLOR RADDYSH", 27:"LUKAS REICHEL", 53:"BUDDY ROBINSON", 62:"BRETT SENEY", 79:"DYLAN SIKURA", 36:"JOSIAH SLAVIN", 71:"MICHAL TEPLY", 19:"JONATHAN TOEWS"]

var sortablePlayersNumOrder = [String]()


var num_array = blackhawksPlayersNumbers.keys
var numarraysort = num_array.sorted(by: <)

for pnumb in numarraysort {
    sortablePlayersNumOrder.append(blackhawksPlayersNumbers[pnumb]!) //! Does something called "unpack"
}

print("The Sorted list of players are: \(sortablePlayersNumOrder)")

print("----------------------------------------------------------------------------------")
var blackhawksPlayersCountry: Dictionary<String, String> = ["ANDREAS ATHANASIOU":"CAN", "EVAN BARRATT":"USA", "COLIN BLACKWELL":"USA", "COLTON DACH":"CAN", "MAX DOMI":"CAN", "MACKENZIE ENTWISTLE":"CAN", "Cole Guttman":"USA", "MIKE HARDMAN":"USA", "REESE JOHNSON":"CAN", "TYLER JOHNSON":"USA", "PATRICK KANE":"USA", "BORIS KATCHOUK":"CAN", "JUJHAR KHAIRA":"CAN", "PHILIPP KURASHEV":"CHE", "SAM LAFFERTY":"USA", "JALEN LUYPEN":"CAN", "LUKE PHILP":"CAN", "JAKUB POUR":"CZE", "TAYLOR RADDYSH":"CAN", "LUKAS REICHEL":"DEU", "BUDDY ROBINSON":"USA", "BRETT SENEY":"CAN", "DYLAN SIKURA":"CAN", "JOSIAH SLAVIN":"USA", "MICHAL TEPLY":"CZE", "JONATHAN TOEWSY":"CAN"]


var sortablePlayersCountryOrder = [String]()
var countryArray = blackhawksPlayersCountry.values
var countryFREE = countryArray.sorted(by: >)
print("The Countries for each player sorted looks like: \(countryFREE)")
print("----------------------------------------------------------------------------------")
//Calculate the average age of the players
//use the ordered array - make a new array with ages ordered by website, then add together all the ages from the array, then divide that by the length of the age array
//
//var age_total = 0
//for age in agearray
//  age_total += age

var orderedAge = [28, 23, 29, 19, 27, 23, 23, 23, 24, 32, 33, 24, 28, 22, 27, 20, 26, 23, 24, 20, 30, 26, 27, 23, 21, 34]
var totalAge = 0
for age in orderedAge{
    totalAge += age
    
}

let averageAge = totalAge / orderedAge.count
print("The Averags Age of all the players is \(averageAge)")










print("----------------------------------------------------------------------------------")
//Calculate the average height of the players
//use the ordered array - make a new array with height ordered by website, convert height to either in or cm(make it easy), then add together all the heights from the array, then divide that by the length of the height array
//var heighttotal = 0
//for height in heightarray
//  height_total += height

var inHeight = [74, 72, 69, 76, 70, 75, 69, 74, 73, 68, 70, 74, 76, 72, 73, 70, 70, 75, 72, 78, 69, 71, 75, 75, 74]
var totalHeight = 0
for height in inHeight{
    totalHeight += height
}
let averageHeight = totalHeight / inHeight.count
print("The Average Height For all the Players is \(averageHeight)in")














print("----------------------------------------------------------------------------------")
//Determine the month in which most of the players birthday falls
//research required, probobly do something based on which month appears the most,

var monthOrded = ["August", "February", "March", "January", "March", "July", "April", "February", "July", "July", "November", "June", "August", "October", "March", "June", "November", "April", "February", "May", "September", "February", "June", "December", "May", "April"]


var janCount = 0
var febCount = 0
var marCount = 0
var aprlCount = 0
var mayCount = 0
var junCount = 0
var julCount = 0
var augCount = 0
var sepCount = 0
var octCount = 0
var novCount = 0
var decCount = 0

for month in monthOrded{
    if month == "January"{
        augCount += 1
    } else if month == "February"{
        febCount += 1
    } else if month == "March"{
        marCount += 1
    } else if month == "April"{
        aprlCount += 1
    } else if month == "May"{
        mayCount += 1
    } else if month == "June"{
        junCount += 1
    } else if month == "July"{
        julCount += 1
    }else if month == "August"{
        augCount += 1
    }else if month == "October"{
        octCount += 1
    }else if month == "November"{
        novCount += 1
    } else if month == "December"{
        decCount += 1
    }
}

var month_to_count: Dictionary<String, Int> = ["January":janCount, "February":febCount, "March":marCount, "April":aprlCount, "May":mayCount, "June":junCount, "July":julCount, "August":augCount, "September":sepCount, "October":octCount, "November":novCount, "December":decCount]
print("The months with all their counts are: \(month_to_count)")
//let montharrayCount = [janCount, febCount, marCount, aprlCount, mayCount, junCount, julCount, augCount, sepCount, octCount, novCount, decCount]

let maxvalue = month_to_count.max {a, b in a.value < b.value}  //apple developer.com
print("The Month where most players are born is \(String(describing: maxvalue))")
