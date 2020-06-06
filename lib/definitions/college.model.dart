import 'package:college_backoffice/definitions/course.model.dart';

abstract class College {
  String id;
  String email;
  String password; //Prototipo navegavel, nada de autenticaçao por aqui 🤙🤙
  String name;
  List<Course> courses;

  College({
    this.id,
    this.email,
    this.password, //Prototipo navegavel, nada de autenticaçao por aqui 🤙🤙
    this.name,
    this.courses,
  });
}