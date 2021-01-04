import Foundation

// Урок 2 - Функция определения четности числа
func isEven(num: Int) -> Bool {

    return (num % 2 == 0) ? true : false;
}

// Урок 2 - Функция определяет делится ли число без остатка на 3
func isDivBy3(num: Int) -> Bool {

    return (num % 3 == 0) ? true : false;
}

// Урок 2 - Возрастающий массив
var Arr: [Int] = []

for i in 0...100 {
    Arr.append(i)
}

// Урок 2 - Удалить из массива четные числа и числа, которые делятся на три
for (index, value) in Arr.enumerated() {
    
    if(isEven(num: value)){
        
        Arr.remove(at: Arr.firstIndex(of: value)!)
        
    } else if(isDivBy3(num: value)){
        
        Arr.remove(at: Arr.firstIndex(of: value)!)
        
    }
}

print(Arr)

// Урок 2 - Фунция добавления чисел Фибоначчи
func fibArray(num: Int) -> [Double]{

    var fibArray: [Double] = []
    
    for i in 0..<num {
        
        if(i < 2){
        
            fibArray.append( Double(i) );
        
        }else{
            
            fibArray.append( Double(fibArray[i-2] + fibArray[i-1]) )
        
        }
    }
    
    return fibArray
}

print(fibArray(num: 100))

