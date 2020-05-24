//
//  ViewController.swift
//  PartTimer
//
//  Created by ぷりん on 2020/04/21.
//  Copyright © 2020 梁有希. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

   
    @IBOutlet weak var goHourText: UITextField!
    @IBOutlet weak var goMinuteText: UITextField!
    @IBOutlet weak var LeaveHourText: UITextField!
    @IBOutlet weak var LeaveMinuteText: UITextField!
   
    @IBOutlet weak var breakMinuteText: UITextField!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var nowTimeLabel: UILabel!
    
    
    @IBOutlet weak var segmentButton: UISegmentedControl!
    
    
    var amountHour:Float=0
    var amountMinute:Float=0
    var totalMinute:Float=0
    var wage:Float=1000
    var income:Float=0
    var wage1 = 0
    var wage2 = 0
    var name1 = "バイト１"
    var name2 = "バイト２"
    
    let dt = Date()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //delegate設定など
        setupText()
        //保存していた出勤時刻を表示
        readText()
        //userdefaultsで時給を読み込む
        readWage()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを閉じる
        textField.resignFirstResponder()
        //入力された文字を取り出す
        if let searchKey = textField.text {
            //入力された文字をデバッグエリアに表示
            print(searchKey)
        }
        return true
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        guard let goHour = Int(goHourText.text!) else {
            print("整数を入力してください")
            return
        }
        guard let goMinute = Int(goMinuteText.text!) else {
            print("整数を入力してください")
            return
        }
        guard let LeaveHour = Int(LeaveHourText.text!) else {
            print("整数を入力してください")
            return
        }
        guard let LeaveMinute = Int(LeaveMinuteText.text!) else {
            print("整数を入力してください")
            return
        }
        guard let breakMinute = Int(breakMinuteText.text!) else {
            print("整数を入力してください")
            return
        }
        
        amountHour = Float(LeaveHour - goHour)
        amountMinute = Float(LeaveMinute - goMinute)
        totalMinute = amountHour*60 + amountMinute-Float(breakMinute)
        if totalMinute > 480 {
            income = (wage*1.25/60)*(totalMinute-480)+wage*8
        }else{
            income = (wage/60)*totalMinute
        }
        
        
        incomeLabel.text=String(Int(income))
    }
    
    //    ユーザーデフォルトに保存する
    @IBAction func saveButton(_ sender: Any) {
        guard let goHour = Int(goHourText.text!) else {
            print("整数を入力してください")
            return
        }
        guard let goMinute = Int(goMinuteText.text!) else {
            print("整数を入力してください")
            return
        }
        let defaults = UserDefaults.standard
        defaults.set(goHour, forKey: "goHour")
        defaults.set(goMinute, forKey: "goMinute")
        view.endEditing(true)
    }
    
    //  保存したテキストをタブ設定のTextfieldに表示する
    func readText(){
        let defaults = UserDefaults.standard
        let value1 = defaults.string(forKey: "goHour")
        let value2 = defaults.string(forKey: "goMinute")
        goHourText.text = value1
        goMinuteText.text = value2
    }
    
    func setupText(){
        //delegate設定
        goHourText.delegate = self
        goMinuteText.delegate = self
        LeaveHourText.delegate = self
        LeaveMinuteText.delegate = self
        //キーボードのタイプ設定
        self.goHourText.keyboardType = UIKeyboardType.numberPad
        self.goMinuteText.keyboardType = UIKeyboardType.numberPad
        self.LeaveHourText.keyboardType = UIKeyboardType.numberPad
        self.LeaveMinuteText.keyboardType = UIKeyboardType.numberPad
        self.breakMinuteText.keyboardType = UIKeyboardType.numberPad
        //休憩時間の表示
        breakMinuteText.text = "0"
        //現在時刻の取得と表示
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "Hm", options: 0, locale: Locale(identifier: "ja_JP"))
        nowTimeLabel.text = "現在時刻 "+dateFormatter.string(from: dt)
    }
    
    func readWage(){
        let settings = UserDefaults.standard
        name1 = settings.string(forKey: "name1") ?? "バイト1"
        wage1 = settings.integer(forKey: "wage1")
        name2 = settings.string(forKey: "name2") ?? "バイト2"
        wage2 = settings.integer(forKey: "wage2")
        segmentButton.setTitle(name1, forSegmentAt: 0)
        segmentButton.setTitle(name2, forSegmentAt: 1)
        
    }
    @IBAction func segmentButton(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            wage = Float(wage1)
        case 1:
            wage = Float(wage2)
        default:
            print("")
        }
    }

}

