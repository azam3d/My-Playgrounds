//: Playground - noun: a place where people can play

import UIKit

let animals = ["cat", "dog", "sheep", "dolphin", "tiger"]

func capitalize(s: String) -> String {
    return s.uppercased()
}

var uppercaseAnimals: [String] = []
for animal in animals {
    let uppercaseAnimal = capitalize(s: animal)
    uppercaseAnimals.append(uppercaseAnimal)
}
uppercaseAnimals

func characterForCharacterName(c: String) -> Character {
    let curlyBracedCharacterName = "\\N{\(c)}"
    let charStr = curlyBracedCharacterName.applyingTransform(
        StringTransform.toUnicodeName, reverse: true)
    return charStr!.characters.first!
}

var animalEmojis: [Character] = []
for uppercaseAnimal in uppercaseAnimals {
    let emoji = characterForCharacterName(c: uppercaseAnimal)
    animalEmojis.append(emoji)
}
animalEmojis

animals.map(capitalize)
uppercaseAnimals.map(characterForCharacterName)

// map
let uppercaseAnimals2 = animals.map({ $0.uppercased() })

// filter
let threeCharacterAnimals = animals.filter() {
    $0.characters.count == 3
}
threeCharacterAnimals

// reduce
func sum(_ items: [Int]) -> Int {
    return items.reduce(0, +)
}
let total = sum([1, 2, 3])
total

// flatmap https://www.natashatherobot.com/swift-2-flatmap/
let minionImagesFlattened = (1...7).flatMap { "\($0 * 2)" }

let nestedArray = [[1,2,3], [4,5,6]]
let flattenedArray = nestedArray.flatMap { $0 }
flattenedArray

let nestedArray2 = [[1,2,3], [4,5,6]]
let multipliedFlattenedArray = nestedArray2.flatMap { $0.map { $0 * 2 } }
multipliedFlattenedArray

//  fully written-out version
let nestedArray3 = [[1,2,3], [4,5,6]]

let multipliedFlattenedArray3 = nestedArray3.flatMap { array in
    array.map { element in
        element * 2 }
}
multipliedFlattenedArray3

