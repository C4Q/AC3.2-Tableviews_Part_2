//
//  MovieTableViewController.swift
//  Tableviews_Part_2//
//  Created by Jason Gresh on 9/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
	var movieData: [Movie]!
	internal let rawMovieData: [[String : Any]] = movies
	let cellIdentifier: String = "MovieTableViewCell"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Movies"
		
		self.movieData = [
			Movie(title: "Rogue One", year: 2016, genre: "sci-fi", cast: [], locations: ["Space"], summary: "An awesome Star Wars movie"),
			Movie(title: "Wonder Woman", year: 2017, genre: "superhero", cast: [], locations: ["Europe"], summary: "Wonder Woman fights evil, and wins.")
		]
		
		for i in movies {
			self.movieData.append(Movie(from: i))
		}
		
		self.movieData = self.movieData.sorted(by: { (a: Movie, b: Movie) -> Bool in
			return a.genre > b.genre ? false : true
		})
		
		//		self.tableView.rowHeight = UITableViewAutomaticDimension
		//		self.tableView.estimatedRowHeight = 200.0
	}
	
	
	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.movieData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		
		let cellMovie = self.movieData[indexPath.row]
		cell.textLabel?.text = "\(cellMovie.title) - \(cellMovie.year) - \(cellMovie.genre)"
		cell.detailTextLabel?.text = cellMovie.summary
		
		return cell
	}
	
}
