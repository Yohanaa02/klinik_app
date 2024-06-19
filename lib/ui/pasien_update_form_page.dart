import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/service/pasien_service.dart';
import 'package:klinik_app/service/poli_service.dart';
import 'package:klinik_app/ui/pasien_detail_page.dart';
import '../model/poli.dart';
import 'poli_detail_page.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _idPasienCtrl.text = widget.pasien.id!;
      _namaPasienCtrl.text = widget.pasien.nm_pasien!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            key: _formKey,
              child: Column(
                children: [
                  _wTextField(namaField: "Nama Pasien", namaController: _namaPasienCtrl, namaIcon: Icons.room_preferences_rounded),
                  SizedBox(height: 10),
                  _wTombolUbah()
                ],
              )),
        ),
      ),
    );
  }

  Widget _wTextField({required String namaField, required namaController, required namaIcon}){
    return TextField(
      decoration: InputDecoration(
        labelText: namaField,
        prefixIcon: Icon(namaIcon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
      ),
      controller: namaController,
    );
  }

  Widget _wTombolUbah(){
    return ElevatedButton(
        onPressed: () async {
          Pasien pasien = Pasien(
            id: _idPasienCtrl.text,
            nm_pasien: _namaPasienCtrl.text,
          );
          await PasienService().updatePasien(pasien).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PasienDetailPage(pasien: pasien)));
          });
        },
        child: Text("Ubah")
    );
  }
}