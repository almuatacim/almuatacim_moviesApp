import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/pages/homepage/data/model/actor.dart';
import 'package:flutter_application_1/view/pages/homepage/data/model/movie_model.dart';
import 'package:flutter_application_1/view/pages/homepage/data/reposotiry/moviereposotiry.dart';
import 'data/model/genres_model.dart';

class MoviesPage extends StatefulWidget {
  MoviesPage({super.key});
  int _selectedIndex = 0;
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  HomeReposotiry homeReposotiry = HomeReposotiry();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
      //here we are
      FutureBuilder<MoviesModel>(
        future: homeReposotiry.fetchMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) => Scaffold(
                                        appBar: AppBar(
                                          title: Text(
                                              '${snapshot.data!.data![index].title}'),
                                        ),
                                        body: Column(
                                          children: [
                                            Center(
                                                child: Image.network(snapshot
                                                    .data!.data![index].img
                                                    .toString())),
                                            Text(snapshot
                                                .data!.data![index].description
                                                .toString())
                                          ],
                                        ))),
                              );
                            },
                            child: Container(
                              width: 200,
                              child: CarouselSlider(
                                items: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      snapshot.data!.data![index].img
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(disableCenter: true),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  child: FutureBuilder<GenresModel>(
                    future: homeReposotiry.fetchGenres(),
                    builder: (context, snapshotgen) {
                      if (snapshotgen.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshotgen.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  var selectedGenres =
                                      snapshotgen.data!.data![index].id;
                                  List genlist = [];
                                  snapshot.data!.data!.forEach((element1) {
                                    element1.genres!.forEach((element) {
                                      if (selectedGenres == element.id) {
                                        genlist.add(element1);
                                      }
                                    });
                                  });
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            Scaffold(
                                              appBar: AppBar(
                                                title: Text(
                                                    '${snapshotgen.data!.data![index].name!.en} Movies Page'),
                                              ),
                                              body: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: genlist.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Container(
                                                      width: 200,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image.network(
                                                          genlist
                                                              .elementAt(index)
                                                              .img
                                                              .toString(),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(snapshotgen
                                      .data!.data![index].name!.en
                                      .toString()),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshotgen.hasError) {
                        return Text(snapshot.error.toString());
                      } else
                        return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text('NEW RENTAL'),
                ),
                SizedBox(height: 10),
                Container(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 100,
                          child: ClipRRect(
                            child: Image.network(
                              snapshot.data!.data![index].img.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
      const Text(
        'Movie Page',
        style: optionStyle,
      ),
      FutureBuilder<ActorModel>(
          future: homeReposotiry.fetchActor(),
          builder: (context, snapshotActor) {
            if (snapshotActor.hasData) {
              return ListView.builder(
                  itemCount: snapshotActor.data!.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => FutureBuilder(
                                    future: homeReposotiry.fetchActorMovies(
                                        id: snapshotActor.data!.data![index].id
                                            .toString()),
                                    builder: (context, snapshotactormovies) {
                                      if (snapshotactormovies.hasData) {
                                        return Scaffold(
                                          appBar: AppBar(
                                            title: Text(
                                                '${snapshotactormovies.data!.name} Movies Page'),
                                          ),
                                          body: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: snapshotactormovies
                                                .data!.movies!.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Container(
                                                  width: 200,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      snapshotactormovies.data!
                                                          .movies![index].thumb
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else if (snapshotactormovies.hasError) {
                                        return Text(snapshotactormovies.error
                                            .toString());
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )),
                        );
                      },
                      child: ListTile(
                        title: Text(
                            snapshotActor.data!.data![index].name.toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshotActor.data!.data![index].img.toString()),
                          radius: 20,
                        ),
                      ),
                    );
                  });
            } else if (snapshotActor.hasError) {
              return Text(snapshotActor.error.toString());
            }
            return CircularProgressIndicator();
          }),
      const Text(
        'Profile Page',
        style: optionStyle,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.black,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.green),
        ),
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.green,
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Drawer Header')),
          )
        ]),
      ),
      body: _widgetOptions.elementAt(widget._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.recent_actors,
            ),
            label: 'Actor',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          )
        ],
        currentIndex: widget._selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
          }
          setState(() {
            widget._selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({super.key});
  List moviesCategory = [
    'action',
    'drama',
    'crime',
    'action',
    'adventure',
    'action',
    'drama',
    'crime',
    'action'
  ];
  List moviesImage = [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7bEYwjUvlJW7GerM8GYmqwl4oS3.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7WCNaek6zGlhum99TA63QmVPhox.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/eeUNWsdoiOijOZAMaWFDA5Pb1n8.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/oktTNFM8PzdseiK1X0E0XhB6LvP.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7bEYwjUvlJW7GerM8GYmqwl4oS3.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/2PQRFl4zcJvZROJFJ2Ngr9YbOqp.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/cAoAgzOCxSytYBqqCQulhXNR3LB.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        moviesImage[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesCategory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1, color: Colors.black)),
                    padding: EdgeInsets.all(10),
                    child: Text(moviesCategory[index]),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text('NEW RENTAL'),
        ),
        SizedBox(height: 10),
        Container(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesImage.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(
                      moviesImage[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
