//
//  Game.swift
//  Right On Target
//
//  Created by Юлия Кунгурова on 31.07.2022.
//  Copyright © 2022 Юлия Кунгурова. All rights reserved.
//

import Foundation

protocol GameProtocol {
    
    // Количестов заработанных очков
    var score: Int {get}
    // Загаданное значение
    var currentSecretValue: Int {get}
    // Проверяет, закончена ли игра
    var isGameEnded: Bool {get}
    
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int = 0
    // Минимальное загаданное число
    private var minSecretValue: Int
    // Максимальное загаданное число
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
    // Количество раундов
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else { return false }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        // Стартовое значение для выбора случайного числа не м\б > конечного
        guard startValue <= endValue else{
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    // Загадать и вернуть новое случайное занчение
    func getNewSecretValue() -> Int {
        return (minSecretValue...maxSecretValue).randomElement()!
    }
    
    // Подсчитывает количество очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 + value - currentSecretValue
        } else {
            score += 50
        }
    }
}
