import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';
import 'universal_renderer.dart';

class BloggerAdminDashboard extends StatefulWidget {
  final Client client;
  const BloggerAdminDashboard({super.key, required this.client});

  @override
  State<BloggerAdminDashboard> createState() => _BloggerAdminDashboardState();
}

class _BloggerAdminDashboardState extends State<BloggerAdminDashboard> {
  int _selectedIndex = 0;
  final int _blogId = 1; // Default primary blog ID

  List<BlogPost> _posts = [];
  List<BlogPage> _pages = [];
  List<Comment> _comments = [];
  List<BlogStat> _stats = [];
  BlogEarning? _earning;
  BlogSettings? _settings;
  BlogTheme? _theme;
  List<FollowedBlog> _followedBlogs = [];

  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    setState(() => _isLoading = true);
    try {
      final posts = await widget.client.blogger.getPosts(_blogId);
      final pages = await widget.client.blogger.getPages(_blogId);
      final comments = await widget.client.blogger.getComments(_blogId);
      final stats = await widget.client.blogger.getBlogStats(_blogId);
      final earning = await widget.client.blogger.getBlogEarning(_blogId);
      final settings = await widget.client.blogger.getBlogSettings(_blogId);
      final theme = await widget.client.blogger.getBlogTheme(_blogId);
      final followed = await widget.client.blogger.getFollowedBlogs(1);

      if (mounted) {
        setState(() {
          _posts = posts;
          _pages = pages;
          _comments = comments;
          _stats = stats;
          _earning = earning;
          _settings = settings;
          _theme = theme;
          _followedBlogs = followed;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error loading dashboard data: $e");
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network('https://www.gstatic.com/images/branding/product/2x/blogger_48dp.png', height: 32, errorBuilder: (_, __, ___) => const Icon(Icons.bento, color: Colors.orange)),
            const SizedBox(width: 12),
            const Text('Blogger Studio', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Dashboard',
            onPressed: _loadDashboardData,
          ),
          IconButton(
            icon: const Icon(Icons.import_export),
            tooltip: 'Backup & Export Blog Data',
            onPressed: _showExportImportDialog,
          ),
          IconButton(
            icon: const Icon(Icons.publish),
            tooltip: 'Ingest JSON-LD Content Webhook',
            onPressed: _showIngestDialog,
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) => setState(() => _selectedIndex = index),
            labelType: NavigationRailLabelType.all,
            leading: FloatingActionButton.extended(
              onPressed: _createNewPostDialog,
              icon: const Icon(Icons.add),
              label: const Text('NEW POST'),
              backgroundColor: Colors.orange.shade800,
              foregroundColor: Colors.white,
            ),
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.article_outlined), selectedIcon: Icon(Icons.article), label: Text('Posts')),
              NavigationRailDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: Text('Stats')),
              NavigationRailDestination(icon: Icon(Icons.comment_outlined), selectedIcon: Icon(Icons.comment), label: Text('Comments')),
              NavigationRailDestination(icon: Icon(Icons.attach_money_outlined), selectedIcon: Icon(Icons.attach_money), label: Text('Earnings')),
              NavigationRailDestination(icon: Icon(Icons.pages_outlined), selectedIcon: Icon(Icons.pages), label: Text('Pages')),
              NavigationRailDestination(icon: Icon(Icons.palette_outlined), selectedIcon: Icon(Icons.palette), label: Text('Theme')),
              NavigationRailDestination(icon: Icon(Icons.dashboard_customize_outlined), selectedIcon: Icon(Icons.dashboard_customize), label: Text('Layout')),
              NavigationRailDestination(icon: Icon(Icons.chrome_reader_mode_outlined), selectedIcon: Icon(Icons.chrome_reader_mode), label: Text('Reading List')),
              NavigationRailDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: Text('Settings')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : IndexedStack(
                    index: _selectedIndex,
                    children: [
                      _buildPostsTab(),
                      _buildStatsTab(),
                      _buildCommentsTab(),
                      _buildEarningsTab(),
                      _buildPagesTab(),
                      _buildThemeTab(),
                      _buildLayoutTab(),
                      _buildReadingListTab(),
                      _buildSettingsTab(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // --- 1. Posts Tab ---
  Widget _buildPostsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search posts by title, summary, or schema type...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  onChanged: (val) async {
                    if (val.isEmpty) {
                      _loadDashboardData();
                    } else {
                      final results = await widget.client.blogger.searchPosts(_blogId, val);
                      setState(() => _posts = results);
                    }
                  },
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: _createNewPostDialog,
                icon: const Icon(Icons.add),
                label: const Text('Create Post'),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: _posts.isEmpty
              ? const Center(child: Text('No posts found. Click "NEW POST" or use Ingest Webhook.'))
              : ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange.shade100,
                          child: Icon(Icons.code, color: Colors.orange.shade900),
                        ),
                        title: Text(post.title ?? post.slug, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Type: ${post.schemaType} | Slug: /${post.slug} | Status: ${post.status}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility, color: Colors.blue),
                              tooltip: 'Preview Universal JSON-LD Render',
                              onPressed: () => _previewPost(post),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                if (post.id != null) {
                                  await widget.client.blogger.deletePost(post.id!);
                                  _loadDashboardData();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  // --- 2. Stats Tab ---
  Widget _buildStatsTab() {
    final totalViews = _stats.fold<int>(0, (sum, item) => sum + item.pageViews);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Analytics & Performance', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildStatCard('Total Pageviews', '$totalViews', Icons.remove_red_eye, Colors.blue),
              const SizedBox(width: 16),
              _buildStatCard('Total Posts', '${_posts.length}', Icons.article, Colors.orange),
              const SizedBox(width: 16),
              _buildStatCard('Comments', '${_comments.length}', Icons.comment, Colors.green),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Recent Activity Log', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: _stats.length,
              itemBuilder: (context, index) {
                final s = _stats[index];
                return ListTile(
                  leading: const Icon(Icons.trending_up, color: Colors.green),
                  title: Text('${s.pageViews} views from ${s.country}'),
                  subtitle: Text('Source: ${s.referrerSource} | Date: ${s.recordedDate.toIso8601String().split('T').first}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 12),
              Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text(title, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  // --- 3. Comments Tab ---
  Widget _buildCommentsTab() {
    return Column(
      children: [
        const ListTile(
          title: Text('Comment Moderation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        const Divider(),
        Expanded(
          child: _comments.isEmpty
              ? const Center(child: Text('No comments yet.'))
              : ListView.builder(
                  itemCount: _comments.length,
                  itemBuilder: (context, index) {
                    final comment = _comments[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(comment.authorName[0])),
                        title: Text(comment.authorName),
                        subtitle: Text(comment.content),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: comment.isApproved,
                              onChanged: (val) async {
                                if (comment.id != null) {
                                  await widget.client.blogger.updateCommentStatus(comment.id!, val);
                                  _loadDashboardData();
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                if (comment.id != null) {
                                  await widget.client.blogger.deleteComment(comment.id!);
                                  _loadDashboardData();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  // --- 4. Earnings Tab ---
  Widget _buildEarningsTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Monetization & AdSense Integration', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.monetization_on, size: 40, color: Colors.green),
                    title: const Text('AdSense Publisher Account'),
                    subtitle: Text(_earning?.adSensePublisherId ?? 'pub-1234567890123456'),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text('Estimated Earnings', style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 6),
                          Text('\$${(_earning?.estimatedRevenue ?? 142.50).toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Impressions', style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 6),
                          Text('${_earning?.impressions ?? 12500}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Clicks', style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 6),
                          Text('${_earning?.clicks ?? 320}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 5. Pages Tab ---
  Widget _buildPagesTab() {
    return Column(
      children: [
        ListTile(
          title: Text('Static Pages (${_pages.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          trailing: ElevatedButton.icon(
            onPressed: _createNewPageDialog,
            icon: const Icon(Icons.add),
            label: const Text('Create Page'),
          ),
        ),
        const Divider(),
        Expanded(
          child: _pages.isEmpty
              ? const Center(child: Text('No static pages.'))
              : ListView.builder(
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.find_in_page, color: Colors.indigo),
                        title: Text(page.title ?? page.slug),
                        subtitle: Text('Slug: /${page.slug} | Type: ${page.schemaType}'),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  // --- 6. Theme Tab ---
  Widget _buildThemeTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const Text('Blog Theme & Style Customizer', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.palette, color: Colors.deepOrange, size: 36),
              title: Text('Active Theme: ${_theme?.themeName ?? 'Contempo'}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Primary Color: ${_theme?.primaryColor ?? '#FF5722'} | Layout: ${_theme?.layoutVariant ?? 'SidebarRight'}'),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Custom CSS Rules', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
            child: Text(
              _theme?.customCss ?? 'body { font-family: Roboto; background-color: #FAFAFA; }',
              style: const TextStyle(fontFamily: 'monospace', color: Colors.cyanAccent),
            ),
          ),
        ],
      ),
    );
  }

  // --- 7. Layout Tab ---
  Widget _buildLayoutTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Theme Layout & Gadgets', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildLayoutSection('Header / Top Navigation', Icons.view_headline),
                _buildLayoutSection('Sidebar Gadgets (AdSense, Labels, Search)', Icons.view_sidebar),
                _buildLayoutSection('Main Blog Posts Container', Icons.view_stream),
                _buildLayoutSection('Footer & Copyright Notice', Icons.view_compact),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayoutSection(String name, IconData icon) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.orange.shade800),
                const SizedBox(width: 8),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const Divider(),
            const Expanded(
              child: Center(
                child: Text('+ Add a Gadget', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 8. Reading List Tab ---
  Widget _buildReadingListTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Reading List & Followed Blogs', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: _followedBlogs.isEmpty
                ? const Center(child: Text('No followed blogs in reading list.'))
                : ListView.builder(
                    itemCount: _followedBlogs.length,
                    itemBuilder: (context, index) {
                      final item = _followedBlogs[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.rss_feed, color: Colors.orange),
                          title: Text(item.blogTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(item.blogUrl),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // --- 9. Settings Tab ---
  Widget _buildSettingsTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          const Text('Blog Settings & SEO Metadata', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('Adult Content Warning'),
            subtitle: const Text('Show warning to blog readers'),
            value: _settings?.adultContent ?? false,
            onChanged: (val) {},
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Allow Readers to Comment'),
            value: _settings?.allowCommenting ?? true,
            onChanged: (val) {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Custom Robots.txt (SEO)'),
            subtitle: Text(_settings?.customRobotsTxt ?? 'User-agent: *\nDisallow: /search'),
            trailing: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  // --- Dialog Helpers ---
  void _previewPost(BlogPost post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Universal JSON-LD Render: ${post.title}')),
          body: UniversalJsonLdRenderer(jsonLdPayload: post.jsonLdPayload),
        ),
      ),
    );
  }

  void _showExportImportDialog() async {
    final exportedData = await widget.client.blogger.exportBlogData(_blogId);
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Export / Import Blog Backup'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Blog Data JSON Backup:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              maxHeight: 200,
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: SelectableText(exportedData, style: const TextStyle(fontFamily: 'monospace', fontSize: 11)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Close')),
        ],
      ),
    );
  }

  void _showIngestDialog() {
    final controller = TextEditingController(text: '''{
  "@context": "https://schema.org",
  "@type": "Recipe",
  "name": "Classic Italian Pizza",
  "description": "Authentic wood-fired Neapolitan pizza recipe.",
  "prepTime": "PT30M",
  "cookTime": "PT15M",
  "recipeIngredient": [
    "500g Flour",
    "325ml Water",
    "7g Yeast",
    "Fresh Mozzarella"
  ],
  "recipeInstructions": [
    "Mix flour and yeast.",
    "Bake in 450C oven for 2 minutes."
  ]
}''');

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Universal Ingestion Webhook'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Paste raw Schema.org JSON-LD generated by any external design tool:'),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 12,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Paste raw JSON-LD here...'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              await widget.client.blogger.ingestJsonLdContent(
                blogId: _blogId,
                authorId: 1,
                rawJsonLd: controller.text,
              );
              if (mounted && dialogContext.mounted) {
                Navigator.of(dialogContext).pop();
                _loadDashboardData();
              }
            },
            child: const Text('Ingest & Save'),
          ),
        ],
      ),
    );
  }

  void _createNewPostDialog() {
    _showIngestDialog();
  }

  void _createNewPageDialog() {
    _showIngestDialog();
  }
}
