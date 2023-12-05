<a id="readme-top"></a>

<!-- TABLE OF CONTENTS -->

<details>
  <summary><h1>📗 Table of Contents</h1></summary>
  <ul>
    <li><a href="#about-project">📖 About the Project</a>
      <ul>
        <li><a href="#built-with">🛠 Built With</a></li>
        <li><a href="#tech-stack">Tech Stack</a></li>
        <li><a href="#key-features">Key Features</a></li>
      </ul>
    </li>
    <li><a href="#live-demo">🚀 Live Demo</a></li>
    <li><a href="#getting-started">💻 Getting Started</a>
      <ul>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#install">Install</a></li>
        <li><a href="#usage">Usage</a></li>
        <li><a href="#run-tests">Run tests</a></li>
        <li><a href="#deployment">Deployment</a></li>
      </ul>
    </li>
    <li><a href="#authors">👥 Authors</a></li>
    <li><a href="#future-features">🔭 Future Features</a></li>
    <li><a href="#contributing">🤝 Contributing</a></li>
    <li><a href="#support">⭐️ Show your support</a></li>
    <li><a href="#acknowledgements">🙏 Acknowledgements</a></li>
    <li><a href="#license">📝 License</a></li>
  </ul>
</details>


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

<!-- Live Demo -->
### 🚀 Live Demo <a id="live-demo"></a>
[Live Demo](https://blog-app-efud.onrender.com/)

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
To ses the API's documentation, open the local server and go to:
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


