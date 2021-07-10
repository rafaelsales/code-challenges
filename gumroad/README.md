https://www.notion.so/Jobs-f43f816013b2405aa41ddefb663a4a38

# Coding challenge

This challenge consists of three questions and should take roughly 2-4 hours. Please submit your answers before Monday, April 19th by emailing them to sahil@hey.com in a new thread (copy/paste the code for the first question in the email, link to the rest via self-hosted answers).

### **A quick coding question**

Write a method that returns the "pivot" index of a list of integers. We define the pivot index as the index where the sum of the numbers on the left is equal to the sum of the numbers on the right. Given [1, 4, 6, 3, 2], the method should return 2, since the sum of the numbers to the left of index 2 is equal to the sum of numbers to the right of index 2 (1 + 4 = 3 + 2). If no such index exists, it should return -1. If there are multiple pivots, you can return the left-most pivot.

You can write the method in any language. Make sure that the method:

• runs successfully

• handles all edge cases within the framing given above

• is as efficient as you can make it!

A successful answer will fulfill the above criteria.

### **Front-end**

If you're not familiar with the Gumroad overlay, you should be. It's pretty cool: [gumroad.com/widgets](http://gumroad.com/widgets)

It's one line of HTML that includes some JavaScript that makes Gumroad links work inline on the page instead of send the user to gumroad.com/l/...

The way it works is pretty simple: it scans every link to a gumroad product on a page, and if they exist, turns them into inline popups using transparent iFrames. Implement your own version of this, that could also be included as a single JS file. It should be as performant as possible, and replicate as closely as possible Gumroad's functionality (i.e. It should look for links to Gumroad products, it should embed the Gumroad products themselves too and allow purchase, etc).

If you have time, please support:

- Custom subdomains and domains for creators (e.g. sahil.gumroad.com/pencil, sahil.com/pencil)
- Early-load pages upon hover
- Read data-attrs of the anchor tags to show a button or not, make it embed or not, etc.

If you have product feedback as well, we'd love to hear it!

### A **data model design question**

Let's design a small part of Gumroad. Gumroad helps creators sell their products online. As part of that we charge the buyers' credit cards and deposit money to the sellers' accounts. Here's a simplified version of our data model:

Seller <1----*> Product <1----*> Purchase

Each seller can have multiple products, and each product can have multiple purchases. Every purchase should increase the seller's balance. The seller can at any time refund a purchase, which should decrease his/her balance.

We want to pay the sellers every other week for all their sales up to a week before that. For instance we would pay the sellers on Friday the 10th for all their sales up to Friday the 3rd. We want to have the flexibility to change this schedule; we might want to pay the sellers once a week instead of every other week.

How would you design the data model that would support these requirements? Feel free to use a drawing tool to sketch out your design but please explain the rationale behind your design and how it would support:

- purchases and refunds increasing and decreasing the balances

- rolling payouts as described above

Imagine the number of sellers and products will be in the millions, and the number of purchases will be in the hundreds of millions. Describe the indexes that you will add to the different tables/collections.

We use ActiveRecord and MySQL, but your answer doesn't have to.
