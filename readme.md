## Basic Overview
This shop shows a simple ecommerce application based on `Polymer` where the clients can buy.
Clients can filter sizes, order by price and buy as many t-shirts as they want.

Assess the quality of the application by creating different automated test suites. And report any possible inconsistency, if they do exist, during your tests.

#### About the tests
Here, at e2y, we work following the `BDD` (Behaviour Driven Development) process with tools like `Cucumber, WebdriverIO, Cypress, Selenium webdriver, Protractor...`
However, feel free to use any framework in any language.

Please, place your code under `tests` in the root directory.
Besides, evaluate which cases are worthy to be automated or not.

Remember, we are developers! Not only do we worry about the quality of the application but also the quality of the code ;)

# SHOP

Shop is a sample e-commerce [Progressive Web App](https://developers.google.com/web/progressive-web-apps/).

![shop screenshot](https://user-images.githubusercontent.com/116360/39545341-c50a9184-4e05-11e8-88e0-0e1f3fa4834b.png)

## Features/highlights

- a sample e-commerce shopping site
- pattern for a real-life shopping cart and store checkout flow
- pattern for using custom announcers for accessibility

## Setup
```bash
$ git clone https://github.com/Polymer/shop.git
$ cd shop
$ npm i
$ npm start
```

## Build
```bash
$ npm run build
```

## Test the build
To test prpl-server build:
```bash
$ npm run serve:prpl-server
```
To test static build:
```bash
$ npm run serve:static
```

## Deploying

Our [production deployment of SHOP](https://shop.polymer-project.org/) is hosted on App Engine with Node.js. It can be deployed with [the same steps as PWA Starter Kit](https://polymer.github.io/pwa-starter-kit/building-and-deploying/#deploying-prpl-server).
