//
//  ViewController.swift
//  Project-Kaiju
//
//  Created by Yuki on 2022/03/15.
//

import UIKit



class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var Label: UILabel!
    
    
    
    let upperPickerView = UIPickerView()
    let upperData = [
        "自動生成","アルバム","カメラ"
    ]
    
    
    
//    let lowerPickerView = UIPickerView()
//    let lowerData = [
//
//        "5","10","15"
//
//    ]
    
     
    
    @IBOutlet weak var selectPicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        selectPicker.delegate = self
        selectPicker.dataSource = self
        
        
        
    }
    
    
    
    
    //IDつける
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    // UIPickerViewの行数、リストの数
        func pickerView(_ pickerView: UIPickerView,
                        numberOfRowsInComponent component: Int) -> Int {
            return upperData.count
        }
    
    
    // UIPickerViewの最初の表示
       func pickerView(_ pickerView: UIPickerView,
                       titleForRow row: Int,
                       forComponent component: Int) -> String? {
           
           return upperData[row]
       }
            
    
    
    // UIPickerViewのRowが選択された時の挙動
        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            
            Label.text = upperData[row]
            
        }
    
    
    
    
    @IBAction func Next(_ sender: Any) {

        
        if Label.text == upperData[0]{
            
            performSegue(withIdentifier: "API", sender: nil)
        
            
        }
        
        if Label.text == upperData[1]{
            
            performSegue(withIdentifier: "Album", sender: nil)
        
            
        }
        
        if Label.text == upperData[2]{
            
            performSegue(withIdentifier: "Camera", sender: nil)
        
            
        }
        
        
    }
    
}
