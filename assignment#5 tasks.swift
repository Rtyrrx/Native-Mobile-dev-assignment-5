//Part 1
class Person {
    var name: String
    var age:Int
    init(name:String, age:Int){
        self.name = name
        self.age = age
    } 
    func introduce() {
        print("Hi, I'm \(name) and I'm \(age) years old.")
    }
}

let person1 = Person(name:"Madias", age:18)
let person2 = Person(name:"Ali", age:19)
let person3 = Person(name:"Aruzhan", age:19)
let person4 = Person(name:"Rei", age:14)

person1.introduce() 
person2.introduce()
person3.introduce()
person4.introduce()
print()


//Part2
struct Student {
    var name: String
    var grade: Int
}

class Teacher {
    var name: String
    var subject: String

    init(name: String, subject: String){
        self.name = name
        self.subject = subject
    }
}

var student1 = Student(name: "Madias", grade: 100)
var student2 = student1
student2.name = "Ali"
print(student1.name)

let teacher1 = Teacher(name: "Adilet", subject: "Native Mobile Dev")
let teacher2 = teacher1
teacher2.name = "Omar"
print(teacher1.name)
print()

//Part3
enum MilitaryBranch {
    case usmc, airForce, navy, army, deltaForce, greenBerets
}

let unit = MilitaryBranch.deltaForce
switch unit {
case .usmc: print("Semper Fi! US Marine Corps")
case .airForce: print("Aim High! US Air Force")
case .navy: print("Honor, Courage, Commitment! US Navy")
case .army: print("This We'll Defend! US Army")
case .deltaForce: print("Delta Force - 1st SFOD-D")
case .greenBerets: print("De Oppresso Liber! Green Berets")
}
print()

//Part4
class BankAccount {
    private var balance: Double = 0
    
    var formattedBalance: String {
        return "$\(balance)"
    }
    
    var amount: Double {
        didSet {
            print("Balance changed from \(oldValue) to \(amount)")
        }
    }
    
    init(amount: Double) {
        self.amount = amount
    }
    
    public func deposit(_ sum: Double) {
        balance += sum
    }
}

let account = BankAccount(amount: 100)
account.deposit(50)
print(account.formattedBalance)
account.amount = 200
print()

//Part5
class Resource {
    var name: String
    
    init(name: String) {
        self.name = name
        print("Resource \(name) created")
    }
    
    deinit {
        print("Resource \(name) deallocated")
    }
}

var res: Resource? = Resource(name: "File")
res = nil
print()

//Part6
class Animal {
    var name: String
    init(name: String) { self.name = name }
    func sound() { print("Some sound") }
}

class Dog: Animal {
    override func sound() { print("\(name) barks!") }
}

class Cat: Animal {
    override func sound() { print("\(name) meows!") }
}

let animals: [Animal] = [Dog(name: "Hatiko"), Cat(name: "Aki")]
for animal in animals {
    animal.sound()
}
print()

//Part7
protocol Describable {
    var description: String { get }
    func describe()
}

struct Car: Describable {
    var description: String = "A fast car"
    func describe() { print(description) }
}

let car = Car()
car.describe()
print()

//Part8
protocol Runnable {
    func run()
}

extension Runnable {
    func run() { print("Running...") }
}

struct Athlete: Runnable {}
let athlete = Athlete()
athlete.run()
print()

//Part9
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 5, y = 10
swapValues(&x, &y)
print("x: \(x), y: \(y)")

func findMax<T: Comparable>(_ a: T, _ b: T) -> T {
    return a > b ? a : b
}
print("Max: \(findMax(3, 7))")
print()

//Part10
enum LoginError: Error {
    case emptyUsername, wrongPassword
}

func login(user: String, pass: String) throws {
    if user.isEmpty { throw LoginError.emptyUsername }
    if pass != "1234" { throw LoginError.wrongPassword }
    print("Login successful!")
}

do {
    try login(user: "admin", pass: "wrong")
} catch LoginError.emptyUsername {
    print("Error: Username is empty")
} catch LoginError.wrongPassword {
    print("Error: Wrong password")
} catch {
    print("Unknown error")
}
print()

//Part11
class Node {
    var value: Int
    var next: Node?
    weak var prev: Node?
    
    init(value: Int) { self.value = value }
    deinit { print("Node \(value) deallocated") }
}

class Owner {
    var pet: Pet?
    deinit { print("Owner deallocated") }
}

class Pet {
    weak var owner: Owner?
    deinit { print("Pet deallocated") }
}

var owner: Owner? = Owner()
var pet: Pet? = Pet()
owner?.pet = pet
pet?.owner = owner
owner = nil
pet = nil
print()

//Part12
// 1. Fighter protocol
protocol Fighter {
    var name: String { get }
    var hp: Int { get set }
    var power: Int { get }
    func attack() -> Int
    func takeDamage(_ amount: Int)
}
print("Fighter protocol created")

// 2-3. Universe enum
enum Universe {
    case attackOnTitan, jujutsuKaisen, demonSlayer
    var title: String {
        switch self {
        case .attackOnTitan: return "Attack on Titan"
        case .jujutsuKaisen: return "Jujutsu Kaisen"
        case .demonSlayer: return "Demon Slayer"
        }
    }
}
print("Universe enum ready: \(Universe.attackOnTitan.title)")

