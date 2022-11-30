import UIKit
import Foundation
//let defaults = UserDefaults.standard
//defaults.removeObject(forKey:"DayMacroTracker")
let date = Date()
let calender = Calendar.current
let current_Day = calender.component(.day, from: date)
let current_month = calender.component(.month, from: date)
struct CustomDay:Codable{
    var day = current_Day
    var month = current_month
    let currCarbs:Double
    let currFat:Double
    let currProtein:Double
}


func loadArray() -> [CustomDay] {
    guard let encodedData = UserDefaults.standard.array(forKey: "DayMacroTracker") as? [Data] else {
        return []
    }

    return encodedData.map { try! JSONDecoder().decode(CustomDay.self, from: $0) }
}

func saveStructToArray(item:CustomDay){
    var loadIn = loadArray()
    print("loading")
    loadIn.append(item)
    let data = loadIn.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "DayMacroTracker")
        print("success")
}



func saveStruct(entry:CustomDay){
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(entry) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "MacroDailyTracker")
    }
}

func readStruct() -> CustomDay{
    let defaults = UserDefaults()
    var returnable:CustomDay = CustomDay(currCarbs: 0, currFat: 0, currProtein: 0)
    if let macroObject = defaults.object(forKey: "MacroDailyTracker") as? Data {
        let decoder = JSONDecoder()
        if let loadedMacro = try? decoder.decode(CustomDay.self, from: macroObject) {
            returnable = loadedMacro
        }
    }
    return returnable
}


//enumerations for values that are to be already set and non negotiable
enum GOALS{
    case gain
    case lose
    case maintain
}
enum Gender{
    case Male
    case Female
}
enum ActivityLevelMultiplier:Double{
    case light = 1.375
    case intermidiate = 1.55
    case active = 1.725
}

//------------------------------ food collection and retrival and reccomendation
enum GoalCategories{
    case maintainWeight
    case gainMuscle
    case gainWeight
    case loseWeight
}

enum GeneratorActions{
    case userSelectedGainLevel
    case selectFoodClass
    case RandomFood
}

struct FoodStats{
    var FoodName:String
    var ProteinWeight:Double
    var FatWeight:Double
    var CarbsWeight:Double
    var GoalCategory:GoalCategories
    var ServingSize:String
    var Recipie:String?  //Work on this next, the optional will be if a recipie is present, print out the recipie, basically if its not null.
}

let BigMac = FoodStats(FoodName: "Big Mac", ProteinWeight: 26, FatWeight: 33, CarbsWeight: 44, GoalCategory: GoalCategories.gainWeight, ServingSize: "1 Burger")

let nutragrain = FoodStats(FoodName: "Nutri-Grain", ProteinWeight: 1.7, FatWeight: 3.2, CarbsWeight: 26, GoalCategory: GoalCategories.maintainWeight, ServingSize: "1 Bar")

let mozzerellaSticks = FoodStats(FoodName: "Farm Rich Mozzarella Sticks", ProteinWeight: 12, FatWeight: 15, CarbsWeight: 23, GoalCategory: GoalCategories.gainWeight, ServingSize: "3 Sticks")

let BuffaloChicken = FoodStats(FoodName: "Farm Rich Buffalo Style Boneless Chicken Bites", ProteinWeight: 12, FatWeight: 9, CarbsWeight: 17, GoalCategory: GoalCategories.maintainWeight, ServingSize: "3 oz(84g) of chicken")

let kindDCN = FoodStats(FoodName: "Kind Dark Chocolate Nut", ProteinWeight: 12, FatWeight: 17, CarbsWeight: 18, GoalCategory: GoalCategories.gainMuscle, ServingSize: "1 Bar")

let ramenNoodles = FoodStats(FoodName: "Ramen Noodles", ProteinWeight: 5, FatWeight: 7, CarbsWeight: 27, GoalCategory: GoalCategories.maintainWeight, ServingSize: "One Package")

let turkeySandwhich = FoodStats(FoodName: "Turkey Sandwhich Estimation (ingriedents can vary)", ProteinWeight: 26, FatWeight: 8, CarbsWeight: 31, GoalCategory: GoalCategories.gainMuscle, ServingSize: "One Sandwhich")

