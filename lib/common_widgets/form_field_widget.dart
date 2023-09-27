import 'package:flutter/material.dart';
import 'package:formit/constants/enums.dart';
import 'package:formit/models/form_field_model.dart';
import 'package:formit/providers/form_provider.dart';
import 'package:provider/provider.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget(this.index, {super.key, required this.field});
  final MyFormField field;
  final int index;
  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: widget.field.question,
                  style: Theme.of(context).textTheme.headlineMedium,
                  onChanged: (question) {
                    context
                        .read<FormProvider>()
                        .changeField(widget.index, question: question);
                  },
                ),
              ),
              // DropdownButton(items: items, onChanged: onChanged)
            ],
          ),
          const SizedBox(height: 10),
          switch (widget.field.type!) {
            FormFieldType.shortAnswer => const SizedBox(),
            FormFieldType.paragraph => const SizedBox(),
            FormFieldType.multipleChoice => const SizedBox(),
            FormFieldType.checkBoxes => const SizedBox(),
            FormFieldType.dropDown => const SizedBox(),
            FormFieldType.fileUpload => const SizedBox(),
            FormFieldType.date => const SizedBox(),
            FormFieldType.time => const SizedBox(),
          }
          // TextFormField(
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
