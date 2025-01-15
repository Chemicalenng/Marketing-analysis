select * from dbo.customer_journey;
with duplicateRecords as (
select 
JourneyID, 
CustomerID, 
ProductID, 
VisitDate, 
Stage, 
Action, 
Duration,
--use row number to assign a unique row number to record within the partition
ROW_NUMBER() over(
partition by CustomerID, ProductID, VisitDate, Stage, Action
order by JourneyID
)as row_num
from dbo.customer_journey
)
select * from duplicateRecords 
where row_num > 1 --only shows duplicates
order by JourneyID
select 
JourneyID, 
CustomerID,
ProductID, 
VisitDate, 
Stage, 
Action,
Coalesce(Duration, avg_duration) as Duration 
from (
select 
JourneyID, 
CustomerID,
ProductID, 
VisitDate, 
Upper(Stage) as Stage, 
Action, Duration,
avg(Duration) over (Partition by VisitDate) as avg_Duration,
ROW_NUMBER() over(
Partition by CustomerID, ProductID, VisitDate, Upper(Stage), Action
order by JourneyID
)as row_Num
from dbo.customer_journey) as subQuery
where row_num = 1 
