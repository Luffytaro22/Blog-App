<a id="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [🛠 Built With](#built-with)
        - [Tech Stack](#tech-stack)
        - [Key Features](#key-features)
    - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)


<!-- PROJECT DESCRIPTION -->

# 📖 Blog App <a id="about-project"></a>

**Blog App** is an application that allows different users to log in, make posts, and comment and like other posts.

The information is saved in a PostgreSQL database with these tables:
![image](./app/assets/images/blog_app_erd_v1_1.png) 

## 🛠 Built With <a id="built-with"></a>

### Tech Stack

<details>
  <summary>Back-end</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org/">Ruby on Rails</a></li>
    <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
  </ul>
</details>

<details>
  <summary>Front-end</summary>
  <ul>
    <li><a href="https://www.w3schools.com/html/">HTML5</a></li>
    <li><a href="https://www.w3schools.com/css/">CSS</a></li>
    <li><a href="https://www.rubyguides.com/2018/11/ruby-erb-haml-slim/">ERB template</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features
* Use of Rails framework.
* MVC architecture.
* Save and retrieve information from a PostgreSQL database.
* Devise gem.
* Capybara tests with RSpec.
* CanCanCan gem.
* Rswag gem and API documentation.
* RESTful API.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->

## 💻 Getting Started <a id="getting-started"></a>

### Prerequisites
In order to run this project you need to have:

- Installed Ruby and Rails.
- If you're using Windows, have installed WSL.
- If you're using MacOS, an option is using UTM.

### Setup
To clone this repository to your desired folder, run the following command: <br>

```
git clone git@github.com:Luffytaro22/Blog-App.git
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Usage
To open a local server, type the following command:
```
rails server
```
To se the API's documentation, open the local server and go to:
```
/api-docs
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Install
To install all the ruby gems, use the following command:
```
bundle install
```
After installing the gems, run this commando to create and migrate a database:
```
rails db:create db:migrate
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Run tests
To run the RSpec unit tests, use the following command:
```
rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a id="authors"></a>

👤 **Manuel Sánchez**

- GitHub: [@Luffytaro22](https://github.com/Luffytaro22)
- LinkedIn: [Manuel Sánchez](https://www.linkedin.com/in/manuel-alejandro-sanchez-sierra/)

👤 **lRebornsl**

- GitHub: [@lRebornsl](https://github.com/lRebornsl)
- Twitter: [@RebornsDev](https://twitter.com/RebornsDev)
- LinkedIn: [Anthony Vásquez](https://www.linkedin.com/in/avvm98/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a id="future-features"></a>
- [ ] **Integrate a Front-end framework.**
- [ ] **Improve UX and UI.**
- [ ] **Let the users follow each other.**
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a id="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a id="support"></a>
If you like this project please give it a star ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a id="acknowledgements"></a>

I would like to give credits to the following:
* **Microverse** for this readme template.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a id="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


