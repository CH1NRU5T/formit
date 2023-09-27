import 'package:flutter/material.dart';
import 'package:formit/constants/enums.dart';
import 'package:formit/models/form_field_model.dart';

import '../models/form_model.dart';

class FormProvider extends ChangeNotifier {
  final MyForm _form = MyForm(fields: []);
  void addField(MyFormField field) {
    _form.fields.add(field);
    notifyListeners();
  }

  void changeField(int index, {String? question, FormFieldType? type}) {
    if (question != null) {
      _form.fields[index].question = question;
    }
    if (type != null) {
      _form.fields[index].type = type;
    }
    notifyListeners();
  }

  MyForm get form => _form;
  int get length => _form.fields.length;
}
