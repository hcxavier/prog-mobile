import 'package:flutter/material.dart';

class FuelCalculatorScreen extends StatefulWidget {
  const FuelCalculatorScreen({super.key});

  @override
  State<FuelCalculatorScreen> createState() => _FuelCalculatorScreenState();
}

class _FuelCalculatorScreenState extends State<FuelCalculatorScreen>
    with SingleTickerProviderStateMixin {
  final _ethanolController = TextEditingController();
  final _gasolineController = TextEditingController();

  String? _result;
  Color? _resultColor;
  IconData? _resultIcon;
  bool _showResult = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _ethanolController.dispose();
    _gasolineController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _calculate() {
    final ethanolPrice = double.tryParse(
      _ethanolController.text.replaceAll(',', '.'),
    );
    final gasolinePrice = double.tryParse(
      _gasolineController.text.replaceAll(',', '.'),
    );

    if (ethanolPrice == null || gasolinePrice == null) {
      setState(() {
        _result = 'Por favor, insira valores válidos para ambos os campos.';
        _resultColor = Theme.of(context).colorScheme.error;
        _resultIcon = Icons.error_outline_rounded;
        _showResult = true;
      });
      _animationController.forward(from: 0);
      return;
    }

    if (ethanolPrice <= 0 || gasolinePrice <= 0) {
      setState(() {
        _result = 'Os preços devem ser maiores que zero.';
        _resultColor = Theme.of(context).colorScheme.error;
        _resultIcon = Icons.error_outline_rounded;
        _showResult = true;
      });
      _animationController.forward(from: 0);
      return;
    }

    final ratio = ethanolPrice / gasolinePrice;
    final percentage = (ratio * 100).toStringAsFixed(1);

    setState(() {
      if (ratio <= 0.7) {
        _result =
            'Abasteça com ETANOL! 🌿\n\n'
            'O etanol está a $percentage% do preço da gasolina.\n'
            'Isso é vantajoso (≤ 70%).';
        _resultColor = Colors.green.shade700;
        _resultIcon = Icons.eco_rounded;
      } else {
        _result =
            'Abasteça com GASOLINA! ⛽\n\n'
            'O etanol está a $percentage% do preço da gasolina.\n'
            'Não é vantajoso (> 70%).';
        _resultColor = Colors.orange.shade800;
        _resultIcon = Icons.local_gas_station_rounded;
      }
      _showResult = true;
    });
    _animationController.forward(from: 0);
  }

  void _clear() {
    setState(() {
      _ethanolController.clear();
      _gasolineController.clear();
      _result = null;
      _showResult = false;
    });
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            Card(
              elevation: 0,
              color: colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.local_gas_station_rounded,
                      size: 48,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Calculadora de Combustível',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Descubra se vale mais a pena abastecer com etanol ou gasolina',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer.withValues(
                          alpha: 0.8,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              elevation: 0,
              color: colorScheme.tertiaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 20,
                      color: colorScheme.onTertiaryContainer,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'O etanol é vantajoso quando seu preço é até 70% do preço da gasolina.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: _ethanolController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: 'Preço do Etanol',
                hintText: 'Ex: 3.89',
                prefixText: 'R\$ ',
                prefixIcon: const Icon(Icons.eco_rounded),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _gasolineController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina',
                hintText: 'Ex: 5.49',
                prefixText: 'R\$ ',
                prefixIcon: const Icon(Icons.local_gas_station_rounded),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _clear,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Limpar'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: FilledButton.icon(
                    onPressed: _calculate,
                    icon: const Icon(Icons.calculate_rounded),
                    label: const Text('Calcular'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            if (_showResult)
              FadeTransition(
                opacity: _fadeAnimation,
                child: Card(
                  elevation: 2,
                  shadowColor: _resultColor?.withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: _resultColor?.withValues(alpha: 0.3) ??
                          colorScheme.outline,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Icon(_resultIcon, size: 48, color: _resultColor),
                        const SizedBox(height: 16),
                        Text(
                          _result ?? '',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: _resultColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
