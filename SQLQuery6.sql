select * from dbo.engagement_data
select 
EngagementID,
ContentID,
CampaignID,
ProductID,
Upper(Replace(ContentType, 'Socialmedia', 'Social Media'))as ContentType,
Left(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) as Views,
Right(ViewsClicksCombined, len(ViewsClicksCombined)- CHARINDEX('-', ViewsClicksCombined)) as Clicks, 
Likes,
Format(EngagementDate, 'dd.MM.yyyy') as EngagementDate
from dbo.engagement_data
where ContentType != 'Newsletter'

