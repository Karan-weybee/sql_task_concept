--------normal query -----

1. Write a SQL query to find the name and year of the movies. Return movie title, movie release year.
     
	 SELECT mov_title as title, mov_year as year FROM movie;
	
2. write a SQL query to find when the movie ‘American Beauty’ released. 
   Return movie release year.

   select mov_year from movie where mov_title='American Beauty'

3. write a SQL query to find the movie, which was made in the year 1999. 
   Return movie title.

   select mov_title from movie where mov_year = '1999'

4.  write a SQL query to find those movies, which was made before 1998. 
    Return movie title.

	select mov_title from movie where mov_year < 1998

5. write a SQL query to find the name of all reviewers 
   and movies together in a single list.

   select movie.mov_id,movie.mov_title,reviewer.rev_id,reviewer.rev_name from rating inner join movie on 
   movie.mov_id=rating.mov_id inner join reviewer on
   reviewer.rev_id=rating.rev_id

6. write a SQL query to find all reviewers 
   who have rated 7 or more stars to their rating. 
   Return reviewer name.

   select reviewer.rev_name from rating inner join reviewer on 
   reviewer.rev_id= rating.rev_id 
   where rating.rev_stars>7 and reviewer.rev_name != ''

 7. write a SQL query to find the movies without any rating. 
    Return movie title.

	select movie.mov_title from rating inner join movie on 
	movie.mov_id=rating.mov_id where
	rating.rev_stars IS NULL

8. write a SQL query to find the movies with ID 905 or 907 or 917. 
   Return movie title.

   select mov_title from movie where mov_id in (905,907,917)

9. write a SQL query to find those movie titles, 
   which include the words 'Boogie Nights'. 
   Sort the result-set in ascending order by movie year. 
   Return movie ID, movie title and movie release year.

   select mov_id,mov_title,mov_year from movie where mov_title like '%Boogie Nights%'
   order by mov_year

10. write a SQL query to find those actors whose 
    first name is 'Woody' and the last name is 'Allen'. 
    Return actor ID

	select act_id from actor where act_fname = 'woody' and act_lname = 'allen'

---------- sub query ----------

1. Find the actors who played a role in the movie 'Annie Hall'. 
   Return all the fields of actor table.

SELECT *  FROM actor WHERE 
act_id IN(SELECT act_id  FROM movie_cast WHERE mov_id IN ( SELECT mov_id  FROM movie  WHERE mov_title='Annie Hall'));

2. write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
  Return director first name, last name.

  select dir_fname,dir_lname from director where dir_id in (select dir_id from movie_direction where mov_id in (select mov_id from movie where mov_title='Eyes Wide Shut'))

3. write a SQL query to find those movies, which released in the country besides UK. 
   Return movie title, movie year, movie time, date of release, releasing country.

   select mov_title,mov_year,mov_time,mov_dt_rel as date_of_release , mov_rel_country from movie where mov_rel_country not in ('uk')

4. write a SQL query to find those movies where reviewer is unknown. 
   Return movie title, year, release date, director first name, last name, actor first name, last name.
 
   select a.mov_title,a.mov_year,a.mov_dt_rel,c.dir_fname,c.dir_lname,e.act_fname,e.act_lname from movie a , movie_direction b,director c,movie_cast d,actor e
  where a.mov_id=b.mov_id and b.dir_id=c.dir_id and d.mov_id=a.mov_id and d.act_id=e.act_id and  a.mov_id in (select mov_id from rating where rev_id in (select rev_id from reviewer where rev_name = ''))


5. write a SQL query to find those movies directed by the director whose first name is ‘Woddy’ and last name is ‘Allen’. 
   Return movie title.

   select mov_title from movie a where mov_id in 
   (select mov_id from movie_cast where act_id in (select act_id from actor where act_fname = 'woody' and act_lname = 'allen'))

6.  write a SQL query to find those years, which produced at least one movie and that, received a rating of more than three stars. 
     Sort the result-set in ascending order by movie year. Return movie year.

	 select mov_year from movie where mov_id in (select mov_id from rating where rev_stars > 3) order by mov_year

7.  write a SQL query to find those movies, which have no ratings. Return movie title.

    select mov_title from movie where mov_id in (select mov_id from rating where rev_stars IS NULL)

8. write a SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.

    select * from reviewer where rev_id in (select rev_id from rating where rev_stars IS NULL)
    
