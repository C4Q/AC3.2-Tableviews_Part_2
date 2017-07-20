//
//  Movie.swift
//  Tableviews_Part_2//
//  Created by Louis Tur on 9/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Movie {
	
	var title: String
	var year: Int
	var genre: String
	var cast: [String]
	var locations: [String]
	var summary: String
	
	init(title: String, year: Int, genre: String, cast: [String], locations: [String], summary: String) {
		self.title = title
		self.year = year
		self.genre = genre
		self.cast = cast
		self.locations = locations
		self.summary = summary
	}
	
	convenience init(from dict: [String : Any]) {
		if let movieTitle = dict["name"] as? String,
			let movieYear = dict["year"] as? Int,
			let movieGenre = dict["genre"] as? String,
			let movieCast = dict["cast"] as? [String],
			let movieLocations = dict["locations"] as? [String],
			let movieSummary = dict["description"] as? String {
			
			self.init(title: movieTitle, year: movieYear, genre: movieGenre, cast: movieCast, locations: movieLocations, summary: movieSummary)
		}
		else {
			self.init()
		}
	}
	
	init() {
		self.title = ""
		self.year = 1970
		self.genre = ""
		self.cast = []
		self.locations = []
		self.summary = ""
	}
}
