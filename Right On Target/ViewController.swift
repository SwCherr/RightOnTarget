//
//  ViewController.swift
//  Right On Target
//
//  Created by Юлия Кунгурова on 27.07.2022.
//  Copyright © 2022 Юлия Кунгурова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Сущность "Game"
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        }
    
    // Проверка выбранного пользователем числа
    @IBAction func checkNumber() {
        // Высчитываем очки за раунд
        game.calculateScore(with: Int(self.slider.value))
        
        // Проверяем, окончена ли игра
        if game.isGameEnded {
            self.showAlertWith(score: game.score)
            // Начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        // Обновляем данные о текущум значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        }
    
    // MARK: - Обновление View
    
    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String){
        self.label.text = newText
    }
    
    // Обновление всплывающего окна
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена Kisiks Myrisiks",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Начать заново",
            style: .default,
            handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

