class Movie {
  static List<Movie> getMovies() => [
        Movie(
            "Avatar",
            "2009",
            "PG-13",
            "18 Dec 2009",
            "162 min",
            "Action, Adventure, Fantasy",
            "James Cameron",
            "James Cameron",
            "Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang",
            "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
            "English, Spanish",
            "USA, UK",
            "Won 3 Oscars. Another 80 wins & 121 nominations.",
            "http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg",
            "83",
            "7.9",
            "890,617",
            "tt0499549",
            "movie",
            "True", [
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BNzM2MDk3MTcyMV5BMl5BanBnXkFtZTcwNjg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxOTEwNDcxN15BMl5BanBnXkFtZTcwOTg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTYxMDg1Nzk1MV5BMl5BanBnXkFtZTcwMDk0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg"
        ]),
        Movie(
            "I Am Legend",
            "2007",
            "PG-13",
            "14 Dec 2007",
            "101 min",
            "Drama, Horror, Sci-Fi",
            "Francis Lawrence",
            "Mark Protosevich (screenplay), Akiva Goldsman (screenplay), Richard Matheson (novel), John William Corrington, Joyce Hooper Corrington",
            "Will Smith, Alice Braga, Charlie Tahan, Salli Richardson-Whitfield",
            "Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.",
            "English",
            "USA",
            "9 wins & 21 nominations.",
            "http://ia.media-imdb.com/images/M/MV5BMTU4NzMyNDk1OV5BMl5BanBnXkFtZTcwOTEwMzU1MQ@@._V1_SX300.jpg",
            "65",
            "7.2",
            "533,874",
            "tt0480249",
            "movie",
            "True", [
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTI0NTI4NjE3NV5BMl5BanBnXkFtZTYwMDA0Nzc4._V1_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTIwMDg2MDU4M15BMl5BanBnXkFtZTYwMTA0Nzc4._V1_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc5MDM1OTU5OV5BMl5BanBnXkFtZTYwMjA0Nzc4._V1_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0MTI2NjMzMzFeQTJeQWpwZ15BbWU2MDMwNDc3OA@@._V1_.jpg"
        ]),
        Movie(
            "300",
            "2006",
            "R",
            "09 Mar 2007",
            "117 min",
            "Action, Drama, Fantasy",
            "Zack Snyder",
            "Zack Snyder (screenplay), Kurt Johnstad (screenplay), Michael Gordon (screenplay), Frank Miller (graphic novel), Lynn Varley (graphic novel)",
            "Gerard Butler, Lena Headey, Dominic West, David Wenham",
            "King Leonidas of Sparta and a force of 300 men fight the Persians at Thermopylae in 480 B.C.",
            "English",
            "USA",
            "16 wins & 42 nominations.",
            "http://ia.media-imdb.com/images/M/MV5BMjAzNTkzNjcxNl5BMl5BanBnXkFtZTYwNDA4NjE3._V1_SX300.jpg",
            "52",
            "7.7",
            "611,046",
            "tt0416449",
            "movie",
            "True", [
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTMwNTg5MzMwMV5BMl5BanBnXkFtZTcwMzA2NTIyMw@@._V1_SX1777_CR0,0,1777,937_AL_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTQwNTgyNTMzNF5BMl5BanBnXkFtZTcwNDA2NTIyMw@@._V1_SX1777_CR0,0,1777,935_AL_.jpg",
          "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0MjQzOTEwMV5BMl5BanBnXkFtZTcwMzE2NTIyMw@@._V1_SX1777_CR0,0,1777,947_AL_.jpg"
        ])
      ];

  String Title;
  String Year;
  String Rated;
  String Released;
  String Runtime;
  String Genre;
  String Director;
  String Writer;
  String Actors;
  String Plot;
  String Language;
  String Country;
  String Awards;
  String Poster;
  String Metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String Type;
  String Response;
  List<String> Images;

  Movie(
      this.Title,
      this.Runtime,
      this.Year,
      this.Released,
      this.Rated,
      this.Genre,
      this.Director,
      this.Writer,
      this.Actors,
      this.Plot,
      this.Language,
      this.Country,
      this.Awards,
      this.Poster,
      this.Metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.Type,
      this.Response,
      this.Images);
}
