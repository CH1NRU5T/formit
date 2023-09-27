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
  final List<DropdownMenuItem> _items = [
    const DropdownMenuItem(
      value: FormFieldType.shortAnswer,
      child: Text('Short Answer'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.paragraph,
      child: Text('Paragraph'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.multipleChoice,
      child: Text('Multiple Choice'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.checkBoxes,
      child: Text('Checkboxes'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.dropDown,
      child: Text('Dropdown'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.fileUpload,
      child: Text('File Upload'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.date,
      child: Text('Date'),
    ),
    const DropdownMenuItem(
      value: FormFieldType.time,
      child: Text('Time'),
    ),
  ];

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
              DropdownButton(
                value: widget.field.type!,
                items: _items,
                onChanged: (value) {
                  context.read<FormProvider>().changeField(
                        widget.index,
                        type: value as FormFieldType,
                      );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          switch (widget.field.type!) {
            FormFieldType.shortAnswer => Text(widget.field.type.toString()),
            FormFieldType.paragraph => Text(widget.field.type.toString()),
            FormFieldType.multipleChoice => Text(widget.field.type.toString()),
            FormFieldType.checkBoxes => Text(widget.field.type.toString()),
            FormFieldType.dropDown => Text(widget.field.type.toString()),
            FormFieldType.fileUpload => Text(widget.field.type.toString()),
            FormFieldType.date => Text(widget.field.type.toString()),
            FormFieldType.time => Text(widget.field.type.toString()),
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
