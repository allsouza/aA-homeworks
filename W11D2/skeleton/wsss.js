{
  entities: {
    notes: {
      1: {
        id: 1,
        authorId: 1,
        title: "My first note",
        body: "This is my very first note! :)",
        notebookId: 1,
        tagIds: []
      },
      2: {
        id: 2,
        authorId: 1,
        title: "Things I learned",
        body: "Ruby, Rails, JavaScript, React, Redux",
        notebookId: 1,
        tagIds: [1,2]
      },
      3: {
        id: 3,
        authorId: 1,
        title: "Random todos",
        body: "1-Wash the car, 2-Do groceries",
        notebookId: 2,
        tagIds: [2,3]
      }
    }
    notebooks: {
      1: {
        id: 1,
        authorId: 1,
        name: "Bootcamp"
      },
      2: {
        id: 2,
        authorId: 1,
        name: "Other"
      }

    }
    tags: {
    1: {
      id: 1,
      authorId: 1,
      name: "learning",
      noteIds: [2]
    },
    2: {
      id: 2,
      authorId: 1,
      name: "list",
      noteIds: [2,3]
    },
    3: {
      id: 3,
      authorId: 1,
      name: "important",
      noteIds: [3]
    }
    }
    users: {
      1: {
        id: 1,
        email: "user@gmail.com",
        firstName: "Some",
        lastName: "User",
        userIcon: "iconUrl"
      }
    }
  },
  ui: {
    loading: true/false,
    modal: {
      login/sign-up: true/false,
      createNotebook: true/false
    }
  },
  errors: {
    login: ["Invalid credentials"],
    signup: ["Must include email", "First name can't be blank"],
    noteFrom: ["Note must have a title"]
  },
  session: { currentUserId: 1 }
}