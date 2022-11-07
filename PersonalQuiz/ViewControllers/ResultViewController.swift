//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
   // 4. Отобразить результаты в соответствии с этим животным
    
    // использовать функции высшего порядка map и sorted
    // отдельный метод для поиска результата
    var answers: [Answer] = []
    
    @IBOutlet weak var resultOfTest: UILabel!
    @IBOutlet weak var textResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        resultOfTest.text = ("Да вы - \(mostCommonAnimal() ?? "")")
    }
    
    func mostCommonAnimal() -> String? {
        var result: String?
        var dictionary = [String: Int]()
        
        answers.forEach { (element) in
            if let count = dictionary[element.animal.definition] {
                dictionary[element.animal.definition] = count + 1
            } else {
                dictionary[element.animal.definition] = 1
            }
            
            var max = 0
            
            for (key, value) in dictionary {
                if value > max {
                    max = value
                    result = key
                }
            }
            
            switch element.animal.definition {
            case "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь.":
                result = "🐶"
                textResult.text = "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
            case "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество.":
                result = "🐱"
                textResult.text = "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
            case "Вам нравится все мягкое. Вы здоровы и полны энергии.":
                result = "🐰"
                textResult.text = "Вам нравится все мягкое. Вы здоровы и полны энергии."
            case "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях.":
                result = "🐢"
                textResult.text = "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
            default:
                break
            }
        }
        return result
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit{
        print("ResultVC has been delocated")
    }
    
}
