Apartment Management System

This is a Ruby-based application that allows users to manage apartments. Users can list apartments, search for apartments by their attributes (type, location, price), and "book" apartments that they are interested in.

Features

List Apartments: View all available apartments with details such as type, location, and price.

Search Apartments: Search for apartments based on type, location, and price. The application will remove any apartments that match the search criteria.
Book Apartments: Add new apartments by specifying the type, location, and price.

Exit the Application: Exit the program when you're done.
Requirements

Ruby 2.x or later: The application is built using Ruby, and you'll need Ruby installed on your system to run it.
Installation

1. Clone the repository or download the files.
To get started, clone this repository to your local machine:

git clone https://github.com/your-username/apartment-management-system.git
cd apartment-management-system

2. Install Ruby.
Ensure you have Ruby installed on your machine. You can check by running:

ruby -v
If Ruby is not installed, follow the official installation guide for your platform.

3. Run the application.
In the project directory, run the following command to start the application:

ruby duplex.rb
This will start the application and you can begin interacting with the apartment management system.

Usage

Once the program is running, you will see the following prompt:

Welcome to the apartment!
From there, you can choose one of the following actions:

"book": Add a new apartment. You will be prompted to enter the type, location, and price of the apartment.
"search": Search for an apartment based on the type, location, and price. If a matching apartment is found, it will be removed from the list.
"list": View all available apartments with their details (type, location, price).
"exit": Exit the application.

Example Workflow
Add an apartment:
Type "book" and enter the apartment details when prompted.
Search for an apartment:
Type "search" and enter the type, location, and price of the apartment you're looking for.
List available apartments:
Type "list" to view all the apartments you have listed.
Exit the program:
Type "exit" to leave the program.
Example Interaction:
Welcome to the apartment!
Type "book", "search", or "list" to use the apartment or type "exit" to leave
> book
Enter type
Apartment
Enter location
Downtown
Enter price
$1200
Apartment: Apartment, Location: Downtown, Price: $1200 has been listed.

Type "book", "search", or "list" to use the apartment or type "exit" to leave
> list
Apartment: Apartment, Location: Downtown, Price: $1200
Project Structure

/apartment-management-system
│
├── duplex.rb             # Main program file that runs the application
├── apartment.rb          # Apartment class definition
├── README.md             # This README file
└── LICENSE               # Project license (if applicable)
duplex.rb: This file contains the main logic of the program, allowing users to interact with the apartment system.
apartment.rb: This file defines the Apartment class, which stores information about individual apartments (type, location, and price).
Contributing

If you'd like to contribute to this project, feel free to submit a pull request. We welcome improvements, bug fixes, and suggestions. Please ensure you follow the standard GitHub workflow:

Fork the repository
Create a new branch for your feature or bug fix
Commit your changes
Open a pull request
License

This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgements

Ruby (https://www.ruby-lang.org) for being a wonderful programming language to build this project.
Anyone who contributed or provided feedback on this project.
