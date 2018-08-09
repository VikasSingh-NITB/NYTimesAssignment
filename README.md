# NYTimesAssignment Project

* This app supports iPhones and iPads running iOS 10 and above.
* Built with Xcode Version 9.4. Written in Swift 4.1.2 
* This sample project initially displays a list of the most popular New York Times articles from the last 7 days.
* I implemented MVC pattern for this project.
* One of the main motivation points behind the featured(popular) articles list was that they all contained thumbnail images which made the app look really nice on startup.

* I look forward to your feedback!


## ios-coding-exercise

### API Details:

* Base URL: http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=sample-key
* API-KEY:`60aeaeae7fff4477958cfe2a8a6a76f5`
* Example URL: http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=60aeaeae7fff4477958cfe2a8a6a76f5
* API Documentation: http://developer.nytimes.com/docs/read/article_search_api_v2#h2-requests

### App Details:

* Created a new project in Xcode.
* The app open to a view controller with a table view embedded in a navigation controller.
* For each article returned from the response, the table view cell should have the article headline and a thumbnail image from that article.
* Imlemented Pull to refresh functionality on tableview to fetch latest articles.
* Showing articles in decending order by date.
* Implemented unit test case by using XCTest, to achieve good code coverage
* When a user taps on an article, it will push a detail view controller onto the navigation stack and present some details about that article.

### Run Test Case

* Select NYTimesAssignmentTests file and in this file there is diamond symbol icon. Tap on this icon to run the test cases.
* Its work on Red Green Refactor. Icon will be green once your test cases will pass otherwise it will be red.

