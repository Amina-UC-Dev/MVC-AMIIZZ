class USerInfo {
  String status;
  Data data = null;

  USerInfo({this.status, this.data});

  USerInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String username;
  String email;
  String avatar;
  String designation;
  int departmentId;
  String departmentName;
  String phone;
  String location;
  String rating;

  Data(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.avatar,
        this.designation,
        this.departmentId,
        this.departmentName,
        this.phone,
        this.location,
        this.rating});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    designation = json['designation'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    phone = json['phone'];
    location = json['location'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['designation'] = this.designation;
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['rating'] = this.rating;
    return data;
  }
}