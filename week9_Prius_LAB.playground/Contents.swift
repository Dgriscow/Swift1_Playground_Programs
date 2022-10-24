import UIKit

//Create the recipe and ingredients to define a playground that allows you to select the model, color, packages, and accessories.


class BuyAPrius {
    var model:Int
    var finalModel:String = ""
    var engine:String? //all engines follow this layout, but with something added on at the end
    var finalEngine:String = ""
    var colorINT:String
    var colorEXT:String
    var packages:String?//only certain cars have packages (cars: XLE[Premium Convenience Package, Advanced Technology Package, Asvanced Technology Package with Options], XLE AWD-e[advanced technology package], 'limited'[premium convienence package, advanced technology package], optional because may not hve a package
    var accessories:[String]? = []
    var totalcost:Double = 0
    

    init(model:Int, engine:String, colorEXT:String,colorINT:String, accessories:[String], packages:String){
        self.model = model
        self.engine = engine
        self.colorEXT = colorEXT
        self.colorINT = colorINT
        self.accessories = accessories
        self.packages = packages
        
    }


    enum model2Price:Double{
        case XLE = 29295
        case leAWDe = 27685
        case prius2022LE = 26285
        case LEco2022 = 25075
        case XLE_AWD_E = 30125
        case priuslimited = 33795
        case NightShadeFWD = 29545
        case NightShadeAWD = 30675
    }
    
    enum XLEPackagesPrices:Double{
        case PremiumPack = 515 // and so on
        case AdvancedTechPac = 800
        case AdvancedTechwithOptions = 1315
    } //have an enumeration for every cars package
    
    enum priusLimited2022:Double{
        case PremiumConvience = 515
        case AdvancedTechPac = 800
    }
    
    
    
    
    var colorsEXTOptions: Dictionary<String, Double> = ["Eletric Storm Blue":0.0, "Classic Silver Metalic":0, "Midnight Black Metallic":0.0,"Sea Glass Pearl":0.0, "Supersonic Red":425, "Wind Chill Pearl":425, "White":0.0]
    
    var colorsINTOptions: Dictionary<String, Double> = ["Harvest Beige Softex": 0, "Black Softex": 0, "Moonstone Softex": 0, "Black Fabric":0, "Moonstone Fabric":0, "Harvest Beige Fabric":0]
    
    var someaccessories: Dictionary<String, Double> = ["Aero Side Splitter": 299, "All-Weather Floor Liner":259, "CAT-Shield": 140, "Paint Protection Film":395, "Removable Cross Bars":299]
    
    
    