9. write a SQL query to find those movies, which reviewed by a reviewer and got a rating. Sort the result-set in  
   ascending order by reviewer name, movie title, review Stars.
   Return reviewer name, movie title, review Stars.

   select b.rev_name,a.mov_title,c.rev_stars from movie a,reviewer b , rating c 
   where a.mov_id=c.mov_id and b.rev_id=c.rev_id and b.rev_name not in (select rev_name from reviewer where rev_name='')
   order by b.rev_name,a.mov_title,rev_stars

10. write a SQL query to find those reviewers who rated more than one movie. 
    Group the result set on reviewer’s name, movie title. 
    Return reviewer’s name, movie title.

ans 1:-

   select b.rev_name,a.mov_title from movie a,reviewer b , rating c 
   where a.mov_id=c.mov_id and c.rev_id =b.rev_id
   and b.rev_id in (select b.rev_id from movie a,reviewer b , rating c 
   where a.mov_id=c.mov_id and c.rev_id =b.rev_id group by b.rev_id having count(b.rev_id) > 1)

ans 2 :-
   select  distinct movie.mov_title , reviewer.rev_name
from reviewer, movie, rating, rating r
where rating.mov_id=movie.mov_id 
  and reviewer.rev_id=rating.rev_ID 
    and rating.rev_id = r.rev_id 
   and movie.mov_title in (
    select  mov_title 
   from reviewer, movie, rating, rating r
   where rating.mov_id=movie.mov_id 
   and reviewer.rev_id=rating.rev_ID 
   and rating.rev_id = r.rev_id 
   group by rev_name,mov_title having count(*) > 1
)


11.  write a SQL query to find those movies, which have received highest number of stars. 
     Group the result set on movie title and sorts the result-set in ascending order by movie title. 
     Return movie title and maximum number of review stars. 

	 select a.mov_title,b.num_o_ratings,b.rev_stars from movie a , rating b 
	 where a.mov_id=b.mov_id and b.rev_stars in (select max(rev_stars) from rating )
	 order by a.mov_title


12.  write a SQL query to find all reviewers who rated the movie 'American Beauty'. 
     Return reviewer name.

	 select rev_name from reviewer 
	 where rev_id in (select rev_id from rating where mov_id in (select mov_id from movie where mov_title='American Beauty'))

13. write a SQL query to find the movies, which have reviewed by any reviewer body except by 'Paul Monks'. 
    Return movie title. 

	select * from movie where mov_id in (select mov_id from rating where rev_id in (select rev_id from reviewer where rev_name != 'Paul Monks'))

14. write a SQL query to find the lowest rated movies. 
    Return reviewer name, movie title, and number of stars for those movies. 

	 select c.rev_name,a.mov_title,b.rev_stars from movie a , rating b ,reviewer c 
	 where a.mov_id=b.mov_id and c.rev_id=b.rev_id and b.rev_stars in (select min(rev_stars) from rating )

15.  write a SQL query to find the movies directed by 'James Cameron'. Return movie title. 

     select mov_title from movie 
	 where mov_id in (select mov_id from movie_direction where dir_id in (select dir_id from director where dir_fname='james' and dir_lname='cameron'))

16. Write a query in SQL to find the name of those movies where one or more actors acted in two or more movies.

    select * from movie a,movie_cast b,actor c
	where a.mov_id=b.mov_id and b.act_id=c.act_id and b.act_id in 
	(
	  select b.act_id from movie_cast b group by b.act_id having count(b.act_id)>1
	)

---------- joins -----------
1. write a SQL query to find the name of all reviewers who have rated their ratings with a NULL value. Return reviewer name.

	select b.rev_name from rating a
	inner join reviewer b on a.rev_id=b.rev_id
	where a.rev_stars IS NULL
   
2. write a SQL query to find the actors who were cast in the movie 'Annie Hall'. 
   Return actor first name, last name and role. 

   SELECT a.act_fname,a.act_lname,b.role  FROM actor a inner join movie_cast b on b.act_id=a.act_id inner join movie c on c.mov_id=b.mov_id
   where c.mov_title='Annie Hall'

3.  write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
    Return director first name, last name and movie title.

	select c.dir_fname,c.dir_lname,a.mov_title from movie a inner join movie_direction b on a.mov_id=b.mov_id
	inner join director c on b.dir_id=c.dir_id
	where a.mov_title='Eyes Wide Shut'

4. write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
   
   select e.dir_fname,e.dir_lname,a.mov_title from movie a 
   inner join movie_cast b on a.mov_id=b.mov_id 
   inner join movie_direction d on a.mov_id=d.mov_id
   inner join director e on e.dir_id=d.dir_id
   where b.role='Sean Maguire'

5. write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). 
   Return actor first name, last name, movie title and release year.

   select c.act_fname,c.act_lname,a.mov_title from movie a
    inner join movie_cast b on a.mov_id=b.mov_id 
	inner join actor c on b.act_id=c.act_id
	where a.mov_year not between 1990 and 2000

