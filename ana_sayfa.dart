import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  // Değişken tanımlaması, fonksiyonlar ve stepler
  int _currentStep = 0;
  void onStepTapped(int index) {
    setState(() {
      _currentStep = index;
    });
  }

  void onStepContinue() {
    setState(() {
      if (_currentStep < 2) {
        _currentStep++;
      }
    });
  }

  void onStepCancel() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  List<Step> steps() {
    return [
      Step(
        isActive: _currentStep == 0,
        title: const Text('Adım 1'),
        content: const Text('Açıklama 1'),
      ),
      Step(
        isActive: _currentStep == 1,
        title: const Text('Adım 2'),
        content: const Text('Açıklama 2'),
      ),
      Step(
        isActive: _currentStep == 2,
        title: const Text('Adım 3'),
        content: const Text('Açıklama 3'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Stepper Widget'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Aşağıda bir Stepper Widget örneği bulunmaktadır',
            ),
            const SizedBox(
              height: 15,
            ),
            // Stepper Widget
            Stepper(
              currentStep: _currentStep,
              onStepCancel: onStepCancel,
              onStepContinue: onStepContinue,
              onStepTapped: onStepTapped,
              type: StepperType.vertical,
              steps: steps(),
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    if (_currentStep > 0)
                      ElevatedButton(
                        onPressed: onStepCancel,
                        child: const Text('Bir Önceki'),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (_currentStep < 2)
                      ElevatedButton(
                        onPressed: onStepContinue,
                        child: const Text(
                          'Sonraki',
                        ),
                      )
                    else
                      const ElevatedButton(
                        onPressed: null,
                        child: Text('Tamamlandı'),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
