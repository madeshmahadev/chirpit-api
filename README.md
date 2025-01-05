# **Chirpit - Twitter Clone API**

This is an API-only backend for a simple Twitter clone application built with **Ruby on Rails**. The project is designed to mimic core social media functionalities while following a **microservices architecture** and adhering to modern best practices.

## **Features**

- **User Authentication:** Implemented with **Devise** and **Devise-JWT** for secure token-based authentication.
- **Tweet Management:** CRUD APIs for creating, reading, updating, and deleting tweets (with character limits).
- **Follow System:** Endpoints for following/unfollowing users and managing relationships.
- **Timeline API:** Fetch personalized timelines for users based on their following list.
- **CORS Support:** Enabled via **Rack-CORS** for seamless integration with frontend applications.
- **Environment Configuration:** Handled securely with **dotenv-rails** for managing sensitive credentials.

---

## **Setup and Installation**

### **Requirements**
- **Ruby**: 3.2.2  
- **Rails**: 6.1.4  
- **SQLite3**: For development and testing  
- **PostgreSQL**: For production  

### **Steps to Set Up**
1. **Clone the Repository**:
   ```bash
   git clone <your-repository-url>
   cd twitter-clone-api
   ```

2. **Install Dependencies**:
   Use Bundler to install the required gems:
   ```bash
   bundle install
   ```

3. **Set Up Environment Variables**:
   Create a `.env` file in the project root and add the following:
   ```env
   SECRET_KEY_BASE=<your-secret-key>
   JWT_SECRET_KEY=<your-jwt-secret-key>
   DATABASE_URL=<your-production-database-url>
   ```

4. **Set Up the Database**:
   Run the following commands to set up and seed the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the Server**:
   Launch the Rails server:
   ```bash
   rails server
   ```

   The API will be available at `http://localhost:3000`.

---

## **API Endpoints**

### **Authentication**
- **POST** `/users/sign_in`: User login
- **POST** `/users/sign_up`: User registration
- **DELETE** `/users/sign_out`: User logout

### **Tweets**
- **POST** `/tweets`: Create a new tweet
- **GET** `/tweets`: Fetch all tweets
- **GET** `/tweets/:id`: Fetch a specific tweet
- **PUT** `/tweets/:id`: Update a tweet
- **DELETE** `/tweets/:id`: Delete a tweet

### **Follow System**
- **POST** `/follow/:user_id`: Follow a user
- **DELETE** `/unfollow/:user_id`: Unfollow a user

### **Timeline**
- **GET** `/timeline`: Fetch personalized feed of tweets

---

## **Gemfile Overview**

### **Core Gems**
- **Rails (~> 6.1.4)**: Core framework for application development.
- **Puma (~> 5.0)**: Lightweight web server for Rails.
- **Devise**: Authentication framework.
- **Devise-JWT**: Adds JWT token-based authentication to Devise.

### **Development Gems**
- **dotenv-rails**: Secure management of environment variables.
- **SQLite3**: Lightweight database for development.

### **Production Gems**
- **pg**: PostgreSQL database adapter for production environments.

---

## **Development and Testing**

### **Testing Tools**
- **Byebug**: Debugging tool for development.

### **Run Tests**
Set up your test suite and run the following command:
```bash
rails test
```

---

## **Deployment**

1. **Ensure Production Gems Are Installed**:
   - PostgreSQL is configured for production in the Gemfile.
2. **Precompile Assets**:
   ```bash
   rails assets:precompile
   ```
3. **Deploy to Hosting Service**:
   - Use platforms like **Heroku**, **AWS EC2**, or **Azure App Service**.

---

## **Contributing**

Contributions are welcome! Please follow these steps to contribute:
1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a pull request.

---

## **License**

This project is licensed under the [MIT License](LICENSE).

---

Let me know if you need further adjustments or additional sections!
