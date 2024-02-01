# ios-search-on-site Combine-SwiftUI

Background
--------------------------
At DoorDash, we allow customers to order delivery from their favorite local restaurants. For this exercise, you will be building a basic version of the search autocomplete page of the DoorDash app.

Screenshots
--------------------------
<img src = "https://github.com/rezakhmf/Combine-Swiftui/assets/3985692/66b7dea1-0060-4082-b0f4-5619b7a7b145" width="200" height="400" />
<img src = "https://github.com/rezakhmf/Combine-Swiftui/assets/3985692/c3bd477f-0ab6-4410-a1dd-5831d9282468" width="200" height="400" />
<img src = "https://github.com/rezakhmf/Combine-Swiftui/assets/3985692/088289d4-ab37-45ca-bd92-ff2eb9999157" width="200" height="400" />



Requirements
--------------------------
1. There should be a tab bar with two pages, the stores page and the search page.  The stores page should just be empty.
2. On the search page, the user should be able to search for a store using the mock feed endpoint.
    • Please use the https://dd-interview.github.io/android/v1/feed?query=<term>&lat=37.7816&lng=-122.4156  endpoint to retrieve stores for a search term (see below for the relevant fields)
    • The lat lng location and other url parameters do not need to be changed.  The only parameter that needs to be modified is the "query" search term parameter.
    • The endpoint will work without an authorization token.
    • The endpoint is a mock and will always return the same results for any query term
3. The behavior of the auto-complete search for the search bar should be the following:
	• The search bar will auto search the current term in the search bar if:
		- There are 3 or more characters in the search term
		- The user has not typed any character for the last 2 seconds.  
	• If the user has typed a character within 2 seconds of the last character typed, the app should *not* make a request for any previous search term.  For example, if the user typed: "tac" and then types a "o" after 1.5 seconds, the app should not make a network request with the term "tac".  It should only make a single network request for the query "taco" 2 seconds after the "o" is typed.
4. The search results should be displayed in a list below the search bar after each network request finishes 
5. If the user taps on a store name in the list, the app should navigate to the store details page.  
For now, just show the store logo and delivery fee below the store logo on the store details page as shown in the screenshot.


API reference
--------------------------
The response to the https://dd-interview.github.io/android/v1/feed?query=<term>&lat=37.7816&lng=-122.4156 endpoint contains multiple fields, the only ones we we are required to decode are name, delivery_fee and cover_img_url fields.

The fields we are concerned about on the objects are:
name: String
delivery_fee: Int
cover_img_url: String (representing an URL)


Example:
[
   {
      "status":"Closed",
      "description":"Indian",
      "delivery_fee":1000,
      "cover_img_url":"https://cdn.doordash.com/media/restaurant/cover/Dosa_Cover_Photo_.jpg",
      "id":763697,
      "name":"dosa by DOSA"
   },
   {
      "status":"Closed",
      "description":"Good for Groups, Asian Food, Cambodian, Asian, Thai, Chinese",
      "delivery_fee":799,
      "cover_img_url":"https://cdn.doordash.com/media/restaurant/cover/Tommy-Thai.png",
      "id":1443,
      "name":"Tommy Thai"
   },
]

Stretch Goals:
    • Handle loading state and edge cases (simple activity indicator that dismisses when fetching is finished is fine.)
    • Show us how you would test it thoroughly.

Design
--------------------------
Find the example screenshots in project directory.

The design contains a tab bar on the bottom with a "Stores" button. The button should appear in the tab bar, but can just navigate to an empty page when clicked on.

Other Notes
--------------------------
Get your code working with good coding practices first, and if you have more time, improve your code base to be production-worthy. Modularize your code, test when appropriate, comment if necessary, etc.

Try not to use 3rd party libraries if possible. Feel free to view the Apple documentation  to look up the Apple APIs, and to Google around, but don't copy/paste code from online unless you know what it's doing.

When You're Done
--------------------------
Demonstrate the project to us. Explain to us different design decisions that you made, edge cases that you handled, etc.
