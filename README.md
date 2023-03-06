# Task2: API integration and state management

A simple application that can perform get, post, patch and delete operation and save the response data to the state using provider.
## API Reference



#### Get post

```http
  GET /https://jsonplaceholder.typicode.com/posts/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `int` | **Required**. id of post to fetch |

#### Create post

```http
  POST /https://jsonplaceholder.typicode.com/posts
```

#### Patch post

```http
  PATCH /https://jsonplaceholder.typicode.com/posts/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `int` | **Required**. id of post to patch |


#### Delete post

```http
  DELETE /https://jsonplaceholder.typicode.com/posts/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `int` | **Required**. id of post to delete |
## Run Locally

Clone the project

```bash
  git clone https://github.com/SanjibLimbu/Task2_API.git
```

Go to the project directory

```bash
  cd Task2_API
  cd Task2
```

Install dependencies

```bash
  flutter pub get
```

Start the app

```bash
  flutter run
```
## License

[MIT](https://choosealicense.com/licenses/mit/)

## Authors

- [@Sanjib Limbu](https://www.github.com/SanjibLimbu)
