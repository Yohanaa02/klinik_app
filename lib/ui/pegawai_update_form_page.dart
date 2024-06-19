import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/pegawai_detail.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';

class PegawaiUpdateFormPage extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiUpdateFormPage({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateFormPage> createState() => _PegawaiUpdateFormPageState();
}

class _PegawaiUpdateFormPageState extends State<PegawaiUpdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();

  @override
  void initState(){
    super.initState();
    setState(() {
      _namaPegawaiCtrl.text = widget.pegawai.namaPegawai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ubah Pegawai"),),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _field(namafield: "Nama Pegawai", namacontroller: _namaPegawaiCtrl),
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
        Pegawai pegawai = Pegawai(namaPegawai: _namaPegawaiCtrl.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetail(pegawai: pegawai)
            )
        );
      },
      child: Text("Simpan Perubahan"),
    );
  }
}
