import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/pegawai_detail.dart';

class PegawaiFormPage extends StatefulWidget {
  const PegawaiFormPage({super.key});

  @override
  State<PegawaiFormPage> createState() => _PegawaiFormPageState();
}

class _PegawaiFormPageState extends State<PegawaiFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tambah Pegawai"),),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _field(namafield: "Nama Pegawai", namacontroller: _namaPegawaiCtrl),
                    SizedBox(height: 20),
                    _tombolSimpan()
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
        onPressed: () {
          Pegawai pegawai = Pegawai(namaPegawai: _namaPegawaiCtrl.text);
          Navigator.pushReplacement(
              context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetail(pegawai: pegawai)
            )
          );
        },
        child: const Text("Simpan"),
    );
  }
}
