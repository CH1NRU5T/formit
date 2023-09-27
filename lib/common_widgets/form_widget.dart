import 'package:flutter/material.dart';
import 'package:formit/common_widgets/form_field_widget.dart';
import 'package:formit/common_widgets/form_header_widget.dart';
import 'package:formit/models/form_model.dart';

class MyFormWidget extends StatelessWidget {
  const MyFormWidget({super.key, required this.form});
  final MyForm form;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormHeader(
          title: form.title,
          description: form.description,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: form.fields.length,
            itemBuilder: (context, index) {
              final field = form.fields[index];
              return FormFieldWidget(
                index,
                field: field,
              );
            },
          ),
        ),
      ],
    );
  }
}
