import Foundation

// Урок 1 - Квадратные уравнения
let a: Float = 7
let b: Float = 14
let c: Float = 2

var d: Float = pow(b, 2) - 4 * a * c

var x1: Float = 0
var x2: Float = 0

if(d < 0){
    
    print("Корней нет")
    
} else if(d > 0){
    
    x1 = (-b + sqrt(d)) / (2 * a)
    x2 = (-b - sqrt(d)) / (2 * a)
    
} else if(d == 0){
    
    x1 = (-b + sqrt(d)) / (2 * a)
    
}

// Урок 1 - Площадь, периметр и гипотенуза треугольника
let AB: Float = 3.6
let AC: Float = 4.2

let BC: Float = sqrt(pow(AB, 2) + pow(AC, 2))

let S: Float = (AB * AC) / 2
let P: Float = AB + AC + BC

print("Длина первого катета \(AB)")
print("Длина второго катета \(AC)")

print("Площадь треугольника \(S)")
print("Периметр треугольника \(P)")
print("Гипотенуза треугольника \(BC)")

// Урок 1 - Сумма вклада через 5 лет
let deposit: Float = 1000
let percent: Float = 10
let years: Int = 5

var sum: Float = deposit

for _ in 1...years {
    sum = sum + (sum * (percent / 100))
}

print("Сумма вклада (\(deposit)) под \(percent)% за \(years) лет составит: \(sum)")
