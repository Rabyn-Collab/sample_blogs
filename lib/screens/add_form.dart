import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_blog/model/posts.dart';
import 'package:sample_blog/provider/post_provider.dart';



class AddForm extends StatelessWidget {

  final titleController = TextEditingController();
  final imageController = TextEditingController();
  final descriptionController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Form'),
      ),
        body: Form(
          key: _form,
          child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (val){
                     if(val!.isEmpty){
                        return 'please provide title';
                       }else{
                       return null;
                     }
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                        label: Text('Title')
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (val){
                        if(val!.isEmpty || val.length < 20){
                          return 'please provide image';
                        }else{
                          return null;
                        }
                      },
                      controller: imageController,
                      decoration: InputDecoration(
                          label: Text('imageUrl')
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp("[a-z]")),
                      // ],
                      validator: (val){
                        if(val!.isEmpty){
                          return 'please provide description';
                        }else{
                          return null;
                        }
                      },
                      maxLines: 4,
                      controller: descriptionController,
                      decoration: InputDecoration(
                          label: Text('Description')
                      ),
                    ),
                    SizedBox(height: 15,),
                    Consumer(
                      builder: (context, ref, child) {
                        return ElevatedButton(
                            onPressed: () async {
                              _form.currentState!.save();
                              if (_form.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                final newPost = Post(
                                    imageUrl: imageController.text.trim(),
                                    title: titleController.text.trim(),
                                    description: descriptionController.text.trim(),
                                    createdAt: DateTime.now().toIso8601String()
                                );
                        final response =  await ref.read(postProvider).addData(newPost: newPost);
                            ref.refresh(dataProvider);

                             if(response == 'success'){
                               Navigator.of(context).pop();
                             }else{
                              print(response);
                             }
                              }
                            },
                            child: Text('Submit'));
                      }
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}
