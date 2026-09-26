import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';
import 'universal_renderer.dart';

class BlogReaderView extends StatefulWidget {
  final Client client;
  final int blogId;
  final String postSlug;

  const BlogReaderView({
    super.key,
    required this.client,
    required this.blogId,
    required this.postSlug,
  });

  @override
  State<BlogReaderView> createState() => _BlogReaderViewState();
}

class _BlogReaderViewState extends State<BlogReaderView> {
  BlogPost? _post;
  BlogSite? _blog;
  List<Comment> _comments = [];
  bool _isLoading = true;

  final TextEditingController _commentAuthorController = TextEditingController();
  final TextEditingController _commentContentController = TextEditingController();
  bool _isSubmittingComment = false;

  @override
  void initState() {
    super.initState();
    _loadPostAndBlogData();
  }

  Future<void> _loadPostAndBlogData() async {
    try {
      final post = await widget.client.blogger.getPostBySlug(widget.blogId, widget.postSlug);
      final blog = await widget.client.blogger.getBlog(widget.blogId);
      final comments = post?.id != null ? await widget.client.blogger.getComments(widget.blogId, postId: post!.id) : <Comment>[];

      if (mounted) {
        setState(() {
          _post = post;
          _blog = blog;
          _comments = comments.where((c) => c.isApproved).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _submitComment() async {
    if (_commentAuthorController.text.isEmpty || _commentContentController.text.isEmpty || _post?.id == null) return;

    setState(() => _isSubmittingComment = true);
    try {
      final newComment = Comment(
        blogId: widget.blogId,
        postId: _post!.id!,
        authorName: _commentAuthorController.text,
        content: _commentContentController.text,
        createdAt: DateTime.now(),
        isApproved: true, // Auto-approve for demo
      );

      await widget.client.blogger.addComment(newComment);
      _commentContentController.clear();
      await _loadPostAndBlogData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Comment posted!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error posting comment: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSubmittingComment = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_post == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('404 Page Not Found')),
        body: const Center(
          child: Text('The requested post or page does not exist on this blog.', style: TextStyle(fontSize: 18)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_blog?.title ?? 'Blogger Site', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              color: Colors.orange.shade50,
              child: Center(
                child: Text(
                  _blog?.description ?? 'Welcome to our blog',
                  style: TextStyle(fontSize: 16, color: Colors.orange.shade900, fontStyle: FontStyle.italic),
                ),
              ),
            ),

            // Content
            UniversalJsonLdRenderer(jsonLdPayload: _post!.jsonLdPayload),

            const Divider(height: 48),

            // Comment Section
            Container(
              maxWidth: 800,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Comments (${_comments.length})', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ..._comments.map((c) => Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(child: Text(c.authorName[0])),
                          title: Text(c.authorName, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(c.content),
                        ),
                      )),
                  const SizedBox(height: 24),
                  const Text('Leave a Comment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _commentAuthorController,
                    decoration: const InputDecoration(labelText: 'Your Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _commentContentController,
                    maxLines: 3,
                    decoration: const InputDecoration(labelText: 'Your Comment...', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: _isSubmittingComment ? null : _submitComment,
                    icon: _isSubmittingComment ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                    label: const Text('Publish Comment'),
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
