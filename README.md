## Example Query

GraphQL queries typically start with a "{" character. Lines that start
with a # are ignored.

An example GraphQL query might look like:

    {
      field(arg: "value") {
        subField
      }
    }



### Index Query
```
{
  users {
    name
    email
    postsCount
    posts{
      title
      body
    }
  }
}
```

### Show Query
```
{
  user(id: 1){
    name
    email
    postsCount
    createdAt
    updatedAt
    posts {
      title
    }
  }
}
```

### Create User
```
mutation {
  createUser(input: {name: "Yadavalli Santosh", email: "santosh@gmail.com"}){
    user{
      id
      email
      name
    }
  }
}
```

### Update User
```
mutation{
  updateUser(input: {id: 8, name: "Madhurima Biswas", email: "manomoy@example.com"}){
    user{
      id
      name
      email
    }
  }
}
```

### Create Post

```
mutation{
  createPost(input: {id: 8, title: "Facebook Post", body: "Lorem ipsum kudo elas judo param thuy hujoki"}){
    user{
      id
      name
      email
      postsCount
      posts{
        id
        title
        body
      }
    }
    post{
        id
        title
        body
      }
  }
}
```
