// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:formit/models/form_field_model.dart';

class MyForm {
  String title;
  String description;
  List<MyFormField> fields;
  String? url;
  MyForm({
    this.title = 'Untitled Form',
    this.description = 'Form Description',
    required this.fields,
    this.url,
  });
}
