import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/pegawai_detail.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';
import '../model/poli.dart';

class PegawaiItemPage extends StatelessWidget {
  final Pegawai pegawai;
  const PegawaiItemPage({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          child: ListTile(
            title: Text("${pegawai.namaPegawai}"),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai : pegawai)));
        }
    );
  }
}
