//
//  NewsTableViewController.swift
//  GetNews
//
//  Created by Ashwini on 2/25/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class NewsTableViewController: UITableViewController {

    // var globalTxtTitle : UITextField?
    //let arr = ["APP", "GOOG", "FB"]
    
    //let authorArr: [[String]:[String]] = [String]()
    
    var newsArr: [News] = [News]()
        

    
    @IBOutlet var tblNews: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initValues()
        //self.tblNews.reloadData()
        //getData()
        //getURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData();
    }
    
   /* func initValues(){
        newsArr.append(News(author: "AAPL", title:"133.19", description:"1367890"))
        newsArr.append(News(author: "GOOG", title:"2121.0", description:"11345609"))
        newsArr.append(News(author: "MSFT", title:"243.70", description:"19802324"))
    
     }*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArr.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewsTableViewCell", owner: self, options: nil)?.first as! NewsTableViewCell
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.lblTitle?.text = "Title : \(newsArr[indexPath.row].title),\n "+"Description : \(newsArr[indexPath.row].description)\n"
        //cell.lblDescription?.text = "\(newsArr[indexPath.row].description)"


        return cell
    }
    
    func getURL() -> String{
        var url = apiURL
        
        
        url.append(apiKey)
        print(url)
        return url
    }
    
    func getData() {
       /* if newsArr.count == 0{
            return
        }*/
        let url = getURL()
        //SwiftSpinner.show("Getting latest News")
        
        AF.request(url).responseJSON { (response) in
         print("response")
        //SwiftSpinner.hide()
            
            if response.error == nil {
                guard let data = response.data else {return}
                //print("data")
                //print(data)
                let json = try! JSON(data:data)
                print("json")
                let articles = json["articles"]

                
                let arrcount = articles.count
                print(articles.count)

                for i in 0...arrcount{

                     //for(_,articles) in json[i]["articles"]{
                         let author = articles[i]["author"].string ?? "N/A"
                         print("author: \(author)")
                         
                         let title = articles[i]["title"].string ?? "N/A"
                         print("title: \(title)")
                         
                         let description = articles[i]["description"].string ?? "N/A"
                         print("description: \(description)")
                         
                    if(title == "N/A"){
                        continue
                    }
                         self.newsArr.append(News(author: author, title: title, description: description))
                     //}
                 }
                
                self.tblNews.reloadData()
                
            }
                    // ID
            else{
                print("Error")
            }
                
                
            }
            
            
        
    }
/*guard let json = JSON(data).array else{return}

print("json")
print(json)
for (_,articles) in json["articles"]{
print("article")
print(articles)
for(article) in  articles {

    let author = articles["author"].string ?? "N/A"
    print("author: \(author)")
    
    let title = articles["title"].string ?? "N/A"
    print("title: \(title)")
    
    let description = articles["description"].string ?? "N/A"
    print("description: \(description)")
    
    self.newsArr.append(News(author: author, title: title, description: description))
}
}*/

}
