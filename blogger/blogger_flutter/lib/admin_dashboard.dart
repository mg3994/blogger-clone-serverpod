import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';
import 'universal_renderer.dart';
import 'post_editor.dart';
import 'theme_customizer.dart';
import 'layout_editor.dart';
import 'comment_manager.dart';
import 'stats_view.dart';
import 'blog_reader_view.dart';

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
  List<BlogMember> _members = [];
  List<MediaItem> _mediaItems = [];
  List<EmailSubscriber> _subscribers = [];
  List<CustomRedirect> _redirects = [];
  String _atomXmlFeed = '';
  Map<String, dynamic>? _apiV3BlogResult;

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
      final members = await widget.client.blogger.getBlogMembers(_blogId);
      final media = await widget.client.blogger.getMediaItems(_blogId);
      final subscribers = await widget.client.blogger.getSubscribers(_blogId);
      final redirects = await widget.client.blogger.getCustomRedirects(_blogId);
      final atomXml = await widget.client.blogger.generateAtomFeedXml(_blogId);
      final apiV3Res = await widget.client.bloggerV3.blogsGet(blogId: '$_blogId');

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
          _members = members;
          _mediaItems = media;
          _subscribers = subscribers;
          _redirects = redirects;
          _atomXmlFeed = atomXml;
          _apiV3BlogResult = apiV3Res;
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
            icon: const Icon(Icons.open_in_new),
            tooltip: 'View Live Blog Reader View',
            onPressed: () {
              if (_posts.isNotEmpty) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlogReaderView(client: widget.client, blogId: _blogId, postSlug: _posts.first.slug),
                  ),
                );
              }
            },
          ),
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
              onPressed: _createNewPostView,
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
              NavigationRailDestination(icon: Icon(Icons.api_outlined), selectedIcon: Icon(Icons.api), label: Text('Blogger v3 API')),
              NavigationRailDestination(icon: Icon(Icons.palette_outlined), selectedIcon: Icon(Icons.palette), label: Text('Theme Customizer')),
              NavigationRailDestination(icon: Icon(Icons.dashboard_customize_outlined), selectedIcon: Icon(Icons.dashboard_customize), label: Text('Layout Editor')),
              NavigationRailDestination(icon: Icon(Icons.alt_route_outlined), selectedIcon: Icon(Icons.alt_route), label: Text('Redirects')),
              NavigationRailDestination(icon: Icon(Icons.rss_feed_outlined), selectedIcon: Icon(Icons.rss_feed), label: Text('Atom/RSS')),
              NavigationRailDestination(icon: Icon(Icons.perm_identity_outlined), selectedIcon: Icon(Icons.perm_identity), label: Text('Permissions')),
              NavigationRailDestination(icon: Icon(Icons.perm_media_outlined), selectedIcon: Icon(Icons.perm_media), label: Text('Media')),
              NavigationRailDestination(icon: Icon(Icons.mark_email_read_outlined), selectedIcon: Icon(Icons.mark_email_read), label: Text('Subscribers')),
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
                      StatsView(client: widget.client, blogId: _blogId),
                      CommentManagerView(client: widget.client, blogId: _blogId),
                      _buildEarningsTab(),
                      _buildPagesTab(),
                      _buildBloggerV3ApiTab(),
                      ThemeCustomizerView(client: widget.client, blogId: _blogId),
                      LayoutEditorView(client: widget.client, blogId: _blogId),
                      _buildRedirectsTab(),
                      _buildFeedTab(),
                      _buildPermissionsTab(),
                      _buildMediaTab(),
                      _buildSubscribersTab(),
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
                onPressed: _createNewPostView,
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
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              tooltip: 'Edit Post',
                              onPressed: () => _editPostView(post),
                            ),
                            IconButton(
                              icon: const Icon(Icons.open_in_new, color: Colors.green),
                              tooltip: 'View in Reader View',
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BlogReaderView(client: widget.client, blogId: _blogId, postSlug: post.slug),
                                  ),
                                );
                              },
                            ),
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

  // --- 6. Blogger v3 REST API Developer Settings Tab ---
  Widget _buildBloggerV3ApiTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Google Blogger API v3 REST Porting Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Access your blog resources programmatically using Blogger API v3 compliant endpoints.'),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('API Key / Authorization Credentials', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  TextFormField(
                    readOnly: true,
                    initialValue: 'AIzaSyBloggerKey_9918237498172938',
                    decoration: const InputDecoration(
                      labelText: 'API Key',
                      suffixIcon: Icon(Icons.copy),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Header Authorization Format: Bearer <your_session_token>', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Live Blogger v3 REST Endpoint Tester Response (GET /blogger/v3/blogs/1)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
              child: SingleChildScrollView(
                child: SelectableText(
                  _apiV3BlogResult != null
                      ? const JsonEncoder.withIndent('  ').convert(_apiV3BlogResult)
                      : '{"kind": "blogger#blog", "id": "1"}',
                  style: const TextStyle(fontFamily: 'monospace', color: Colors.lightGreenAccent, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 7. Custom Redirects Tab ---
  Widget _buildRedirectsTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Custom URL Redirects (301 / 302)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: _showAddRedirectDialog,
                icon: const Icon(Icons.add),
                label: const Text('Add Redirect'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _redirects.isEmpty
                ? const Center(child: Text('No custom redirects configured.'))
                : ListView.builder(
                    itemCount: _redirects.length,
                    itemBuilder: (context, index) {
                      final r = _redirects[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.alt_route, color: Colors.blue),
                          title: Text('${r.fromPath} ➔ ${r.toPath}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Type: ${r.isPermanent ? "301 Permanent" : "302 Temporary"}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              if (r.id != null) {
                                await widget.client.blogger.deleteCustomRedirect(r.id!);
                                _loadDashboardData();
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // --- 8. Atom/RSS Feed Tab ---
  Widget _buildFeedTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Live Atom / RSS XML Feed Output', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
              child: SingleChildScrollView(
                child: SelectableText(
                  _atomXmlFeed.isEmpty ? '<feed>Generating feed...</feed>' : _atomXmlFeed,
                  style: const TextStyle(fontFamily: 'monospace', color: Colors.lightGreenAccent, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 9. Permissions / Private Blog Tab ---
  Widget _buildPermissionsTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Blog Authors & Private Readers', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: _showAddMemberDialog,
                icon: const Icon(Icons.person_add),
                label: const Text('Invite Member'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _members.isEmpty
                ? const Center(child: Text('No invited authors or private readers.'))
                : ListView.builder(
                    itemCount: _members.length,
                    itemBuilder: (context, index) {
                      final m = _members[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.security, color: Colors.purple),
                          title: Text(m.userEmail, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Role: ${m.role} | Status: ${m.status}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              if (m.id != null) {
                                await widget.client.blogger.removeBlogMember(m.id!);
                                _loadDashboardData();
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // --- 10. Media Tab ---
  Widget _buildMediaTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Media Library', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: _showUploadMediaDialog,
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Upload Media'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _mediaItems.isEmpty
                ? const Center(child: Text('No media items uploaded.'))
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
                    itemCount: _mediaItems.length,
                    itemBuilder: (context, index) {
                      final media = _mediaItems[index];
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.image, size: 48, color: Colors.blue),
                            const SizedBox(height: 8),
                            Text(media.filename, style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                            Text('${(media.sizeInBytes / 1024).toStringAsFixed(1)} KB', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // --- 11. Subscribers Tab ---
  Widget _buildSubscribersTab() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email Follower Subscribers', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: _subscribers.isEmpty
                ? const Center(child: Text('No email subscribers yet.'))
                : ListView.builder(
                    itemCount: _subscribers.length,
                    itemBuilder: (context, index) {
                      final sub = _subscribers[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.mark_email_read, color: Colors.teal),
                          title: Text(sub.email, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Confirmed: ${sub.isConfirmed} | Subscribed: ${sub.subscribedAt.toIso8601String().split('T').first}'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // --- 14. Reading List Tab ---
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

  // --- 15. Settings Tab ---
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

  // --- Navigation & View Navigation Helpers ---
  void _createNewPostView() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostEditorView(
          client: widget.client,
          blogId: _blogId,
          onSaved: () {
            Navigator.of(context).pop();
            _loadDashboardData();
          },
        ),
      ),
    );
  }

  void _editPostView(BlogPost post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostEditorView(
          client: widget.client,
          blogId: _blogId,
          postToEdit: post,
          onSaved: () {
            Navigator.of(context).pop();
            _loadDashboardData();
          },
        ),
      ),
    );
  }

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

  void _showAddRedirectDialog() {
    final fromController = TextEditingController();
    final toController = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Custom Redirect'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: fromController, decoration: const InputDecoration(labelText: 'From Path (e.g. /old-path)')),
            TextField(controller: toController, decoration: const InputDecoration(labelText: 'To Path (e.g. /new-path)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (fromController.text.isNotEmpty && toController.text.isNotEmpty) {
                await widget.client.blogger.addCustomRedirect(
                  CustomRedirect(
                    blogId: _blogId,
                    fromPath: fromController.text,
                    toPath: toController.text,
                    isPermanent: true,
                    createdAt: DateTime.now(),
                  ),
                );
                if (mounted && dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                  _loadDashboardData();
                }
              }
            },
            child: const Text('Save Redirect'),
          ),
        ],
      ),
    );
  }

  void _showAddMemberDialog() {
    final emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Invite Author or Private Reader'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (emailController.text.isNotEmpty) {
                await widget.client.blogger.addBlogMember(
                  BlogMember(
                    blogId: _blogId,
                    userId: 2,
                    userEmail: emailController.text,
                    role: 'PrivateReader',
                    status: 'Invited',
                    joinedAt: DateTime.now(),
                  ),
                );
                if (mounted && dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                  _loadDashboardData();
                }
              }
            },
            child: const Text('Send Invite'),
          ),
        ],
      ),
    );
  }

  void _showUploadMediaDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Upload Media'),
        content: const Text('Simulating file picker upload...'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              await widget.client.blogger.addMediaItem(
                MediaItem(
                  blogId: _blogId,
                  filename: 'cover-image.png',
                  url: 'https://via.placeholder.com/600',
                  mimeType: 'image/png',
                  sizeInBytes: 102400,
                  uploadedAt: DateTime.now(),
                ),
              );
              if (mounted && dialogContext.mounted) {
                Navigator.of(dialogContext).pop();
                _loadDashboardData();
              }
            },
            child: const Text('Upload Sample Image'),
          ),
        ],
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
              constraints: const BoxConstraints(maxHeight: 200),
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

  void _createNewPageDialog() {
    _showIngestDialog();
  }
}
