import 'package:json_annotation/json_annotation.dart';
import 'package:random_contacts_app/model/name_model.dart';
import 'package:random_contacts_app/model/picture_model.dart';


part 'contacts_model.g.dart';

@JsonSerializable()
class ContactsModel {
  NameModel? name;
  String? phone;
  String? email;
  PictureModel? picture;

  ContactsModel({this.name, this.phone, this.email, this.picture});

  factory ContactsModel.fromJson(Map<String, dynamic> json) => _$ContactsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsModelToJson(this);
}
