class MatchDetailsResponse {
  Match? match;
  List<Batter>? batter;
  List<Bowler>? bowler;
  List<Keystats>? keystats;
  String? recent;
  List<Commentry>? commentry;

  MatchDetailsResponse(
      {this.match,
      this.batter,
      this.bowler,
      this.keystats,
      this.recent,
      this.commentry});

  MatchDetailsResponse.fromJson(Map<String, dynamic> json) {
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
    if (json['batter'] != null) {
      batter = <Batter>[];
      json['batter'].forEach((v) {
        batter!.add(new Batter.fromJson(v));
      });
    }
    if (json['bowler'] != null) {
      bowler = <Bowler>[];
      json['bowler'].forEach((v) {
        bowler!.add(new Bowler.fromJson(v));
      });
    }
    if (json['keystats'] != null) {
      keystats = <Keystats>[];
      json['keystats'].forEach((v) {
        keystats!.add(new Keystats.fromJson(v));
      });
    }
    recent = json['recent'];
    if (json['commentry'] != null) {
      commentry = <Commentry>[];
      json['commentry'].forEach((v) {
        commentry!.add(new Commentry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.match != null) {
      data['match'] = this.match!.toJson();
    }
    if (this.batter != null) {
      data['batter'] = this.batter!.map((v) => v.toJson()).toList();
    }
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.map((v) => v.toJson()).toList();
    }
    if (this.keystats != null) {
      data['keystats'] = this.keystats!.map((v) => v.toJson()).toList();
    }
    data['recent'] = this.recent;
    if (this.commentry != null) {
      data['commentry'] = this.commentry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Match {
  T1name? t1name;
  T1name? t2name;
  String? node;

  Match({this.t1name, this.t2name, this.node});

  Match.fromJson(Map<String, dynamic> json) {
    t1name =
        json['t1name'] != null ? new T1name.fromJson(json['t1name']) : null;
    t2name =
        json['t2name'] != null ? new T1name.fromJson(json['t2name']) : null;
    node = json['node'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.t1name != null) {
      data['t1name'] = this.t1name!.toJson();
    }
    if (this.t2name != null) {
      data['t2name'] = this.t2name!.toJson();
    }
    data['node'] = this.node;
    return data;
  }
}

class T1name {
  String? name;
  String? crr;
  String? req;

  T1name({this.name, this.crr, this.req});

  T1name.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    crr = json['crr'];
    req = json['req'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['crr'] = this.crr;
    data['req'] = this.req;
    return data;
  }
}

class Batter {
  String? batter;
  String? r;
  String? b;
  String? s4s;
  String? s6s;
  String? sR;

  Batter({this.batter, this.r, this.b, this.s4s, this.s6s, this.sR});

  Batter.fromJson(Map<String, dynamic> json) {
    batter = json['Batter'];
    r = json['R'];
    b = json['B'];
    s4s = json['4s'];
    s6s = json['6s'];
    sR = json['SR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Batter'] = this.batter;
    data['R'] = this.r;
    data['B'] = this.b;
    data['4s'] = this.s4s;
    data['6s'] = this.s6s;
    data['SR'] = this.sR;
    return data;
  }
}

class Bowler {
  String? bowler;
  String? o;
  String? m;
  String? r;
  String? w;
  String? eCO;

  Bowler({this.bowler, this.o, this.m, this.r, this.w, this.eCO});

  Bowler.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    o = json['O'];
    m = json['M'];
    r = json['R'];
    w = json['W'];
    eCO = json['ECO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bowler'] = this.bowler;
    data['O'] = this.o;
    data['M'] = this.m;
    data['R'] = this.r;
    data['W'] = this.w;
    data['ECO'] = this.eCO;
    return data;
  }
}

class Keystats {
  String? key;
  String? value;

  Keystats({this.key, this.value});

  Keystats.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Commentry {
  String? over;
  String? value;

  Commentry({this.over, this.value});

  Commentry.fromJson(Map<String, dynamic> json) {
    over = json['over'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['over'] = this.over;
    data['value'] = this.value;
    return data;
  }
}
