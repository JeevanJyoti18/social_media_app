import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = "/posts_screen";

  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //Add Post (Pick Image Nnd go to create post screen)
          IconButton(onPressed: (){}, icon: const Icon(Icons.add, size: 30)),
          //Log Out (Navigate back to Sign in Screen)
          IconButton(onPressed: (){}, icon: const Icon(Icons.logout, size: 30)),
        ],
      ),

      body: ListView.builder(itemBuilder: (context, index) {
       return Container();
      }),

    );
  }
}
