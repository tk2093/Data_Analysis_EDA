alter session set current_schema=sharmac;

--Analysis 1
select startyear, genres, count(tconst)
                from title_basics
                where lower(genres) in ('comedy','horror','sci-fi') and titletype='movie' and startyear between '2000' and '2015'
                group by startyear, genres
                order by startyear, genres;


--Analysis 2
select Primarytitle, Startyear, genres, primaryname
               from TITLE_BASICS t join TITLE_crew_dir td on t.TCONST=td.TCONST
                                   join NAME_TITLE_MAPPING nt on t.TCONST=nt.TCONST
                                   join NAME_BASICS nb on nt.NCONST=nb.NCONST
               where td.directors=nt.NCONST and titletype='movie' and lower(Startyear) != '\n'
                                         and lower(genres) like '%comedy%';
                                         

--Analysis 3
select tb.Startyear, count(tb.Tconst)
             from TITLE_BASICS tb join TITLE_PRINCIPALS nt on tb.Tconst=nt.Tconst
             where nt.Nconst = 'nm0000168' and lower(tb.startyear) not like '%\n%' and tb.startyear between '1999' and '2009'
             group by tb.startyear
             order by tb.startyear;
             


select tb.Startyear, count(tb.Tconst)
             from TITLE_BASICS tb join TITLE_PRINCIPALS nt on tb.Tconst=nt.Tconst
             where nt.Nconst = 'nm0000098' and lower(tb.startyear) not like '%\n%' and tb.startyear between '1999' and '2009'
             group by tb.startyear
             order by tb.startyear;
             




