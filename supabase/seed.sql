-- Seed data for DSA Ladder

-- Insert topics
INSERT INTO public.topics (id, title, description, order_index) VALUES
(1, 'Arrays', 'Fundamental data structure for storing collections of elements', 1),
(2, 'Two Pointers', 'Technique using two pointers to solve array problems efficiently', 2),
(3, 'Sliding Window', 'Technique for processing subarrays with a moving window', 3),
(4, 'Binary Search', 'Efficient search algorithm for sorted data', 4),
(5, 'Stack', 'LIFO data structure for managing function calls and expressions', 5),
(6, 'Queue', 'FIFO data structure for breadth-first operations', 6),
(7, 'Linked List', 'Linear data structure with nodes connected by pointers', 7),
(8, 'Trees', 'Hierarchical data structure with root and child nodes', 8),
(9, 'Heap / Priority Queue', 'Specialized tree-based structure for priority management', 9),
(10, 'Graphs', 'Nodes connected by edges for representing relationships', 10),
(11, 'Dynamic Programming', 'Optimization technique using memoization', 11),
(12, 'Greedy', 'Making locally optimal choices for global solutions', 12),
(13, 'Backtracking', 'Exploring all possibilities and undoing choices', 13),
(14, 'Trie', 'Tree-like structure for prefix matching', 14),
(15, 'Bit Manipulation', 'Using bit operations for efficient problem solving', 15),
(16, 'Strings', 'Working with character arrays and string algorithms', 16),
(17, 'Sorting', 'Algorithms for arranging elements in order', 17),
(18, 'BST', 'Binary Search Tree operations and problems', 18)
ON CONFLICT (id) DO NOTHING;

