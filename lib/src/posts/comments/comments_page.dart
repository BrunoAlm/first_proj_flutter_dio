import 'package:first_proj_flutter_dio/src/posts/comments/comment_model.dart';
import 'package:first_proj_flutter_dio/src/posts/repositories/comments_repository.dart';
import 'package:first_proj_flutter_dio/src/posts/repositories/dio/comments_dio_repository.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsRepository commentsRepository;
  var comments = <CommentModel>[];

  @override
  void initState() {
    super.initState();
    commentsRepository = CommentsDioRepository();
    loadComments();
  }

  loadComments() async {
    comments = await commentsRepository.listComments(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Comentários do Post: ${widget.postId}"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: comments.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, int index) {
                    var comment = comments[index];
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(comment.name.substring(0, 6)),
                                Text(comment.email),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(comment.body),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
