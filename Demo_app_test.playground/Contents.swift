import Foundation

let defaults = UserDefaults.standard
defaults.removeObject(forKey:"MacroDailyTracker")
if defaults.object(forKey: "MacroDailyTracker") != nil{
    print("exists")
} else {
    print("does not exist")
}

func saveMacrosToDefaults(currProtein:Double, currCarbs:Double, currFat:Double){
    let defaultUserStorage = UserDefaults.standard //userdefaults is a data dictionary that stores small amounts of user settings/variables as long as the app is installed, it can easily store and save basic swift data types
    let macroUpdater = defaultUserStorage.dictionary(forKey: "MacroDailyTracker")
    let curdefaultProtein: Any? = macroUpdater!["currProtein"]
    
    //add part
    if curdefaultProtein != nil{
        print("nil")

    }
    let macroDictionary = ["currProtein":currProtein, "currCarbs":currCarbs, "currFat":currFat]
    defaultUserStorage.set(macroDictionary, forKey: "MacroDailyTracker")
    
    print("inserted into default storage")
    //.set(*dictionary Name*, forKey: "*what goes here is the name of the dictionary, so you can retrive it later from userdefaults.
}


//
//func saveMacrosToDefaults(currProtein:Double, currCarbs:Double, currFat:Double){
//    let defaultUserStorage = UserDefaults.standard //userdefaults is a data dictionary that stores small amounts of user settings/variables as long as the app is installed, it can easily store and save basic swift data types
//
//    if defaultUserStorage.object(forKey: "MacroDailyTracker") != nil{
//        print("exists")
//        let macroUpdater = defaultUserStorage.dictionary(forKey: "MacroDailyTracker")
//        print(macroUpdater!)
//        print(macroUpdater!["currProtein"] as Any)
//
//
//        let macroDictionary = ["currProtein":currProtein, "currCarbs":currCarbs, "currFat":currFat]
//    } else {
//        print("does not exist")
//        let macroDictionary = ["currProtein":currProtein, "currCarbs":currCarbs, "currFat":currFat]
//        defaultUserStorage.set(macroDictionary, forKey: "MacroDailyTracker")
//    }
//
////.set(*dictionary Name*, forKey: "*what goes here is the name of the dictionary, so you can retrive it later from userdefaults.
//}


func readMacrosFromDefault() -> [String: Any]{
    let defaultUserStorage = UserDefaults.standard //userdefaults is a data dictionary that stores small amounts of user settings/variables as long as the app is installed, it can easily store and save basic swift data types
    let MacroTrackerDictionary = defaultUserStorage.dictionary(forKey: "MacroDailyTracker")
    
    return MacroTrackerDictionary!
}
saveMacrosToDefaults(currProtein: 44, currCarbs: 32, currFat: 32)
let x = readMacrosFromDefault()
print(x, "bep")
//saveMacrosToDefaults(currProtein: 126, currCarbs: 289, currFat: 89)

readMacrosFromDefault()
