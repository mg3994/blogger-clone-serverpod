import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';
import 'universal_renderer.dart';

class PostEditorView extends StatefulWidget {
  final Client client;
  final int blogId;
  final BlogPost? postToEdit;
  final VoidCallback onSaved;

  const PostEditorView({
    super.key,
    required this.client,
    required this.blogId,
    this.postToEdit,
    required this.onSaved,
  });

  @override
  State<PostEditorView> createState() => _PostEditorViewState();
}

class _PostEditorViewState extends State<PostEditorView> {
  late TextEditingController _titleController;
  late TextEditingController _slugController;
  late TextEditingController _summaryController;
  late TextEditingController _labelsController;
  late TextEditingController _jsonLdController;

  String _selectedSchemaType = 'Article';
  String _selectedStatus = 'Published';
  bool _showPreview = false;
  bool _isSaving = false;

  final List<String> _supportedSchemaTypes = [
    'Article',
    'BlogPosting',
    'Recipe',
    'Product',
    'Event',
    'Review',
    'Course',
    'NewsArticle',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.postToEdit?.title ?? '');
    _slugController = TextEditingController(text: widget.postToEdit?.slug ?? '');
    _summaryController = TextEditingController(text: widget.postToEdit?.summary ?? '');
    _labelsController = TextEditingController(text: widget.postToEdit?.labels.join(', ') ?? '');
    _selectedSchemaType = widget.postToEdit?.schemaType ?? 'Article';
    _selectedStatus = widget.postToEdit?.status ?? 'Published';

    _jsonLdController = TextEditingController(
      text: widget.postToEdit?.jsonLdPayload ??
          const JsonEncoder.withIndent('  ').convert({
            "@context": "https://schema.org",
            "@type": "Article",
            "headline": "My New Blogger Post",
            "description": "Enter post summary and rich description here...",
            "articleBody": "This post is powered strictly by Schema.org JSON-LD payload...",
            "author": {"@type": "Person", "name": "Blogger Author"}
          }),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _slugController.dispose();
    _summaryController.dispose();
    _labelsController.dispose();
    _jsonLdController.dispose();
    super.dispose();
  }

  Future<void> _savePost() async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a post title')));
      return;
    }

    setState(() => _isSaving = true);
    try {
      final labels = _labelsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
      String slug = _slugController.text.trim();
      if (slug.isEmpty) {
        slug = _titleController.text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'^-|-$'), '');
      }

      final post = BlogPost(
        id: widget.postToEdit?.id,
        blogId: widget.blogId,
        authorId: 1,
        slug: slug,
        publishedDate: widget.postToEdit?.publishedDate ?? DateTime.now(),
        status: _selectedStatus,
        labels: labels,
        schemaType: _selectedSchemaType,
        jsonLdPayload: _jsonLdController.text,
        title: _titleController.text,
        summary: _summaryController.text,
      );

      await widget.client.blogger.createOrUpdatePost(post);
      widget.onSaved();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving post: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postToEdit == null ? 'Create New Post' : 'Edit Post'),
        actions: [
          IconButton(
            icon: Icon(_showPreview ? Icons.edit : Icons.visibility, color: Colors.deepOrange),
            tooltip: _showPreview ? 'Switch to Code Editor' : 'Live Universal JSON-LD Preview',
            onPressed: () => setState(() => _showPreview = !_showPreview),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: _isSaving ? null : _savePost,
              icon: _isSaving ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.publish),
              label: Text(widget.postToEdit == null ? 'Publish' : 'Update'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: _showPreview
                ? UniversalJsonLdRenderer(jsonLdPayload: _jsonLdController.text)
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _titleController,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            border: InputBorder.none,
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _slugController,
                                decoration: const InputDecoration(
                                  labelText: 'Custom Slug / Permalinks',
                                  prefixText: '/',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedSchemaType,
                                decoration: const InputDecoration(labelText: 'Schema.org Type', border: OutlineInputBorder()),
                                items: _supportedSchemaTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedSchemaType = val);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _summaryController,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Search Description / Summary',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _labelsController,
                          decoration: const InputDecoration(
                            labelText: 'Labels / Tags (comma separated)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.label),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text('Raw Schema.org JSON-LD Editor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  _jsonLdController.text = const JsonEncoder.withIndent('  ').convert({
                                    "@context": "https://schema.org",
                                    "@type": _selectedSchemaType,
                                    "headline": _titleController.text.isNotEmpty ? _titleController.text : "Sample Title",
                                    "description": _summaryController.text,
                                    "articleBody": "Rich text content generated dynamically into Schema.org payload."
                                  });
                                });
                              },
                              icon: const Icon(Icons.auto_fix_high, size: 16),
                              label: const Text('Generate Boilerplate'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _jsonLdController,
                            maxLines: 14,
                            style: const TextStyle(fontFamily: 'monospace', color: Colors.lightGreenAccent, fontSize: 13),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          const VerticalDivider(width: 1),
          Container(
            width: 280,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade50,
            child: ListView(
              children: [
                const Text('Post Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: const InputDecoration(labelText: 'Status', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'Published', child: Text('Published')),
                    DropdownMenuItem(value: 'Draft', child: Text('Draft')),
                    DropdownMenuItem(value: 'Scheduled', child: Text('Scheduled')),
                  ],
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedStatus = val);
                  },
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Publish Date'),
                  subtitle: Text(DateTime.now().toIso8601String().split('T').first),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Location Tag'),
                  subtitle: const Text('Add GPS Geolocation'),
                  trailing: const Icon(Icons.add_location_alt),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
