//
//  ViewController.swift
//  TatvaSoftPractical
//
//  Created by Dipali Rajbanshi on 26/03/22.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomTableViewCellDelegate {
   
    

    @IBOutlet var tableView: UITableView!
    var storiesData: [Stories] = []
    static var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Number of selected posts:  \(ViewController.count)"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        stories()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storiesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            cell.createdAt.text = storiesData[indexPath.row].createdAt
            cell.storyTitle.text = storiesData[indexPath.row].title
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func updateTitle() {
        title = "Number of selected posts:  \(ViewController.count)"
    }
    
    // MARK: API Calling
    
    func stories() {
        let url = "https://hn.algolia.com/api/v1/search_by_date?tags=story&page=2"
        let urlRequest = URLRequest(url: URL(string : url)!)
        let configObj = URLSessionConfiguration.default
        let session = URLSession(configuration: configObj)
        let task = session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            print(response)
            do {
                let outerDic = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
                print("Outer Dic:", outerDic)
                let dataArray = outerDic?.value(forKey: "hits") as? NSArray
                print("DataArray:", dataArray)
                for item in dataArray! {
                    let dic = item as? NSDictionary
                    let createdAt = dic?.value(forKey: "created_at") as? String
                    let title = dic?.value(forKey: "title") as? String
                    
                    var storiesObj = Stories()
                    storiesObj.createdAt = createdAt
                    storiesObj.title = title
                    
                    self?.storiesData.append(storiesObj)
                }
                
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        task.resume()
    }
    


}

