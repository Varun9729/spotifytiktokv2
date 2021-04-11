class FPlaylists {
  String _message;
  Playlists _playlists;

  FPlaylists({String message, Playlists playlists}) {
    this._message = message;
    this._playlists = playlists;
  }

  String get message => _message;
  set message(String message) => _message = message;
  Playlists get playlists => _playlists;
  set playlists(Playlists playlists) => _playlists = playlists;

  FPlaylists.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _playlists = json['playlists'] != null
        ? new Playlists.fromJson(json['playlists'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._playlists != null) {
      data['playlists'] = this._playlists.toJson();
    }
    return data;
  }
}

class Playlists {
  String _href;
  List<Items> _items;
  int _limit;
  String _next;
  int _offset;
  Null _previous;
  int _total;

  Playlists(
      {String href,
      List<Items> items,
      int limit,
      String next,
      int offset,
      Null previous,
      int total}) {
    this._href = href;
    this._items = items;
    this._limit = limit;
    this._next = next;
    this._offset = offset;
    this._previous = previous;
    this._total = total;
  }

  String get href => _href;
  set href(String href) => _href = href;
  List<Items> get items => _items;
  set items(List<Items> items) => _items = items;
  int get limit => _limit;
  set limit(int limit) => _limit = limit;
  String get next => _next;
  set next(String next) => _next = next;
  int get offset => _offset;
  set offset(int offset) => _offset = offset;
  Null get previous => _previous;
  set previous(Null previous) => _previous = previous;
  int get total => _total;
  set total(int total) => _total = total;

  Playlists.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
    if (json['items'] != null) {
      _items = new List<Items>();
      json['items'].forEach((v) {
        _items.add(new Items.fromJson(v));
      });
    }
    _limit = json['limit'];
    _next = json['next'];
    _offset = json['offset'];
    _previous = json['previous'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    if (this._items != null) {
      data['items'] = this._items.map((v) => v.toJson()).toList();
    }
    data['limit'] = this._limit;
    data['next'] = this._next;
    data['offset'] = this._offset;
    data['previous'] = this._previous;
    data['total'] = this._total;
    return data;
  }
}

class Items {
  bool _collaborative;
  String _description;
  ExternalUrls _externalUrls;
  String _href;
  String _id;
  List<Images> _images;
  String _name;
  Owner _owner;
  Null _public;
  String _snapshotId;
  Tracks _tracks;
  String _type;
  String _uri;

  Items(
      {bool collaborative,
      String description,
      ExternalUrls externalUrls,
      String href,
      String id,
      List<Images> images,
      String name,
      Owner owner,
      Null public,
      String snapshotId,
      Tracks tracks,
      String type,
      String uri}) {
    this._collaborative = collaborative;
    this._description = description;
    this._externalUrls = externalUrls;
    this._href = href;
    this._id = id;
    this._images = images;
    this._name = name;
    this._owner = owner;
    this._public = public;
    this._snapshotId = snapshotId;
    this._tracks = tracks;
    this._type = type;
    this._uri = uri;
  }

  bool get collaborative => _collaborative;
  set collaborative(bool collaborative) => _collaborative = collaborative;
  String get description => _description;
  set description(String description) => _description = description;
  ExternalUrls get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls externalUrls) => _externalUrls = externalUrls;
  String get href => _href;
  set href(String href) => _href = href;
  String get id => _id;
  set id(String id) => _id = id;
  List<Images> get images => _images;
  set images(List<Images> images) => _images = images;
  String get name => _name;
  set name(String name) => _name = name;
  Owner get owner => _owner;
  set owner(Owner owner) => _owner = owner;
  Null get public => _public;
  set public(Null public) => _public = public;
  String get snapshotId => _snapshotId;
  set snapshotId(String snapshotId) => _snapshotId = snapshotId;
  Tracks get tracks => _tracks;
  set tracks(Tracks tracks) => _tracks = tracks;
  String get type => _type;
  set type(String type) => _type = type;
  String get uri => _uri;
  set uri(String uri) => _uri = uri;

  Items.fromJson(Map<String, dynamic> json) {
    _collaborative = json['collaborative'];
    _description = json['description'];
    _externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    if (json['images'] != null) {
      _images = new List<Images>();
      json['images'].forEach((v) {
        _images.add(new Images.fromJson(v));
      });
    }
    _name = json['name'];
    _owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    _public = json['public'];
    _snapshotId = json['snapshot_id'];
    _tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collaborative'] = this._collaborative;
    data['description'] = this._description;
    if (this._externalUrls != null) {
      data['external_urls'] = this._externalUrls.toJson();
    }
    data['href'] = this._href;
    data['id'] = this._id;
    if (this._images != null) {
      data['images'] = this._images.map((v) => v.toJson()).toList();
    }
    data['name'] = this._name;
    if (this._owner != null) {
      data['owner'] = this._owner.toJson();
    }
    data['public'] = this._public;
    data['snapshot_id'] = this._snapshotId;
    if (this._tracks != null) {
      data['tracks'] = this._tracks.toJson();
    }
    data['type'] = this._type;
    data['uri'] = this._uri;
    return data;
  }
}

class ExternalUrls {
  String _spotify;

  ExternalUrls({String spotify}) {
    this._spotify = spotify;
  }

  String get spotify => _spotify;
  set spotify(String spotify) => _spotify = spotify;

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    _spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this._spotify;
    return data;
  }
}

class Images {
  int _height;
  String _url;
  int _width;

  Images({int height, String url, int width}) {
    this._height = height;
    this._url = url;
    this._width = width;
  }

  int get height => _height;
  set height(int height) => _height = height;
  String get url => _url;
  set url(String url) => _url = url;
  int get width => _width;
  set width(int width) => _width = width;

  Images.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _url = json['url'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['url'] = this._url;
    data['width'] = this._width;
    return data;
  }
}

class Owner {
  ExternalUrls _externalUrls;
  String _href;
  String _id;
  String _type;
  String _uri;

  Owner(
      {ExternalUrls externalUrls,
      String href,
      String id,
      String type,
      String uri}) {
    this._externalUrls = externalUrls;
    this._href = href;
    this._id = id;
    this._type = type;
    this._uri = uri;
  }

  ExternalUrls get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls externalUrls) => _externalUrls = externalUrls;
  String get href => _href;
  set href(String href) => _href = href;
  String get id => _id;
  set id(String id) => _id = id;
  String get type => _type;
  set type(String type) => _type = type;
  String get uri => _uri;
  set uri(String uri) => _uri = uri;

  Owner.fromJson(Map<String, dynamic> json) {
    _externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._externalUrls != null) {
      data['external_urls'] = this._externalUrls.toJson();
    }
    data['href'] = this._href;
    data['id'] = this._id;
    data['type'] = this._type;
    data['uri'] = this._uri;
    return data;
  }
}

class Tracks {
  String _href;
  int _total;

  Tracks({String href, int total}) {
    this._href = href;
    this._total = total;
  }

  String get href => _href;
  set href(String href) => _href = href;
  int get total => _total;
  set total(int total) => _total = total;

  Tracks.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    data['total'] = this._total;
    return data;
  }
}
