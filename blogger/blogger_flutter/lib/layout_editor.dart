import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';

class LayoutEditorView extends StatefulWidget {
  final Client client;
  final int blogId;

  const LayoutEditorView({super.key, required this.client, required this.blogId});

  @override
  State<LayoutEditorView> createState() => _LayoutEditorViewState();
}

class _LayoutEditorViewState extends State<LayoutEditorView> {
  List<LayoutWidget> _widgets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWidgets();
  }

  Future<void> _loadWidgets() async {
    try {
      final widgets = await widget.client.blogger.getLayoutWidgets(widget.blogId);
      if (mounted) {
        setState(() {
          _widgets = widgets;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showAddGadgetDialog(String section) {
    final titleController = TextEditingController();
    String selectedType = 'HTML/JavaScript';

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Add Gadget to $section'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: const InputDecoration(labelText: 'Gadget Type', border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'HTML/JavaScript', child: Text('HTML / JavaScript Code')),
                DropdownMenuItem(value: 'AdSense', child: Text('Google AdSense Banner')),
                DropdownMenuItem(value: 'PopularPosts', child: Text('Popular Posts Carousel')),
                DropdownMenuItem(value: 'Labels', child: Text('Labels Cloud / Categories')),
                DropdownMenuItem(value: 'Search', child: Text('Blog Search Box')),
              ],
              onChanged: (val) {
                if (val != null) selectedType = val;
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Gadget Title', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (titleController.text.isNotEmpty) {
                final gadget = LayoutWidget(
                  blogId: widget.blogId,
                  section: section,
                  widgetType: selectedType,
                  title: titleController.text,
                  configJson: '{}',
                  sortOrder: _widgets.length + 1,
                  isVisible: true,
                );
                await widget.client.blogger.saveLayoutWidget(gadget);
                if (mounted && dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                  _loadWidgets();
                }
              }
            },
            child: const Text('Add Gadget'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: const Text('Layout & Gadget Studio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildSectionCard('Header Section', Icons.view_headline, 'Header'),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildSectionCard('Main Posts Container', Icons.view_stream, 'Main')),
                const SizedBox(width: 16),
                Expanded(child: _buildSectionCard('Right Sidebar Gadgets', Icons.view_sidebar, 'Sidebar')),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionCard('Footer Section', Icons.view_compact, 'Footer'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, IconData icon, String sectionKey) {
    final sectionWidgets = _widgets.where((w) => w.section == sectionKey).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.orange.shade800),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _showAddGadgetDialog(sectionKey),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Add a Gadget'),
                ),
              ],
            ),
            const Divider(),
            if (sectionWidgets.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text('No gadgets in this section.', style: TextStyle(color: Colors.grey))),
              )
            else
              ...sectionWidgets.map((w) => ListTile(
                    leading: const Icon(Icons.widgets, color: Colors.blue),
                    title: Text(w.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Type: ${w.widgetType}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        if (w.id != null) {
                          await widget.client.blogger.deleteLayoutWidget(w.id!);
                          _loadWidgets();
                        }
                      },
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
