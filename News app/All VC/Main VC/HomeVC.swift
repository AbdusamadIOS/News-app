//
//  HomeVC.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 15/11/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sanaLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    var articles: [Articles] = []
    var city = "America"
    var currentDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColView()
        getNews()
        getCurrentweather(for: city)
        print(currentDate)
    }
    func setupColView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "BIgCell", bundle: nil), forCellWithReuseIdentifier: "BIgCell")
        collectionView.register(UINib(nibName: "SmallCell", bundle: nil), forCellWithReuseIdentifier: "SmallCell")
        
        let layout = UICollectionViewCompositionalLayout { [self] section, environment  in
            
            switch section {
            case 0:
                return big()
            default:
                return small()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func showAlert(with title: String?) {
        let alert = UIAlertController(title: title, message: "news api error", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    func showAlertWeather(with title: String?) {
        
        let alert = UIAlertController(title: title, message: "weather api error", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
        
    }
    
    func UpdateUI(weather: CurrentResponse ) {
        
        tempLbl.text = "\(String(Int(weather.current.temp_c)))℃"
        weatherImage.setImage(by: URL(string: "https:" + weather.current.condition.icon))
        sanaLbl.text = "\(weather.current.last_updated.prefix(10))"
    }
    
    func getNews() {
       
        let urelString =  "https://newsapi.org/v2/everything?q=apple&from=2024-02-04&to=2024-02-04&sortBy=popularity&apiKey=b53e7747c4764f119dc0925d2bd42476"
        
  /*  "https://newsapi.org/v2/everything?q=tesla&from=2023-10-16&sortBy=publishedAt&apiKey=b53e7747c4764f119dc0925d2bd42476"
       
       https://newsapi.org/v2/everything?q=tesla&from=2023-10-17&sortBy=publishedAt&apiKey=b53e7747c4764f119dc0925d2bd42476
       
       https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b53e7747c4764f119dc0925d2bd42476
       
       https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b53e7747c4764f119dc0925d2bd42476
       
       https://newsapi.org/v2/everything?domains=wsj.com&apiKey=b53e7747c4764f119dc0925d2bd42476
       
       https://newsapi.org/v2/everything?q=apple&from=2023-11-16&to=2023-11-16&sortBy=popularity&apiKey=b53e7747c4764f119dc0925d2bd42476
       */
        
        guard let url = URL(string: urelString) else {return}
    
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            
            DispatchQueue.main.async {
                
                guard let data, error == nil else {
                    self.showAlert(with: error?.localizedDescription)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode(NewsApi.self, from: data)
                    self.articles = news.articles
                    self.collectionView.reloadData()
                } catch {
                    self.showAlert(with: error.localizedDescription)
                    print(error)
                    print("Error while serialization", error)
                }
            }
        }
        task.resume()
        
    }
    
    func getCurrentweather(for city: String) {
        
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=11ffd290d26f4ebcb4854359230610&q=\(city)&days=1&aqi=no&alerts=no"
        
        guard let url = URL(string: urlString) else  {return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) {data, response, error in
            
            guard let data, error == nil else {
                
                DispatchQueue.main.async {
                    self.showAlert(with: error?.localizedDescription)
                }
                return
            }
            do {
                let decoder = JSONDecoder()
               
                let weather = try decoder.decode(CurrentResponse.self, from: data)
              
                DispatchQueue.main.async {
                    self.UpdateUI(weather: weather)
            
                }
                
            } catch  {
                DispatchQueue.main.async {
                    self.showAlertWeather(with: error.localizedDescription)
                }
                print("Error while serialization", error)
            }
        }
        task.resume()
        
    }
        func big()-> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .absolute(300),
                heightDimension: .absolute(245))
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 10)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .continuous
            
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 5,
                bottom: 5,
                trailing: 5)
            
            return section
            
        }
        func small() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 5,
                leading: 5,
                bottom: 5,
                trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(120))
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 0,
                bottom: 8,
                trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 5,
                leading: 5,
                bottom: 5,
                trailing: 5)
            
            return section
            
        }
    }

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return articles.count * 1 / 3
        default:
            return articles.count * 2 / 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            
            let article = articles[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BIgCell", for: indexPath) as! BIgCell
            cell.titleLbl.text = article.title
            cell.descLbl.text = article.description
            cell.newsImage.setImage(by: URL(string: article.urlToImage ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fvector%2Fno-image-available-photo-coming-soon-gm1392182937-448510205&psig=AOvVaw3sFZNOTMmgbvG7zH3ZSkDc&ust=1700302080396000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCODtpP7kyoIDFQAAAAAdAAAAABAJ"))
            return cell
        default:
            let cellSmall = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCell", for: indexPath) as! SmallCell
            
            let article = articles[indexPath.item + articles.count * 1 / 3]
            cellSmall.titleLbl.text = article.title
            cellSmall.descLbl.text = articles[indexPath.item].description
            cellSmall.newsImage.setImage(by: URL(string: article.urlToImage ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fvector%2Fno-image-available-photo-coming-soon-gm1392182937-448510205&psig=AOvVaw3sFZNOTMmgbvG7zH3ZSkDc&ust=1700302080396000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCODtpP7kyoIDFQAAAAAdAAAAABAJ"))
            return cellSmall
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch indexPath.item {
        case 0:
            
            let see = SeeNewsVC(nibName: "SeeNewsVC", bundle: nil)
            see.seeArticle = articles[indexPath.item + articles.count * 2 / 3]
            see.modalTransitionStyle = .coverVertical
            see.modalPresentationStyle = .formSheet
            
            self.present(see, animated: true)
            
        default:
            
            let see2 = SeeNewsVC(nibName: "SeeNewsVC", bundle: nil)
            see2.seeArticle = articles[indexPath.item + articles.count * 1 / 3]
            see2.modalTransitionStyle = .coverVertical
            see2.modalPresentationStyle = .formSheet
            
            self.present(see2, animated: true)
        }
    }
    

    
}
