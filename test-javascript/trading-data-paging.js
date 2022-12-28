// The front end interface of a stock trading web application has the trading data for the day in JSON format.
// To paginate the user trade report for the day, implement the function getPageData, which:
// •	Accepts a string in JSON format, the page size, and the page number.
// •	Sums up the stocks each user has traded for that day.
// •	Sorts user data in descending order by total stocks per user. If more than one user has the same stock total, they can be in any order.
// •	Returns a string in JSON format that has the trading data for the given page number depending on page size. Page numbers start from 1.
// For example, the code below:
// var dayTrade =
// `[
//   {"user": "Rob", "company": "Google", "countOfStocks": 5},
//   {"user": "Bill", "company": "Goldman", "countOfStocks": 18},
//   {"user": "Rob", "company": "JPMorgan", "countOfStocks": 10},
//   {"user": "Dave", "company": "Boeing", "countOfStocks": 10},
//   {"user": "Miley", "company": "Microsoft", "countOfStocks": 12}
// ]`;

// console.log(getPageData(dayTrade, 3, 2)); // page size = 3, page number = 2
// should print:
// '[{"user": "Dave","totalStocks": 10}]'

// In the example above, there will be data for 4 users after aggregation.
// The 1st page will have data for 3 users and the 2nd page will have the data for the remaining 1 user.

function getPageData(dayTrade, pageSize, pageNumber) {
  try {
    const tradeData = JSON.parse(dayTrade);

    return JSON.stringify(
      tradeData
        .reduce((result, item) => {
          const user = result.find(
            (userData) =>
              userData.user === item.user && userData.company === item.company
          );

          if (user) {
            user.totalStocks += item.countOfStocks;
            return result;
          }

          result.push({
            user: item.user,
            company: item.company,
            totalStocks: item.countOfStocks,
          });

          return result;
        }, [])
        .sort((user1, user2) => user2.totalStocks - user1.totalStocks)
        .slice((pageNumber - 1) * pageSize, pageNumber * pageSize)
        .map((userData) => ({
          user: userData.user,
          totalStocks: userData.totalStocks,
        }))
    );
  } catch (error) {
    console.error("Failed to load dayTrade data", error);
  }
  // Your code goes here
}
var dayTrade = `[
    {"user": "Rob", "company": "Google", "countOfStocks": 5},
    {"user": "Bill", "company": "Goldman", "countOfStocks": 18},
    {"user": "Rob", "company": "JPMorgan", "countOfStocks": 10},
    {"user": "Dave", "company": "Boeing", "countOfStocks": 10},
    {"user": "Miley", "company": "Microsoft", "countOfStocks": 12}
  ]`;
console.log(getPageData(dayTrade, 3, 2)); // page size = 3, page number = 2
// getPageData(dayTrade, 3, 2);
