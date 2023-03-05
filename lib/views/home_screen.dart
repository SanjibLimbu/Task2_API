import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/models/posts_model.dart';
import 'package:task2/view_models/posts_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostsData>(context, listen: false).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Consumer<PostsData>(
          builder: (context, postsData, child) {
            if (postsData.posts.isNotEmpty) {
              return ListView.builder(
                  itemCount: postsData.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Posts post = postsData.posts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.green
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                post.body,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                 style: const TextStyle(
                                  fontSize: 16,
                              
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text('Empty'),
              );
            }
          },
        ));
  }
}
