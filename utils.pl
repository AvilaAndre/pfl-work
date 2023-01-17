% Array Manipulation

/**
* Gets the element on the Index position of the Array.
*/
element_at([Element | _ArrayTail], 0, Element).

element_at([_ArrayHead | ArrayTail], Index, Element):-
    Index1 is Index - 1,
    element_at(ArrayTail, Index1, Element).

/**
* Gets the number of elements in an Array.
*/
array_size([], 0).

array_size([_ArrayHead | ArrayTail], Size):-
    array_size(ArrayTail, Size1),
    Size is Size1 + 1.

/**
*   Sums every number on an array.
*/
array_sum([], 0).

array_sum([ArrayHead | ArrayTail], Sum):-
    array_sum(ArrayTail, Sum1),
    increment(Sum1, ArrayHead, Sum).

/**
*   Selects the indexes in an array where the element is bigger than Pivot
*/
array_index_bigger_than([], _Index, [], _Pivot).

array_index_bigger_than([ArrayHead | ArrayTail], Index, IndexArray, Pivot):-
    ArrayHead > Pivot,
    Index1 is Index + 1,
    array_index_bigger_than(ArrayTail, Index1, IndexArray1, Pivot),
    append([Index], IndexArray1, IndexArray).

array_index_bigger_than([_ArrayHead | ArrayTail], Index, IndexArray, Pivot):-
    Index1 is Index + 1,
    array_index_bigger_than(ArrayTail, Index1, IndexArray, Pivot).


/**
* Replaces the element on the Index position of the Array with the Replacement element.
*/
replace_at([_ArrayHead | ArrayTail], 0, Replacement, NewArray):-
    append([Replacement], ArrayTail, NewArray).

replace_at([ArrayHead | ArrayTail], Index, Replacement, NewArray):-
    Index1 is Index - 1,
    replace_at(ArrayTail, Index1, Replacement, NewArray1),
    append([ArrayHead], NewArray1, NewArray).

% Graphics

clear_screen:-
    write('\33\[2J').