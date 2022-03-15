//
//  CameraViewController.swift
//  Project-Kaiju
//
//  Created by Yuki on 2022/03/15.
//

import UIKit
import Photos

class CameraViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentString: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        commentString.layer.cornerRadius = 25.0
                
                PHPhotoLibrary.requestAuthorization{(status) in
                    
                    switch(status){
                        
                    case .authorized:break
                    case .notDetermined:break
                    case .restricted:break
                    case .denied:break
                    case .limited:break
                    @unknown default: break
                        
                    }
        
    }
        
        
}
    
    
    
    @IBAction func cameraAction(_ sender: Any) {
        
        
        //UIImagePickerController.SourceTypeという型
        let sourceType:UIImagePickerController.SourceType = .camera
        //メソッドcreateImagePickerが呼ばれる
        createImagePicker(sourseType: sourceType)
        
        
    }
    
    
    func createImagePicker(sourseType:UIImagePickerController.SourceType){
        
        
        
        //インスタンスを作成
        let cameraPicker = UIImagePickerController()
        
        cameraPicker.sourceType = sourseType
        
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
