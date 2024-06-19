import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/pegawai_form_page.dart';
import 'package:klinik_app/ui/pegawai_item_page.dart';
import '../widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          title: const Text("Data Pegawai"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PegawaiFormPage()));
                },
                child: Padding(
                  padding: EdgeInsets.all(8.10),
                  child: Icon(Icons.add),
                )
            )
          ],
        ),
        body: ListView(
          children: [
            PegawaiItemPage(pegawai: Pegawai(namaPegawai: "Yohana")),
            PegawaiItemPage(pegawai: Pegawai(namaPegawai: "Jisoo")),
          ],
        )
    );
  }
}