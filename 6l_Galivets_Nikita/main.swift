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

struct Queue <AnyTypeOfElement: Equatable> {
    
    private var line = [AnyTypeOfElement]()
    
    ///Добавление  элемента
    mutating func add (element: AnyTypeOfElement) {
        line.append(element)
    }
    
    ///Удвление  элемента
    mutating func remove () -> AnyTypeOfElement? {
        line.isEmpty ? nil : line.removeFirst()
    }
    
    ///Проверка первого элемента в очереди
    mutating func peek () -> AnyTypeOfElement? {
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
    
    ///Вывод содержимого очереди в терминал
    func status() {
        line.isEmpty ? print("Empty") : print(line)
    }
    
    subscript(index: Int) -> AnyTypeOfElement? {
        
        get {
            guard line.count > index else { return nil }
            return line[index]
        }
        set(newValue) {
            
            self.line[index] = newValue!
            
        }
        
    }
}
var intQueue = Queue<Int>()
intQueue.add(element: 10)
intQueue[0] = 10
print(intQueue[0])
intQueue.add(element: 20)
intQueue.add(element: 30)
intQueue.add(element: 40)
intQueue.add(element: 5)
intQueue.add(element: 1)
intQueue.add(element: 2)
intQueue.add(element: 3)
intQueue.add(element: 8)
intQueue.add(element: 50)
intQueue.add(element: 11)
intQueue.add(element: 0)
intQueue.add(element: 17)
intQueue.add(element: 4)
intQueue.add(element: 56)
intQueue.add(element: 124)
intQueue.add(element: 29)
intQueue.add(element: 33)
intQueue.add(element: 74)
print("Четные")
print(intQueue.filtering(make: {$0 % 2 == 0}))
print("Нечетные")
print(intQueue.filtering(make: {$0 % 2 != 0}))
print("Все числа, которые делятся на 5")
print(intQueue.filtering(make: {$0 % 5 == 0}))

var stringQueue = Queue<String>()
stringQueue.add(element: "Nik")
stringQueue.add(element: "Alice")
stringQueue.add(element: "John")
stringQueue.add(element: "Marry")
stringQueue.add(element: "Jin")
stringQueue.add(element: "Petrush")
stringQueue.add(element: "Kally")
stringQueue.add(element: "Stix")
stringQueue.status()
stringQueue[0] = "James"
stringQueue[5] = "Nik"
stringQueue[7] = "Axel"
stringQueue[3] = "Sponge Bob"
print(stringQueue[20])
stringQueue.status()
