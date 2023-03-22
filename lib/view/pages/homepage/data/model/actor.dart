class ActorModel {
  Meta? meta;
  List<Data>? data;

  ActorModel({this.meta, this.data});

  ActorModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? img;
  String? thumb;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.img,
      this.thumb,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    thumb = json['thumb'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['thumb'] = this.thumb;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
