-- CREATE TABLE restaurant(
--     id serial primary key,
--     Name text,
--     Address varchar,
--     Category text
-- );

-- INSERT INTO restaurant (Name, Address, Category)
-- VALUES ('Chipotle', '3424 Piedmont Rd NE', 'Mexican'),
--        ('Blue Moon Pizza', '325 E Paces Ferry Rd NE', 'Pizza'),
--        ('Sarku Japan', '3393 Peachtree Rd NE', 'Japanese'),
--        ('LongHorn Steakhouse', '2430 Piedmont Rd NE', 'BBQ'),
--        ('McDonalds', '2929 Peachtree Rd NE', 'Fast Food');


CREATE TABLE restaurant(
    id serial primary key,
    name text,
    category text,
    distance varchar,
    stars int,
    fav_dish text,
    does_takeout text,
    prev_trip varchar
);

INSERT INTO restaurant (name, category, distance, stars, fav_dish, does_takeout, prev_trip)
VALUES ('Chipotle', 'Mexican','400 ft Away', 4, 'Chicken Bowl', true, '1 Week Ago'),
       ('Blue Moon Pizza', 'Pizza','0.7 Miles Away', 4, 'Pepperoni Pizza', true, '3 Days Ago'),
       ('Sarku Japan','Japanese','1.6 Miles Away', 5, 'Chicken Plate', true, '1 Month Ago'),
       ('LongHorn Steakhouse','BBQ','1.9 Miles Away', 3, 'Idk', true, 'A few years Ago'),
       ('McDonalds','Fast Food''2.3 Miles Away', 2.5, 'Sprite', true, '2 Months Ago');



CREATE TABLE reviewer(
    id serial primary key,
    Name text,
    Email varchar,
    Karma int
);

INSERT INTO reviewer (Name, Email, Karma)
VALUES ('Ajani', 'baraketorchies@gmail.com', '7'),
       ('Jordan', 'truckem74@gmail.com', '5'),
       ('Drake', 'lsg15@gmail.com', '2'),
       ('Geoff', 'oldguy31@gmail.com', '4'),
       ('Akili', 'futuredoctor@gmail.com', '0');

CREATE TABLE review(
    id serial primary key,
    ReviewerID int REFERENCES reviewer(id),
    Stars int,
    Title text,
    Review varchar,
    RestaurantID int REFERENCES restaurant(id)
);

INSERT INTO review (ReviewerID, Stars, Title, Review, RestaurantID)
VALUES (1, 3, 'Chipotle Review', 'Food was just OK. Definitely not as good as any of the Tex Mex spots *cough cough Torchys Tacos*.', 1),
       (2, 4, 'Blue Moon Review', 'Pizza was pretty good, crust too thin though.', 2),
       (3, 5, 'Sarku Review', 'I love rice, rice was good. Honestly its the only thing I ate.', 3),
       (4, 1, 'LongHorn Review', 'Was a chain restaurant so automatic 1 star.', 4),
       (5, 2, 'McDonalds Review', 'McDonalds is nasty.', 5);

-- -------------------------------------------------------------------------------------------------------------------

QUERIES:

SELECT * FROM restaurant;
SELECT name FROM restaurant WHERE id = ${id};
SELECT review FROM review WHERE RestaurantID = ${RestaurantID};
SELECT review FROM restaurant, review WHERE restaurant.id = RestaurantID AND name LIKE ${name};
SELECT reviewer.name, review.review FROM reviewer INNER JOIN review ON reviewerid = reviewer.id WHERE reviewer.name LIKE ${reviewer.name};
SELECT name, review FROM restaurant, review WHERE restaurant.id = RestaurantID AND name LIKE ${name};
SELECT  reviewer.name AS Reviewer, restaurant.name AS Restaurant, review.review AS Review FROM restaurant, reviewer INNER JOIN review ON reviewerid = reviewer.id WHERE restaurantid = restaurant.id;