let jalapenoCheddarChips = FoodStats(FoodName: "Jalapeno Cheddar Chips", ProteinWeight: 3, FatWeight: 13, CarbsWeight: 25, GoalCategory: GoalCategories.maintainWeight, ServingSize: "1 Small Bag")

let hamSandwhich = FoodStats(FoodName: "Ham Sandwhich Estamation (ingriedents can vary)", ProteinWeight: 13, FatWeight: 6.5, CarbsWeight: 37.4, GoalCategory: GoalCategories.gainMuscle, ServingSize: "1 Sandwhich")

let BLT = FoodStats(FoodName: "BLT", ProteinWeight: 11.6, FatWeight: 17.5, CarbsWeight: 34.9, GoalCategory: GoalCategories.gainWeight, ServingSize: "One Sandwhich")

let Egg = FoodStats(FoodName: "Egg", ProteinWeight: 7, FatWeight: 5, CarbsWeight: 0.6, GoalCategory: GoalCategories.gainMuscle, ServingSize: "Depends on use, Eggs are very healthy")

let chickenBreast = FoodStats(FoodName: "Chicken Breast", ProteinWeight: 53.4, FatWeight: 6.2, CarbsWeight: 0, GoalCategory: GoalCategories.gainMuscle, ServingSize: "One Chicken")

let cheesefries = FoodStats(FoodName: "Cheese Fries", ProteinWeight: 9.9, FatWeight: 22, CarbsWeight: 38, GoalCategory: GoalCategories.gainWeight, ServingSize: "1 Cup")

let chickentenders = FoodStats(FoodName: "Chicken Tenders", ProteinWeight: 35.4, FatWeight: 25.7, CarbsWeight: 31.7, GoalCategory: GoalCategories.gainMuscle, ServingSize: "184g")

let chickenNuggets = FoodStats(FoodName: "Chicken Nuggets", ProteinWeight: 12, FatWeight: 13, CarbsWeight: 14, GoalCategory: GoalCategories.gainWeight, ServingSize: "5 pieces")

let Ribeye = FoodStats(FoodName: "Ribeye Steak", ProteinWeight: 63.6, FatWeight: 34.4, CarbsWeight: 0, GoalCategory: GoalCategories.gainMuscle, ServingSize: "1 Steak")

let milk = FoodStats(FoodName: "Milk", ProteinWeight: 8, FatWeight: 8, CarbsWeight: 12, GoalCategory: GoalCategories.gainMuscle, ServingSize: "One Cup")

let BrownRice = FoodStats(FoodName: "Brown Rice", ProteinWeight: 5, FatWeight: 1.8, CarbsWeight: 44, GoalCategory: GoalCategories.gainMuscle, ServingSize: "1 Gram")

let scrambledEgg = FoodStats(FoodName: "Scrambled Eggs", ProteinWeight: 6.1, FatWeight: 6.7, CarbsWeight: 1, GoalCategory: GoalCategories.gainMuscle, ServingSize: "1 Large")

let toast = FoodStats(FoodName: "Toast", ProteinWeight: 4, FatWeight: 1, CarbsWeight: 12, GoalCategory: GoalCategories.maintainWeight, ServingSize: "1 Slice")

let tombStoneCheesePizza = FoodStats(FoodName: "Tombstone Cheese Pizza", ProteinWeight: 17, FatWeight: 16, CarbsWeight: 34, GoalCategory: GoalCategories.gainWeight, ServingSize: "140g")

let tombStonePepperoniPizza = FoodStats(FoodName: "Tombstone Pepperoni Pizza", ProteinWeight: 15, FatWeight: 18, CarbsWeight: 34, GoalCategory: GoalCategories.gainWeight, ServingSize: "140g")

let WhiteCastleChickenRings = FoodStats(FoodName: "White Castle Chicken Rings", ProteinWeight: 26.1, FatWeight: 30.6, CarbsWeight: 18.5, GoalCategory: GoalCategories.maintainWeight, ServingSize: "9 Rings")

let DonMiguelBeefMiniTacos = FoodStats(FoodName: "Don Miguel Beef MiniTacos", ProteinWeight: 5, FatWeight: 9, CarbsWeight: 27, GoalCategory: GoalCategories.gainWeight, ServingSize: "4 Mini Tacos")

