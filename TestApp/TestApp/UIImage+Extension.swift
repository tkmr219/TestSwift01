//
//  UIImage+Extension.swift
//  TestApp
//
//  Created by takemura on 2018/02/20.
//  Copyright © 2018年 takemura. All rights reserved.
//

import UIKit

extension UIImage {
    // UIImageを円形に
    func circle() -> UIImage {
        // 縦横小さい方を優先して矩形を定義
        let rect = CGSize(width: min(size.width,size.height), height: min(size.width,size.height))
        // UIImageViewを生成して矩形の半分のサイズで角丸に
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: rect))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = rect.width / 2
        imageView.layer.masksToBounds = true
        // UIImageViewから画像として出力
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        imageView.layer.render(in: context!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}
