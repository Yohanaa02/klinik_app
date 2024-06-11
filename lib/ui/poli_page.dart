import 'package:flutter/material.dart';
import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/ui/poli_item_page.dart';
import 'package:klinik_app/widget/sidebar.dart';
import '../model/poli.dart';
import '../service/poli_service.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  PoliService _poliService = PoliService();
  Future<List<Poli>>? _poliList;
  List<Poli>? _retrievedPoliList;

  Future<void> _initRetrieval() async {
    _poliList = _poliService.retrievePoli();
    _retrievedPoliList = await _poliService.retrievePoli();
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _initRetrieval();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Poli"),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PoliForm()));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: FutureBuilder(
          future: _poliList,
          builder: (BuildContext context, AsyncSnapshot<List<Poli>> snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: _retrievedPoliList!.length,
              itemBuilder: (context, index){
                var poli = _retrievedPoliList![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete, color: Colors.white,),
                  ),
                  onDismissed: (direction){
                    _poliService.deletePoli(poli.id!);
                  },
                  direction: DismissDirection.endToStart,
                  child: PoliItemPage(poli: poli),
                );
              }
            );
          }
        ),
      ),
    );
  }
}
