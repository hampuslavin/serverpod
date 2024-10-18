import 'dart:io';
import 'dart:math';

class ChecklistOption {
  String label;
  bool selected;

  ChecklistOption(this.label, {this.selected = false});
}

class InteractiveChecklist {
  List<ChecklistOption> options;
  int currentIndex = 0;
  int scrollOffset = 0;
  static const int maxVisibleItems = 20;

  InteractiveChecklist(this.options);

  Future<List<ChecklistOption>> show() async {
    stdin.echoMode = false;
    stdin.lineMode = false;

    bool running = true;

    while (running) {
      await _clearScreen();
      _printOptions();

      final key = stdin.readByteSync();

      switch (key) {
        case 27: // ESC
          if (stdin.readByteSync() == 91) {
            // [
            switch (stdin.readByteSync()) {
              case 65: // Up arrow
                _moveUp();
                break;
              case 66: // Down arrow
                _moveDown();
                break;
              case 53: // Page Up
                stdin.readByteSync(); // Read '~'
                _pageUp();
                break;
              case 54: // Page Down
                stdin.readByteSync(); // Read '~'
                _pageDown();
                break;
            }
          }
          break;
        case 32: // Space
          options[currentIndex].selected = !options[currentIndex].selected;
          break;
        case 13: // Enter
        case 10: // Enter
          running = false;
          break;
        case 3: // Ctrl+C
          await _clearScreen();
          exit(0);
      }
    }

    stdin.echoMode = true;
    stdin.lineMode = true;

    await _clearScreen();
    print('Selected items:');
    for (var option in options.where((opt) => opt.selected)) {
      print('  ✓ ${option.label}');
    }

    return options;
  }

  void _moveUp() {
    if (currentIndex > 0) {
      currentIndex--;
      if (currentIndex < scrollOffset) {
        scrollOffset = currentIndex;
      }
    }
  }

  void _moveDown() {
    if (currentIndex < options.length - 1) {
      currentIndex++;
      if (currentIndex >= scrollOffset + maxVisibleItems) {
        scrollOffset = currentIndex - maxVisibleItems + 1;
      }
    }
  }

  void _pageUp() {
    currentIndex = max(0, currentIndex - maxVisibleItems);
    scrollOffset = max(0, scrollOffset - maxVisibleItems);
  }

  void _pageDown() {
    currentIndex = min(options.length - 1, currentIndex + maxVisibleItems);
    scrollOffset =
        min(options.length - maxVisibleItems, scrollOffset + maxVisibleItems);
    if (scrollOffset < 0) scrollOffset = 0;
  }

  Future<void> _clearScreen() async {
    // Move cursor to top-left corner
    stdout.write('\x1B[0;0H');
    // Clear from cursor to end of screen
    stdout.write('\x1B[J');
    // Alternative approach if the above doesn't work well:
    // print('\x1B[2J\x1B[0;0H');

    // Ensure buffer is flushed
    await stdout.flush();
  }

  void _printOptions() {
    print(
        'Use ↑↓ arrows to navigate, PgUp/PgDn to scroll, space to select, enter to confirm, Ctrl+C to exit\n');

    // Show scroll indicators if needed
    if (scrollOffset > 0) {
      print('↑ More items above');
    }

    String padding = ' ' * 20;

    // Calculate visible range
    int endIndex = min(scrollOffset + maxVisibleItems, options.length);
    List<ChecklistOption> visibleOptions =
        options.sublist(scrollOffset, endIndex);

    for (var i = 0; i < visibleOptions.length; i++) {
      final option = visibleOptions[i];
      final selected = option.selected ? '[✓]' : '[ ]';
      final cursor = (i + scrollOffset) == currentIndex ? '>' : ' ';
      print('$cursor $selected ${option.label}$padding');
    }

    // Show scroll indicator if there are more items below
    if (endIndex < options.length) {
      print('↓ More items below');
    }

    // Fill remaining space if needed
    int remainingLines = maxVisibleItems - visibleOptions.length;
    for (var i = 0; i < remainingLines; i++) {
      print(padding);
    }
  }
}
