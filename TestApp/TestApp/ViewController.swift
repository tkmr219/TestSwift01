//
//  ViewController.swift
//  TestApp
//
//  Created by takemura on 2018/02/20.
//  Copyright © 2018年 takemura. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private let Identifier = "Cell"
    
    private let items = ["UIImageViewサンプル", "MKMapViewサンプル"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        alamofireExample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alamofireExample() -> Void {
        
//        Alamofire.request("https://httpbin.org/get").responseJSON { (response) in
//            print("Request: \(String(describing: response.request))")
//            print("Response: \(String(describing: response.response))")
//            print("Result: \(response.result)")
//
//            if let json = response.result.value {
//                print("JSON: \(json)")
//            }
//
//            let decode = try! JSONDecoder().decode(OrgGet.self, from: response.data!)
//            print("decode: \(decode)")
//        }
        
//        let url = "https://httpbin.org/get"
//        let parameters = [
//            "grant_type": "password",
//            "client_id": "SF_SLIENT_ID",
//            "user_name": "aaaa"
//        ]
//        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
//            switch response.result {
//            case .success:
//                if let json = response.result.value {
//                    print("JSON: \(json)")
//                }
//            case .failure(let error):
//                print("error: \(error)")
//            }
//        }
        
        
//        let url:String = "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"
//        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
//
////            if let json = response.result.value {
////                print("JSON: \(json)")
////            }
//
//            let weatherNews = try! JSONDecoder().decode(WeatherNews.self, from:response.data!)
//            print(weatherNews)
//        }
    }

}

// UITableViewDelegateを実装した部分
extension ViewController : UITableViewDelegate {
    // テーブルのセル選択時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Main.storyboardを取得
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let row = indexPath.row
        if row == 0 {
            // CatNavigationViewControllerのIDのViewControllerを取得してモーダル表示
            let vc = storyBoard.instantiateViewController(withIdentifier: "CatNavigationViewController")
            self.present(vc, animated: true, completion: nil)
        }
        else {
            // MapViewControllerのIDのViewControllerを取得して画面遷移
            let mapVC = storyBoard.instantiateViewController(withIdentifier: "MapViewController")
            self.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
}

// UITableViewDataSourceを実装した部分
extension ViewController : UITableViewDataSource {
    // テーブルのセル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // テーブルに表示するセル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.Identifier)
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
}



