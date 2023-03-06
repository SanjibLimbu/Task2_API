import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/view_models/posts_data.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

  TextEditingController myTitleController = TextEditingController();
  TextEditingController myBodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (myTitleController.text.isNotEmpty &&
                  myBodyController.text.isNotEmpty) {
                Provider.of<PostsData>(context, listen: false).createPost(
                  myTitleController.text,
                  myBodyController.text,
                );

                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
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
    );
  }
}
