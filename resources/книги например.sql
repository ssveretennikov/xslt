CREATE TABLE if not exists books (
    id int PRIMARY KEY,
    name varchar(150)
);

CREATE TABLE if not exists authors (
    id int PRIMARY KEY,
    author varchar(50)
);


CREATE TABLE if not exists authors_of_books (
    book_id int,
    author_id int,
    primary key (book_id, author_id)
);

-- delete from books where name = 'Книга 8=9';


insert into books values(1, 'Книга 1');
insert into books values(2, 'Книга 2');
insert into books values(3, 'Книга 3');
insert into books values(4, 'Книга 4');
insert into books values(5, 'Книга 5');
insert into books values(6, 'Книга 6');
insert into books values(7, 'Книга 7');
insert into books values(8, 'Книга 8');
insert into books values(9, 'Книга 9');

insert into authors values(1, 'Автор 1');
insert into authors values(2, 'Автор 2');
insert into authors values(3, 'Автор 3');
insert into authors values(4, 'Автор 4');
insert into authors values(5, 'Автор 5');
insert into authors values(6, 'Автор 6');

insert into authors_of_books values(1, 1);
insert into authors_of_books values(2, 1);
insert into authors_of_books values(2, 2);
insert into authors_of_books values(3, 2);
insert into authors_of_books values(4, 2);
insert into authors_of_books values(4, 3);
insert into authors_of_books values(5, 1);
insert into authors_of_books values(5, 3);
insert into authors_of_books values(6, 4);
insert into authors_of_books values(7, 5);
insert into authors_of_books values(7, 6);
insert into authors_of_books values(8, 6);
insert into authors_of_books values(9, 4);


select id, name from books
where not id in (
-- книги, в которых авторы являются соавторами в других книгах
    select distinct ab.book_id
    from authors_of_books as ab
             inner join (
-- книги и авторы с количеством авторов больше 1
        select ab.book_id, ab.author_id
        from authors_of_books as ab
                 inner join (
-- книги, в которых авторов больше 1
            select book_id
            from authors_of_books
            group by book_id
            having count(author_id) > 1
        ) as ab2
                            on ab.book_id = ab2.book_id
    ) as ab2
                        on ab.author_id = ab2.author_id and ab.book_id <> ab2.book_id
)