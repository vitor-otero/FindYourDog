# Dog API SwiftUI Project iOS 15

This iOS app connects to a Dog API, offering three primary views:

1. Breeds View

    **Description:** The Breeds View is the initial screen that welcomes users. It presents a collection of dog breeds.

    **Features:**
    - Display dog breeds in a grid or list format.
    - Use pagination to load as you scroll down.
    - Download the image and save the data into Realm to download only once.
    - Show an image of the breed.
    - Tap on a breed to access its detailed information in the Breed Details View.

2. Breed Details View

    **Description:** The Breed Details View provides in-depth information about a specific dog breed.

    **Features:**
    - Display the breed's name, category, origin, temperament.
    - Navigation button to return to the last view.

3. Search View

    **Description:** The Search View allows users to find dog breeds by their name.

    **Features:**
    - Search for dog breeds by name.
    - View search results in a grid or list format.
    - Tap on a search result to access its detailed information in the Breed Details View.

## Dependencies

This project relies on the following dependencies:

- **Realm:** Realm is used for local data storage and database management.
- **Alamofire:** Alamofire is utilized for making network requests to fetch data from the Dog API.
- **Dog API:** The Dog API serves as the data source for dog breed information and images.

To install these dependencies, you need to use Cocoapods.

