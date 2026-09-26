import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';

class ThemeCustomizerView extends StatefulWidget {
  final Client client;
  final int blogId;

  const ThemeCustomizerView({super.key, required this.client, required this.blogId});

  @override
  State<ThemeCustomizerView> createState() => _ThemeCustomizerViewState();
}

class _ThemeCustomizerViewState extends State<ThemeCustomizerView> {
  BlogTheme? _theme;
  bool _isLoading = true;
  bool _isSaving = false;

  late TextEditingController _customCssController;
  String _selectedThemePreset = 'Contempo';
  String _selectedFontFamily = 'Roboto';
  String _selectedLayoutVariant = 'SidebarRight';

  final List<String> _themePresets = ['Contempo', 'Soho', 'Emporium', 'Notable', 'Essential', 'Simple'];
  final List<String> _fontFamilies = ['Roboto', 'Open Sans', 'Lato', 'Merriweather', 'Playfair Display'];

  @override
  void initState() {
    super.initState();
    _customCssController = TextEditingController();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final theme = await widget.client.blogger.getBlogTheme(widget.blogId);
      if (mounted) {
        setState(() {
          _theme = theme;
          _selectedThemePreset = theme?.themeName ?? 'Contempo';
          _selectedFontFamily = theme?.fontFamily ?? 'Roboto';
          _selectedLayoutVariant = theme?.layoutVariant ?? 'SidebarRight';
          _customCssController.text = theme?.customCss ?? '/* Custom Blogger Theme CSS */\nbody {\n  font-family: "Roboto", sans-serif;\n  background-color: #f5f5f5;\n}';
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _saveTheme() async {
    setState(() => _isSaving = true);
    try {
      final newTheme = BlogTheme(
        id: _theme?.id,
        blogId: widget.blogId,
        themeName: _selectedThemePreset,
        primaryColor: '#FF5722',
        fontFamily: _selectedFontFamily,
        customCss: _customCssController.text,
        layoutVariant: _selectedLayoutVariant,
        updatedAt: DateTime.now(),
      );

      final updated = await widget.client.blogger.updateBlogTheme(newTheme);
      if (mounted) {
        setState(() {
          _theme = updated;
          _isSaving = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Theme saved successfully!')));
      }
    } catch (e) {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme & CSS Customizer'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: _isSaving ? null : _saveTheme,
              icon: const Icon(Icons.save),
              label: const Text('Apply To Blog'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Theme Preset Gallery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _themePresets.length,
                itemBuilder: (context, index) {
                  final preset = _themePresets[index];
                  final isSelected = preset == _selectedThemePreset;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedThemePreset = preset),
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange.shade50 : Colors.white,
                        border: Border.all(color: isSelected ? Colors.orange.shade800 : Colors.grey.shade300, width: isSelected ? 2 : 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.palette, size: 36, color: isSelected ? Colors.orange.shade800 : Colors.grey),
                          const SizedBox(height: 8),
                          Text(preset, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedFontFamily,
                    decoration: const InputDecoration(labelText: 'Typography Font Family', border: OutlineInputBorder()),
                    items: _fontFamilies.map((font) => DropdownMenuItem(value: font, child: Text(font))).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => _selectedFontFamily = val);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedLayoutVariant,
                    decoration: const InputDecoration(labelText: 'Page Layout Structure', border: OutlineInputBorder()),
                    items: const [
                      DropdownMenuItem(value: 'SidebarRight', child: Text('Main Content + Right Sidebar')),
                      DropdownMenuItem(value: 'SidebarLeft', child: Text('Left Sidebar + Main Content')),
                      DropdownMenuItem(value: 'FullWidth', child: Text('Single Column Full Width')),
                    ],
                    onChanged: (val) {
                      if (val != null) setState(() => _selectedLayoutVariant = val);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text('Advanced Custom CSS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: _customCssController,
                maxLines: 12,
                style: const TextStyle(fontFamily: 'monospace', color: Colors.cyanAccent, fontSize: 13),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
