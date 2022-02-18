//
//  FilmsTableViewController.swift
//  GETPeople
//
//  Created by Najla on 10/01/2022.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    var filmsList: [Result]? = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        AllModel.getAllFilms(completionHandler: {
            data, response, error in
            
            guard let myData = data else { return }
            
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(FilmsInfo.self, from: myData)

                self.filmsList = jsonResult.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
        })
        
            
        self.tableView.dataSource = self
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList?.count ?? 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath)
        
        cell.textLabel?.text = filmsList?[indexPath.row].title ?? ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Films", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        
        let indexPath = sender as! IndexPath
        
        guard let item = filmsList?[indexPath.row] else { return }
        
        destination.name = "Title: \(String(describing: item.title))"
        destination.gender = "Release Date: \(String(describing: item.releaseDate))"
        destination.birth = "Director: \(String(describing: item.director))"
        destination.mass = "Opening Craw: \(String(describing: item.openingCrawl))"
    }

}
