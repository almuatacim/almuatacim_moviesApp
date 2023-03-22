class GenresModel {
  Meta? meta;
  List<GenData>? data;

  GenresModel({this.meta, this.data});

  GenresModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <GenData>[];
      json['data'].forEach((v) {
        data!.add(new GenData.fromJson(v));
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

class GenData {
  int? id;
  Name? name;
  String? createdAt;
  String? updatedAt;

  GenData({this.id, this.name, this.createdAt, this.updatedAt});

  GenData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
