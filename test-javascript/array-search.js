// The program uses a data structure with an array that can contain items and other arrays.
// Write a function numberOfItems that recursively passes through all arrays and counts the number of occurrences of a given item.
// Keep in mind that arrays can be nested within each other.
// For example, numberOfItems(arr, 25) and numberOfItems(arr, "apple") for the array below should both return 2.
// var arr = [
//   25,
//   "apple",
//   ["banana", "strawberry", "apple", 25]
// ];

function numberOfItems(arr, item) {
  // Write the code that goes here
  let result = 0;
  function count(arr, item) {
    for (value of arr) {
      if (value === item) result++;
      if (Array.isArray(value)) count(value, item);
    }
  }
  count(arr, item);
  return result;
}

// var arr = [25, "apple", ["banana", "strawberry", "apple", 25]];
var arr = [
  25,
  "apple",
  ["banana", "strawberry", "apple", 25],
  26,
  25,
  [["apple", 25], 25],
];
console.log(numberOfItems(arr, 25));
console.log(numberOfItems(arr, "apple"));
