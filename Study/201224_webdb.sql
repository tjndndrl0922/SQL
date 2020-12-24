create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

alter table book add (pubs varchar2(50));

SELECT
    *
FROM book;

alter table book modify(title varchar2(100));

alter table book rename COLUMN title to subject;

alter table book drop (author);

rename book to article;

drop table article;

