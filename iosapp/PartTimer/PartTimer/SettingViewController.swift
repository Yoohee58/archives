//
//  SettingViewController.swift
//  PartTimer
//
//  Created by ぷりん on 2020/04/21.
//  Copyright © 2020 梁有希. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var name1Text: UITextField!
    @IBOutlet weak var wage1Text: UITextField!
    @IBOutlet weak var name2Text: UITextField!
    @IBOutlet weak var wage2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //delegate設定
        name1Text.delegate = self
        wage1Text.delegate = self
        name2Text.delegate = self
        wage2Text.delegate = self
        //キーボード設定
        self.wage1Text.keyboardType = UIKeyboardType.numberPad
        self.wage2Text.keyboardType = UIKeyboardType.numberPad
        //保存していたデータを表示
        readData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func save1Button(_ sender: Any) {
        let name1 = name1Text.text
        guard let wage1 = Int(wage1Text.text!) else {
            print("整数を入力してください")
            return
        }
        let name2 = name2Text.text
        guard let wage2 = Int(wage2Text.text!) else {
            print("整数を入力してください")
            return
        }
        let defaults = UserDefaults.standard
        defaults.set(name1, forKey: "name1")
        defaults.set(wage1, forKey: "wage1")
        defaults.set(name2, forKey: "name2")
        defaults.set(wage2, forKey: "wage2")
        view.endEditing(true)
    }
    
    
    
    func readData(){
        let defaults = UserDefaults.standard
        let name1 = defaults.string(forKey: "name1")
        let wage1 = defaults.string(forKey: "wage1")
        let name2 = defaults.string(forKey: "name2")
        let wage2 = defaults.string(forKey: "wage2")
        name1Text.text = name1
        wage1Text.text = wage1
        name2Text.text = name2
        wage2Text.text = wage2
        
    }
    
}