-- Insert problems for Arrays (topic_id = 1)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(1, 'Second Largest Element', 'Easy', 'https://www.geeksforgeeks.org/problems/second-largest3735/1'),
(1, 'Third Largest Element', 'Easy', 'https://www.geeksforgeeks.org/dsa/third-largest-element-array-distinct-elements/'),
(1, 'Reverse an Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/program-to-reverse-an-array/'),
(1, 'Reverse Array in Groups', 'Easy', 'https://www.geeksforgeeks.org/problems/reverse-array-in-groups0255/1'),
(1, 'Rotate Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/array-rotation/'),
(1, 'Three Great Candidates', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-the-largest-three-elements-in-an-array/'),
(1, 'Max Consecutive Ones', 'Easy', 'https://www.geeksforgeeks.org/dsa/maximum-consecutive-ones-or-zeros-in-a-binary-array/'),
(1, 'Move All Zeroes To End', 'Easy', 'https://www.geeksforgeeks.org/dsa/move-all-zeroes-to-end-of-array/'),
(1, 'Wave Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/sort-array-wave-form-2/'),
(1, 'Plus One', 'Easy', 'https://www.geeksforgeeks.org/dsa/plus-one-add-1-to-a-number-represented-as-array/'),
(1, 'Stock Buy and Sell – One Transaction', 'Easy', 'https://www.geeksforgeeks.org/dsa/best-time-to-buy-and-sell-stock/'),
(1, 'Stock Buy and Sell – Multiple Transactions', 'Easy', 'https://www.geeksforgeeks.org/dsa/stock-buy-sell/'),
(1, 'Remove Duplicates from Sorted Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/remove-duplicates-sorted-array/'),
(1, 'Alternate Positive Negative', 'Easy', 'https://www.geeksforgeeks.org/problems/array-of-alternate-ve-and-ve-nos1401/0'),
(1, 'Array Leaders', 'Easy', 'https://www.geeksforgeeks.org/dsa/leaders-in-an-array/'),
(1, 'Missing and Repeating in Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-a-repeating-and-a-missing-number/'),
(1, 'Missing Ranges of Numbers', 'Easy', 'https://www.geeksforgeeks.org/dsa/missing-ranges-of-numbers/'),
(1, 'Sum of all Subarrays', 'Easy', 'https://www.geeksforgeeks.org/dsa/sum-of-all-subarrays/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(1, 'Next Permutation', 'Medium', 'https://www.geeksforgeeks.org/dsa/next-permutation/'),
(1, 'Majority Element', 'Medium', 'https://www.geeksforgeeks.org/dsa/majority-element/'),
(1, 'Majority Element II', 'Medium', 'https://www.geeksforgeeks.org/dsa/majority-element-ii/'),
(1, 'Minimize the Heights II', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimize-the-maximum-difference-between-the-heights/'),
(1, 'Maximum Subarray Sum', 'Medium', 'https://www.geeksforgeeks.org/dsa/largest-sum-contiguous-subarray/'),
(1, 'Maximum Product Subarray', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-product-subarray/'),
(1, 'Product of Array Except Self', 'Medium', 'https://www.geeksforgeeks.org/dsa/a-product-array-puzzle/'),
(1, 'Subarrays with Product Less Than K', 'Medium', 'https://www.geeksforgeeks.org/dsa/number-subarrays-product-less-k/'),
(1, 'Split Into Three Equal Sum Segments', 'Medium', 'https://www.geeksforgeeks.org/dsa/split-array-three-equal-sum-subarrays/'),
(1, 'Maximum Consecutive 1s After Flipping 0s', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximize-consecutive-1s-by-flipping-0/'),
(1, 'Last Moment Before Ants Fall Out of Plank', 'Medium', 'https://www.geeksforgeeks.org/dsa/last-moment-before-all-ants-fall-out-of-a-plank/'),
(1, 'Find 0 with Farthest 1s in a Binary', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-zero-replacement-maximize-consecutive-ones/'),
(1, 'Intersection of Interval Lists', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-intersection-of-intervals/'),
(1, 'Rearrange Array Elements by Sign', 'Medium', 'https://www.geeksforgeeks.org/dsa/rearrange-array-elements-by-sign/'),
(1, 'Meeting Scheduler for Two Persons', 'Medium', 'https://www.geeksforgeeks.org/dsa/meeting-scheduler/'),
(1, 'Longest Mountain Subarray', 'Medium', 'https://www.geeksforgeeks.org/dsa/longest-mountain-subarray/'),
(1, 'Transform and Sort Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/transform-array-and-sort/'),
(1, 'Minimum Swaps To Group All Ones', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-swaps-required-group-1s-together/'),
(1, 'Minimum Moves To Equalize Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-moves-to-equal-array-elements/'),
(1, 'Minimum Indices To Equal Even-Odd Sums', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-ways-to-split-array-such-that-sum-of-even-indexed-and-odd-indexed-elements-are-equal/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(1, 'Trapping Rain Water', 'Hard', 'https://www.geeksforgeeks.org/dsa/trapping-rain-water/'),
(1, 'Maximum Circular Subarray Sum', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-contiguous-circular-sum/'),
(1, 'Smallest Missing Positive Number', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-the-smallest-positive-number-missing-from-an-unsorted-array/'),
(1, 'Jump Game', 'Hard', 'https://www.geeksforgeeks.org/dsa/minimum-number-of-jumps-to-reach-end-of-a-given-array/'),
(1, 'Closest Subsequence Sum', 'Hard', 'https://www.geeksforgeeks.org/dsa/closest-subsequence-sum/'),
(1, 'Smallest Non-Representable Sum in Array', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-smallest-value-represented-sum-subset-given-array/'),
(1, 'Smallest Range Having Elements From K Lists', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-smallest-range-containing-elements-from-k-lists/'),
(1, 'Count Subarrays with K Distinct Elements', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-subarrays-with-k-distinct-elements/'),
(1, 'Next Smallest Palindrome', 'Hard', 'https://www.geeksforgeeks.org/dsa/given-a-number-find-next-smallest-palindrome-larger-than-this-number/'),
(1, 'Maximum Sum Among All Rotations', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-sum-possible-of-an-array/')
ON CONFLICT DO NOTHING;

-- Insert problems for Two Pointers (topic_id = 2)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(2, 'Valid Palindrome', 'Easy', 'https://leetcode.com/problems/valid-palindrome/'),
(2, '3Sum Closest', 'Medium', 'https://leetcode.com/problems/3sum-closest/'),
(2, 'Container With Most Water', 'Medium', 'https://leetcode.com/problems/container-with-most-water/'),
(2, 'Remove Duplicates from Sorted Array', 'Easy', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array/'),
(2, 'Sort Colors', 'Medium', 'https://leetcode.com/problems/sort-colors/'),
(2, 'Trapping Rain Water', 'Hard', 'https://leetcode.com/problems/trapping-rain-water/')
ON CONFLICT DO NOTHING;

-- Insert problems for Sliding Window (topic_id = 3)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(3, 'Maximum Average Subarray', 'Easy', 'https://leetcode.com/problems/maximum-average-subarray-i/'),
(3, 'Maximum Sum Subarray', 'Medium', 'https://leetcode.com/problems/maximum-sum-subarray/'),
(3, 'Longest Substring Without Repeating Characters', 'Medium', 'https://leetcode.com/problems/longest-substring-without-repeating-characters/'),
(3, 'Minimum Size Subarray Sum', 'Medium', 'https://leetcode.com/problems/minimum-size-subarray-sum/'),
(3, 'Sliding Window Maximum', 'Hard', 'https://leetcode.com/problems/sliding-window-maximum/'),
(3, 'Fruit Into Baskets', 'Medium', 'https://leetcode.com/problems/fruit-into-baskets/')
ON CONFLICT DO NOTHING;

-- Insert problems for Binary Search (topic_id = 4)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(4, 'Missing Number', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-the-missing-number/'),
(4, 'Second Largest', 'Easy', 'https://www.geeksforgeeks.org/problems/second-largest3735/1'),
(4, 'Common in Three Sorted Arrays', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-common-elements-three-sorted-arrays/'),
(4, 'Transition Point in a Binary Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-transition-point-binary-array/'),
(4, 'Floor in a Sorted Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/floor-in-a-sorted-array/'),
(4, 'Pair with Given Difference', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-a-pair-with-the-given-difference/'),
(4, 'Square Root (Binary Search)', 'Easy', 'https://www.geeksforgeeks.org/dsa/square-root-of-an-integer/'),
(4, 'Rotation Count in Rotated Sorted Array', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-rotation-count-rotated-sorted-array/'),
(4, 'Matrix Sorted Search', 'Easy', 'https://www.geeksforgeeks.org/dsa/search-in-row-wise-and-column-wise-sorted-matrix/'),
(4, 'Bitonic Peak Search', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-the-maximum-element-in-an-array-which-is-first-increasing-and-then-decreasing/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(4, 'Search in Rotated Sorted Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/search-an-element-in-a-sorted-and-pivoted-array/'),
(4, 'Majority Element', 'Medium', 'https://www.geeksforgeeks.org/dsa/majority-element/'),
(4, 'K''th Smallest/Largest in Unsorted Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/kth-smallestlargest-element-unsorted-array/'),
(4, 'Count Frequency in Sorted Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-number-of-occurrences-or-frequency-in-a-sorted-array/'),
(4, 'Peak Element', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-a-peak-in-a-given-array/'),
(4, 'Smallest Missing Positive', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-smallest-positive-number-missing-from-an-unsorted-array/'),
(4, 'All Triplets with Zero Sum', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-triplets-array-whose-sum-equal-zero/'),
(4, 'First & Last Positions in Sorted Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-first-and-last-positions-of-an-element-in-a-sorted-array/'),
(4, 'Matrix Sorted Search', 'Medium', 'https://www.geeksforgeeks.org/dsa/search-element-in-a-sorted-matrix/'),
(4, 'Two Repeating Elements', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-two-repeating-elements-in-a-given-array/'),
(4, 'Single Element in Sorted Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-element-that-appears-once-in-a-sorted-array/'),
(4, 'Two Elements with Sum Closest to Zero', 'Medium', 'https://www.geeksforgeeks.org/dsa/two-elements-whose-sum-is-closest-to-zero/'),
(4, 'Count ≤ Elements from Second Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-elements-less-than-or-equal-to-in-second-array/'),
(4, 'Smallest Number with n Factorial Zeros', 'Medium', 'https://www.geeksforgeeks.org/dsa/smallest-number-with-at-least-n-trailing-zeroes-in-factorial/'),
(4, 'kth Smallest in Given n Ranges', 'Medium', 'https://www.geeksforgeeks.org/dsa/kth-smallest-number-in-ranges/'),
(4, 'Minimum Repeats for Substring', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-of-times-a-has-to-be-repeated-such-that-b-is-a-substring-of-it/'),
(4, 'Remove Coins for ≤ K Difference', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-of-coins-to-remove/'),
(4, 'Capacity to Ship Packages Within D Days', 'Medium', 'https://www.geeksforgeeks.org/dsa/capacity-to-ship-packages-within-d-days/'),
(4, 'Count Pairs with Sum > 0', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-pairs-array-whose-sum-greater-zero/'),
(4, 'Farthest Smaller Element to the Right', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-farthest-smaller-number-in-the-right-side/'),
(4, 'Ternary Search', 'Medium', 'https://www.geeksforgeeks.org/dsa/ternary-search/'),
(4, 'Distribute N Candies Among K People', 'Medium', 'https://www.geeksforgeeks.org/dsa/distribute-n-candies-among-k-people/'),
(4, 'Smallest Difference Triplet from Three Arrays', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimize-maxai-bj-ck/'),
(4, 'Minimize Tower Equalization Cost', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimize-the-heights/'),
(4, 'Maximum Modulo Pair', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-value-of-ai-mod-aj/'),
(4, 'K-th Missing Positive', 'Medium', 'https://www.geeksforgeeks.org/dsa/k-th-missing-element-in-sorted-array/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(4, 'Median of Two Sorted Arrays', 'Hard', 'https://www.geeksforgeeks.org/dsa/median-of-two-sorted-arrays/'),
(4, 'Book Allocation Problem', 'Hard', 'https://www.geeksforgeeks.org/dsa/allocate-minimum-number-pages/'),
(4, 'Painters Partition Problem', 'Hard', 'https://www.geeksforgeeks.org/dsa/the-painters-partition-problem/'),
(4, 'Median in Row-wise Sorted Matrix', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-median-row-wise-sorted-matrix/'),
(4, 'Aggressive Cows', 'Hard', 'https://www.geeksforgeeks.org/problems/aggressive-cows/1'),
(4, 'Split Array to Minimize Max Sum', 'Hard', 'https://www.geeksforgeeks.org/dsa/split-array-largest-sum/'),
(4, 'Kth Smallest Number in Multiplication Table', 'Hard', 'https://www.geeksforgeeks.org/dsa/kth-smallest-number-in-multiplication-table/'),
(4, 'Count Numbers with Digit Sum Difference', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-numbers-with-digit-sum-difference/'),
(4, 'Minimum Time to Fulfil All Orders', 'Hard', 'https://www.geeksforgeeks.org/dsa/minimum-time-to-fulfil-all-orders/'),
(4, 'Maximize Minimum Flower Height', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximize-minimum-height-of-flowers/')
ON CONFLICT DO NOTHING;

-- Insert problems for Stack (topic_id = 5)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(5, 'Valid Parentheses', 'Easy', 'https://leetcode.com/problems/valid-parentheses/'),
(5, 'Min Stack', 'Medium', 'https://leetcode.com/problems/min-stack/'),
(5, 'Evaluate Reverse Polish Notation', 'Medium', 'https://leetcode.com/problems/evaluate-reverse-polish-notation/'),
(5, 'Decode String', 'Medium', 'https://leetcode.com/problems/decode-string/'),
(5, 'Car Fleet', 'Medium', 'https://leetcode.com/problems/car-fleet/')
ON CONFLICT DO NOTHING;

-- Insert problems for Queue (topic_id = 6)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(6, 'Implement Queue using Stacks', 'Easy', 'https://leetcode.com/problems/implement-queue-using-stacks/'),
(6, 'Number of Recent Calls', 'Easy', 'https://leetcode.com/problems/number-of-recent-calls/'),
(6, 'Dota2 Senate', 'Medium', 'https://leetcode.com/problems/dota2-senate/'),
(6, 'Design Circular Queue', 'Medium', 'https://leetcode.com/problems/design-circular-queue/'),
(6, 'Task Scheduler', 'Medium', 'https://leetcode.com/problems/task-scheduler/')
ON CONFLICT DO NOTHING;

-- Insert problems for Linked List (topic_id = 7)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(7, 'Reverse Linked List', 'Easy', 'https://leetcode.com/problems/reverse-linked-list/'),
(7, 'Merge Two Sorted Lists', 'Easy', 'https://leetcode.com/problems/merge-two-sorted-lists/'),
(7, 'Linked List Cycle', 'Easy', 'https://leetcode.com/problems/linked-list-cycle/'),
(7, 'Remove Nth Node From End', 'Medium', 'https://leetcode.com/problems/remove-nth-node-from-end-of-list/'),
(7, 'Add Two Numbers', 'Medium', 'https://leetcode.com/problems/add-two-numbers/'),
(7, 'Copy List with Random Pointer', 'Medium', 'https://leetcode.com/problems/copy-list-with-random-pointer/')
ON CONFLICT DO NOTHING;

-- Insert problems for Trees (topic_id = 8)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(8, 'Height of Binary Tree', 'Easy', 'https://www.geeksforgeeks.org/dsa/height-of-a-binary-tree/'),
(8, 'Identical Trees', 'Easy', 'https://www.geeksforgeeks.org/dsa/write-c-code-to-determine-if-two-trees-are-identical/'),
(8, 'Mirror Trees', 'Easy', 'https://www.geeksforgeeks.org/dsa/mirror-of-a-given-binary-tree/'),
(8, 'Symmetric Trees', 'Easy', 'https://www.geeksforgeeks.org/dsa/symmetric-tree-tree-which-is-mirror-image-of-itself/'),
(8, 'Balanced Tree', 'Easy', 'https://www.geeksforgeeks.org/dsa/how-to-determine-if-a-binary-tree-is-balanced/'),
(8, 'Children Sum Parent', 'Easy', 'https://www.geeksforgeeks.org/dsa/check-for-children-sum-property-in-a-binary-tree/'),
(8, 'Array to BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/sorted-array-to-balanced-bst/'),
(8, 'Nodes at Given Distance', 'Easy', 'https://www.geeksforgeeks.org/dsa/print-nodes-at-k-distance-from-root/'),
(8, 'Inorder Successor in BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/inorder-successor-in-binary-search-tree/'),
(8, 'Kth Largest Element in a BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/kth-largest-element-in-bst/'),
(8, 'Balance a BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/convert-normal-bst-balanced-bst/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(8, 'Diameter of Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/diameter-of-a-binary-tree/'),
(8, 'Check if Subtree', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-if-a-binary-tree-is-subtree-of-another-binary-tree/'),
(8, 'Check for BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/a-program-to-check-if-a-binary-tree-is-bst-or-not/'),
(8, 'Single Valued Subtree', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-single-valued-subtrees/'),
(8, 'Unique BSTs', 'Medium', 'https://www.geeksforgeeks.org/dsa/total-number-of-possible-binary-search-trees-using-catalan-number/'),
(8, 'Zigzag Tree Traversal', 'Medium', 'https://www.geeksforgeeks.org/dsa/zigzag-tree-traversal/'),
(8, 'Vertical Traversal', 'Medium', 'https://www.geeksforgeeks.org/dsa/vertical-order-traversal-of-binary-tree/'),
(8, 'Boundary Traversal', 'Medium', 'https://www.geeksforgeeks.org/dsa/boundary-traversal-of-binary-tree/'),
(8, 'Tree from Preorder and Inorder Traversal', 'Medium', 'https://www.geeksforgeeks.org/dsa/construct-tree-from-given-inorder-and-preorder-traversal/'),
(8, 'BST from Preorder Traversal', 'Medium', 'https://www.geeksforgeeks.org/dsa/construct-bst-from-preorder-traversal/'),
(8, 'Minimum Distance Between Two Nodes', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-distance-between-two-nodes-of-a-binary-tree/'),
(8, 'Maximum Sum Leaf to Root Path', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-maximum-sum-path-from-root-to-leaf-in-a-binary-tree/'),
(8, 'Odd Even Level Difference', 'Medium', 'https://www.geeksforgeeks.org/dsa/difference-between-sums-of-odd-level-and-even-level-nodes-of-a-binary-tree/'),
(8, 'Lowest Common Ancestor of a Binary Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/lowest-common-ancestor-binary-tree-set-1/'),
(8, 'Ancestors in Binary Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/print-ancestors-of-a-given-node-in-binary-tree/'),
(8, 'Remove BST Keys Outside the Given Range', 'Medium', 'https://www.geeksforgeeks.org/dsa/remove-bst-keys-outside-the-given-range/'),
(8, 'Pair with Given Target in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-a-pair-with-given-sum-in-bst/'),
(8, 'BST to Greater Sum Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/transform-bst-to-greater-sum-tree/'),
(8, 'Maximum Sum of Non Adjacent Nodes', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-sum-nodes-binary-tree-no-two-adjacent/'),
(8, 'Largest BST in a Binary Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/largest-bst-binary-tree-set-2/'),
(8, 'Extreme Nodes in Alternate Order', 'Medium', 'https://www.geeksforgeeks.org/dsa/print-extreme-nodes-of-each-level-of-binary-tree-in-alternate-order/'),
(8, 'Connect Nodes at Same Level', 'Medium', 'https://www.geeksforgeeks.org/dsa/connect-nodes-at-same-level/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(8, 'Sorted Linked List to BST', 'Hard', 'https://www.geeksforgeeks.org/dsa/sorted-linked-list-to-balanced-bst/'),
(8, 'Binary Tree to Doubly Linked List', 'Hard', 'https://www.geeksforgeeks.org/dsa/convert-binary-tree-to-doubly-linked-list/'),
(8, 'Maximum Sum Path Between Two Leaves', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-maximum-path-sum-two-leaves-binary-tree/'),
(8, 'K-Sum Paths', 'Hard', 'https://www.geeksforgeeks.org/dsa/print-k-sum-paths-binary-tree/'),
(8, 'Number of Turns in a Binary Tree', 'Hard', 'https://www.geeksforgeeks.org/dsa/number-of-turns-to-reach-from-one-node-to-another-in-binary-tree/'),
(8, 'Merge Two BSTs', 'Hard', 'https://www.geeksforgeeks.org/dsa/merge-two-balanced-binary-search-trees/'),
(8, 'Fixing Two Nodes of a BST', 'Hard', 'https://www.geeksforgeeks.org/dsa/fix-two-swapped-nodes-of-a-bst/'),
(8, 'Burn Binary Tree', 'Hard', 'https://www.geeksforgeeks.org/dsa/burn-the-binary-tree-starting-from-the-target-node/'),
(8, 'Clone Binary Tree with Random Pointer', 'Hard', 'https://www.geeksforgeeks.org/dsa/clone-binary-tree-random-pointers/')
ON CONFLICT DO NOTHING;

-- Insert problems for Heap / Priority Queue (topic_id = 9)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(9, 'Kth Largest Element in an Array', 'Medium', 'https://leetcode.com/problems/kth-largest-element-in-an-array/'),
(9, 'Find Median from Data Stream', 'Hard', 'https://leetcode.com/problems/find-median-from-data-stream/'),
(9, 'Top K Frequent Elements', 'Medium', 'https://leetcode.com/problems/top-k-frequent-elements/'),
(9, 'Merge K Sorted Lists', 'Hard', 'https://leetcode.com/problems/merge-k-sorted-lists/'),
(9, 'Task Scheduler II', 'Medium', 'https://leetcode.com/problems/task-scheduler-ii/')
ON CONFLICT DO NOTHING;

-- Insert problems for Graphs (topic_id = 10)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(10, 'BFS of Graph', 'Easy', 'https://www.geeksforgeeks.org/problems/bfs-traversal-of-graph/1'),
(10, 'DFS of Graph', 'Easy', 'https://www.geeksforgeeks.org/problems/depth-first-traversal-for-a-graph/1'),
(10, 'Number of Islands', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-the-number-of-islands-using-dfs/'),
(10, 'Detect Cycle in an Undirected Graph', 'Easy', 'https://www.geeksforgeeks.org/dsa/detect-cycle-undirected-graph/'),
(10, 'Bipartite Graph', 'Easy', 'https://www.geeksforgeeks.org/dsa/bipartite-graph/'),
(10, 'Snake and Ladder Problem', 'Easy', 'https://www.geeksforgeeks.org/dsa/snake-ladder-problem-2/'),
(10, 'Flood Fill Algorithm', 'Easy', 'https://www.geeksforgeeks.org/dsa/flood-fill-algorithm/'),
(10, 'Replace O''s with X''s', 'Easy', 'https://www.geeksforgeeks.org/dsa/given-matrix-o-x-replace-o-x-surrounded-x/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(10, 'Cycle in a Directed Graph', 'Medium', 'https://www.geeksforgeeks.org/problems/detect-cycle-in-a-directed-graph/1'),
(10, 'Union-Find (Disjoint Set Union)', 'Medium', 'https://www.geeksforgeeks.org/dsa/union-find/'),
(10, 'Kruskals Minimum Spanning Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/kruskals-minimum-spanning-tree-algorithm/'),
(10, 'Prims Minimum Spanning Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/prims-minimum-spanning-tree-mst-greedy-algo-5/'),
(10, 'Dijkstras Shortest Path', 'Medium', 'https://www.geeksforgeeks.org/dsa/dijkstras-shortest-path-algorithm-greedy-algo-7/'),
(10, 'Bellman Ford Algorithm', 'Medium', 'https://www.geeksforgeeks.org/dsa/bellman-ford-algorithm-dp-23/'),
(10, 'Floydss Algorithm (Floyd-Warshall)', 'Medium', 'https://www.geeksforgeeks.org/dsa/floyd-warshall-algorithm-dp-16/'),
(10, 'Topological Sort', 'Medium', 'https://www.geeksforgeeks.org/problems/topological-sort/1'),
(10, 'Prerequisite Tasks', 'Medium', 'https://www.geeksforgeeks.org/problems/prerequisite-tasks/1'),
(10, 'Course Schedule', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-whether-it-is-possible-to-finish-all-tasks-or-not-from-given-dependencies/'),
(10, 'Circle of Strings', 'Medium', 'https://www.geeksforgeeks.org/problems/circle-of-strings/1'),
(10, 'Maximum Bipartite Matching', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-bipartite-matching/'),
(10, 'Detect Cycle in a Directed Graph', 'Medium', 'https://www.geeksforgeeks.org/dsa/detect-cycle-in-a-graph/'),
(10, 'Find Whether Path Exists', 'Medium', 'https://www.geeksforgeeks.org/problems/find-whether-path-exist/1'),
(10, 'Possible Paths Between 2 Vertices', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-possible-paths-two-vertices/'),
(10, 'Find the Number of X Total Shapes', 'Medium', 'https://www.geeksforgeeks.org/problems/x-total-shapes/1'),
(10, 'Distance of Nearest Cell Having 1', 'Medium', 'https://www.geeksforgeeks.org/problems/distance-of-nearest-cell-having-1/1'),
(10, 'Mother Vertex', 'Medium', 'https://www.geeksforgeeks.org/problems/mother-vertex/1'),
(10, 'Unit Area of Largest Region of 1s', 'Medium', 'https://www.geeksforgeeks.org/problems/length-of-largest-region-of-1s/1'),
(10, 'Rotten Oranges', 'Medium', 'https://www.geeksforgeeks.org/problems/rotten-oranges2536/1'),
(10, 'Minimum Swaps to Sort', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-swaps-required-sort-array/'),
(10, 'Steps by Knight', 'Medium', 'https://www.geeksforgeeks.org/problems/steps-by-knight5927/1'),
(10, 'Dijkstra Algorithm', 'Medium', 'https://www.geeksforgeeks.org/problems/implementing-dijkstra-set-1-adjacency-matrix/1'),
(10, 'Word Search', 'Medium', 'https://www.geeksforgeeks.org/problems/word-search/1'),
(10, 'Word Boggle', 'Medium', 'https://www.geeksforgeeks.org/problems/word-boggle/1')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(10, 'Minimum Weight Cycle', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-minimum-weight-cycle-undirected-graph/'),
(10, 'Bridge Edge in Graph', 'Hard', 'https://www.geeksforgeeks.org/dsa/bridge-in-a-graph/'),
(10, 'Strongly Connected Components (Kosaraju''s Algorithm)', 'Hard', 'https://www.geeksforgeeks.org/dsa/kosarajus-algorithm-in-c/'),
(10, 'Minimum Cost Path', 'Hard', 'https://www.geeksforgeeks.org/problems/minimum-cost-path3833/1'),
(10, 'Strongly Connected Components (Tarjan''s Algorithm)', 'Hard', 'https://www.geeksforgeeks.org/dsa/tarjan-algorithm-find-strongly-connected-components/'),
(10, 'Articulation Point', 'Hard', 'https://www.geeksforgeeks.org/dsa/articulation-points-or-cut-vertices-in-a-graph/'),
(10, 'Alien Dictionary', 'Hard', 'https://www.geeksforgeeks.org/problems/alien-dictionary/1'),
(10, 'Word Ladder I', 'Hard', 'https://www.geeksforgeeks.org/problems/word-ladder/1'),
(10, 'Word Ladder II', 'Hard', 'https://www.geeksforgeeks.org/problems/word-ladder-ii/1'),
(10, 'Number of Closed Islands', 'Hard', 'https://www.geeksforgeeks.org/dsa/number-of-closed-islands/'),
(10, 'Shortest Path by Removing K Walls', 'Hard', 'https://www.geeksforgeeks.org/dsa/shortest-path-by-removing-k-walls/'),
(10, 'Min Length String with All Substrings of Size N', 'Hard', 'https://www.geeksforgeeks.org/dsa/minimum-length-string-having-all-substrings-of-length-n/'),
(10, 'Hamiltonian Path', 'Hard', 'https://www.geeksforgeeks.org/dsa/hamiltonian-path/')
ON CONFLICT DO NOTHING;

-- Insert problems for Dynamic Programming (topic_id = 11)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(11, 'Nth Catalan Number', 'Easy', 'https://www.geeksforgeeks.org/dsa/program-nth-catalan-number/'),
(11, 'Minimum Operations', 'Easy', 'https://www.geeksforgeeks.org/problems/minimum-operations/1'),
(11, 'Minimum Steps to Delete Using Palindrome Subsequences', 'Easy', 'https://www.geeksforgeeks.org/dsa/minimum-number-deletions-make-string-palindrome/'),
(11, 'Minimum Number of Coins', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-minimum-number-of-coins-that-make-a-change/'),
(11, 'Maximum Product Cutting', 'Easy', 'https://www.geeksforgeeks.org/dsa/maximum-product-cutting-dp-36/'),
(11, 'Ways to Cover a Distance', 'Easy', 'https://www.geeksforgeeks.org/dsa/count-number-of-ways-to-cover-a-distance/'),
(11, 'Minimum Deletions and Insertions to Transform', 'Easy', 'https://www.geeksforgeeks.org/dsa/minimum-number-deletions-insertions-transform-one-string-another/'),
(11, 'Minimum Sum Subsequence Such That One of Every Four Consecutive is Picked', 'Easy', 'https://www.geeksforgeeks.org/dsa/minimum-sum-subsequence-such-that-one-of-every-four-consecutive-elements-is-picked/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(11, 'Subset Sum Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/subset-sum-problem-dp-25/'),
(11, 'Longest Common Subsequence', 'Medium', 'https://www.geeksforgeeks.org/dsa/longest-common-subsequence-dp-4/'),
(11, 'Longest Increasing Subsequence', 'Medium', 'https://www.geeksforgeeks.org/dsa/longest-increasing-subsequence-dp-3/'),
(11, 'Edit Distance', 'Medium', 'https://www.geeksforgeeks.org/dsa/edit-distance-dp-5/'),
(11, 'Longest Path in Matrix', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-longest-path-in-a-matrix-with-given-constraints/'),
(11, 'Optimal Strategy for a Game', 'Medium', 'https://www.geeksforgeeks.org/dsa/optimal-strategy-for-a-game-dp-31/'),
(11, '0-1 Knapsack Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/0-1-knapsack-problem-dp-10/'),
(11, 'Shortest Common Supersequence', 'Medium', 'https://www.geeksforgeeks.org/dsa/shortest-common-supersequence/'),
(11, 'Partition Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/partition-problem-dp-18/'),
(11, 'Rod Cutting', 'Medium', 'https://www.geeksforgeeks.org/dsa/cutting-a-rod-dp-13/'),
(11, 'Coin Change Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/coin-change-dp-7/'),
(11, 'Word Break Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/word-break-problem-dp-32/'),
(11, 'Dice Throw Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/dice-throw-dp-30/'),
(11, 'Box Stacking', 'Medium', 'https://www.geeksforgeeks.org/dsa/box-stacking-problem-dp-22/'),
(11, 'Egg Dropping Puzzle', 'Medium', 'https://www.geeksforgeeks.org/dsa/egg-dropping-puzzle-dp-11/'),
(11, 'Max Length Chain', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-length-chain-of-pairs-dp-20/'),
(11, 'Longest Common Substring', 'Medium', 'https://www.geeksforgeeks.org/dsa/longest-common-substring-dp-29/'),
(11, 'Interleaved Strings', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-if-a-string-is-interleaved-of-two-other-strings-dp-33/'),
(11, 'Maximum Sum Increasing Subsequence', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-sum-increasing-subsequence-dp-14/'),
(11, 'Minimum Number of Jumps', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-of-jumps-to-reach-end-of-a-given-array/'),
(11, 'Count Subsequences of Type a^i b^j c^k', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-subsequences-of-type-ai-bj-ck/'),
(11, 'Get Minimum Squares', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-of-squares-whose-sum-equals-to-given-number-n/'),
(11, 'Nth Fibonacci Number', 'Medium', 'https://www.geeksforgeeks.org/dsa/program-for-nth-fibonacci-number/'),
(11, 'Longest Palindromic Substring', 'Medium', 'https://www.geeksforgeeks.org/dsa/longest-palindromic-substring/'),
(11, 'Total Decoding Messages', 'Medium', 'https://www.geeksforgeeks.org/problems/total-decoding-messages/1'),
(11, 'Unique BSTs', 'Medium', 'https://www.geeksforgeeks.org/dsa/total-number-of-possible-binary-search-trees-using-catalan-number/'),
(11, 'Player with Max Score', 'Medium', 'https://www.geeksforgeeks.org/dsa/maximum-score-from-performing-multiplication-operations/'),
(11, 'Form a Palindrome', 'Medium', 'https://www.geeksforgeeks.org/problems/form-a-palindrome1455/1'),
(11, 'Word Wrap Problem', 'Medium', 'https://www.geeksforgeeks.org/dsa/word-wrap-problem-dp-19/'),
(11, 'Count Palindromic Subsequences', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-palindromic-subsequence-given-string/'),
(11, 'Minimum Time to Finish Tasks Without Skipping Two Consecutive', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-time-to-finish-tasks-without-skipping-two-consecutive/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(11, 'Minimum Partition', 'Hard', 'https://www.geeksforgeeks.org/dsa/partition-a-set-into-two-subsets-such-that-the-difference-of-subset-sums-is-minimum/'),
(11, 'Boolean Parenthesization Problem', 'Hard', 'https://www.geeksforgeeks.org/dsa/boolean-parenthesization-problem-dp-37/'),
(11, 'Matrix Chain Multiplication', 'Hard', 'https://www.geeksforgeeks.org/dsa/matrix-chain-multiplication-dp-8/'),
(11, 'Longest Zig-Zag Subsequence', 'Hard', 'https://www.geeksforgeeks.org/dsa/longest-zig-zag-subsequence/'),
(11, 'Maximum Profit', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-profit-by-buying-and-selling-a-share-at-most-k-times/'),
(11, 'Maximum Path Sum in Matrix', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-path-sum-matrix/'),
(11, 'Painters Partition Problem', 'Hard', 'https://www.geeksforgeeks.org/dsa/the-painters-partition-problem/'),
(11, 'Palindrome Partitioning', 'Hard', 'https://www.geeksforgeeks.org/dsa/palindrome-partitioning-dp-17/'),
(11, 'Array Partition', 'Hard', 'https://www.geeksforgeeks.org/dsa/partition-array-to-minimize-sum-difference/'),
(11, 'Maximum Difference of Zeros and Ones in Binary String', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-difference-zeros-ones-binary-string/'),
(11, 'Count Digit Groupings of a Number', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-of-ways-to-partition-a-number-into-groups-of-digits/')
ON CONFLICT DO NOTHING;

-- Insert problems for Greedy (topic_id = 12)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(12, 'Assign Cookies', 'Easy', 'https://leetcode.com/problems/assign-cookies/'),
(12, 'Non-overlapping Intervals', 'Medium', 'https://leetcode.com/problems/non-overlapping-intervals/'),
(12, 'Jump Game', 'Medium', 'https://leetcode.com/problems/jump-game/'),
(12, 'Gas Station', 'Medium', 'https://leetcode.com/problems/gas-station/'),
(12, 'Task Scheduler', 'Medium', 'https://leetcode.com/problems/task-scheduler/'),
(12, 'Minimum Number of Arrows', 'Medium', 'https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/')
ON CONFLICT DO NOTHING;

-- Insert problems for Backtracking (topic_id = 13)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(13, 'Subsets', 'Medium', 'https://leetcode.com/problems/subsets/'),
(13, 'Combination Sum', 'Medium', 'https://leetcode.com/problems/combination-sum/'),
(13, 'Permutations', 'Medium', 'https://leetcode.com/problems/permutations/'),
(13, 'Word Search', 'Medium', 'https://leetcode.com/problems/word-search/'),
(13, 'N-Queens', 'Hard', 'https://leetcode.com/problems/n-queens/'),
(13, 'Sudoku Solver', 'Hard', 'https://leetcode.com/problems/sudoku-solver/')
ON CONFLICT DO NOTHING;

-- Insert problems for Trie (topic_id = 14)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(14, 'Implement Trie', 'Medium', 'https://leetcode.com/problems/implement-trie-prefix-tree/'),
(14, 'Word Search II', 'Hard', 'https://leetcode.com/problems/word-search-ii/'),
(14, 'Replace Words', 'Medium', 'https://leetcode.com/problems/replace-words/'),
(14, 'Maximum XOR of Two Numbers', 'Medium', 'https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/'),
(14, 'Design Add and Search Words', 'Medium', 'https://leetcode.com/problems/design-add-and-search-words-data-structure/')
ON CONFLICT DO NOTHING;

-- Insert problems for Bit Manipulation (topic_id = 15)
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(15, 'Number of 1 Bits', 'Easy', 'https://leetcode.com/problems/number-of-1-bits/'),
(15, 'Reverse Bits', 'Easy', 'https://leetcode.com/problems/reverse-bits/'),
(15, 'Sum of Two Integers', 'Medium', 'https://leetcode.com/problems/sum-of-two-integers/'),
(15, 'Missing Number', 'Easy', 'https://leetcode.com/problems/missing-number/'),
(15, 'Single Number', 'Easy', 'https://leetcode.com/problems/single-number/'),
(15, 'Single Number II', 'Medium', 'https://leetcode.com/problems/single-number-ii/'),
(15, 'Maximum XOR Subarray', 'Medium', 'https://leetcode.com/problems/maximum-subarray-xor/')
ON CONFLICT DO NOTHING;

-- Insert problems for Strings (topic_id = 16)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(16, 'Palindrome Check', 'Easy', 'https://www.geeksforgeeks.org/dsa/check-if-a-string-is-palindrome/'),
(16, 'Reverse a String', 'Easy', 'https://www.geeksforgeeks.org/dsa/reverse-a-string/'),
(16, 'Reverse Words', 'Easy', 'https://www.geeksforgeeks.org/dsa/reverse-words-in-a-given-string/'),
(16, 'Check for Rotation', 'Easy', 'https://www.geeksforgeeks.org/dsa/check-if-a-string-is-rotation-of-another-string/'),
(16, 'First Non Repeating Character', 'Easy', 'https://www.geeksforgeeks.org/dsa/first-non-repeating-character-in-a-stream/'),
(16, 'Roman to Integer', 'Easy', 'https://www.geeksforgeeks.org/dsa/converting-roman-numerals-to-decimal-lying-between-1-to-3999/'),
(16, 'Implement Atoi', 'Easy', 'https://www.geeksforgeeks.org/dsa/write-your-own-atoi/'),
(16, 'Encrypt the String – II', 'Easy', 'https://www.geeksforgeeks.org/problems/encrypt-the-string-2/1'),
(16, 'Equal Point in Brackets', 'Easy', 'https://www.geeksforgeeks.org/problems/equal-point-in-brackets/1'),
(16, 'Anagram Checking', 'Easy', 'https://www.geeksforgeeks.org/dsa/check-whether-two-strings-are-anagram-of-each-other/'),
(16, 'Pangram Checking', 'Easy', 'https://www.geeksforgeeks.org/dsa/check-if-the-given-string-is-pangram/'),
(16, 'Validate IP Address', 'Easy', 'https://www.geeksforgeeks.org/problems/validate-an-ip-address-1587115621/1'),
(16, 'Add Binary Strings', 'Easy', 'https://www.geeksforgeeks.org/dsa/add-two-binary-strings/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(16, 'Integer to Words', 'Medium', 'https://www.geeksforgeeks.org/dsa/convert-number-to-words/'),
(16, 'Fizz Buzz', 'Medium', 'https://www.geeksforgeeks.org/dsa/fizz-buzz-implementation/'),
(16, 'Palindromic Sentence Check', 'Medium', 'https://www.geeksforgeeks.org/dsa/sentence-palindrome-palindrome-removing-spaces-dots-etc/'),
(16, 'Isomorphic Strings', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-if-two-given-strings-are-isomorphic/'),
(16, 'Check for k-anagram', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-if-two-strings-are-k-anagrams-or-not/'),
(16, 'Equal 0,1, and 2', 'Medium', 'https://www.geeksforgeeks.org/dsa/substring-equal-number-0-1-2/'),
(16, 'Find and Replace in String', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-and-replace-in-string/'),
(16, 'Look and Say Pattern', 'Medium', 'https://www.geeksforgeeks.org/dsa/look-and-say-sequence/'),
(16, 'Minimum repetitions to make Substring', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-of-times-a-has-to-be-repeated-such-that-b-is-a-substring-of-it/'),
(16, 'Excel Sheet – I', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-excel-column-name-given-number/'),
(16, 'Find the N-th character', 'Medium', 'https://www.geeksforgeeks.org/problems/find-the-n-th-character/1'),
(16, 'Next Palindromic Number with same digits', 'Medium', 'https://www.geeksforgeeks.org/dsa/next-palindrome-using-same-digits/'),
(16, 'Length of longest prefix suffix', 'Medium', 'https://www.geeksforgeeks.org/dsa/longest-prefix-also-suffix/'),
(16, 'Longest K unique characters substring', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-longest-substring-with-k-unique-characters-in-a-given-string/'),
(16, 'Smallest window containing all characters', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-smallest-window-in-a-string-containing-all-characters-of-another-string/'),
(16, 'Longest substring without repeating characters', 'Medium', 'https://www.geeksforgeeks.org/dsa/length-of-the-longest-substring-without-repeating-characters/'),
(16, 'Substrings of length k with k-1 distinct elements', 'Medium', 'https://www.geeksforgeeks.org/dsa/count-substrings-length-k-k-1-distinct-elements/'),
(16, 'Count number of substrings', 'Medium', 'https://www.geeksforgeeks.org/dsa/number-substrings-string/'),
(16, 'Interleaved Strings', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-if-a-string-is-interleaved-of-two-other-strings-dp-33/'),
(16, 'Print Anagrams Together', 'Medium', 'https://www.geeksforgeeks.org/dsa/given-a-sequence-of-words-print-all-anagrams-together/'),
(16, 'Rank the Permutation', 'Medium', 'https://www.geeksforgeeks.org/dsa/lexicographic-rank-of-a-string/'),
(16, 'A Special Keyboard', 'Medium', 'https://www.geeksforgeeks.org/dsa/how-to-print-maximum-number-of-a-using-given-four-keys/'),
(16, 'Sum of two large numbers', 'Medium', 'https://www.geeksforgeeks.org/dsa/sum-two-large-numbers/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(16, 'Repeatedly Remove Duplicates', 'Hard', 'https://www.geeksforgeeks.org/dsa/remove-all-adjacent-duplicates-in-string/'),
(16, 'Multiply Two Strings', 'Hard', 'https://www.geeksforgeeks.org/dsa/multiply-large-numbers-represented-as-strings/'),
(16, 'Search Pattern (KMP Algorithm)', 'Hard', 'https://www.geeksforgeeks.org/dsa/kmp-algorithm-for-pattern-searching/'),
(16, 'Search Pattern (Rabin-Karp Algorithm)', 'Hard', 'https://www.geeksforgeeks.org/dsa/rabin-karp-algorithm-for-pattern-searching/'),
(16, 'Shortest Common Supersequence', 'Hard', 'https://www.geeksforgeeks.org/dsa/shortest-common-supersequence/'),
(16, 'Longest substring to form a Palindrome', 'Hard', 'https://www.geeksforgeeks.org/dsa/longest-palindromic-substring/'),
(16, 'Longest Valid Parenthesis', 'Hard', 'https://www.geeksforgeeks.org/dsa/length-of-the-longest-valid-substring/'),
(16, 'Longest Palindromic Subsequence', 'Hard', 'https://www.geeksforgeeks.org/dsa/longest-palindromic-subsequence-dp-12/'),
(16, 'Distinct Palindromic Substrings', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-palindrome-sub-strings-string/'),
(16, 'Palindrome Substring Queries', 'Hard', 'https://www.geeksforgeeks.org/dsa/palindrome-substring-queries/'),
(16, 'Number of Distinct Subsequences', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-distinct-subsequences/'),
(16, 'Minimum Deletions for Palindrome', 'Hard', 'https://www.geeksforgeeks.org/dsa/minimum-number-deletions-make-string-palindrome/'),
(16, 'Minimum Insertions for Palindrome', 'Hard', 'https://www.geeksforgeeks.org/dsa/minimum-insertions-to-form-a-palindrome/'),
(16, 'Max Non-Overlapping Odd Palindrome Sum', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-sum-of-non-overlapping-odd-length-palindromes/')
ON CONFLICT DO NOTHING;

-- Insert problems for Sorting (topic_id = 17)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(17, 'Maximum Perimeter Triangle', 'Easy', 'https://www.geeksforgeeks.org/dsa/maximum-perimeter-triangle-from-array/'),
(17, 'Maximize Sum After K Negations', 'Easy', 'https://www.geeksforgeeks.org/dsa/maximize-array-sum-after-k-negations/'),
(17, 'Sum of Minimum Absolute Difference', 'Easy', 'https://www.geeksforgeeks.org/dsa/sum-minimum-absolute-difference-array/'),
(17, 'Sort in Waveform', 'Easy', 'https://www.geeksforgeeks.org/dsa/sort-array-wave-form-2/'),
(17, 'Chocolate Distribution Problem', 'Easy', 'https://www.geeksforgeeks.org/dsa/chocolate-distribution-problem/'),
(17, 'Pair with the Given Difference', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-a-pair-with-the-given-difference/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(17, 'Triplet Sum (3Sum)', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-a-triplet-that-sum-to-a-given-value/'),
(17, 'H Index', 'Medium', 'https://www.geeksforgeeks.org/dsa/what-is-h-index/'),
(17, 'Triplet with Closest Sum', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-a-triplet-in-an-array-whose-sum-is-closest-to-a-given-number/'),
(17, 'K Most Occurring Elements', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-k-numbers-occurrences-given-array/'),
(17, 'Merge Overlapping Intervals', 'Medium', 'https://www.geeksforgeeks.org/dsa/merging-intervals/'),
(17, 'Form the Largest Number', 'Medium', 'https://www.geeksforgeeks.org/dsa/given-an-array-of-numbers-arrange-the-numbers-to-form-the-biggest-number/'),
(17, 'Sort Array of 0s, 1s and 2s', 'Medium', 'https://www.geeksforgeeks.org/dsa/sort-an-array-of-0s-1s-and-2s/'),
(17, 'Kth Smallest / Largest', 'Medium', 'https://www.geeksforgeeks.org/dsa/kth-smallestlargest-element-unsorted-array/'),
(17, 'Inversion Count', 'Medium', 'https://www.geeksforgeeks.org/dsa/counting-inversions/'),
(17, 'Minimum Platforms Required', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-number-platforms-required-railwaybus-station/'),
(17, 'Maximum Meetings in One Room', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-maximum-meetings-in-one-room/'),
(17, 'Case-Specific Sorting of Strings', 'Medium', 'https://www.geeksforgeeks.org/problems/case-specific-sorting-of-strings4845/1'),
(17, 'Sort by Frequency', 'Medium', 'https://www.geeksforgeeks.org/dsa/sort-elements-by-frequency/'),
(17, 'Minimum Operations for Distinct Elements', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-operations-to-make-array-elements-distinct/'),
(17, 'Maximum Intersection Lines', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-point-where-maximum-intervals-overlap/'),
(17, 'Maximum Intervals Overlapping', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-point-where-maximum-intervals-overlap/'),
(17, 'Minimum Product Sum of Consecutive Pairs', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-product-sum-of-consecutive-pairs/'),
(17, 'Position of an Element After Stable Sort', 'Medium', 'https://www.geeksforgeeks.org/dsa/position-of-an-element-after-stable-sort/'),
(17, 'Merge Sort for Doubly Linked List', 'Medium', 'https://www.geeksforgeeks.org/dsa/merge-sort-for-doubly-linked-list/'),
(17, 'Radix Sort', 'Medium', 'https://www.geeksforgeeks.org/dsa/radix-sort/'),
(17, 'Segregate 0s and 1s in an Array', 'Medium', 'https://www.geeksforgeeks.org/dsa/segregate-0s-and-1s-in-an-array/'),
(17, 'Sort Even and Odd Numbers', 'Medium', 'https://www.geeksforgeeks.org/dsa/sort-even-and-odd-numbers/'),
(17, 'Minimum Product of K Integers', 'Medium', 'https://www.geeksforgeeks.org/dsa/minimum-product-of-k-integers-from-an-array-of-positive-integers/'),
(17, 'Array Permutation with Pair Sums ≥ K', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-if-permutation-of-two-arrays-satisfies-the-condition/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(17, 'Merge Sorted Arrays with O(1) Extra Space', 'Hard', 'https://www.geeksforgeeks.org/dsa/merge-two-sorted-arrays-o1-extra-space/'),
(17, 'Count Smaller Elements on Right Side', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-smaller-elements-on-right-side/'),
(17, 'Smallest Non-Representable Subset Sum', 'Hard', 'https://www.geeksforgeeks.org/dsa/find-smallest-value-represented-sum-subset-given-array/'),
(17, 'Count Subarrays with Median at Least X', 'Hard', 'https://www.geeksforgeeks.org/dsa/count-subarrays-with-median-at-least-x/'),
(17, 'Merge K Sorted Linked Lists', 'Hard', 'https://www.geeksforgeeks.org/dsa/merge-k-sorted-linked-lists/'),
(17, 'Smallest Difference Triplet from Three Arrays', 'Hard', 'https://www.geeksforgeeks.org/dsa/minimize-maxai-bj-ck/'),
(17, 'Sort n Numbers from 0 to n² – 1 in Linear Time', 'Hard', 'https://www.geeksforgeeks.org/dsa/sort-array-0-n2-1-linear-time/'),
(17, 'Sort a 2D Vector Diagonally', 'Hard', 'https://www.geeksforgeeks.org/dsa/sort-matrix-diagonally/'),
(17, 'Print Binary Tree Levels in Sorted Order', 'Hard', 'https://www.geeksforgeeks.org/dsa/print-binary-tree-levels-in-sorted-order/')
ON CONFLICT DO NOTHING;

-- Insert problems for BST (topic_id = 18)
-- Easy Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(18, 'Check if a Binary Tree is BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/a-program-to-check-if-a-binary-tree-is-bst-or-not/'),
(18, 'Count BST nodes in a given range', 'Easy', 'https://www.geeksforgeeks.org/dsa/count-bst-nodes-that-are-in-a-given-range/'),
(18, 'Searching in Binary Search Tree', 'Easy', 'https://www.geeksforgeeks.org/dsa/search-a-node-in-binary-tree/'),
(18, 'Lowest Common Ancestor in BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/lowest-common-ancestor-in-a-binary-search-tree/'),
(18, 'Kth Largest Element in BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/kth-largest-element-in-bst/'),
(18, 'Minimum value node in BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-the-node-with-minimum-value-in-a-binary-search-tree/'),
(18, 'Inorder Successor in BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/inorder-successor-in-binary-search-tree/'),
(18, 'Find Median of BST', 'Easy', 'https://www.geeksforgeeks.org/dsa/find-median-bst-time-o1-space/'),
(18, 'Binary Tree to BST Conversion', 'Easy', 'https://www.geeksforgeeks.org/dsa/binary-tree-to-binary-search-tree-conversion/'),
(18, 'Count pairs from two BSTs with given sum', 'Easy', 'https://www.geeksforgeeks.org/dsa/count-pairs-from-two-bsts-whose-sum-is-equal-to-a-given-value-x/')
ON CONFLICT DO NOTHING;

-- Medium Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(18, 'Inorder predecessor and successor in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/inorder-predecessor-successor-given-key-bst/'),
(18, 'Check if Binary Tree is Heap', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-if-a-given-binary-tree-is-heap/'),
(18, 'Closest element in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-closest-element-binary-search-tree/'),
(18, 'Number of Unique BSTs', 'Medium', 'https://www.geeksforgeeks.org/dsa/total-number-of-possible-binary-search-trees-using-catalan-number/'),
(18, 'BST Dead End Detection', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-whether-bst-contains-dead-end-not/'),
(18, 'Common nodes in two BSTs', 'Medium', 'https://www.geeksforgeeks.org/dsa/print-common-nodes-in-two-binary-search-trees/'),
(18, 'Sorted Array to Balanced BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/sorted-array-to-balanced-bst/'),
(18, 'Postorder from Preorder of BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-postorder-traversal-of-bst-from-preorder-traversal/'),
(18, 'Balance a Binary Search Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/convert-normal-bst-balanced-bst/'),
(18, 'Pair with given sum in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-a-pair-with-given-sum-in-bst/'),
(18, 'Check if array can represent BST preorder', 'Medium', 'https://www.geeksforgeeks.org/dsa/check-if-a-given-array-can-represent-preorder-traversal-of-binary-search-tree/'),
(18, 'Add all greater values to every node in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/add-greater-values-every-node-given-bst/'),
(18, 'Replace every element with least greater element on right', 'Medium', 'https://www.geeksforgeeks.org/dsa/replace-every-element-with-the-least-greater-element-on-its-right/'),
(18, 'Maximum sum leaf-to-root path', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-the-maximum-sum-path-from-root-to-leaf-in-a-binary-tree/'),
(18, 'Leaf nodes from preorder of BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/print-leaf-nodes-preorder-binary-search-tree/'),
(18, 'Convert BST to Max Heap', 'Medium', 'https://www.geeksforgeeks.org/dsa/convert-bst-to-max-heap/'),
(18, 'Transform BST to greater sum tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/transform-bst-to-greater-sum-tree/'),
(18, 'Remove BST keys outside given range', 'Medium', 'https://www.geeksforgeeks.org/dsa/remove-bst-keys-outside-the-given-range/'),
(18, 'Largest BST in Binary Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/largest-bst-binary-tree-set-2/'),
(18, 'Pair with minimum absolute difference in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-pair-given-sum-bst/'),
(18, 'Top view of Binary Tree', 'Medium', 'https://www.geeksforgeeks.org/dsa/print-nodes-top-view-binary-tree/'),
(18, 'Deletion in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/deletion-in-binary-search-tree/'),
(18, 'Kth smallest element in BST', 'Medium', 'https://www.geeksforgeeks.org/dsa/find-k-th-smallest-element-in-bst-order-statistics-in-bst/'),
(18, 'Correct swapped BST nodes', 'Medium', 'https://www.geeksforgeeks.org/dsa/fix-two-swapped-nodes-of-bst/')
ON CONFLICT DO NOTHING;

-- Hard Problems
INSERT INTO public.problems (topic_id, title, difficulty, link) VALUES
(18, 'Merge two BSTs with limited extra space', 'Hard', 'https://www.geeksforgeeks.org/dsa/merge-two-bsts-with-limited-extra-space/'),
(18, 'Optimal Binary Search Tree', 'Hard', 'https://www.geeksforgeeks.org/dsa/optimal-binary-search-tree-dp-24/'),
(18, 'Insertion in AVL Tree', 'Hard', 'https://www.geeksforgeeks.org/dsa/insertion-in-an-avl-tree/'),
(18, 'Sorted Linked List to Balanced BST', 'Hard', 'https://www.geeksforgeeks.org/dsa/sorted-linked-list-to-balanced-bst/'),
(18, 'Merge Two Balanced BSTs', 'Hard', 'https://www.geeksforgeeks.org/dsa/merge-two-balanced-binary-search-trees/'),
(18, 'Inversion count using self-balancing BST', 'Hard', 'https://www.geeksforgeeks.org/dsa/inversion-count-in-array-using-self-balancing-bst/'),
(18, 'Print BST keys in range O(1) space', 'Hard', 'https://www.geeksforgeeks.org/dsa/print-bst-keys-in-given-range/'),
(18, 'Maximum unique element in every subarray of size K', 'Hard', 'https://www.geeksforgeeks.org/dsa/maximum-unique-element-every-subarray-size-k/'),
(18, 'Floor and Ceil in BST', 'Hard', 'https://www.geeksforgeeks.org/dsa/floor-and-ceil-from-a-bst/')
ON CONFLICT DO NOTHING;