// 4-9. Character class
class Character: Fighter {
    var name: String
    var hp: Int
    var power: Int
    var universe: Universe
    private var shield: Int = 0
    
    var shieldPoints: Int {
        get { shield }
        set { shield = min(max(0, newValue), 100) }
    }
    
    init(name: String, hp: Int, power: Int, universe: Universe) {
        self.name = name; self.hp = hp; self.power = power; self.universe = universe
    }
    
    func attack() -> Int { power }
    
    func takeDamage(_ amount: Int) {
        var dmg = amount
        if shield > 0 { let absorbed = min(shield, dmg); shield -= absorbed; dmg -= absorbed }
        hp = max(0, hp - dmg)
    }
    
    func status() { print("Name: \(name) | HP: \(hp) | Power: \(power) | Universe: \(universe.title)") }
}

// 10. Subclasses
class TitanShifter: Character {
    var titanForm: String
    init(name: String, hp: Int, power: Int, titanForm: String) {
        self.titanForm = titanForm
        super.init(name: name, hp: hp, power: power, universe: .attackOnTitan)
    }
    override func attack() -> Int { power + 30 }
}

class Sorcerer: Character {
    var cursedEnergy: Int
    init(name: String, hp: Int, power: Int, cursedEnergy: Int) {
        self.cursedEnergy = cursedEnergy
        super.init(name: name, hp: hp, power: power, universe: .jujutsuKaisen)
    }
    override func attack() -> Int { power + cursedEnergy / 10 }
}

// 11-12. Array + loop
let chars: [Character] = [
    Character(name: "Levi", hp: 100, power: 40, universe: .attackOnTitan),
    TitanShifter(name: "Eren", hp: 150, power: 50, titanForm: "Attack"),
    Sorcerer(name: "Gojo", hp: 120, power: 60, cursedEnergy: 200)
]
print("Characters")
for c in chars { c.status(); print("Attack: \(c.attack())") }

// 13-15. Healable protocol
protocol Healable { func heal() -> Int }
extension Healable { func heal() -> Int { 10 } }

class Healer: Character, Healable {
    func heal() -> Int { 25 }
}
let healer = Healer(name: "Shoko", hp: 80, power: 20, universe: .jujutsuKaisen)
print("\nHealed for: \(healer.heal())")

// 16-18. Delegation
protocol BattleLoggerDelegate: AnyObject {
    func didStartBattle(_ a: String, _ b: String)
    func didEndBattle(winner: String)
}

class BattleLogger: BattleLoggerDelegate {
    func didStartBattle(_ a: String, _ b: String) { print("\nBattle: \(a) vs \(b)") }
    func didEndBattle(winner: String) { print("Winner: \(winner)") }
}

class BattleArena {
    weak var delegate: BattleLoggerDelegate?
    func fight(_ a: Character, _ b: Character) {
        delegate?.didStartBattle(a.name, b.name)
        for i in 1...3 {
            b.takeDamage(a.attack()); a.takeDamage(b.attack())
            print("Round \(i): \(a.name) HP:\(a.hp) | \(b.name) HP:\(b.hp)")
            if a.hp == 0 || b.hp == 0 { break }
        }
        delegate?.didEndBattle(winner: a.hp > b.hp ? a.name : b.name)
    }
}

// 19-20. Generic function
func pickRandom<T>(_ items: [T]) -> T? { items.randomElement() }
print("\nRandom char: \(pickRandom(chars)?.name ?? "none")")
print("Random universe: \(pickRandom([Universe.attackOnTitan, .jujutsuKaisen, .demonSlayer])?.title ?? "none")")

// 21-23. Error handling
enum BattleError: Error { case sameFighter, deadFighter, invalidPower }

func validateForBattle(_ a: Character, _ b: Character) throws {
    if a.name == b.name { throw BattleError.sameFighter }
    if a.hp == 0 || b.hp == 0 { throw BattleError.deadFighter }
    if a.power <= 0 { throw BattleError.invalidPower }
}

let f1 = TitanShifter(name: "Eren", hp: 100, power: 50, titanForm: "Attack")
let f2 = Sorcerer(name: "Gojo", hp: 100, power: 60, cursedEnergy: 200)

do {
    try validateForBattle(f1, f2)
    let arena = BattleArena()
    let logger = BattleLogger()
    arena.delegate = logger
    arena.fight(f1, f2)
} catch BattleError.sameFighter { print("Error: same fighter")
} catch BattleError.deadFighter { print("Error: dead fighter cannot battle")
} catch { print("Error: \(error)") }

// After battle
print("\nAfter Battle")
f1.status(); f2.status()

// 24. Map/Filter/Sorted
print("\nMap/Filter/Sorted")
print("Map: \(chars.map { "\($0.name) (HP:\($0.hp))" })")
print("Filter HP>50: \(chars.filter { $0.hp > 50 }.map { $0.name })")
print("Sorted by power: \(chars.sorted { $0.power > $1.power }.map { $0.name })")
