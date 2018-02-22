//
//  CatViewController.swift
//  TestApp
//
//  Created by takemura on 2018/02/20.
//  Copyright © 2018年 takemura. All rights reserved.
//

import UIKit

class CatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIImageを初期化
        let image = UIImage(named: "cat")
        // UIImageViewを初期化
        let imageView = UIImageView(image: image)
        // UIImageViewの矩形を指定
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 130)
        // UIImageViewの中心位置を指定
        imageView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func pressCloseButton(_ sender: Any) {
        // モーダルで表示した画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
}
