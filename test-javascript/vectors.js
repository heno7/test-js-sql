// Write a function that takes an array of 3D vectors and returns the shortest one.
// Each vector is represented with an array that contains 3 elements (x, y and z).
// If multiple vectors have the same length, the function should return any one of them.
// To determine the length of a vector use the formula:  sqrt(x**2 + y**2 + z**2)
// For example, for the array of 3D vectors [ [1, 1, 1], [2, 2, 2], [3, 3, 3] ]
// findShortest should return the first vector (array [1, 1, 1]) because it is the shortest.

function findShortest(vectors) {
  // Write the code that goes here
  let shortestVector = vectors[0];
  let [x, y, z] = vectors[0];
  let shortestLength = Math.sqrt(x ** 2 + y ** 2 + z ** 2);
  for (let vector of vectors) {
    let [x, y, z] = vector;
    let lengthOfVector = Math.sqrt(x ** 2 + y ** 2 + z ** 2);
    if (lengthOfVector < shortestLength) {
      shortestVector = vector;
      shortestLength = lengthOfVector;
    }
  }
  return shortestVector;
}

// var vectors = [
//   [1, 1, 1],
//   [2, 2, 2],
//   [3, 3, 3],
// ];

var vectors = [
  [1, 1, 1],
  [2, 2, 2],
  [3, 3, 3],
  [0, 1, 0],
];
var shortest = findShortest(vectors);
console.log(shortest);
