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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройки начального значения для счетчика и текстового поля
        counterLabel.text = "\(scoreCounter)"
        historyValues.isEditable = false
        
    }

    func updateHistoryTextView() {
        let historyText = history.joined(separator: "\n")
        historyValues.text = historyText
    }
    
    @IBAction func plusButton(_ sender: Any) {
        // Увеличиваем счетчик на 1 при каждом нажатии на кнопку
        scoreCounter += 1
        // Обновляем текст на экране с текущим значением счетчика
        counterLabel.text = "\(scoreCounter)"
        history.append("Добавлено +1. Текущее значение: \(scoreCounter)")
        updateHistoryTextView()
    }
    
    @IBAction func minusButton(_ sender: Any) {
        scoreCounter = max(scoreCounter - 1, 0)
        counterLabel.text = "\(scoreCounter)"
        history.append("Вычтено -1. Текущее значение: \(scoreCounter)")
        updateHistoryTextView()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        scoreCounter = 0
        counterLabel.text = "\(scoreCounter)"
        history.append("Счётчик сброшен. Текущее значение: \(scoreCounter)")
        updateHistoryTextView()
    }
    
    
}

