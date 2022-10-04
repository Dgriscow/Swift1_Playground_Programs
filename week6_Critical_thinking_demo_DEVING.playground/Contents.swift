import UIKit


var schoolNecesities = ["iPad", "Apple Pencil", "Macbook", "AirPods", "Portable Battery", "Mouse", "Dongle"]
//iterate through the array and 
var room_Stuffs: Dictionary<String, String> = ["Monitor": "DesktopPC", "Computer Tower": "DesktopPC", "Red PS5 Controller": "Playstation", "White Headset": "Playstation", "Switch": "Nintendo", "Switch Doc": "Nintendo", "Controller Holder": "Nintendo"]


for (techname, techtype) in room_Stuffs {
    if techtype == "DesktopPC"{
        print("The \(techname) goes with the Desktop Setup")
        room_Stuffs.removeValue(forKey: techtype)
    }
    else if techtype == "Playstation"{
        print("The \(techname) Goes with the PS5")
        room_Stuffs.removeValue(forKey: techtype)
    }
    else if techtype == "Nintendo"{
        print("The \(techname) goes witht the Nintendo switch, in the corner of the room")
        room_Stuffs.removeValue(forKey: techtype)
    }
}

print("-------------------------------------------")

//part two will randomly order what i need to bring to school every day randomly, so its different every time (harder to forget and miss)

for _ in schoolNecesities{
    let random_Selector = Int.random(in: 0...5)
    print("Dont forget the \(schoolNecesities[random_Selector]), You'll Regret it")
    
}

