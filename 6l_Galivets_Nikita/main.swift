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
    
    mutating func add (element: AnyTypeOfElement) {
        line.append(element)
    }
    
    mutating func remove () -> AnyTypeOfElement? {
        line.isEmpty != true ? line.removeFirst() : nil
    }
    
    mutating func peek () -> AnyTypeOfElement? {
        line.isEmpty != true ? line[0] : nil
    }
    
    func filtering(make:(AnyTypeOfElement) -> Bool) -> [AnyTypeOfElement] {
        
        var result = [AnyTypeOfElement]()
        
        for i in line {
            if make(i) {
                result.append(i)
            }
        }
        
        return result
        
    }
    
    subscript(index: Int) -> AnyTypeOfElement {
        
        get {
            return line[index]
        }
        set(newValue) {
            self.line[index] = newValue
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
intQueue.add(element: 4)
print(intQueue.filtering(make: {$0 % 2 == 0}))

