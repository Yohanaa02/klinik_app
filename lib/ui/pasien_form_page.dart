import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/ui/pasien_detail.dart';

class PasienFormPage extends StatefulWidget {
  const PasienFormPage({super.key});

  @override
  State<PasienFormPage> createState() => _PasienFormPageState();
}

class _PasienFormPageState extends State<PasienFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field(namafield: "Nama Pasien", namacontroller: _namaPasienCtrl),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
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
        onPressed: () {
          Pasien pasien = Pasien(namaPasien: _namaPasienCtrl.text);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien)
              )
          );
        },
        child: const Text("Simpan")
    );
  }
}