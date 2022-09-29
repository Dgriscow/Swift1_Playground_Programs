import UIKit

//DEMO PURPOSE: take data from the division AFC East and compare the win and losses for each team and calculate their win/loss rate as well as the combined division wins and losses


let PatriotsW = 529
let PatriotsT = 9
let PatriotsL = 411

let DolphinsW = 476
let DolphinsT = 4
let DolphinsL = 385

let BillsW = 449
let BillsT = 8
let BillsL = 492

let JetsW = 414
let JetsT = 8
let JetsL = 527



//calculate win loss % for patriots
var patriots_total = Double((PatriotsW + PatriotsT + PatriotsL))
var patriotsWrate = (Double(PatriotsW) / patriots_total) * 100
var patriotsLrate = (Double(PatriotsL) / patriots_total) * 100

var dolphins_total = Double(DolphinsW + DolphinsT + DolphinsL)
var dolphinsWrate = (Double(DolphinsW) / dolphins_total) * 100
var dolphinsLrate = (Double(DolphinsL) / dolphins_total) * 100

var bills_total = Double((BillsW + BillsT + BillsL))
var billsWrate = (Double(BillsW) / bills_total) * 100
var billsLrate = (Double(BillsL) / bills_total) * 100

var jets_total = Double((JetsW + JetsT + JetsL))
var jetsWrate = (Double(JetsW) / jets_total) * 100
var jetsLrate = (Double(JetsL) / jets_total) * 100


//compare two teams
//first compare patriots and dolphins
//then compare bills and jets

var winray = [PatriotsW, DolphinsW, BillsW, JetsW]
var Lray = [PatriotsL, DolphinsL, BillsL, JetsL]
var placeholder = 0
var placeholder2 = 0

for wincount in winray{
    if wincount > placeholder{
        placeholder = wincount
    }
    
}

for Lcount in Lray{
    if Lcount > placeholder2{
        placeholder2 = Lcount
    }
    
}

var most_Ls = ""

if placeholder2 == 411{
    most_Ls = "Patriots"
}
else if placeholder2 == 385{
    most_Ls = "Dolphins"
}
else if placeholder2 == 492{
    most_Ls = "Bills"
}
else if placeholder2 == 527{
    most_Ls = "Jets"
}

var most_wins = ""

if placeholder == 529{
    most_wins = "Patriots"
}
else if placeholder == 476{
    most_wins = "Dolphins"
}
else if placeholder == 449{
    most_wins = "Bills"
}
else if placeholder == 414{
    most_wins = "Jets"
}
print("The Team with the most wins is the \(most_wins)")
print("The Team With the Most Loses is the \(most_Ls)")

if patriotsWrate > dolphinsWrate{
    print("Patriors have a higher win rate than the Dolphins ")
}
else{
    print("Dolphins have a higher win rate than the patriots")
}
if billsWrate < jetsWrate{
    print("Jets have a higher win rate than the Bills ")
}
else{
    print("Bills have a higher win rate than the Jets")
}

