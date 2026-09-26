import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';

class CommentManagerView extends StatefulWidget {
  final Client client;
  final int blogId;

  const CommentManagerView({super.key, required this.client, required this.blogId});

  @override
  State<CommentManagerView> createState() => _CommentManagerViewState();
}

class _CommentManagerViewState extends State<CommentManagerView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Comment> _allComments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadComments();
  }

  Future<void> _loadComments() async {
    try {
      final comments = await widget.client.blogger.getComments(widget.blogId);
      if (mounted) {
        setState(() {
          _allComments = comments;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    final published = _allComments.where((c) => c.isApproved).toList();
    final pending = _allComments.where((c) => !c.isApproved).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Moderation'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Published (${published.length})'),
            Tab(text: 'Pending Moderation (${pending.length})'),
            const Tab(text: 'Spam (0)'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCommentList(published),
          _buildCommentList(pending),
          const Center(child: Text('No spam comments flagged.')),
        ],
      ),
    );
  }

  Widget _buildCommentList(List<Comment> comments) {
    if (comments.isEmpty) return const Center(child: Text('No comments found in this category.'));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(child: Text(comment.authorName[0])),
            title: Text(comment.authorName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(comment.content, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 4),
                Text(comment.createdAt.toIso8601String().split('T').first, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: comment.isApproved,
                  onChanged: (val) async {
                    if (comment.id != null) {
                      await widget.client.blogger.updateCommentStatus(comment.id!, val);
                      _loadComments();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    if (comment.id != null) {
                      await widget.client.blogger.deleteComment(comment.id!);
                      _loadComments();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
