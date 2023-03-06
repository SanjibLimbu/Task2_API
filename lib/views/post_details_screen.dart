import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/models/posts_model.dart';
import 'package:task2/view_models/posts_data.dart';

class PostDetailScreen extends StatelessWidget {
  PostDetailScreen({super.key, required this.post});

  final post;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController myTitleController = TextEditingController(
    text: post.title ?? '',
  );
  late TextEditingController myBodyController =
      TextEditingController(text: post.body ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<PostsData>(context, listen: false).patchPost(
                post.id ?? 0,
                myTitleController.text,
                myBodyController.text,
              );
              Navigator.pop(context);
            },
            child: const Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //title
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: myTitleController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                      cursorColor: Colors.black54,
                      textCapitalization: TextCapitalization.sentences,
                      autofocus: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 156, 156, 157),
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              0,
                            ),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //body
                    TextFormField(
                      controller: myBodyController,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      cursorColor: Colors.black54,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: 'body',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 156, 156, 157),
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              0,
                            ),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