    func calculatePrice() -> String{
        
        if self.model == 1{
            self.totalcost += model2Price.LEco2022.rawValue
            self.finalModel = "2022 Prius L ECO"
            self.finalEngine = "1.8L 4-Cyl FWD"
            self.packages = "Standard"
            
            //ext
            if self.colorEXT == "Eletric Storm Blue"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Supersonic Red"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Wind Chill Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Classic Silver Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Magnetic Gray Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Sea Glass Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Moonstone Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
                
            } else if self.colorINT == "Black Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Harvest Beige Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
            
            
            
            
        } else if self.model == 2{
            print("car2")
            self.totalcost += model2Price.prius2022LE.rawValue
            self.finalModel = "2022 Prius LE"
            self.finalEngine = "1.8L 4-Cyl FWD"
            self.packages = "Standard"
            
            //ext
            if self.colorEXT == "Eletric Storm Blue"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Supersonic Red"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Wind Chill Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Sea Glass Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Moonstone Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
                
            } else if self.colorINT == "Black Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            
            } else if self.colorINT == "Harvest Beige Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!

            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
        
            
        } else if self.model == 3{
            print("car3")
            self.totalcost += model2Price.leAWDe.rawValue
            self.finalModel = "2022 Prius LE AWD-e"
            self.finalEngine = "1.8L 4-Cyl AWD-e"
            self.packages = "Standard"
            
            //ext
            if self.colorEXT == "Eletric Storm Blue"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Supersonic Red"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Wind Chill Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Classic Silver Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Magnetic Gray Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Sea Glass Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Moonstone Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
                
            } else if self.colorINT == "Black Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Harvest Beige Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
            
        } else if self.model == 4{
            print("car4")
            self.totalcost += model2Price.XLE.rawValue
            self.finalModel = "2022 Prius XLE"
            self.finalEngine = "1.8L 4-Cyl FWD"
            
            if self.packages == "Premium Convenience Package" {
                self.totalcost += XLEPackagesPrices.PremiumPack.rawValue
            } else if self.packages == "Advanced Technology Package"{
                self.totalcost += XLEPackagesPrices.AdvancedTechPac.rawValue
            } else if self.packages == "Advanced Technology Package with options"{
                self.totalcost += XLEPackagesPrices.AdvancedTechwithOptions.rawValue
            } else {
                self.packages = "Standard"}
            
            //ext
            if self.colorEXT == "Eletric Storm Blue"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Supersonic Red"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Wind Chill Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Classic Silver Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Magnetic Gray Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Sea Glass Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Moonstone Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Black Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Harvest Beige Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
            
        } else if self.model == 5{
            print("car5")
            self.totalcost += model2Price.XLE_AWD_E.rawValue
            self.finalModel = "2022 Prius XLE AWD-e"
            self.finalEngine = "1.8L 4-Cyl FWD"
            
            if self.packages == "Advanced Technology Package"{
                self.totalcost += XLEPackagesPrices.AdvancedTechPac.rawValue
            } else {
                self.packages = "Standard"}
            
            //ext
            if self.colorEXT == "Eletric Storm Blue"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Supersonic Red"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Wind Chill Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Classic Silver Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Magnetic Gray Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Sea Glass Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Moonstone Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Black Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Harvest Beige Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
            
        } else if self.model == 6{
            print("car6")
            self.totalcost += model2Price.priuslimited.rawValue
            self.finalModel = "2022 Prius Limited"
            self.finalEngine = "1.8L 4-Cyl FWD"
            
            if self.packages == "Premium Convenience Package" {
                self.totalcost += XLEPackagesPrices.PremiumPack.rawValue
            } else if self.packages == "Advanced Technology Package"{
                self.totalcost += XLEPackagesPrices.AdvancedTechPac.rawValue
            } else {
                self.packages = "Standard"}
            
            //ext
            if self.colorEXT == "Eletric Storm Blue"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Supersonic Red"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Wind Chill Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Sea Glass Pearl"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Moonstone Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Black Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            } else if self.colorINT == "Harvest Beige Fabric"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
            
        } else if self.model == 7{
            print("car7")
            self.totalcost += model2Price.NightShadeFWD.rawValue
            self.finalModel = "2022 Prius Nightshade FWD"
            self.finalEngine = "1.8L 4-Cyl"
            self.packages = "Standard"
            
            //ext
            if self.colorEXT == "Classic Silver Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "White"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Black Softex"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
            
            
        
        } else if self.model == 8{
            print("Car8")
            self.totalcost += model2Price.NightShadeFWD.rawValue
            self.finalModel = "2022 Prius Nightshade AWD-e"
            self.finalEngine = "1.8L 4-Cyl"
            self.packages = "Standard"
            
            //ext
            if self.colorEXT == "Classic Silver Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "White"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            } else if self.colorEXT == "Midnight Black Metallic"{
                self.totalcost += colorsEXTOptions[self.colorEXT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorEXT = "Standard"
            }
            
            //int
            if self.colorINT == "Black Softex"{
                self.totalcost += colorsINTOptions[self.colorINT]!
            }else {
                print("Color Is not Available, set to standard")
                self.colorINT = "Standard"
            }
        }
        //calculate accessories
        for access in accessories!{
            for option in someaccessories.keys{
                if access == option{
                    self.totalcost += someaccessories[option]!
                }
            }
        }
        return "You've Selected the \(self.finalModel) with a \(self.finalEngine) engine, with a \(self.colorEXT) exterior with an interior of \(self.colorINT) with the \(self.packages ?? "none") package with \(self.accessories!) The Final Cost is: $\(self.totalcost)"
    }
    
    
    
    
    
}


var car1 = BuyAPrius(model: 1, engine: "standard", colorEXT: "Eletric Storm Blue", colorINT: "Harvest Beige Fabric", accessories: [], packages: "")
print(car1.calculatePrice())
var car4 = BuyAPrius(model: 4, engine: "FWD", colorEXT: "Supersonic Red", colorINT: "Moonstone Fabric", accessories: ["Paint Protection Film"], packages: "Premium Convenience Package")
print(car4.calculatePrice())


var car2 = BuyAPrius(model: 2, engine: "select for me", colorEXT: "Wind Chill Pearl", colorINT: "Moonstone Fabric", accessories: ["CAT-Shield", "All-Weather Floor Liner"], packages: "no packages to select from")
print(car2.calculatePrice())

var car5 = BuyAPrius(model: 5, engine: "select for me", colorEXT: "Supersonic Red", colorINT: "Black Softex", accessories: [], packages: "")
print(car5.calculatePrice())

var car6 = BuyAPrius(model: 6, engine: "select for me", colorEXT: "Supersonic Red", colorINT: "Moonstone Fabric", accessories: [], packages: "")
print(car6.calculatePrice())

var car7 = BuyAPrius(model: 7, engine: "standard", colorEXT: "Eletric Storm Blue", colorINT: "Black Fabric", accessories: [], packages: "select for me")
print(car7.calculatePrice())
var car8 = BuyAPrius(model: 8, engine: "standard", colorEXT: "Wind Chill Pearl", colorINT: "Black Fabric", accessories: ["Aero Side Splitter", "All-Weather Floor Liner"], packages: "select for me")
print(car8.calculatePrice())
