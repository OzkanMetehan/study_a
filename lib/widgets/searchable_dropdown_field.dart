import 'package:flutter/material.dart';

class SearchableDropdownField extends StatefulWidget {
  const SearchableDropdownField({
    super.key,
    required this.label,
    required this.options,
    this.initialValue,
    this.onChanged,
    this.hintText,
  });

  final String label;
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  @override
  State<SearchableDropdownField> createState() => _SearchableDropdownFieldState();
}

class _SearchableDropdownFieldState extends State<SearchableDropdownField> {
  late final TextEditingController _controller;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        final media = MediaQuery.of(ctx);
        return Padding(
          padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
          child: StatefulBuilder(
            builder: (ctx, setModalState) {
              final filtered = widget.options
                  .where((o) => o.toLowerCase().contains(_query.toLowerCase()))
                  .toList();
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: widget.hintText ?? 'Search ${widget.label.toLowerCase()}',
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (v) => setModalState(() => _query = v),
                      ),
                    ),
                    Flexible(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (ctx, i) {
                          final value = filtered[i];
                          return ListTile(
                            title: Text(value),
                            onTap: () {
                              _controller.text = value;
                              widget.onChanged?.call(value);
                              Navigator.of(ctx).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: 48,
          child: TextField(
            controller: _controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.black.withOpacity(0.08)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.4),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
              filled: true,
              fillColor: Colors.white,
            ),
            onTap: _openPicker,
          ),
        ),
      ],
    );
  }
}


