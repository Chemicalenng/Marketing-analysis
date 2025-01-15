select * from dbo.customer_reviews
select 
ReviewID, 
CustomerID, 
ProductID, 
ReviewDate, 
case 
when Rating < 2 then 'Bad'
when Rating < 4 then 'Could be better'
else 'Good' end as RatingCategory, 
Replace(ReviewText, '  ' , ' ') as ReviewText

from dbo.customer_reviews
