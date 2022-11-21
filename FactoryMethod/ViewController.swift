//
//  ViewController.swift
//  FactoryMethod
//
//  Created by 王亚威 on 2022/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 案例一:
        // 简单工厂模式
        let oper = OperationFactory.createOperation(operate: "+")
        oper?.a = 1
        oper?.b = 2
        let result = oper?.getResult()
        print("result----", result!)
        
        
        // 工厂方法模式
        let addFactory = AddFactory()
        let addOperation = addFactory.createOperation()
        addOperation.a = 1
        addOperation.b = 5
        let result1 = addOperation.getResult()
        print("a + b =", result1)
        
        let subFactory = SubFactory()
        let subOperation = subFactory.createOperation()
        subOperation.a = 8
        subOperation.b = 5
        let result2 = subOperation.getResult()
        print("a - b =", result2)
        
        ///案例二:
        // 没有简单工厂模式时
        let stu = Undergraduate()
        stu.sweep()
        
        let stu1 = Undergraduate()
        stu1.wash()
        
        let stu2 = Undergraduate()
        stu2.buyRice()
        
        // 简单工厂模式
        let stu00 = SimpleFactory.createLeiFeng(type: "学雷锋的大学生")
        stu00?.sweep()
        
        let stu11 = SimpleFactory.createLeiFeng(type: "学雷锋的大学生")
        stu11?.wash()
        
        let stu22 = SimpleFactory.createLeiFeng(type: "学雷锋的大学生")
        stu22?.buyRice()
        
        // 工厂方法模式
        let underFactory = UndergraduateFactory()
        let student = underFactory.createLeiFeng()
        student.sweep()
        student.wash()
        student.buyRice()
        
    }

}

class Operation {
    var a: Int = 0
    var b: Int = 0
    func getResult() -> Int {
        return 0
    }
}

class OperationAdd: Operation {
    override func getResult() -> Int {
        var result = 0
        result = a + b
        return result
    }
}

class OperationSub: Operation {
    override func getResult() -> Int {
        var result = 0
        result = a - b
        return result
    }
}

class OperationMut: Operation {
    override func getResult() -> Int {
        var result = 0
        result = a * b
        return result
    }
}

class OperationDiv: Operation {
    override func getResult() -> Int {
        var result = 0
        if b == 0 {
            result = a / b
        }
        return result
    }
}

class OperationFactory {
    static func createOperation(operate: String) -> Operation? {
        var oper: Operation?
        switch operate {
        case "+":
            oper = OperationAdd()
        case "-":
            oper = OperationSub()
        case "*":
            oper = OperationMut()
        case "/":
            oper = OperationDiv()
        default:
            print("undefined operation")
        }
        return oper
    }
}

//工厂方法模式
protocol IFactory {
    func createOperation() -> Operation
}

class AddFactory: IFactory {
    func createOperation() -> Operation {
        return OperationAdd()
    }
}

class SubFactory: IFactory {
    func createOperation() -> Operation {
        return OperationSub()
    }
}

class MutFactory: IFactory {
    func createOperation() -> Operation {
        return OperationMut()
    }
}

class DivFactory: IFactory {
    func createOperation() -> Operation {
        return OperationDiv()
    }
}

class LeiFeng {
    func sweep() {
        print("扫地")
    }
    
    func wash() {
        print("洗衣")
    }
    
    func buyRice() {
        print("买米")
    }
}

class Undergraduate: LeiFeng {
 
}

class Volunteer: LeiFeng {
    
}

class SimpleFactory {
    static func createLeiFeng(type: String) -> LeiFeng? {
        var result: LeiFeng?
        switch type {
        case "学雷锋的大学生":
            result = Undergraduate()
        case "社区志愿者":
            result = Volunteer()
        default:
            print("undefined team")
        }
        return result
    }
}

// 工厂方法模式
protocol IIFactory {
    func createLeiFeng() -> LeiFeng
}


class UndergraduateFactory: IIFactory {
    func createLeiFeng() -> LeiFeng {
        return Undergraduate()
    }
}

class VolunteerFactory: IIFactory {
    func createLeiFeng() -> LeiFeng {
        return Volunteer()
    }
}
