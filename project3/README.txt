
For the task4, the major change I did is that I implement the calculateEM function (P(word|correction)).

My calculateEM has 3 situations, which depend on what the editDistance is.

1. editDistance==0;
Just return 1;

2. editDistance==1;
Under this situation, because there are 80% error within editDistance 1, I assign 1*0.8 as the base case. Then I separate it as 4 cases including deletion, insertion, transposition and substitution. I also weighted their possibilities separately as well. I analyzed the data from http://norvig.com/ngrams/count_1edit.txt, and got the following result:

	A. Deletion.
	   Deletion is the most common case, which is 60%. 
	   But even in the deletion case, there are some errors extremely common, which are ly||lly, k|ke, r|re, t|te, h|he. So I assigned them as 0.8, and others as 0.8*0.6.
	B. Substitution.
	   Substitution is another common error, which is about 31%. But this error is more common in some special characters, which like "a, e, i, r", and "c, s". So I assigned these special character as 0.8*0.31*0.9, and the rest as 0.9*0.31*0.1.
	C. Transposition
	   0.8*0.1
	D. Insertion
	   0.8*0.1

3.editDistance==2;
Just return 0.2.

Finally I got 78.87% accuracy.  