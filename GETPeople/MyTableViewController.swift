//
//  ViewController.swift
//  GETPeople
//
//  Created by Najla on 10/01/2022.
/*
 Now that we have our data let's take it one step further and add the ability to view details for a particular film or person.

 Add a details view for the people resource with the following details about each Star Wars Person:

 Name, Gender, Birth Year, Mass
 Add a details view for the films resource with the following details about each Star Wars Film:

 Title, Release Date, Director, Opening Crawl
 These do not need to be Table View Controllers (They can be vanilla view controllers with Labels)
 */
//

import UIKit

//using Codable
class MyTableViewController: UITableViewController {
    
    var people: [FilmResult]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AllModel.getAllPeople(completionHandler: {
            data, response, error in
            
            guard let myData = data else { return }
            
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(People.self, from: myData)

                self.people = jsonResult.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
        })
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create a generic cell
            let cell = UITableViewCell()
            // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people?[indexPath.row].name
            // return the cell so that it can be rendered
            return cell
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "People", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        let indexPath = sender as! IndexPath
        
        guard let item = people?[indexPath.row] else { return }
        
        destination.name = "Name: \(String(describing: item.name))"
        destination.gender = "Gender: \(String(describing: item.gender))"
        destination.birth = "Birth Year: \(String(describing: item.birthYear))"
        destination.mass = "Mass: \(String(describing: item.mass))"
    }
}

