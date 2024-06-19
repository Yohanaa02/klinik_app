import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/pasien_detail.dart';
import 'package:klinik_app/ui/pegawai_detail.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';

class PasienUpdateFormPage extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateFormPage({super.key, required this.pasien});

  @override
  State<PasienUpdateFormPage> createState() => _PasienUpdateFormPageState();
}

class _PasienUpdateFormPageState extends State<PasienUpdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();

  @override
  void initState(){
    super.initState();
    setState(() {
      _namaPasienCtrl.text = widget.pasien.namaPasien;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ubah Pasien"),),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _field(namafield: "Nama Pasien", namacontroller: _namaPasienCtrl),
                    SizedBox(height: 20),
                    _tombolSimpan(),
                  ],
                )
            )
        )
    );
  }

  Widget _field({required String namafield, required namacontroller}){
    return TextField(
      decoration: InputDecoration(labelText: namafield),
      controller: namacontroller,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: (){
        Pasien pasien = Pasien(namaPasien: _namaPasienCtrl.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: pasien)
            )
        );
      },
      child: Text("Simpan Perubahan"),
    );
  }
}
