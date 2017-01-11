//: Playground - noun: a place where people can play

import UIKit

struct Song {
    let genre: String
    let songTitle: String
    var artist: String
    let album: String
    static var formattedSong: String {
        print("Now playing \(songTitle) by \(artist).")
        return "someString"
    }
}

let blankSpace = Song(genre: "Pop", songTitle: "Blank Space", artist: "Taylor Swift")
blankSpace.a

Song.formattedSong
