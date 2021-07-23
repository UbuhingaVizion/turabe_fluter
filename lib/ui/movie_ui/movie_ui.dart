import 'package:first_flutter_app/model/movie.dart';
import 'package:first_flutter_app/util/utils.dart';
import 'package:flutter/material.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              )),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 80.0,
              color: Colors.white60,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 50.0,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(

        children: [

          MoviePoster(poster: getRandomElement(movie.Images)),
          SizedBox(
            width: 16.0,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.Year}, ${movie.Genre}",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Text(movie.Title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontSize: 32.0)),
        Text.rich(TextSpan(
            style:
                TextStyle(fontWeight: FontWeight.w300, color: Colors.white60,fontSize: 12),
            children: [
              TextSpan(text: movie.Plot),
              TextSpan(
                  text: " More...", style: TextStyle(color: Colors.yellow))
            ]))
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10.0));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.Actors),
          MovieField(field: "Directors", value: movie.Director),
          MovieField(field: "Awards", value: movie.Awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field : ",
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: Text(
          value,
          style: TextStyle(
              color: Colors.white60, fontSize: 12.0, fontWeight: FontWeight.w300),
        ))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 0.7,
        color: Colors.blueGrey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("More Movie Posters".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 150.0,
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posters[index]),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8.0,
                  ),
              itemCount: posters.length),
        )
      ],
    );
  }
}