let bacon = FoodStats(FoodName: "Bacon", ProteinWeight: 3.1, FatWeight: 3.6, CarbsWeight: 0.1, GoalCategory: GoalCategories.gainMuscle, ServingSize: "1 Medium slice")

var foodcollection = [BigMac, nutragrain, mozzerellaSticks, BuffaloChicken, kindDCN, ramenNoodles, turkeySandwhich, hamSandwhich, BLT, Egg, cheesefries, jalapenoCheddarChips, chickentenders, chickenBreast, chickenNuggets, Ribeye, milk, BrownRice, scrambledEgg, toast, tombStoneCheesePizza, tombStonePepperoniPizza, WhiteCastleChickenRings, DonMiguelBeefMiniTacos, bacon]







class DetermineMacros{
    var age:Int
    var gender:Gender
    var heightFeet:Double
    var heightInches:Double
    var weight:Double
    var activityLevel:ActivityLevelMultiplier
    var goal: GOALS
    
    var REE:Double = 0
    var TDEE:Double = 0
    var Protein:Double = 0
    var Fat:Double = 0
    var Carbs:Double = 0
    
    
    init(age:Int, gender:Gender, heightFeet:Double, heightInches:Double, weight:Double, activityLevel:ActivityLevelMultiplier, goal:GOALS){
        self.age = age
        self.gender = gender
        self.heightFeet = heightFeet
        self.heightInches = heightFeet
        self.weight = weight
        self.activityLevel = activityLevel
        self.goal = goal  //goal will be a percentage value (calorie deficits)
    }
    
    //calculated variable (stored elsewhere due to using self.)
    var cmheight: Double {
        return (30.48 * self.heightFeet) + (2.54 * self.heightInches)
    }
    var kgweiht: Double {
        return (self.weight / 2.205)
    }
    
    
    
    func calculateREE(){ //calculates resting energy expenditure
        let genderz = self.gender
        
        switch genderz{
        case .Male:
            Swift.print("MALE")
            REE = 10 * kgweiht + 6.25 * cmheight - 5 * Double(self.age) + 5
            
        case .Female:
            Swift.print("FEMALE")
            REE = 10 * kgweiht + 6.25 * cmheight - 5 * Double(self.age) - 161
            
        }
        
    }
        
    func calculatedMacroCalorieGoal(){ //calculates TDEE
        calculateREE()
        TDEE = REE * self.activityLevel.rawValue
        let goaldeterminer = self.goal
            
        switch goaldeterminer{
        case .lose:
            let p1 = (TDEE * 0.20)
            let p2 = TDEE - p1
            TDEE = p2
        case .gain:
            let p1 = (TDEE * 0.20)
            let p2 = TDEE + p1
            TDEE = p2
        case .maintain:
            Swift.print("No Change")
        }
    }
        
        
    func proteinCalculator(){
        Protein = self.weight * 0.825
        }
        
    func fatCalculator(){
        let calorie = TDEE * 0.25
        Fat = calorie/9
    }
        
    func carbCalculator(){
        Carbs = (TDEE - (Fat * 9) - (Protein * 4))/4
    }
    
    func calculateALL(){ //activates all the calculators and allows for instant and easy calculations
        calculatedMacroCalorieGoal()
        proteinCalculator()
        fatCalculator()
        carbCalculator()
        print("_____________________________________________")
        print(TDEE, "Users daily reccomended TDEE")
        print(Carbs, "daily reccomended Carbs")
        print(Protein, "Daily Reccomended Protein")
        print(Fat, "Daily Reccomended Fat")
        print("_____________________________________________")
    }
}


class FoodPicker{  //randomly picks foods with user max protein and carbs and fat in mind
    let userMax_TDEE:Double
    let userMax_FAT:Double
    let userMax_Carbs:Double
    let userMax_Protein:Double
    let userGoal:GoalCategories
    
    var fatcount: Double = 0
    var carbCount: Double = 0
    var proteinCount: Double = 0
    var tracker:Bool = false
    
    var rmFat:Double = 0.0
    var rmCarbs:Double = 0.0
    var rmProtein:Double = 0.0
    var rmname = ""
    
    
    
