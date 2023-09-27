import 'package:formit/constants/enums.dart';

class MyFormField {
  String question;
  FormFieldType? type;
  MyFormField(
      {this.question = 'Question', this.type = FormFieldType.shortAnswer});
}
