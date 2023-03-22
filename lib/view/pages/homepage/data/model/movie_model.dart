class MoviesModel {
  Meta? meta;
  List<Data>? data;

  MoviesModel({this.meta, this.data});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? firstPage;
  int? lastPage;
  int? from;
  int? to;
  List<String>? columns;
  List<String>? relations;
  List<int>? pageSizes;

  Meta(
      {this.total,
      this.perPage,
      this.currentPage,
      this.firstPage,
      this.lastPage,
      this.from,
      this.to,
      this.columns,
      this.relations,
      this.pageSizes});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    firstPage = json['first_page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];
    columns = json['columns'].cast<String>();
    relations = json['relations'].cast<String>();
    pageSizes = json['page_sizes'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['first_page'] = this.firstPage;
    data['last_page'] = this.lastPage;
    data['from'] = this.from;
    data['to'] = this.to;
    data['columns'] = this.columns;
    data['relations'] = this.relations;
    data['page_sizes'] = this.pageSizes;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? description;
  String? releaseDate;
  String? img;
  String? thumb;
  RunningTime? runningTime;
  String? rating;
  int? rentalRate;
  RentalDuration? rentalDuration;
  int? damageCost;
  bool? isDisabled;
  String? createdAt;
  String? updatedAt;
  String? boxOffice;
  String? fulltext;
  int? avgRating;
  List<Genres>? genres;

  Data(
      {this.id,
      this.title,
      this.description,
      this.releaseDate,
      this.img,
      this.thumb,
      this.runningTime,
      this.rating,
      this.rentalRate,
      this.rentalDuration,
      this.damageCost,
      this.isDisabled,
      this.createdAt,
      this.updatedAt,
      this.boxOffice,
      this.fulltext,
      this.avgRating,
      this.genres});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    releaseDate = json['release_date'];
    img = json['img'];
    thumb = json['thumb'];
    runningTime = json['running_time'] != null
        ? new RunningTime.fromJson(json['running_time'])
        : null;
    rating = json['rating'];
    rentalRate = json['rental_rate'];
    rentalDuration = json['rental_duration'] != null
        ? new RentalDuration.fromJson(json['rental_duration'])
        : null;
    damageCost = json['damage_cost'];
    isDisabled = json['is_disabled'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    boxOffice = json['box_office'];
    fulltext = json['fulltext'];
    avgRating = json['avg_rating'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['release_date'] = this.releaseDate;
    data['img'] = this.img;
    data['thumb'] = this.thumb;
    if (this.runningTime != null) {
      data['running_time'] = this.runningTime!.toJson();
    }
    data['rating'] = this.rating;
    data['rental_rate'] = this.rentalRate;
    if (this.rentalDuration != null) {
      data['rental_duration'] = this.rentalDuration!.toJson();
    }
    data['damage_cost'] = this.damageCost;
    data['is_disabled'] = this.isDisabled;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['box_office'] = this.boxOffice;
    data['fulltext'] = this.fulltext;
    data['avg_rating'] = this.avgRating;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RunningTime {
  int? hours;
  int? minutes;

  RunningTime({this.hours, this.minutes});

  RunningTime.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    return data;
  }
}

class RentalDuration {
  int? days;

  RentalDuration({this.days});

  RentalDuration.fromJson(Map<String, dynamic> json) {
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    return data;
  }
}

class Genres {
  int? id;
  Name? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}

class Name {
  String? ar;
  String? en;

  Name({this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}
