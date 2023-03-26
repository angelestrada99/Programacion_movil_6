import 'package:flutter/material.dart';
import 'package:flutter_1/database/database_helper.dart';
import 'package:flutter_1/models/post_model.dart';
import 'package:flutter_1/provider/flags_provider.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  DatabaseHelper database = DatabaseHelper();
  PostModel? objPostModel;

  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    final txtConPost = TextEditingController();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      objPostModel = ModalRoute.of(context)!.settings.arguments as PostModel;
      txtConPost.text = objPostModel!.dscPost.toString();
    }
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 350,
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: Colors.greenAccent),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              objPostModel == null ? Text('Add post') : Text('Update post'),
              TextFormField(
                controller: txtConPost,
                maxLines: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (objPostModel == null) {
                      database.INSERT('tblPost', {
                        'dscPost': txtConPost.text,
                        'datePost': DateTime.now().toString(),
                      }).then((value) {
                        var msg = value > 0
                            ? 'Registro insertado'
                            : 'Ocurrio un error';
                        var snackBar = SnackBar(content: Text(msg));

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    } else {
                      database
                          .UPDATE(
                              'tblPost',
                              {
                                'idPost': objPostModel!.idPost,
                                'dscPost': txtConPost.text,
                                'datePost': DateTime.now().toString(),
                              },
                              'idPost')
                          .then((value) {
                        var msg = value > 0
                            ? 'Registro modificado'
                            : 'Ocurrio un error';
                        var snackBar = SnackBar(content: Text(msg));
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                    flag.setflagListPost();
                  },
                  child: Text('Save post'))
            ],
          ),
        ),
      ),
    );
  }
}
