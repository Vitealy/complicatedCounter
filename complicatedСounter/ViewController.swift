//
//  ViewController.swift
//  complicatedСounter
//
//  Created by Vitaly Kashavkin on 18.02.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyValues: UITextView!
    private var scoreCounter: Int = 0 // Счетчик для отслеживания количества нажатий
    private var history: [String] = []
    let dateFormatter: DateFormatter = {  // Объявляем и настраиваем DateFormatter в вашем классе!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Формат даты и времени
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройки начального значения для счетчика и текстового поля
        counterLabel.text = "\(scoreCounter)"
        historyValues.isEditable = false
        historyValues.text = "История изменений:"
        
    }

    func updateHistoryTextView() {
        let historyText = history.joined(separator: "\n")
        historyValues.text = historyText
    }
    
    @IBAction func plusButton(_ sender: Any) {
        // Увеличиваем счетчик на +1 при каждом нажатии на кнопку
        scoreCounter += 1
        // Обновляем текст на экране с текущим значением счетчика
        counterLabel.text = "\(scoreCounter)"
        let currentDate = Date()   // Date - представляет текущую дату и время.
        let formattedDate = dateFormatter.string(from: currentDate) // Преобразование объекта currentDate в строку в соответствии с заданным форматом.
        history.append("\(formattedDate)\n Добавлено +1. Текущее значение: \(scoreCounter)")
        updateHistoryTextView()
    }
    
    @IBAction func minusButton(_ sender: Any) {
        // Уменьшаем счетчик на -1 при каждом нажатии на кнопку
        if scoreCounter > 0 {
            scoreCounter -= 1
            // Обновляем текст на экране с текущим значением счетчика
            counterLabel.text = "\(scoreCounter)"
            let currentDate = Date() // Date - представляет текущую дату и время.
            let formattedDate = dateFormatter.string(from: currentDate) // Преобразование объекта currentDate в строку в соответствии с заданным форматом.
            history.append("\(formattedDate)\n Вычтено -1. Текущее значение: \(scoreCounter)")
            updateHistoryTextView()
        } else {
            let currentDate = Date() // Date - представляет текущую дату и время.
            let formattedDate = dateFormatter.string(from: currentDate) // Преобразование объекта currentDate в строку в соответствии с заданным форматом.
            history.append("\(formattedDate)\n Попытка уменьшить значение счётчика ниже 0. Текущее значение: \(scoreCounter)")
            updateHistoryTextView()
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        // Сбрасываем данные счетчика приравнивая его значение к 0
        scoreCounter = 0
        // Обновляем текст на экране с текущим значением счетчика
        counterLabel.text = "\(scoreCounter)"
        let currentDate = Date() // Date - представляет текущую дату и время.
        let formattedDate = dateFormatter.string(from: currentDate) // Преобразование объекта currentDate в строку в соответствии с заданным форматом.
        history.append("\(formattedDate)\n Счётчик сброшен. Текущее значение: \(scoreCounter)")
        updateHistoryTextView()
    }
    
    
}

