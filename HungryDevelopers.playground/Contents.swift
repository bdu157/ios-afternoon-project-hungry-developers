import Foundation

var lock = NSLock()

class Spoon {
    
    var isBeingUsed : Bool
    
    func pickUp() {
        lock.lock()
        isBeingUsed = true
    }
    
    func putDown() {
        isBeingUsed = false
        lock.unlock()
    }
    
    init(isBeingUsed: Bool) {
        self.isBeingUsed = isBeingUsed
    }
    
}

class Developer {
    
    var name: String
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    
    init(name: String, leftSpoon: Spoon, rightSpoon: Spoon) {
        self.name = name
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
    }
    
    func think() {
        //pickup right and left
        if leftSpoon.isBeingUsed == false {
        leftSpoon.pickUp()
        print("\(name) picked up left spoon")
        }
        
        if rightSpoon.isBeingUsed == false {
        rightSpoon.pickUp()
        print("\(name) picking up right spoon")
        }
    }
    
    func eat() {
        //putdown right and left
        let randomTime = UInt32.random(in: 0xD800...0xDFFF)
        usleep(randomTime)
        leftSpoon.putDown()
        print("\(name) put down left spoon")
        usleep(randomTime)
        rightSpoon.putDown()
        print("\(name) put down right spoon")

    }
    
    func run() {
        while(true) {
            think()
            eat()
        }
    }
}

var spoon1 = Spoon(isBeingUsed: false)
var spoon2 = Spoon(isBeingUsed: false)
var spoon3 = Spoon(isBeingUsed: false)
var spoon4 = Spoon(isBeingUsed: false)
var spoon5 = Spoon(isBeingUsed: false)


var developer1 = Developer(name: "Dongwoo(1)", leftSpoon: spoon5, rightSpoon: spoon1)
var developer2 = Developer(name: "Chris(2)", leftSpoon: spoon1, rightSpoon: spoon2)
var developer3 = Developer(name: "Jaehoon(3)", leftSpoon: spoon2, rightSpoon: spoon3)
var developer4 = Developer(name: "Juhwan(4)", leftSpoon: spoon3, rightSpoon: spoon4)
var developer5 = Developer(name: "Kevin(5)", leftSpoon: spoon4, rightSpoon: spoon5)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}




