// This function generates all permutations of a given length from a list of items.
// It uses a recursive approach to generate the permutations.
// The function is a generator, so it yields each permutation as it is generated.
Iterable<List<T>> permutations<T>(List<T> items, int length) sync* {
  // If the desired length is 0, yield an empty list and return.
  if (length == 0) {
    yield <T>[];
    return;
  }

  // Loop over the items in the input list.
  for (int i = 0; i < items.length; i++) {
    // Select the current item.
    T current = items[i];

    // Create a new list of remaining items by removing the current item from the input list.
    List<T> remaining = List<T>.from(items)..removeAt(i);

    // Generate all permutations of length length-1 from the remaining items.
    for (List<T> permutation in permutations(remaining, length - 1)) {
      // Yield a new list consisting of the current item followed by the permutation.
      yield [current, ...permutation];
    }
  }
}
