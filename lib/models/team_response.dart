class TeamResponse {
  List<Live>? live;

  TeamResponse({this.live});

  TeamResponse.fromJson(Map<String, dynamic> json) {
    if (json['live'] != null) {
      live = <Live>[];
      json['live'].forEach((v) {
        live!.add(new Live.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.live != null) {
      data['live'] = this.live!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Live {
  String? link;
  String? title;
  String? status;
  String? t1Image;
  String? t1Name;
  String? t1Score;
  String? t2Image;
  String? t2Name;
  String? t2Score;
  String? message;

  Live(
      {this.link,
      this.title,
      this.status,
      this.t1Image,
      this.t1Name,
      this.t1Score,
      this.t2Image,
      this.t2Name,
      this.t2Score,
      this.message});

  Live.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    status = json['status'];
    t1Image = json['t1Image'];
    t1Name = json['t1Name'];
    t1Score = json['t1Score'];
    t2Image = json['t2Image'];
    t2Name = json['t2Name'];
    t2Score = json['t2Score'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    data['status'] = this.status;
    data['t1Image'] = this.t1Image;
    data['t1Name'] = this.t1Name;
    data['t1Score'] = this.t1Score;
    data['t2Image'] = this.t2Image;
    data['t2Name'] = this.t2Name;
    data['t2Score'] = this.t2Score;
    data['message'] = this.message;
    return data;
  }
}
