tree5(node(node(node(node(empty, 1, empty), 2, empty), 3, node(empty, 4, empty)), 5, node(node(empty, 6, empty), 7, node(empty, 8, empty)))) .

insert(V,empty,node(empty,V,empty)). /* insert a value into a binary search tree */
insert(V, node(L,V2,R), node(L2,V2,R)):- V<V2, insert(V,L,L2).
insert(V, node(L,V2,R), node(L2,V2,R)):- V==V2, insert(V,L,L2).
insert(V, node(L,V2,R), node(L,V2,R2)):- V>V2, insert(V,R,R2).

search(E, node(_,E, _)):- write("true").

search(E, node(LT,Root, _)):-
   E < Root,
   search(E, LT).

search(E, node(_, Root, RT)):-
   E > Root,
   search(E, RT).


preorder(empty).
preorder(node(Left, Root, Right)) :-

   write(Root),
   write(" "),
   preorder(Left),
   preorder(Right).


inorder(empty).
inorder(node(Left, Root, Right)) :-
   inorder(Left),
   write(Root),
   write(" "),
   inorder(Right).


postorder(empty).
postorder(node(Left,Root, Right)) :-
   postorder(Left),
   postorder(Right),
   write(Root),
   write(" ").
