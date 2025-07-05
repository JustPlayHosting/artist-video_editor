import 'package:flutter/material.dart';

class NewProjectScreen extends StatefulWidget {
  const NewProjectScreen({super.key});

  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _widthController = TextEditingController(text: "1080");
  final TextEditingController _heightController = TextEditingController(text: "1920");
  final TextEditingController _fpsController = TextEditingController(text: "30");

  void _createProject() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      int width = int.parse(_widthController.text);
      int height = int.parse(_heightController.text);
      int fps = int.parse(_fpsController.text);

      // For now, just print to console
      print("🎬 Creating project: $name, ${width}x$height @${fps}fps");

      // TODO: Navigate to editor screen with project config
      // Navigator.push(...);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Project")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Project Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Project Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _widthController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Width",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || int.tryParse(value) == null ? 'Enter width' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Height",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || int.tryParse(value) == null ? 'Enter height' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _fpsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "FPS (Frames Per Second)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || int.tryParse(value) == null ? 'Enter FPS' : null,
              ),
              const SizedBox(height: 24),

              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text("Create Project"),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                onPressed: _createProject,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
