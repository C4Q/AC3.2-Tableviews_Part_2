# Exercises and Code Reference
---

### 1. Initial code for project `MovieTableViewController`

```swift
class MovieTableViewController: UITableViewController {
 var movieData: [Movie]!

    internal let rawMovieData: [[String : Any]] = movies
    let cellIdentifier: String = "MovieTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movies"

		self.movieData = [
			Movie(title: "Rogue One", year: 2016, genre: "Sci-Fi", cast: [], locations: ["Space"], summary: "An awesome Star Wars movie"),
			Movie(title: "Wonder Woman", year: 2017, genre: "Superhero", cast: [], locations: ["Europe"], summary: "Wonder Woman fights evil, and wins.")
		]

		for i in movies {
			self.movieData.append(Movie(from: i))
		}

		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 200.0
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
		cell.textLabel?.text = "\(cellMovie.title) - \(cellMovie.year)"
		cell.detailTextLabel?.text = cellMovie.summary

        return cell
    }

}
```

### Adding `Poster` property to `Movie`

```swift
class Movie {

	var title: String
	var year: Int
	var genre: String
	var cast: [String]
	var locations: [String]
	var summary: String
	var poster: String

	init(title: String, year: Int, genre: String, cast: [String], locations: [String], summary: String, poster: String) {
		self.title = title
		self.year = year
		self.genre = genre
		self.cast = cast
		self.locations = locations
		self.summary = summary
		self.poster = poster
	}

	convenience init(from dict: [String : Any]) {
		if let movieTitle = dict["name"] as? String,
			let movieYear = dict["year"] as? Int,
			let movieGenre = dict["genre"] as? String,
			let movieCast = dict["cast"] as? [String],
			let movieLocations = dict["locations"] as? [String],
			let movieSummary = dict["description"] as? String,
			let moviePoster = dict["poster"] as? String {

			self.init(title: movieTitle, year: movieYear, genre: movieGenre, cast: movieCast, locations: movieLocations, summary: movieSummary, poster: moviePoster)
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
		self.poster = ""
	}
}
```