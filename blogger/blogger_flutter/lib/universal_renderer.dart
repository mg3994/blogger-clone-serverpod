import 'dart:convert';
import 'package:flutter/material.dart';

class SeoRenderer {
  static void injectJsonLd(String jsonLdPayload) {
    try {
      debugPrint("Injecting JSON-LD into head: $jsonLdPayload");
    } catch (e) {
      debugPrint("SEO Injection error: $e");
    }
  }
}

class UniversalJsonLdRenderer extends StatelessWidget {
  final String jsonLdPayload;

  const UniversalJsonLdRenderer({super.key, required this.jsonLdPayload});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {};
    try {
      data = jsonDecode(jsonLdPayload);
      SeoRenderer.injectJsonLd(jsonLdPayload);
    } catch (e) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.red.shade50,
        child: Text('Invalid JSON-LD payload: $e', style: const TextStyle(color: Colors.red)),
      );
    }

    final schemaType = data['@type']?.toString() ?? 'Thing';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.orange.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.schema, size: 16, color: Colors.orange.shade800),
                    const SizedBox(width: 6),
                    Text(
                      'Schema.org / $schemaType',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade900,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSchemaContent(context, schemaType, data),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),
              ExpansionTile(
                initiallyExpanded: false,
                title: const Text(
                  'Raw Schema.org JSON-LD Payload',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SelectableText(
                      const JsonEncoder.withIndent('  ').convert(data),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.lightGreenAccent,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchemaContent(BuildContext context, String schemaType, Map<String, dynamic> data) {
    switch (schemaType) {
      case 'Recipe':
        return _buildRecipeLayout(context, data);
      case 'Product':
        return _buildProductLayout(context, data);
      case 'Event':
        return _buildEventLayout(context, data);
      case 'Review':
        return _buildReviewLayout(context, data);
      case 'Course':
        return _buildCourseLayout(context, data);
      case 'BlogPosting':
      case 'Article':
      case 'NewsArticle':
      default:
        return _buildArticleLayout(context, data);
    }
  }

  Widget _buildArticleLayout(BuildContext context, Map<String, dynamic> data) {
    final title = data['headline'] ?? data['name'] ?? data['title'] ?? 'Untitled Article';
    final body = data['articleBody'] ?? data['description'] ?? '';
    final author = data['author'] is Map ? data['author']['name'] : data['author']?.toString();
    final image = data['image'] is Map ? data['image']['url'] : data['image']?.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
        if (author != null) ...[
          const SizedBox(height: 8),
          Text('By $author', style: TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.italic)),
        ],
        const SizedBox(height: 20),
        if (image != null) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(image.toString(), fit: BoxFit.cover, errorBuilder: (_, __, ___) => const SizedBox.shrink()),
          ),
          const SizedBox(height: 20),
        ],
        Text(
          body.toString(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildRecipeLayout(BuildContext context, Map<String, dynamic> data) {
    final title = data['name'] ?? 'Untitled Recipe';
    final description = data['description'] ?? '';
    final prepTime = data['prepTime'] ?? '';
    final cookTime = data['cookTime'] ?? '';
    final ingredients = data['recipeIngredient'] is List ? List<String>.from(data['recipeIngredient']) : [];
    final instructions = data['recipeInstructions'] is List ? List.from(data['recipeInstructions']) : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(description.toString(), style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
        const SizedBox(height: 16),
        Row(
          children: [
            if (prepTime.toString().isNotEmpty)
              Chip(avatar: const Icon(Icons.timer, size: 16), label: Text('Prep: $prepTime')),
            const SizedBox(width: 8),
            if (cookTime.toString().isNotEmpty)
              Chip(avatar: const Icon(Icons.outdoor_grill, size: 16), label: Text('Cook: $cookTime')),
          ],
        ),
        const SizedBox(height: 24),
        if (ingredients.isNotEmpty) ...[
          Text('Ingredients', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...ingredients.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 18, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item, style: const TextStyle(fontSize: 15))),
                  ],
                ),
              )),
          const SizedBox(height: 24),
        ],
        if (instructions.isNotEmpty) ...[
          Text('Instructions', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...instructions.asMap().entries.map((entry) {
            final text = entry.value is Map ? entry.value['text'] ?? '' : entry.value.toString();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 12, child: Text('${entry.key + 1}', style: const TextStyle(fontSize: 12))),
                  const SizedBox(width: 12),
                  Expanded(child: Text(text, style: const TextStyle(fontSize: 15, height: 1.4))),
                ],
              ),
            );
          }),
        ],
      ],
    );
  }

  Widget _buildProductLayout(BuildContext context, Map<String, dynamic> data) {
    final title = data['name'] ?? 'Product';
    final description = data['description'] ?? '';
    final brand = data['brand'] is Map ? data['brand']['name'] : data['brand']?.toString();
    final offers = data['offers'] is Map ? data['offers'] : {};
    final price = offers['price'] ?? '';
    final currency = offers['priceCurrency'] ?? '\$';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
        if (brand != null) ...[
          const SizedBox(height: 6),
          Text('Brand: $brand', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        ],
        const SizedBox(height: 16),
        if (price.toString().isNotEmpty)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
            child: Text('Price: $currency $price', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green.shade800)),
          ),
        const SizedBox(height: 20),
        Text(description.toString(), style: const TextStyle(fontSize: 16, height: 1.5)),
      ],
    );
  }

  Widget _buildEventLayout(BuildContext context, Map<String, dynamic> data) {
    final title = data['name'] ?? 'Event';
    final description = data['description'] ?? '';
    final startDate = data['startDate'] ?? '';
    final location = data['location'] is Map ? data['location']['name'] : data['location']?.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (startDate.toString().isNotEmpty)
                  ListTile(leading: const Icon(Icons.event, color: Colors.deepOrange), title: const Text('Date & Time'), subtitle: Text(startDate.toString())),
                if (location != null)
                  ListTile(leading: const Icon(Icons.location_on, color: Colors.red), title: const Text('Location'), subtitle: Text(location)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(description.toString(), style: const TextStyle(fontSize: 16, height: 1.5)),
      ],
    );
  }

  Widget _buildReviewLayout(BuildContext context, Map<String, dynamic> data) {
    final itemReviewed = data['itemReviewed'] is Map ? data['itemReviewed']['name'] : data['itemReviewed']?.toString() ?? 'Item';
    final reviewBody = data['reviewBody'] ?? data['description'] ?? '';
    final rating = data['reviewRating'] is Map ? data['reviewRating']['ratingValue'] : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Review for: $itemReviewed', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        if (rating != null)
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 28),
              const SizedBox(width: 8),
              Text('$rating / 5 Stars', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        const SizedBox(height: 20),
        Text(reviewBody.toString(), style: const TextStyle(fontSize: 16, height: 1.5)),
      ],
    );
  }

  Widget _buildCourseLayout(BuildContext context, Map<String, dynamic> data) {
    final title = data['name'] ?? 'Course';
    final description = data['description'] ?? '';
    final provider = data['provider'] is Map ? data['provider']['name'] : data['provider']?.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
        if (provider != null) ...[
          const SizedBox(height: 8),
          Text('Provided by $provider', style: const TextStyle(fontSize: 16, color: Colors.indigo, fontWeight: FontWeight.w600)),
        ],
        const SizedBox(height: 20),
        Text(description.toString(), style: const TextStyle(fontSize: 16, height: 1.5)),
      ],
    );
  }
}
