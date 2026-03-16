import 'package:flutter/material.dart';

class WidgetsShowcaseScreen extends StatefulWidget {
  const WidgetsShowcaseScreen({super.key});

  @override
  State<WidgetsShowcaseScreen> createState() => _WidgetsShowcaseScreenState();
}

class _WidgetsShowcaseScreenState extends State<WidgetsShowcaseScreen> {
  // Checkbox states
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = true;
  bool _checkboxValue3 = false;

  // Switch states
  bool _switchValue1 = false;
  bool _switchValue2 = true;

  // Radio state
  String _selectedRadio = 'opcao1';

  // Slider states
  double _sliderValue1 = 50;
  double _sliderValue2 = 3;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Card(
              elevation: 0,
              color: colorScheme.secondaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.widgets_rounded,
                      size: 48,
                      color: colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tipos de Entrada',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Demonstração de widgets de entrada do Flutter',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSecondaryContainer.withValues(
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

            // ========================
            // CHECKBOX Section
            // ========================
            _buildSectionHeader(
              context,
              icon: Icons.check_box_rounded,
              title: 'Checkbox',
              subtitle: 'Permite selecionar múltiplas opções',
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Aceito os termos de uso'),
                    subtitle: const Text('Obrigatório para continuar'),
                    value: _checkboxValue1,
                    onChanged: (value) {
                      setState(() => _checkboxValue1 = value ?? false);
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    secondary: Icon(
                      Icons.description_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Divider(height: 1),
                  CheckboxListTile(
                    title: const Text('Receber notificações'),
                    subtitle: const Text('E-mails e push notifications'),
                    value: _checkboxValue2,
                    onChanged: (value) {
                      setState(() => _checkboxValue2 = value ?? false);
                    },
                    secondary: Icon(
                      Icons.notifications_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Divider(height: 1),
                  CheckboxListTile(
                    title: const Text('Modo desenvolvedor'),
                    subtitle: const Text('Ativar recursos avançados'),
                    value: _checkboxValue3,
                    onChanged: (value) {
                      setState(() => _checkboxValue3 = value ?? false);
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                    ),
                    secondary: Icon(
                      Icons.code_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ========================
            // SWITCH Section
            // ========================
            _buildSectionHeader(
              context,
              icon: Icons.toggle_on_rounded,
              title: 'Switch',
              subtitle: 'Ativar ou desativar funcionalidades',
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Modo Escuro'),
                    subtitle: Text(
                      _switchValue1 ? 'Ativado' : 'Desativado',
                      style: TextStyle(
                        color:
                            _switchValue1
                                ? colorScheme.primary
                                : colorScheme.outline,
                      ),
                    ),
                    value: _switchValue1,
                    onChanged: (value) {
                      setState(() => _switchValue1 = value);
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    secondary: Icon(
                      _switchValue1
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('Localização GPS'),
                    subtitle: Text(
                      _switchValue2 ? 'Ativado' : 'Desativado',
                      style: TextStyle(
                        color:
                            _switchValue2
                                ? colorScheme.primary
                                : colorScheme.outline,
                      ),
                    ),
                    value: _switchValue2,
                    onChanged: (value) {
                      setState(() => _switchValue2 = value);
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                    ),
                    secondary: Icon(
                      _switchValue2
                          ? Icons.location_on_rounded
                          : Icons.location_off_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ========================
            // RADIO Section
            // ========================
            _buildSectionHeader(
              context,
              icon: Icons.radio_button_checked_rounded,
              title: 'Radio',
              subtitle: 'Selecionar apenas uma opção entre várias',
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: RadioGroup<String>(
                groupValue: _selectedRadio,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedRadio = value);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                      child: Text(
                        'Selecione seu combustível preferido:',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    RadioListTile<String>(
                      title: const Text('Etanol'),
                      subtitle: const Text('Combustível renovável'),
                      value: 'opcao1',
                      secondary: Icon(
                        Icons.eco_rounded,
                        color:
                            _selectedRadio == 'opcao1'
                                ? colorScheme.primary
                                : colorScheme.outline,
                      ),
                    ),
                    const Divider(height: 1),
                    RadioListTile<String>(
                      title: const Text('Gasolina'),
                      subtitle: const Text('Combustível convencional'),
                      value: 'opcao2',
                      secondary: Icon(
                        Icons.local_gas_station_rounded,
                        color:
                            _selectedRadio == 'opcao2'
                                ? colorScheme.primary
                                : colorScheme.outline,
                      ),
                    ),
                    const Divider(height: 1),
                    RadioListTile<String>(
                      title: const Text('Diesel'),
                      subtitle: const Text('Para veículos pesados'),
                      value: 'opcao3',
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                      ),
                      secondary: Icon(
                        Icons.fire_truck_rounded,
                        color:
                            _selectedRadio == 'opcao3'
                                ? colorScheme.primary
                                : colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ========================
            // SLIDER Section
            // ========================
            _buildSectionHeader(
              context,
              icon: Icons.tune_rounded,
              title: 'Slider',
              subtitle: 'Selecionar um valor em um intervalo',
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Slider contínuo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.volume_up_rounded,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Volume',
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${_sliderValue1.round()}%',
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _sliderValue1,
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        setState(() => _sliderValue1 = value);
                      },
                    ),

                    const Divider(height: 32),

                    // Slider discreto (com divisions)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Avaliação',
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${_sliderValue2.round()}',
                                style: Theme.of(
                                  context,
                                ).textTheme.labelLarge?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _sliderValue2,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: '${_sliderValue2.round()} estrelas',
                      onChanged: (value) {
                        setState(() => _sliderValue2 = value);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Summary Card
            Card(
              elevation: 0,
              color: colorScheme.tertiaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.summarize_rounded,
                          color: colorScheme.onTertiaryContainer,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Resumo dos Valores',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildSummaryRow(
                      context,
                      'Checkboxes',
                      'Termos: ${_checkboxValue1 ? "✅" : "❌"} | '
                          'Notificações: ${_checkboxValue2 ? "✅" : "❌"} | '
                          'Dev: ${_checkboxValue3 ? "✅" : "❌"}',
                    ),
                    const SizedBox(height: 6),
                    _buildSummaryRow(
                      context,
                      'Switches',
                      'Modo Escuro: ${_switchValue1 ? "ON" : "OFF"} | '
                          'GPS: ${_switchValue2 ? "ON" : "OFF"}',
                    ),
                    const SizedBox(height: 6),
                    _buildSummaryRow(
                      context,
                      'Radio',
                      _selectedRadio == 'opcao1'
                          ? 'Etanol'
                          : _selectedRadio == 'opcao2'
                          ? 'Gasolina'
                          : 'Diesel',
                    ),
                    const SizedBox(height: 6),
                    _buildSummaryRow(
                      context,
                      'Sliders',
                      'Volume: ${_sliderValue1.round()}% | '
                          'Avaliação: ${_sliderValue2.round()}★',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: colorScheme.primary, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: colorScheme.onTertiaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onTertiaryContainer.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
