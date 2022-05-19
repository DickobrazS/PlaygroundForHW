
import Foundation

// MARK: Enums

enum EngineStatus: String {
    case running = "работает"
    case muted = "заглушен"
}

enum WindowsStatus: String {
    case opened = "открыты"
    case closed = "закрыты"
}

enum BodyType: String {
    case coupe = "купе"
    case sedan = "седан"
    case truck = "грузовик"
}



// MARK: SportCar struct
 
struct SportCar {
    let carModel: String
    let carBody: BodyType
    let carYear: Int
    let carColor: String
    let trunkVolume: Int
    var filledTrunkVolume: Int = 0 {
        didSet {
            if oldValue>filledTrunkVolume {
                print ("Из багажника \(carColor + " " + carModel) убрали \(oldValue - filledTrunkVolume) литров груза")
            } else {
                print ("В багажник \(carColor + " " + carModel) загрузили еще \(filledTrunkVolume - oldValue) литров груза")
            }
        }
    }
    var carKM: Int {
        didSet{
            print ("Машина \(carColor + " " + carModel) проехала еще \(carKM-oldValue) км")
        }
    }
    var windows: WindowsStatus {
        willSet {
            print ("Теперь окна у машины \(carColor + " " + carModel) \(windows.rawValue)")
            }
        }
    
    var engine: EngineStatus {
        willSet {
            print ("Теперь двигатель у \(carColor + " " + carModel) \(engine.rawValue)")
            }
        }
    
    func allSettingPrint(){
        print ("""
     
     Модель машины: \(carModel),
     Кузов: \(carBody.rawValue),
     Год выпуска машины: \(carYear),
     Цвет машины: \(carColor),
     Объем багажника \(trunkVolume) литров, из них заполнено \(filledTrunkVolume) литров,
     Пробег: \(carKM),
     Окна \(windows.rawValue),
     Двигатель \(engine.rawValue).
     """)
    }
}

//MARK: TrunkCar struct

struct TrunkCar {
    let carModel: String
    let carBody: BodyType
    let numberOfSeats: Int
    let numberOfWheels: Int
    let carYear: Int
    let carColor: String
    let trunkVolume: Int
    var filledTrunkVolume: Int = 0 {
        didSet {
            if oldValue>filledTrunkVolume {
                print ("Из багажника \(carColor + " " + carModel) убрали \(oldValue - filledTrunkVolume) литров груза")
            } else {
                print ("В багажник \(carColor + " " + carModel) загрузили еще \(filledTrunkVolume - oldValue) литров груза")
            }
        }
    }
    var carKM: Int {
        didSet{
            print ("Машина \(carColor + " " + carModel) проехала еще \(carKM-oldValue) км")
        }
    }
    var windows: WindowsStatus {
        willSet {
            print ("Теперь окна у машины \(carColor + " " + carModel) \(windows.rawValue)")
            }
        }
    
    var engine: EngineStatus {
        willSet {
            print ("Теперь двигатель у \(carColor + " " + carModel) \(engine.rawValue)")
            }
        }
    func allSettingPrint(){
        print ("""
     
     Модель машины: \(carModel),
     Кузов: \(carBody.rawValue),
     Кол-во пассажирских мест: \(numberOfSeats),
     Кол-во колес: \(numberOfWheels),
     Год выпуска машины: \(carYear),
     Цвет машины: \(carColor),
     Объем багажника \(trunkVolume) литров, из них заполнено \(filledTrunkVolume) литров,
     Пробег: \(carKM),
     Окна \(windows.rawValue),
     Двигатель \(engine.rawValue).
     """)
    }
}


// MARK: Initialization

var firstCar = SportCar(carModel: "БМВ", carBody: .coupe, carYear: 2019, carColor: "зеленый", trunkVolume: 650, filledTrunkVolume: 100, carKM: 150, windows: .closed, engine: .running)
var secondCar = SportCar(carModel: "Тесла", carBody: .sedan, carYear: 2015, carColor: "красный", trunkVolume: 400, filledTrunkVolume: 225, carKM: 150000, windows: .closed, engine: .muted)
var trunkCar = TrunkCar(carModel: "Мерседес", carBody: .truck, numberOfSeats: 5, numberOfWheels: 10, carYear: 2005, carColor: "черный", trunkVolume: 2300, filledTrunkVolume: 400, carKM: 400000, windows: .opened, engine: .running)

firstCar.windows = .opened
secondCar.engine = .muted
trunkCar.carKM = 600000
firstCar.filledTrunkVolume = 50
firstCar.filledTrunkVolume = 400
firstCar.allSettingPrint()
secondCar.allSettingPrint()
trunkCar.allSettingPrint()
