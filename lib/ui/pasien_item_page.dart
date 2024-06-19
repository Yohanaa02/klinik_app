import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/pasien_detail.dart';
import 'package:klinik_app/ui/pegawai_detail.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';
import '../model/poli.dart';

class PasienItemPage extends StatelessWidget {
  final Pasien pasien;
  const PasienItemPage({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          child: ListTile(
            title: Text("${pasien.namaPasien}"),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien : pasien)));
        }
    );
  }
}
