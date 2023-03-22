import 'dart:convert';

import 'package:flutter_application_1/view/pages/homepage/data/model/ActorMoviesModel.dart';
import 'package:flutter_application_1/view/pages/homepage/data/model/actor.dart';
import 'package:flutter_application_1/view/pages/homepage/data/model/genres_model.dart';
import 'package:flutter_application_1/view/pages/homepage/data/model/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeReposotiry {
  Future<MoviesModel> fetchMovie() async {
    final response =
        await http.get(Uri.parse('https://smdb.sadeem-lab.com/api/v1/movies'));

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Movies');
    }
  }

  Future<GenresModel> fetchGenres() async {
    final responsegen =
        await http.get(Uri.parse('https://smdb.sadeem-lab.com/api/v1/genres'));

    if (responsegen.statusCode == 200) {
      return GenresModel.fromJson(jsonDecode(responsegen.body));
    } else {
      throw Exception('Failed to load Genres');
    }
  }

  Future<ActorModel> fetchActor() async {
    final responseActor =
        await http.get(Uri.parse('https://smdb.sadeem-lab.com/api/v1/actors'));
    if (responseActor.statusCode == 200) {
      return ActorModel.fromJson(jsonDecode(responseActor.body));
    } else {
      throw Exception('Failed to load Genres');
    }
  }

  Future<ActorMovie> fetchActorMovies({required String id}) async {
    final responseActor = await http
        .get(Uri.parse('https://smdb.sadeem-lab.com/api/v1/actors/$id'));
    if (responseActor.statusCode == 200) {
      return ActorMovie.fromJson(jsonDecode(responseActor.body));
    } else {
      throw Exception('Failed to load Genres');
    }
  }
}
