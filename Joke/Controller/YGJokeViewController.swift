//
//  YGJokeViewController.swift
//  Joke
//
//  Created by 杨业高(外包) on 2018/5/30.
//  Copyright © 2018年 杨业高(外包). All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

enum YGJokeViewControllerType : Int {
    case latest  //最新
    case suggest //推荐
    case imgrank //有图有真相
}

class YGJokeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var url : String = ""
    var page : Int = 1
    var table : UITableView!
    var datas : [YGJokeInfo]?

    init(type:YGJokeViewControllerType) {
        super.init(nibName: nil, bundle: nil)
        switch type {
        case .latest:
            self.url = "https://m2.qiushibaike.com/article/list/latest?count=10&page=\(page)"
        case .suggest:
            self.url = "https://m2.qiushibaike.com/article/list/suggest?count=10&page=\(page)"
        case .imgrank:
            self.url = "https://m2.qiushibaike.com/article/list/imgrank?count=10&page=\(page)"
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.table = UITableView(frame: self.view.bounds)
        self.table.delegate = self
        self.table.dataSource = self
        self.table.rowHeight = UITableViewAutomaticDimension
        self.table.estimatedRowHeight = 44.0
        self.table.register(YGJokeCell.self, forCellReuseIdentifier: "JokeCell")
        self.view.addSubview(self.table)
        
        getJokeList()
        
    }

    func getJokeList() {
        Alamofire.request(self.url).response { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                if let res = YGResponse.deserialize(from: utf8Text) {
                    
                    self.datas = res.items ?? []
                    
                    self.table.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.datas == nil {
            return 0
        }
        return self.datas!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = YGJokeCell(style: .default, reuseIdentifier: "JokeCell")
        
        let joke = self.datas![indexPath.row]
        
        cell.updateCell(joke)

        return cell
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
