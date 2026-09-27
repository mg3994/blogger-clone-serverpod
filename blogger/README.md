# Google Blogger Platform Clone & Studio (Serverpod + Flutter)

A comprehensive, modern clone of Google's **Blogger** platform built with **Serverpod `^4.1.0-beta.1`** on the backend and **Flutter** on the frontend.

---

## 🌟 Key Architectural Highlights

### 1. The Universal JSON-LD Schema Architecture (CRITICAL)
Instead of standard relational HTML text columns, **every post and page is served and stored strictly as a raw `Schema.org JSON-LD` payload** (`jsonLdPayload`).
- Supports **100% of Schema.org types** (`BlogPosting`, `Article`, `Recipe`, `Product`, `Event`, `Review`, `Course`, `NewsArticle`, etc.).
- **Universal Ingestion Webhook**: External design tools POST raw JSON-LD to the server, which extracts `@type` -> `schemaType`, `headline`/`name` -> title, and keywords -> `labels`.
- **Universal Content Renderer**: Frontend utility dynamically inspects and parses raw JSON-LD into responsive Flutter UI blocks with a fallback schema inspector tree.
- **Web DOM SEO Injection**: Directly injects `<script type="application/ld+json">` into the document `<head>` on Flutter Web for search engine indexing.

---

## 🏛️ System Architecture & Data Layer

The platform is structured as a Serverpod workspace containing three linked packages:
- `blogger_server`: Serverpod backend server app.
- `blogger_client`: Generated client library.
- `blogger_flutter`: Flutter Admin Studio & Public Blog Reader frontend app.

### Relational Data Models
1. **`BlogPost`**: Post metadata and raw `jsonLdPayload` (`schemaType`, `slug`, `publishedDate`, `status`, `labels`).
2. **`BlogPage`**: Static pages with raw `jsonLdPayload` support.
3. **`BlogSite`**: Blog metadata, custom domain, and subdomain routing.
4. **`UserProfile`**: User profile details and roles (`Admin`, `Author`, `Reader`).
5. **`Comment`**: Comment moderation (`isApproved`) and threading.
6. **`BlogStat`**: Audience analytics for pageviews, unique visitors, referrers, and geolocation.
7. **`BlogEarning`**: Google AdSense publisher account ID, estimated revenue, impressions, and clicks.
8. **`LayoutWidget`**: Widget gadget layout sections (`Header`, `Sidebar`, `Main`, `Footer`).
9. **`BlogSettings`**: Custom robots.txt, comment moderation, adult content warning.
10. **`BlogTheme`**: Custom CSS, active theme preset, font family, layout variant.
11. **`FollowedBlog`**: Reading list subscriptions feed.
12. **`BlogMember`**: Private blog reader access control & invited author roles.
13. **`MediaItem`**: Media library upload assets.
14. **`EmailSubscriber`**: Email follower list.
15. **`CustomRedirect`**: Custom URL 301/302 redirects.

---

## 🔌 Google Blogger API v3 REST Specification Compatibility

The backend includes `BloggerV3Endpoint`, porting Google Blogger API v3 REST specification resources:
- `GET /blogger/v3/users/{userId}` (`usersGet`)
- `GET /blogger/v3/users/{userId}/blogs/{blogId}` (`blogUserInfosGet`)
- `GET /blogger/v3/users/{userId}/blogs/{blogId}/posts` (`postUserInfosList`)
- `GET /blogger/v3/users/{userId}/blogs/{blogId}/posts/{postId}` (`postUserInfosGet`)
- `GET /blogger/v3/blogs/{blogId}` (`blogsGet`)
- `GET /blogger/v3/blogs/byurl?url={url}` (`blogsGetByUrl`)
- `GET /blogger/v3/blogs/{blogId}/pages/{pageId}` (`pagesGet`)
- `GET /blogger/v3/blogs/{blogId}/posts/search?q={q}` (`postsSearch`)
- `GET /blogger/v3/blogs/{blogId}/posts` (`postsList`)
- `GET /blogger/v3/blogs/{blogId}/posts/{postId}` (`postsGet`)
- `POST /blogger/v3/blogs/{blogId}/posts` (`postsInsert`)
- `DELETE /blogger/v3/blogs/{blogId}/posts/{postId}` (`postsDelete`)
- `GET /blogger/v3/blogs/{blogId}/posts/{postId}/comments` (`commentsList`)

---

## 🎨 Flutter Studio & Public App Views

1. **`BloggerAdminDashboard` (`admin_dashboard.dart`)**: 15-tab navigation studio (Posts, Stats, Comments, Earnings, Pages, Blogger v3 API, Theme, Layout, Redirects, Atom/RSS, Permissions, Media, Subscribers, Reading List, Settings).
2. **`PostEditorView` (`post_editor.dart`)**: Post composer with Schema.org type selector, custom permalink slug, search description summary, label tagger, status dropdown, boilerplate generator, and live side-by-side JSON-LD preview.
3. **`ThemeCustomizerView` (`theme_customizer.dart`)**: Theme preset gallery (`Contempo`, `Soho`, `Emporium`, `Notable`, `Essential`, `Simple`), typography font family selector, layout structure picker (`SidebarRight`, `SidebarLeft`, `FullWidth`), and custom CSS editor.
4. **`LayoutEditorView` (`layout_editor.dart`)**: Gadget section manager (Header, Sidebar, Main, Footer).
5. **`CommentManagerView` (`comment_manager.dart`)**: Moderation tabs for Published, Pending, and Spam comments.
6. **`StatsView` (`stats_view.dart`)**: Audience analytics dashboard with traffic referrer breakdown and country logs.
7. **`BlogReaderView` (`blog_reader_view.dart`)**: Public visitor blog post reader page with comment posting and Universal JSON-LD rendering.

---

## 🚀 Quickstart & Setup Instructions

### Environment Prerequisites
- Dart SDK `>= 3.12.2` (Environment running Dart 3.13.4)
- Flutter SDK `>= 3.19.0` (Environment running Flutter 3.47.5)
- Serverpod CLI version `4.1.0-beta.1`

### Running the Project
```bash
# 1. Install Serverpod CLI
dart pub global activate serverpod_cli 4.1.0-beta.1

# 2. Get Workspace Dependencies
cd blogger
dart pub get

# 3. Start Serverpod Backend Server
cd blogger_server
dart bin/main.dart

# 4. Start Flutter Frontend App
cd ../blogger_flutter
flutter run -d chrome
```
