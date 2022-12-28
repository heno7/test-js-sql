// Write a function that removes all items that are not numbers from the array.
// The function should modify the existing array, not create a new one.
// For example, if the input array contains values [1, 'a', 'b', 2],
// after processing, the array will contain only values [1, 2].

function filterNumbersFromArray(arr) {
  // Write the code that goes here
  while (arr.some((ele) => typeof ele !== "number")) {
    for (let value of arr) {
      if (typeof value !== "number") arr.splice(arr.indexOf(value), 1);
    }
  }
}

// var arr = [1, "a", "b", 2];
var arr = [1, "a", "b", 2, "Hello", { name: "Chinh" }];
filterNumbersFromArray(arr);
// At this point, arr should have been modified in place
// and contain only 1 and 2.
for (var i = 0; i < arr.length; i++) console.log(arr[i]);
