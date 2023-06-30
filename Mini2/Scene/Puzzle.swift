//
//  Puzzle.swift
//  Mini2
//
//  Created by Brandon Nicolas Marlim on 6/30/23.
//

import SpriteKit
struct Puzzle : Decodable {
    let type : String
    let pieces : [Piece]
    let nextPuzzle : String?
    
    init?(fileNamed resource: String) {
        guard let gameURL = Bundle.main.url(forResource: resource, withExtension:nil) else {
            print("File \(resource) does not exist")
            return nil
        }
        let gameData : Data
        do {
            gameData = try Data(contentsOf: gameURL)
        } catch {
            print("Invalid data: \(error)")
            return nil
        }
        let jsonDecoder = JSONDecoder()
        do {
            self = try jsonDecoder.decode(Puzzle.self, from: gameData)
        } catch {
            print("Failed to decode JSON: \(error)")
            return nil
        }
    }
}
