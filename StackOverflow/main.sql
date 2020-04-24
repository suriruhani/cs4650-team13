Select *
From Tags
where TagName = 'nlp';

Select *
From Posts
where Tags like '%nlp%';

Select *
From Posts
where Tags like '%nlp%'
      and PostTypeId = 1
      and ClosedDate IS NULL 
      and DeletionDate IS NULL 
      and AcceptedAnswerId IS NOT NULL;

Select *
From Posts
where Id in (
      Select AcceptedAnswerId
      From Posts
      where Tags like '%nlp%'
            and PostTypeId = 1
            and ClosedDate IS NULL 
            and DeletionDate IS NULL 
            and AcceptedAnswerId IS NOT NULL
);

select q.Body, a.Body 
from Posts as q
left join Posts as a on q.AcceptedAnswerId = a.Id
            and q.Tags like '%nlp%'
            and q.PostTypeId = 1
            and q.ClosedDate IS NULL 
            and q.DeletionDate IS NULL 
            and q.AcceptedAnswerId IS NOT NULL;
