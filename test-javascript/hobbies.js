// Implement the findAllHobbyists function that takes a hobby, and an object consisting of peoples names mapped to their respective hobbies.
// The function should return an Array containing the names of the people (in any order) that enjoy the hobby.
// For example, the following code should display the name 'Chad'.
// var hobbies = {
//   "Steve": ['Fashion', 'Piano', 'Reading'],
//   "Patty": ['Drama', 'Magic', 'Pets'],
//   "Chad": ['Puzzles', 'Pets', 'Yoga']
// };

// console.log(findAllHobbyists('Yoga', hobbies));

function findAllHobbyists(hobby, hobbies) {
  const result = [];
  for (let person in hobbies) {
    if (hobbies[person].includes(hobby)) result.push(person);
  }
  return result;
}

var hobbies = {
  Steve: ["Fashion", "Piano", "Reading"],
  Patty: ["Drama", "Magic", "Pets"],
  Chad: ["Puzzles", "Pets", "Yoga"],
};

console.log(findAllHobbyists("Yoga", hobbies));
console.log(findAllHobbyists("Pets", hobbies));
