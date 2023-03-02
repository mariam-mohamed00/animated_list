import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);
  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  List<String> data = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: Color.fromRGBO(234, 143, 213, 0.9),
        elevation: 0,
        title: const Text('Flutter Map', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
      ),


      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,40,0,10),
              child: FloatingActionButton(

                onPressed: addItem,
                child: Icon(Icons.add,color: Colors.blue,size: 40),
                backgroundColor: Colors.transparent,
                elevation: 0.5,
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: 0,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    key: UniqueKey(),
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Color.fromRGBO(230, 231, 242, 0.8),
                      child: ListTile(
                        title: Text(
                          data[index],
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            removeItem(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void addItem() {
    data.insert(0, 'Item ${data.length+1}');
    key.currentState!.insertItem(0,duration: Duration(milliseconds: 400),
    );
  }

  void removeItem(int index) {
    key.currentState!.removeItem(
      index , (_, animation) {
      return SizeTransition(sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(15),
          color: Colors.red,
          child: ListTile(
            title: Text('Deleted', style: TextStyle(fontSize: 24),),
          ),
        ),
      );
    },
      duration: Duration(milliseconds: 500),
    );
    data.removeAt(index);
  }
}

