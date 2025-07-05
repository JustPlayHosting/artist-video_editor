import 'package:flutter/material.dart';

class EditorScreen extends StatelessWidget {
  final String projectName;
  final int width;
  final int height;
  final int fps;

  const EditorScreen({
    super.key,
    required this.projectName,
    required this.width,
    required this.height,
    required this.fps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editing: $projectName"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Preview area
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade900,
              child: const Center(
                child: Text(
                  "Preview Area",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
          ),

          // Timeline placeholder
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade800,
              child: const Center(
                child: Text(
                  "Timeline",
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ),
          ),

          // Bottom toolbar
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.text_fields, color: Colors.tealAccent),
                Icon(Icons.image, color: Colors.tealAccent),
                Icon(Icons.audiotrack, color: Colors.tealAccent),
                Icon(Icons.videocam, color: Colors.tealAccent),
                Icon(Icons.layers, color: Colors.tealAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
