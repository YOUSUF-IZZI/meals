import 'package:freezed_annotation/freezed_annotation.dart';


part 'users.freezed.dart';
part 'users.g.dart';    //for json files

@freezed
class Users with _$Users
{
  const factory Users({
    String? name,
    String? surname,
    required String email,
    required String password,
    DateTime? birthday,
    String? city,
    String? district
  })  = _Users;


  factory Users.fromJson(Map<String, Object?> json) => _$UsersFromJson(json);
}

/* -----------------------------------------------------
 use this to Upgrade:  flutter pub run build_runner build
 ------------------------------------------------------ */