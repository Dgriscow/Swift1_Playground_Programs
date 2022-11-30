import Foundation
let defaults = UserDefaults()
struct Person: Codable {
    var name: String
}

let taylor = Person(name: "draggula")


func saveStruct(human:Person){
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(human) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "swiftshady")
    }
}

func saveStructToArray(item:Person){
    var loadIn = loadArray()
    print(loadIn, "loadin")
    //var emptyArray:[Person] = [Person(name: "chillin")]
    loadIn.append(item)
    print(loadIn)
    let data = loadIn.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "swiftshadysArray")
        print("success")

}

let x = Person(name: "pawn shop")
saveStructToArray(item: x)

func loadArray() -> [Person] {
    guard let encodedData = UserDefaults.standard.array(forKey: "swiftshadysArray") as? [Data] else {
        return []
    }

    return encodedData.map { try! JSONDecoder().decode(Person.self, from: $0) }
}
let y = loadArray()
print(y, "ohhh yeahhh")
let v = Person(name: "chris hanssen")
saveStructToArray(item: v)
print(v, "ohhh")
let n = loadArray()

func readStruct() -> Person{
    var returnable:Person = Person(name: "jim")
    if let savedPerson = defaults.object(forKey: "swiftshady") as? Data {
        let decoder = JSONDecoder()
        if let loadedPerson = try? decoder.decode(Person.self, from: savedPerson) {
            print(loadedPerson)
            returnable = loadedPerson
        }
    }
    return returnable
}
//saveStruct(human: taylor)
readStruct()

let nm = loadArray()
for x in nm{
    print(x)
}
