# Readers Haven API

This API gives you access to the Readers Haven database that hosts a number of books posted by the platforms users for review by other users.

## Table of Contents

- [Models](#models)
- [Validations](#validations)
- [Routes](#routes)

## Models

The following relationships are established:

- A `User` has many `Books`
- A `User` has many `Reviews`
- An `Author` has many `Books`
- A `Book` belongs to a `User`, belongs to a `Publisher`, and belongs_to `Author`
- A `Review` belongs to a `User` and `Book`


## Validations

The following validations are added to the models:

- `User` model:
  - `email` must be present and unique
  - `password` must have a length of atleast 6 characters
- `Book` model:
  - `user_id` must be belong a to valid `user.id` in the database
  - `author_id` must be belong a to valid `author.id` in the database
  - `publisher_id` must be belong a to valid `publisher.id` in the database
- `Review` model:
  - `user_id` must be belong a to valid `user.id` in the database
  - `book_id` must be belong a to valid `book.id` in the database
  

## Routes

The following routes are set up in the API:

### GET /books

Retrieve a list of all books in JSON format.

**Response format:**

```
[
  {
        "id": 62,
        "title": "Mombasa 2",
        "genre": "adventure",
        "description": "https://images.pexels.com/photos/17354116/pexels-photo-17354116/free-photo-of-city-dawn-landscape-sunset.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "publish_date": 2003,
        "author_id": 14,
        "price": 14,
        "user_id": 14,
        "poster_url": "https://images.pexels.com/photos/17354116/pexels-photo-17354116/free-photo-of-city-dawn-landscape-sunset.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "author": {
            "id": 14,
            "name": "Fr. Lacy Dietrich",
            "gender": "Male",
            "email": "quincy@swift-doyle.org",
            "nationality": "Chileans",
            "bio": "Consequatur provident voluptate. Animi debitis et.",
            "image_url": "https://images.pexels.com/photos/13193108/pexels-photo-13193108.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
        }
    },
    {
        "id": 61,
        "title": "Anyuongi Forces",
        "genre": "War",
        "description": "https://images.pexels.com/photos/16228271/pexels-photo-16228271/free-photo-of-holi-in-vrindavan.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "publish_date": 2021,
        "author_id": 4,
        "price": 20,
        "user_id": 14,
        "poster_url": "https://images.pexels.com/photos/16228271/pexels-photo-16228271/free-photo-of-holi-in-vrindavan.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "author": {
            "id": 4,
            "name": "Gov. Zack Corkery",
            "gender": "Male",
            "email": "tyler.lynch@reichel-jast.org",
            "nationality": "Ukrainians",
            "bio": "Perferendis illo exercitationem. Voluptatem amet esse.",
            "image_url": "https://images.pexels.com/photos/13193108/pexels-photo-13193108.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
        }
    },
    {
        "id": 59,
        "title": "anyuongi",
        "genre": "comedy",
        "description": "https://images.pexels.com/photos/16954314/pexels-photo-16954314/free-photo-of-young-woman-standing-in-the-meadow.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "publish_date": 2014,
        "author_id": 2,
        "price": 1,
        "user_id": 13,
        "poster_url": "https://images.pexels.com/photos/16954314/pexels-photo-16954314/free-photo-of-young-woman-standing-in-the-meadow.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        "author": {
            "id": 2,
            "name": "Aron Hudson",
            "gender": "Male",
            "email": "dan.feest@berge.com",
            "nationality": "Surinamese",
            "bio": "Velit labore odio. Dolorem ut dolor.",
            "image_url": "https://images.pexels.com/photos/13193108/pexels-photo-13193108.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
        }
    },
]
```

### GET /books/:id

Retrieve a specific book by ID in JSON format.

If the hero exists:

**Response format:**

```
{
    "id": 1,
    "title": "Noli Me Tangere",
    "genre": "Folklore",
    "description": "Blanditiis quis veniam. Accusamus beatae incidunt. Consectetur quis enim.",
    "publish_date": 1902,
    "price": 86,
    "user_id": 3,
    "poster_url": "https://images.pexels.com/photos/16364335/pexels-photo-16364335/free-photo-of-city-road-landscape-people.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "publisher": {
        "id": 5,
        "name": "Howell-Jaskolski",
        "address": "Suite 905 7276 Loralee Key, Rathberg, IA 39853-0978",
        "email": "darryl_harvey@moen.biz",
        "telephone": "1703977616831822"
    },
    "author": {
        "id": 20,
        "name": "Morris Ullrich",
        "gender": "Female",
        "email": "dorinda@greenfelder-bergstrom.name",
        "nationality": "Uzbeks",
        "bio": "Architecto rerum non. Amet et sapiente.",
        "image_url": "https://images.pexels.com/photos/13193108/pexels-photo-13193108.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
    }
}
```

If the hero does not exist:

**Response format:**

```
{ "error": "Book not found" }
```

### GET /me

Retrieve a user profile to enable login in JSON format.

**Response format:**

```
{
    "id": 11,
    "first_name": "felix",
    "last_name": "olali",
    "email": "felix.olali@ratke.name",
    "image_url": "https://robohash.org/Lita.png?size=300x300&set=set1",
    "books": []
}
```

### POST /login

Sends a user's login credential for authentication in JSON format.

**Response format:**

```
{
  "email": "user@mail.com",
  "password": "3NcR7Pt#D99a55w0RD"
}
```

**Response format:**

```
{
    "id": 11,
    "first_name": "felix",
    "last_name": "olali",
    "email": "user@mail.com",
    "image_url": "https://robohash.org/Lita.png?size=300x300&set=set1",
    "books": []
}
```


If the user does not exist:

**Response format:**

```
{ "error": "User not found" }
```

### POST  /books/book_id/rewiews

Enables a logged in user to post a review to a specific book.

Request body format:

```
{
  "description": "A very nice read!",
  "star_rating": 6,
  "user_id": 3
}
```



### POST /books

Create a new book.

Request body format:

```
{
    "title": "Noli Me Tangere",
    "genre": "Folklore",
    "description": "Blanditiis quis veniam. Accusamus beatae incidunt. Consectetur quis enim.",
    "publish_date": 1902,
    "price": 86,
    "user_id": 3,
    "poster_url": "https://images.pexels.com/photos/16364335/pexels-photo-16364335/free-photo-of-city-road-landscape-people.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "publisher_id":4,
    "author_id":9 
}
```

If the Book is created successfully:

**Response format:**

```
{
    "title": "Noli Me Tangere",
    "genre": "Folklore",
    "description": "Blanditiis quis veniam. Accusamus beatae incidunt. Consectetur quis enim.",
    "publish_date": 1902,
    "price": 86,
    "user_id": 3,
    "poster_url": "https://images.pexels.com/photos/16364335/pexels-photo-16364335/free-photo-of-city-road-landscape-people.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "publisher_id":4,
    "author_id":9 
}
```

If the Book is not created successfully:

**Response format:**

```
{ "errors": ["validation errors"] }
```

## Project Setup

This API is hosted in GIthub [here](https://github.com/Ase020/readers-haven-api) and deployed at [Readers Haven API](https://peaceful-oasis-68149-c720121aea60.herokuapp.com)

This Readers Haven frontend is hosted in GIthub [here](https://github.com/Ase020/Readers-haven-client) and deployed at [Readers Haven](https://readers-haven.vercel.app)



## Acknowledgements

This project was developed as Ruby on Rails group project assignment. Special thanks to our technical mentor Solomon Kitonyi for his guidance and support.

## Contributors

- Felix Nyalenda
- Frank Thomas
- Mohamed salad
- Milhan Omar
