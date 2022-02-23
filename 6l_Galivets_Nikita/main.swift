//
//  main.swift
//  6l_Galivets_Nikita
//
//  Created by Nikita on 21/2/22.
//

import Foundation

//1) Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2) Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//*3) Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue <AnyTypeOfElement> {
    
    private var line = [AnyTypeOfElement]()
    
    ///Добавление  элемента
    mutating func push(element: AnyTypeOfElement) {
        line.append(element)
    }
    
    ///Удвление  элемента
    mutating func pop() -> AnyTypeOfElement? {
        line.isEmpty ? nil : line.removeFirst()
    }
    
    ///Проверка первого элемента в очереди
    mutating func peek() -> AnyTypeOfElement? {
        line.isEmpty ? nil : line[0]
    }
    
    ///Фильтрация с кастомным условием
    func filtering(make:(AnyTypeOfElement) -> Bool) -> [AnyTypeOfElement] {
        
        var result = [AnyTypeOfElement]()
        
        for i in line {
            if make(i) {
                result.append(i)
            }
        }
        
        return result
        
    }
    
    //MARK: TO DO - Method for closure with two parameters
//    func sorting(make:(_ s0: AnyTypeOfElement, _ s1: AnyTypeOfElement) -> Bool) -> [AnyTypeOfElement] {
//
//        var result = [AnyTypeOfElement]()
//
//
//        return result
//    }
    
    ///Вывод содержимого очереди в терминал
    func status() {
        line.isEmpty ? print("Empty") : print("Количество элементов: \(line.count), Элементы очереди: \(line)")
    }
    
    subscript(index: Int) -> AnyTypeOfElement? {
        
        get {
            guard line.count <= index else { return line[index] }
            return nil
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            guard line.count != index && line.count >= index else { return print("Индекс вне диапозона") }
            self.line[index] = newValue
        }
    }
}
var intQueue = Queue<Int>()
intQueue.push(element: 10)
intQueue[0] = 2555
intQueue[-1]
intQueue.push(element: 20)
intQueue.push(element: 30)
intQueue.push(element: 40)
intQueue.push(element: 5)
intQueue.push(element: 1)
intQueue.push(element: 2)
intQueue.push(element: 3)
intQueue.push(element: 8)
intQueue.push(element: 50)
intQueue.push(element: 11)
intQueue.push(element: 0)
intQueue.push(element: 17)
intQueue.push(element: 4)
intQueue.push(element: 56)
intQueue.push(element: 124)
intQueue.push(element: 29)
intQueue.push(element: 33)
intQueue.push(element: 74)
print("Четные")
print(intQueue.filtering(make: {$0 % 2 == 0}))
print("Нечетные")
print(intQueue.filtering(make: {$0 % 2 != 0}))
print("Все числа, которые делятся на 5")
print(intQueue.filtering(make: {$0 % 5 == 0}))
print(intQueue[23])
//print(intQueue.sorting(make: {$0 > $1}))

print("""

__________________________________________________________

""")


var stringQueue = Queue<String>()
stringQueue.push(element: "Nik")
stringQueue.push(element: "Alice")
stringQueue.push(element: "John")
stringQueue.push(element: "Marry")
stringQueue.push(element: "Jin")
stringQueue.push(element: "Petrush")
stringQueue.push(element: "Kally")
stringQueue.push(element: "Stix")
stringQueue.push(element: "Jimy")
stringQueue[0] = "James"
stringQueue[5] = "Nik"
stringQueue[7] = "Axel"
stringQueue[3] = "Sponge Bob"
stringQueue[8] = "Jimy"
stringQueue.status()
stringQueue[8] = "Fin"
stringQueue.status()
let a = stringQueue.peek()
print(a!)
let b = stringQueue.pop()
print(b!)
let c = stringQueue.peek()
print(c!)
