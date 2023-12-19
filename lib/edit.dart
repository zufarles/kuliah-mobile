import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditPage extends StatefulWidget {
  final String description;
  final String amount;
  final int id;

  const EditPage({
    super.key,
    required this.description,
    required this.amount,
    required this.id,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController keteranganController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    keteranganController.text = widget.description;
    amountController.text = widget.amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Edit Page",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: keteranganController,
                label: "Keterangan",
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: amountController,
                label: "Jumlah Pengeluaran",
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPressed: () async {
                  await Supabase.instance.client.from('expense').update({
                    'description': keteranganController.text,
                    'amount': amountController.text,
                  }).match({'id': widget.id});

                  Navigator.of(context).pop();
                },
                text: "Simpan",
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
