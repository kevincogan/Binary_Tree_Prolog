# Binary Search Tree Implementation

This repository contains a Prolog implementation of a binary search tree (BST). It includes the functionality to insert elements, search for a value, and traverse the tree using preorder, inorder, and postorder traversal methods.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Setup and Usage](#setup-and-usage)
  - [Running the Program](#running-the-program)
  - [Examples](#examples)
- [Implementation Details](#implementation-details)
- [License](#license)

---

## Features
- **Insertion**: Add elements to the BST.
- **Search**: Check if an element exists in the tree.
- **Traversal**:
  - Preorder
  - Inorder
  - Postorder

---

## Requirements
- A Prolog interpreter such as [SWI-Prolog](https://www.swi-prolog.org/).

---

## Setup and Usage

### Running the Program
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```
2. Open the Prolog interpreter:
   ```bash
   swipl
   ```
3. Load the program:
   ```prolog
   ?- [binary_tree].
   ```

### Examples
#### Inserting Values
To insert a value into a BST:
```prolog
?- insert(3, empty, Tree).
Tree = node(empty, 3, empty).
```

#### Searching for a Value
To check if a value exists in the tree:
```prolog
?- search(3, node(node(empty, 1, empty), 2, node(empty, 3, empty))).
true
```

#### Preorder Traversal
To perform a preorder traversal:
```prolog
?- preorder(node(node(empty, 1, empty), 2, node(empty, 3, empty))).
2 1 3
```

#### Inorder Traversal
To perform an inorder traversal:
```prolog
?- inorder(node(node(empty, 1, empty), 2, node(empty, 3, empty))).
1 2 3
```

#### Postorder Traversal
To perform a postorder traversal:
```prolog
?- postorder(node(node(empty, 1, empty), 2, node(empty, 3, empty))).
1 3 2
```

---

## Implementation Details
### Tree Structure
The tree structure is defined as:
- `empty`: Represents an empty tree.
- `node(Left, Value, Right)`: Represents a tree node with:
  - `Left`: The left subtree.
  - `Value`: The value stored at the node.
  - `Right`: The right subtree.

### Predicates
- **Insert**: Add a value to the BST while maintaining its properties.
  ```prolog
  insert(V, empty, node(empty, V, empty)).
  insert(V, node(L, V2, R), node(L2, V2, R)) :- V < V2, insert(V, L, L2).
  insert(V, node(L, V2, R), node(L, V2, R2)) :- V > V2, insert(V, R, R2).
  ```

- **Search**: Verify if a value exists in the tree.
  ```prolog
  search(E, node(_, E, _)).
  search(E, node(L, Root, _)) :- E < Root, search(E, L).
  search(E, node(_, Root, R)) :- E > Root, search(E, R).
  ```

- **Traversal**: Print values in preorder, inorder, or postorder.
  ```prolog
  preorder(empty).
  preorder(node(L, Root, R)) :- write(Root), write(" "), preorder(L), preorder(R).

  inorder(empty).
  inorder(node(L, Root, R)) :- inorder(L), write(Root), write(" "), inorder(R).

  postorder(empty).
  postorder(node(L, Root, R)) :- postorder(L), postorder(R), write(Root), write(" ").
  ```

---

## License
This project is licensed under the MIT License. See the LICENSE file for details.

---

Enjoy exploring the binary search tree implementation!

