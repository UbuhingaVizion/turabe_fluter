// New route/page/screen
import 'package:first_flutter_app/ui/movie_ui/movie_ui.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:first_flutter_app/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:first_flutter_app/model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Movies App albin",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff131e48),

      ),
      bottomNavigationBar: textFieldView(),
      backgroundColor: Color(0xff131e40),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Positioned(child: movieCard(movieList[index], context)),
              Positioned(
                  top: 6.0,
                  child: movieImage(getRandomElement(movieList[index].Images)))
            ]);
          }),
    );
  }
  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter movie name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),),
              contentPadding: EdgeInsets.all(8.0)
          ),
          onSubmitted: (value){

           // setState(() {
             // _tipPercentage = newValue.round();
           // });
          },
        ),
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 40.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color:  Color(0xff131e48),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 54.0, right: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.Title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.5,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating}/10",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5,
                            color: Colors.cyan),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Released ${movie.Released}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white54),
                      ),

                      Text(
                        movie.Rated,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: Colors.yellow),
                      )
                    ],
                  ),  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        movie.Runtime,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(movie: movie)))
      },
    );
  }

  Widget movieImage(String imageUrl) {

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 80.0,
        height: 110.0,

        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12.0),
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image:
                    NetworkImage(imageUrl ?? 'https://via.placeholder.com/100'),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final Movie movie;

  MovieListViewDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Title: ${movie.Title}",style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff131e48),
        ),
        body: ListView(

          children: [
            MovieDetailsThumbnail(
              thumbnail: getRandomElement(movie.Images),
            ),
            MovieDetailsHeaderWithPoster(
              movie: movie,
            ),
            HorizontalLine(),
            MovieDetailsCast(
              movie: movie,
            ),
            HorizontalLine(),
            MovieDetailsExtraPosters(
              posters: movie.Images,
            )
          ],
        ), backgroundColor: Color(0xff131e48),);
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0;
  Color _darkslategray = HexColor("#2F4F4F");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: _darkslategray.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total per person",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Bif ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount : ",
                        prefixIcon: Icon(Icons.money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {}
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _darkslategray.withOpacity(0.2)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _darkslategray.withOpacity(0.2)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Container(
                          width: 100.0,
                          height: 50.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.transparent),
                          child: Center(
                            child: Text(
                              "Bif ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage %",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0.0,
                          max: 100.0,
                          activeColor: Colors.greenAccent,
                          inactiveColor: _darkslategray.withOpacity(0.3),
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100.0;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The greatest glory in living lies not in never falling, but in rising every time we fall. - By Allan Stockman Rugano",
    "The way to get started is to quit talking and begin doing. - By Allan Stockman Rugano",
    "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. - By Allan Stockman Rugano",
    "If life were predictable it would cease to be life, and be without flavor. - By Allan Stockman Rugano",
    "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough. - By Allan Stockman Rugano",
    "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success. - By Allan Stockman Rugano",
    "Life is what happens when you're busy making other plans. - By Allan Stockman Rugano",
    "Spread love everywhere you go. Let no one ever come to you without leaving happier. - By Allan Stockman Rugano",
    "When you reach the end of your rope, tie a knot in it and hang on. - By Allan Stockman Rugano",
    "Always remember that you are absolutely unique. Just like everyone else. - By Allan Stockman Rugano",
    "Don't judge each day by the harvest you reap but by the seeds that you plant. - By Allan Stockman Rugano",
    "The future belongs to those who believe in the beauty of their dreams. - By Allan Stockman Rugano",
    "Tell me and I forget. Teach me and I remember. Involve me and I learn. - By Allan Stockman Rugano",
    "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart. - By Allan Stockman Rugano",
    "It is during our darkest moments that we must focus to see the light. - By Allan Stockman Rugano",
    "Whoever is happy will make others happy too. - By Allan Stockman Rugano",
    "Do not go where the path may lead, go instead where there is no path and leave a trail. - By Allan Stockman Rugano",
    "You will face many defeats in life, but never let yourself be defeated. - By Allan Stockman Rugano",
    "The greatest glory in living lies not in never falling, but in rising every time we fall. - By Allan Stockman Rugano",
    "In the end, it's not the years in your life that count. It's the life in your years. - By Allan Stockman Rugano",
    "Never let the fear of striking out keep you from playing the game. - By Allan Stockman Rugano",
    "Life is either a daring adventure or nothing at all. - By Allan Stockman Rugano",
    "Many of life's failures are people who did not realize how close they were to success when they gave up. - By Allan Stockman Rugano",
    "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose. - By Allan Stockman Rugano"
        "Success is not final; failure is not fatal: It is the courage to continue that counts. - By Allan Stockman Rugano",
    "Success usually comes to those who are too busy to be looking for it. - By Allan Stockman Rugano",
    "The way to get started is to quit talking and begin doing. - By Allan Stockman Rugano",
    "If you really look closely, most overnight successes took a long time. - By Allan Stockman Rugano",
    "The secret of success is to do the common thing uncommonly well. - By Allan Stockman Rugano",
    "I find that the harder I work, the more luck I seem to have. - By Allan Stockman Rugano",
    "The real test is not whether you avoid this failure, because you won't. It's whether you let it harden or shame you into inaction, or whether you learn from it; whether you choose to persevere. - By Allan Stockman Rugano"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 18.0,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton.icon(
                  onPressed: _showQuote,
                  icon: Icon(Icons.wb_sunny),
                  label: Text("Inspire me",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Allan Stockman",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23.5,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "Learning Flutter",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person_outline), Text("Twitter : @iMitwe")],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint('Tapped button!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email printed")),
          IconButton(icon: Icon(Icons.access_alarm), onPressed: _tapButton)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen.shade300,
        child: Icon(Icons.call_missed),
        onPressed: () => debugPrint("Floating button"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "First"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Second"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Third")
        ],
        onTap: (int index) => debugPrint("You typed on item $index."),
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomButton()],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello snack"),
          backgroundColor: Colors.amberAccent.shade700,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "Hello Rugano",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.5,
            fontStyle: FontStyle.italic),
      )),
      color: Colors.deepOrange,
    );
  }
}
