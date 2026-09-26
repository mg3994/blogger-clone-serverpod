import 'package:flutter/material.dart';
import 'package:blogger_client/blogger_client.dart';

class StatsView extends StatefulWidget {
  final Client client;
  final int blogId;

  const StatsView({super.key, required this.client, required this.blogId});

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  List<BlogStat> _stats = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    try {
      final stats = await widget.client.blogger.getBlogStats(widget.blogId);
      if (mounted) {
        setState(() {
          _stats = stats;
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

    final totalViews = _stats.fold<int>(0, (sum, item) => sum + item.pageViews);
    final totalUnique = _stats.fold<int>(0, (sum, item) => sum + item.uniqueVisitors);

    return Scaffold(
      appBar: AppBar(title: const Text('Detailed Audience Analytics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCard('Total Pageviews', '$totalViews', Icons.show_chart, Colors.blue),
                const SizedBox(width: 16),
                _buildCard('Unique Visitors', '$totalUnique', Icons.people, Colors.green),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Traffic Breakdown by Referrer Source', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _stats.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final s = _stats[index];
                  return ListTile(
                    leading: const Icon(Icons.language, color: Colors.indigo),
                    title: Text(s.referrerSource, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Country: ${s.country} | Date: ${s.recordedDate.toIso8601String().split('T').first}'),
                    trailing: Text('${s.pageViews} views', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon, Color color) {
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
}