    init(userMax_TDEE:Double, userMax_FAT:Double, userMax_Carbs:Double, userMax_Protein:Double, userGoal:GoalCategories){
        self.userMax_TDEE = userMax_TDEE
        self.userMax_FAT = userMax_FAT
        self.userMax_Carbs = userMax_Carbs
        self.userMax_Protein = userMax_Protein
        self.userGoal = userGoal
    }
    
    func generateReccomendedFood(requestedtype:GeneratorActions = GeneratorActions.userSelectedGainLevel, foodTypeRequest:GoalCategories=GoalCategories.maintainWeight){ //function shuffles food collection when called, and runs through the shuffled list of food for matching foods
        rmname = "placeholder"
        rmFat = 0.0
        rmCarbs = 0.0
        rmProtein = 0.0
        
        let differentChoices = requestedtype
        
        switch differentChoices{
        case .userSelectedGainLevel:
            foodcollection.shuffle()
            
            //rm is the variable storage for when the for loop and if statement is met
            for food in foodcollection{
                if food.GoalCategory == self.userGoal{
                    print("_____________________________________________")
                    print("Your reccomended food item is: \(food.FoodName)")
                    print("The Macros in this food are: ")
                    print("Fat: \(food.FatWeight)")
                    print("Carbs: \(food.CarbsWeight)")
                    print("Protein: \(food.ProteinWeight)")
                    print("Serving Size: \(food.ServingSize)")
                    print("Helps With: \(food.GoalCategory)")
                    if let recipie = food.Recipie{
                        print("Recipie: \(recipie)")
                    }
                    print("Do you want this item? call eatlastItem to add this item, or recall to reroll")
                    print("_____________________________________________")
                    rmname = food.FoodName
                    rmFat = food.FatWeight
                    rmCarbs = food.CarbsWeight
                    rmProtein = food.ProteinWeight
                    break
                    //variables x y z act as storage for the randomly generated food, and returned once avalible (outside of the for loops and if statements)
                }
            }
        case .selectFoodClass:
            foodcollection.shuffle()
            
            //rm is the variable storage for when the for loop and if statement is met
            for food in foodcollection{
                if food.GoalCategory == foodTypeRequest{
                    print("_____________________________________________")
                    print("Your reccomended food item is: \(food.FoodName)")
                    print("The Macros in this food are: ")
                    print("Fat: \(food.FatWeight)")
                    print("Carbs: \(food.CarbsWeight)")
                    print("Protein: \(food.ProteinWeight)")
                    print("Serving Size: \(food.ServingSize)")
                    print("Helps With: \(food.GoalCategory)")
                    if let recipie = food.Recipie{
                        print("Recipie: \(recipie)")
                    }
                    print("Do you want this item? call eatlastItem to add this item, or recall to reroll")
                    print("_____________________________________________")
                    rmname = food.FoodName
                    rmFat = food.FatWeight
                    rmCarbs = food.CarbsWeight
                    rmProtein = food.ProteinWeight
                    break
                    //variables x y z act as storage for the randomly generated food, and returned once avalible (outside of the for loops and if statements)
                }
            }
        case .RandomFood:
            foodcollection.shuffle()
            
            //rm is the variable storage for when the for loop and if statement is met
            for food in foodcollection{
                
                print("_____________________________________________")
                print("Your reccomended food item is: \(food.FoodName)")
                print("The Macros in this food are: ")
                print("Fat: \(food.FatWeight)")
                print("Carbs: \(food.CarbsWeight)")
                print("Protein: \(food.ProteinWeight)")
                print("Serving Size: \(food.ServingSize)")
                print("Helps With: \(food.GoalCategory)")
                if let recipie = food.Recipie{
                    print("Recipie: \(recipie)")
                }
                print("Do you want this item? call eatlastItem to add this item, or recall to reroll")
                print("_____________________________________________")
                rmname = food.FoodName
                rmFat = food.FatWeight
                rmCarbs = food.CarbsWeight
                rmProtein = food.ProteinWeight
                break
                    //variables x y z act as storage for the randomly generated food, and returned once avalible (outside of the for loops and if statements)
                }
        }
        
        
    }
    
