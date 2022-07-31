//
//  ViewController.swift
//  Right On Target
//
//  Created by Юлия Кунгурова on 27.07.2022.
//  Copyright © 2022 Юлия Кунгурова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    // Ленивое свойство для хранения ViewController
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    // Приватный метод, загружающий View Controller
     private func getSecondViewController() -> SecondViewController {
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
     return viewController as! SecondViewController
     }
    
    // Метод для перехода present
     @IBAction func showNextScreen() {        
        self.present(secondViewController, animated: true, completion: nil)
     }
    
    @IBAction func checkNumber() {
        
            // Получем значение на слайдере
            let numSlider = Int(self.slider.value.rounded())
            
            // Сравниваем значение с загаданным и подсчитываем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            
            if self.round == 5 {
                // Выводим информационное окно с результатами игры
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков",
                    preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(
                    title: "Начать заново",
                    style: .default,
                    handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
                
            } else {
                self.round += 1
            }
            
            // Генерируем случайное число
            self.number = Int.random(in: 1...50)
            // Передаем значение случайного числа в label
            self.label.text = String(self.number)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // Генерируем случайное число
        self.number = Int.random(in: 1...50)
        // Передаем значение случайного числа в label
        self.label.text = String(self.number)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Прекрасно подходит для создания новых графических элементов с помощью кода
    override func loadView() {
        super.loadView()
        print("loadView")
        
        // Создаем метку для вывода номера версии
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        // Изменяем текст метки
        versionLabel.text = "Версия 1.1"
        // Добавляем метку в родительский view
        self.view.addSubview(versionLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}

