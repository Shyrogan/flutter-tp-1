import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key, 
    required this.displayName,
    required this.description,
    required this.imageUrl,
    required this.bskyHandle,
    required this.githubHandle,
    this.imageProvider
  });

  final String displayName;
  final String description;
  final String imageUrl;
  final String bskyHandle;
  final String githubHandle;
  final ImageProvider? imageProvider;

  void _launch(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
    } catch (e) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon profil"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: imageProvider ?? NetworkImage(imageUrl),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(height: 16),
                Text(
                  displayName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _launch("https://bsky.app/profile/$bskyHandle"),
                  icon: const Icon(Icons.verified_user),
                  label: Text('@$bskyHandle'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _launch("https://github.com/$githubHandle"),
                  icon: const Icon(Icons.gite),
                  label: Text(githubHandle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed('/random'),
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text("Répondre à une question aléatoire"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

