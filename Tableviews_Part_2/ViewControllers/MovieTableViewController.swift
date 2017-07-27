//
//  MovieTableViewController.swift
//  Tableviews_Part_2//
//  Created by Jason Gresh on 9/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

enum MovieType {
	case action, animation, drama
}

class MovieTableViewController: UITableViewController {
	var movieData: [Movie]!
	let cellIdentifier: String = "MovieTableViewCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Movies"
		self.movieData = []
		for i in movies {
			self.movieData.append(Movie(from: i))
		}
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
		let cellMovie: Movie = movieData[indexPath.row]
		
		cell.textLabel?.text = "\(cellMovie.title) - \(cellMovie.year)"
		cell.detailTextLabel?.text = cellMovie.summary
		return cell
	}
}