6. write a SQL query to find the directors with number of genres movies. 
   Group the result set on director first name, last name and generic title. 
   Sort the result-set in ascending order by director first name and last name. 
   Return director first name, last name and number of genres movies.

   select c.gen_id,e.dir_fname,e.dir_lname,count(c.gen_id) as Number_of_genres_movie from movie a 
   inner join movie_direction d on a.mov_id=d.mov_id
   inner join director e on d.dir_id=e.dir_id
   inner join movie_genres b on a.mov_id=b.mov_id
   inner join genres c on b.gen_id=c.gen_id
   group by c.gen_id, e.dir_fname,e.dir_lname

	
7. write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

   select a.mov_title,a.mov_year,c.gen_title from movie a
   inner join movie_genres b on a.mov_id=b.mov_id
   inner join genres c on b.gen_id=c.gen_id

8. write a SQL query to find all the movies with year, genres, and name of the director.
   
   select a.mov_year,c.gen_title,e.dir_fname,e.dir_lname from movie a 
   inner join movie_direction d on a.mov_id=d.mov_id
   inner join director e on d.dir_id=e.dir_id
   inner join movie_genres b on a.mov_id=b.mov_id
   inner join genres c on b.gen_id=c.gen_id

9. write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending 
   order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director.

   select a.mov_title,a.mov_year,a.mov_dt_rel,a.mov_time,e.dir_fname,e.dir_lname from movie a 
   inner join movie_direction d on a.mov_id=d.mov_id
   inner join director e on d.dir_id=e.dir_id
   where a.mov_dt_rel<'1989-01-01 00:00:00:000'


10. write a SQL query to compute the average time and count number of movies for each genre. 
    Return genre title, average time and number of movies for each genre.

	select c.gen_title,c.gen_id,avg(a.mov_time),count(a.mov_id) from movie a
	inner join movie_genres b on a.mov_id=b.mov_id
	inner join genres c on b.gen_id=c.gen_id
	group by c.gen_id,c.gen_title

11. write a SQL query to find movies with the lowest duration. 
    Return movie title, movie year, director first name, last name, actor first name, last name and role.

   select a.mov_title,a.mov_year,e.dir_fname,e.dir_lname from movie a 
   inner join movie_direction d on a.mov_id=d.mov_id
   inner join director e on d.dir_id=e.dir_id 
   where a.mov_time in (select min(mov_time) from movie)

12. write a SQL query to find those years when a movie received a rating of 3 or 4. Sort the result in increasing 
    order on movie year. Return move year. 
    
	select a.mov_year from movie a
	inner join rating b on a.mov_id=b.mov_id
	where b.rev_stars in (3,4)

13. write a SQL query to get the reviewer name, movie title, and stars in an 
    order that reviewer name will come first, then by movie title, and lastly by number of stars.
	
	select c.rev_name,a.mov_title,b.rev_stars from movie a
	inner join rating b on a.mov_id=b.mov_id
	inner join reviewer c on b.rev_id=c.rev_id
	where c.rev_name != ''
	order by c.rev_name,a.mov_title,b.rev_stars

14. write a SQL query to find those movies that have at least one rating and received highest number of stars. 
    Sort the result-set on movie title. Return movie title and maximum review stars.

	select a.mov_title,max(b.rev_stars) from movie a
	inner join rating b on a.mov_id=b.mov_id
	where b.num_o_ratings>1 
	group by a.mov_id,a.mov_title

15. write a SQL query to find those movies, which have received ratings. 
    Return movie title, director first name, director last name and review stars.

	select a.mov_title,e.dir_fname,e.dir_lname,b.rev_stars from movie a
	inner join rating b on a.mov_id=b.mov_id
	inner join movie_direction d on a.mov_id=d.mov_id
    inner join director e on d.dir_id=e.dir_id 
	where b.num_o_ratings IS NOT NULL

16. Write a query in SQL to find the movie title, actor first and last name, and the role for those movies 
    where one or more actors acted in two or more movies. 

	select a.mov_title,c.act_fname,c.act_lname,b.role from movie a
	inner join movie_cast b on a.mov_id=b.mov_id
	inner join actor c on b.act_id=c.act_id 
	where b.act_id in (select b.act_id from movie_cast b group by b.act_id having count(b.act_id)>1)

	select b.act_id,a.mov_title from movie a
	inner join movie_cast b on a.mov_id=b.mov_id
	inner join actor c on b.act_id=c.act_id 
	group by b.act_id,a.mov_title
	

