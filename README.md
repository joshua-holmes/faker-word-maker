# Faker Word Maker

Welcome to the Faker Word Maker App! This app uses machine learning to generate words that look like real words, but do not already exist in the dictionary. In this project I have developed my own machine learning algorithm that recognizes patterns in a set of words (usually a dictionary) that the user uploads. In this project, I have included an English dictionary by default so the user is not required to find data on their own and can use the data I have provided as a tool.

## Demo
View live demo: [faker-word-maker.jpholmes.com](https://faker-word-maker.jpholmes.com/).

![Faker Word Maker demo gif](./faker-word-maker.gif)

## How to Run Locally
*Your local environment should have the following installed and setup:*

* _"npm package manager" and "node" for the frontend_
* _"rvm (Ruby Version Manager so you can install ruby)", "gem package manager", "Ruby on Rails" and "ruby" for the backend_
* _"PostgreSQL" for the database_
* _OS must be Linux, Mac, or Windows. If you are using Windows, you must have WSL installed._

Once the dependencies above are met, follow these instructions to run locally:

1. Clone down this repository from GitHub onto your local machine, then cd into root project directory
2. The root directory for the Rails backend from here is `./ror` and the root directory for the React frontend is `./ror/client`. Open one more terminal window so you have two terminal windows open total. In one terminal, run `cd ./ror` and in the other run `cd ./ror/client`.
3. In the backend terminal window (the one in `./ror`), run the line of code shown below. *This step may take some time because it is seeding the database with an English dictionary so the database does not start empty*:
```
bundle install && rails db:create db:migrate db:seed && rails s
```
4. In the frontend terminal window, run:
```
npm install && npm start
```
5. This will install all other dependencies automatically, create the database on your machine, and start the backend and frontend. After the first time running these commands, you only need `rails s` in the backend terminal and `npm start` in the frontend terminal to start the servers, since you do not need to install dependencies more than once.
6. Open a browser and go to `http://localhost:4000` to view the running application. Running `npm start` may have done this for you already.

## Made by
Joshua Holmes<br/>
[jpholmes.com](https://www.jpholmes.com)<br/>
[linkedin.com/in/joshua-phillip-holmes](https://www.linkedin.com/in/joshua-phillip-holmes/)<br/>
[github.com/joshua-holmes](https://github.com/joshua-holmes)<br/>
[joshua.phillip.holmes@gmail.com](mailto:joshua.phillip.holmes@gmail.com)