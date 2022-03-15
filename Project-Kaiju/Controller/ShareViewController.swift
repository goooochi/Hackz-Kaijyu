//
//  ShareViewController.swift
//  Project-Kaiju
//
//  Created by Yuki on 2022/03/15.
//

import UIKit

class ShareViewController: UIViewController {
    
    var resultImage = UIImage()
    var commentString = String()
    var screenShotImage = UIImage()
    
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    
    @IBOutlet weak var commentLabel: UILabel!
    

    @IBOutlet weak var Share: UIButton!
    
    @IBOutlet weak var back: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        resultImageView.image = resultImage
        commentLabel.text = commentString
        
        //commentLabelにフォントサイズが入るようにする
        commentLabel.adjustsFontSizeToFitWidth = true
        Share.layer.cornerRadius = 20.0
        back.layer.cornerRadius = 20.0

        
    }
    

   
    @IBAction func share(_ sender: Any) {
        
        //スクリーンショットを撮る
        takeScreenShot()
        
        //アクティビティービューに載っけて、シェアする
        let items = [screenShotImage] as [Any]
 
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activityVC, animated: true, completion: nil)
        
    }
    
    
    //スクリーンショットを自動で撮る
    func takeScreenShot(){
       
        //撮る幅と高さを決める
        let width = CGFloat(UIScreen.main.bounds.size.width)
        
        //画面の上のステータスバーは写したくないので、1.3で割る
        let height = CGFloat(UIScreen.main.bounds.size.height/1.3)
        
        let size = CGSize(width: width, height: height)
        
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //viewに書き出す
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        
        UIGraphicsEndImageContext()
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
