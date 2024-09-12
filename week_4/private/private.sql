create table decode (
    id integer,
    phrase text,
    primary key(id)
);

insert into decode (phrase)
select substr(sentence, 98, 4) from sentences
where id = 14;

insert into decode (phrase)
select substr(sentence, 3, 5) from sentences
where id = 114;

insert into decode (phrase)
select substr(sentence, 72, 9) from sentences
where id = 618;

insert into decode (phrase)
select substr(sentence, 7, 3) from sentences
where id = 630;

insert into decode (phrase)
select substr(sentence, 12, 5) from sentences
where id = 932;

insert into decode (phrase)
select substr(sentence, 50, 7) from sentences
where id = 2230;

insert into decode (phrase)
SELECT substr(sentence, 44, 10) from sentences
WHERE id = 2346;

insert into decode (phrase)
select substr(sentence, 14, 5) from sentences
where id = 3041;

create view message as
select phrase from decode;