    func eatlastItem(){  //simulates eating one of the reccomended food
        print("you choose the \(rmname)")
        fatcount += rmFat
        carbCount += rmCarbs
        proteinCount += rmProtein
        saveStruct(entry: CustomDay(currCarbs: rmCarbs, currFat: rmFat, currProtein: rmProtein))
        checkMacroLimit()
        checkDailyMacroLimit()
    }
    
    func checkMacroLimit(){  //this function checks and reminds the user if their approaching their max carb limits
        print("__________________MACRO CHECKER______________________")
        print("Your current carb count so far is: \(carbCount)")
        print("Your current fat count so far is: \(fatcount)")
        print("Your current protein count so far is: \(proteinCount)")
        
        if carbCount >= self.userMax_Carbs{
            print("at or above max carbs")
        } else if carbCount > (0.50 * self.userMax_Carbs){
            print("above half of daily carb max")
        }
        
        if fatcount >= self.userMax_FAT{
            print("at or above max fat")
        } else if fatcount > (0.50 * self.userMax_FAT){
            print("above half of daily fat")
        }
        
        if proteinCount >= self.userMax_Protein{
            print("at or above max protein")
        } else if proteinCount > (0.50 * self.userMax_Protein){
            print("above half of daily protein max")
        }
        print("_____________________________________________")

        
    }
    
    func checkDailyMacroLimit(){  //this function checks and reminds the user if their approaching their max carb limits
        
        let MacroDictionaryReader = readStruct()
        
        let proteinTrack:Double = MacroDictionaryReader.currProtein
        let carbTrack:Double = MacroDictionaryReader.currCarbs
        let fatTrack:Double = MacroDictionaryReader.currFat
        
        print("__________________DAILY MACRO CHECKER______________________")
        print("Your current carb count so far is: \(carbTrack)")
        print("Your current fat count so far is: \(fatTrack)")
        print("Your current protein count so far is: \(proteinTrack)")
        
        if carbTrack >= self.userMax_Carbs{
            print("at or above max carbs")
        } else if carbTrack > (0.50 * self.userMax_Carbs){
            print("above half of daily carb max")
        }
        
        if fatTrack >= self.userMax_FAT{
            print("at or above max fat")
        } else if fatTrack > (0.50 * self.userMax_FAT){
            print("above half of daily fat")
        }
        
        if proteinTrack >= self.userMax_Protein{
            print("at or above max protein")
        } else if proteinTrack > (0.50 * self.userMax_Protein){
            print("above half of daily protein max")
        }
        print("____________________________________________________")
    }
    
    func nextDayTrackTicker(){
        
        
        let defaults = UserDefaults.standard
        
        var currentDayMacro = readStruct() //makes currentDayMacro the current structure in the MAcroStruct UserDefault
        

        print("Counting to New Day\n") //for user
        
        //save item to array
        saveStructToArray(item: currentDayMacro)
        
        
        defaults.removeObject(forKey:"MacroDailyTracker")
        print("Macros Have Been Wiped")
        print("ALL MACROS PRINTED OUT NICELY")
        let allDaysMacros = loadArray()
        for item in allDaysMacros{
            print("------------------")
            print("\(item.month)/\(item.day)")
            print(item.currProtein, "Protein Count")
            print(item.currFat, "Fat Count")
            print(item.currCarbs, "Carbs Count")
            print("-----------------\n")
        }
    }
    
    

}


//functional test of both classes
let jeff = DetermineMacros(age: 21, gender: Gender.Male, heightFeet: 5, heightInches: 8, weight: 160, activityLevel: ActivityLevelMultiplier.active, goal: GOALS.gain)
jeff.calculateALL()



let jeffEats = FoodPicker(userMax_TDEE: jeff.TDEE, userMax_FAT: jeff.Fat, userMax_Carbs: jeff.Carbs, userMax_Protein: jeff.Protein, userGoal: GoalCategories.gainMuscle)


//jeffEats.nextDayTrackTicker()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
jeffEats.nextDayTrackTicker()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()

jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.selectFoodClass, foodTypeRequest: GoalCategories.gainWeight)
jeffEats.eatlastItem()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
jeffEats.generateReccomendedFood(requestedtype: GeneratorActions.RandomFood)
jeffEats.eatlastItem()
