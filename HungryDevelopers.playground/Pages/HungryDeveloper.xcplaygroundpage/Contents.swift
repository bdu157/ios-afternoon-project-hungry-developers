import Foundation

class Spoon {
    
    private var lock = NSLock()
    //var isBeingUsed : Bool
    var index: Int
    
    func pickUp() {
        lock.lock()
        //isBeingUsed = true
    }
    
    func putDown() {
        //isBeingUsed = false
        lock.unlock()
    }
    
    init(index: Int) {
       // self.isBeingUsed = isBeingUsed
        self.index = index
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
        
            print("\(name) is thinking")
        if leftSpoon.index < rightSpoon.index {
            leftSpoon.pickUp()
            print("\(name) picked up left spoon")
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
        } else {
            rightSpoon.pickUp()
            print("\(name) picked up right spoon")
            leftSpoon.pickUp()
            print("\(name) picked up left spoon")
        }
    }
    
        
//        if rightSpoon.isBeingUsed == false {
//        rightSpoon.pickUp()
//        print("\(name) picking up right spoon")
//        }
//
//        if leftSpoon.isBeingUsed == false {
//        leftSpoon.pickUp()
//        print("\(name) picking up left spoon")
//        }
//    }

    
    func eat() {
        //putdown right and left
        //let randomTime = UInt32.random(in: 0xD800...0xDFFF)
        print("\(name) is eating")
        
        usleep(1000)
        leftSpoon.putDown()
        print("\(name) put down left spoon")
        usleep(1000)
        rightSpoon.putDown()
        print("\(name) put down right spoon")

    
//        usleep(1000)
//        if leftSpoon.isBeingUsed == true {
//        leftSpoon.putDown()
//        print("\(name) put down left spoon")
//        }
//        usleep(1000)
//        if rightSpoon.isBeingUsed == true {
//        rightSpoon.putDown()
//        print("\(name) put down right spoon")
//        }
    }
    
    func run() {
        while(true) {
            print("while loop starts----------------------------------------")
            think()
            eat()
            return
        }
    }
}

var spoon1 = Spoon(index: 1)
var spoon2 = Spoon(index: 2)
var spoon3 = Spoon(index: 3)
var spoon4 = Spoon(index: 4)
var spoon5 = Spoon(index: 5)


var developer1 = Developer(name: "Dongwoo(1)", leftSpoon: spoon5, rightSpoon: spoon1)
var developer2 = Developer(name: "Chris(2)", leftSpoon: spoon1, rightSpoon: spoon2)
var developer3 = Developer(name: "Jaehoon(3)", leftSpoon: spoon2, rightSpoon: spoon3)
var developer4 = Developer(name: "Juhwan(4)", leftSpoon: spoon3, rightSpoon: spoon4)
var developer5 = Developer(name: "Kevin(5)", leftSpoon: spoon4, rightSpoon: spoon5)

let developers = [developer1, developer2, developer3, developer4, developer5]

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}




