
-- Pages liked by their friends
select f.UserId,L.PageId from friends f join Likes l on f.FriendId =l.UserId

except

-- Pages liked by the person
select UserId, PageId from Likes