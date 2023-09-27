import 'package:flutter/material.dart';
import 'package:formit/common_widgets/form_widget.dart';
import 'package:formit/models/form_field_model.dart';
import 'package:formit/providers/form_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FormProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FormProvider>().addField(MyFormField(question: 'Wow'));
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<FormProvider>(
        builder: (context, form, child) {
          return MyFormWidget(form: form.form);
        },
      ),
    );
  }
}
