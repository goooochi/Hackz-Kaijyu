//
//  AlbumViewController.swift
//  Project-Kaiju
//
//  Created by Yuki on 2022/03/15.
//

import UIKit
import Photos


class AlbumViewController: UIViewController ,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentString: UITextView!
    
    private let placeholder = "5文字だけ"
    private let textLenght = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentString.delegate = self
        commentString.text = placeholder
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    private func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replecementText text: String) ->  Bool{
        let existingLines = textView.text.components(separatedBy: .newlines)
        let newLines = text.components(separatedBy: .newlines)
        let linesAfterChange = existingLines.count + newLines.count - 1
        
        return linesAfterChange<=1 && commentString.text.count + (text.count - range.length)<=textLenght
    }
    
    func textViewDidChange(_ textView: UITextView) {
        _ = textView.text.components(separatedBy: .newlines)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = nil
            textView.textColor = .darkText
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = placeholder
            textView.textColor = .darkGray
        }
    }

    
    @IBAction func selectAlbum(_ sender: Any) {
        
        //UIImagePickerController.SourceTypeという型
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        //メソッドcreateImagePickerが呼ばれるx
        createImagePicker(sourceType: sourceType)
        
        
    }
    
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        
        //インスタンスを作成
        let cameraPicker = UIImagePickerController()
        
        cameraPicker.sourceType = sourceType
        
        //cameraPickerに使えるデリゲートメソッドをViewControllerでも使えるようにする
        //他のクラスから自分のクラスへ委任を受ける
        cameraPicker.delegate = self
        
        cameraPicker.allowsEditing = true
        
        self.present(cameraPicker, animated: true, completion: nil)
        
        
        
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let shareVC = segue.destination as! ShareViewController
        
        shareVC.commentString = commentString.text
        
        shareVC.resultImage = imageView.image!
        
    }
    
}
    
