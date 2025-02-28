-- All_Media Photos Library
-- all by analysis Date
-- :num_days --600

select a.zfavorite, a.zdeletereason,
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), (a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')) as DiffCreated,
julianday('now') - julianday(datetime((a.zaddeddate + 978303599.796), 'unixepoch', 'localtime')) as DiffAdded,
datetime((a.zaddeddate + 978303599.796), 'unixepoch', 'localtime') as dateAdded,
substr(datetime((a.zaddeddate + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateAddedT,
datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime') as dateCreated,
aaa.zoriginalfilename as fileName, a.ZOVERALLAESTHETICSCORE as score
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (156))) as inAll
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517))) as inAllTopScoreAlbums        
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) as excluded
,a.z_pk,
datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime') as analysisDate,
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) as analysiDateDiff
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
and (a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517)))) = 0
-- analysis date last week
and 
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) < :num_day -- 600
-- datetaken last week
and 
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')) < :num_day --600
-- hide favorities and excluded
and a.zfavorite = 0 
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) = 0
and a.ZOVERALLAESTHETICSCORE > 0.54
-- by date imported
--order by a.zaddeddate desc
-- by score
--order by a.ZOVERALLAESTHETICSCORE desc
-- by analysisDate
--order by a.ZANALYSISSTATEMODIFICATIONDATE desc
-- by dateCreated
order by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) desc, a.ZOVERALLAESTHETICSCORE desc


-- count by dateCreated groups
-- :num_days --600
select distinct count(a.z_pk) as count, substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateCreated
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
and (a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517)))) = 0
-- analysis date last week
and  julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) <  :num_day --540
-- datetaken last week
and julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')) < :num_day -- 540
-- hide favorities and excluded
and a.zfavorite = 0 
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) = 0
and a.ZOVERALLAESTHETICSCORE > 0.54
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by count(a.z_pk) desc;


-- set favorite for the particular date 
update ZASSET set ZFAVORITE = 1 where Z_PK in
(
select a.Z_PK,a.zdirectory
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
and (a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517)))) = 0
-- analysis date last week
and 
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) < :num_day -- 600
-- datetaken last week
and 
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')) < :num_day --600
-- hide favorities and excluded
and a.zfavorite = 0 
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) = 0
and a.ZOVERALLAESTHETICSCORE > 0.54
and (substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)) = '2023-09-06'
)


-- 39629 -> 133
select Z_PK,ZTITLE from ZGENERICALBUM z 
where ZTITLE like '%exclud%'

-- 39517 -> 573
select Z_PK,ZTITLE from ZGENERICALBUM z 
where ZTITLE  = 'All TopScore Albums'




/*-- count by dateCreated groups
-- :num_days --600
select distinct count(a.z_pk) as count, substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateCreated
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
and (a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 573)))) = 0
-- analysis date last week
and  julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) <  :num_day --540
-- datetaken last week
and julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')) < :num_day -- 540
-- hide favorities and excluded
and a.zfavorite = 0 
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (133))) = 0
and a.ZOVERALLAESTHETICSCORE > 0.54
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by count(a.z_pk) desc;

select count(z.Z_PK), z.ZOVERALLAESTHETICSCORE 
from ZASSET z
group by z.ZOVERALLAESTHETICSCORE 
order by 1 desc
*/

-- group by date order by favorites count
select distinct count(a.z_pk) as count, substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateCreated
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
--and (a.z_pk  in (select z_pk from zasset where z_pk in 
--    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517)))) = 0
-- analysis date last week
and  julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) <  :num_day --540
-- datetaken last week
and julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')) < :num_day -- 540
-- hide favorities and excluded
and a.zfavorite = '1' 
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) = 0
and a.ZOVERALLAESTHETICSCORE > 0.54
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by count(a.z_pk) desc;


-- photo group fovorites - date - order by creationDate - 0.84619140625
select 
datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime') as dateCreated,
aaa.zoriginalfilename as fileName, a.ZOVERALLAESTHETICSCORE as score,
aaa.zoriginalfilesize as size, ea.zcameramodel, a.zfavorite,
case 
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2004-06-19', '2004-06-20') 
		and ea.zcameramodel in ('KODAK DX6490 ZOOM DIGITAL CAMERA')
		and a.zfavorite = '1'
	then 'June 2004 - Cleveland Chicago Indianapolis'
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2006-06-18') 
		and ea.zcameramodel in ('EX-S600')
		and a.zfavorite = '1'
	then '18 June 2006 - Poolparty Lee'
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2021-12-29') 
		and ea.zcameramodel in ('iPhone 12')
		and a.zfavorite = '1'
	then '29 December 2021 - Museum of Natural History'
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2017-05-30') 
		and ea.zcameramodel in ('NIKON 1 J1')
		and a.zfavorite = '1'
	then '30 May 2017 - Grand Canyon'
END 
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (156))) as inAll
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517))) as inAllTopScoreAlbums        
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) as excluded
,a.z_pk,
datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime') as analysisDate,
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime')) as analysiDateDiff
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
-- filter by HighRated Events
--and substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2021-09-09', '2010-10-23', '2020-08-14', '2006-02-22') 
--and a.ZOVERALLAESTHETICSCORE >= :score --0.82
order by 3 desc, 1


PRAGMA journal_mode=WAL;


select a.zdirectory
from ZASSET a
group by a.zdirectory
order by a.zdirectory

select count(*), a.ZOVERALLAESTHETICSCORE
from zasset a
group by a.ZOVERALLAESTHETICSCORE
order by a.ZOVERALLAESTHETICSCORE desc

select count(*), avg(a.ZOVERALLAESTHETICSCORE) as avg, min(a.ZOVERALLAESTHETICSCORE) as min, max(a.ZOVERALLAESTHETICSCORE) as max, 
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by 4 desc;




-- high rated Events without an album
select count(*), min(a.ZOVERALLAESTHETICSCORE) as min, avg(a.ZOVERALLAESTHETICSCORE) as avg, max(a.ZOVERALLAESTHETICSCORE) as max, 
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC,
	(max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 as rating
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90', 'KODAK EASYSHARE CX7300 DIGITAL CAMERA')
-- hide deleted
and a.ztrashedstate = 0
-- no child folder of HighRatedEventsIntake
and 
a.z_pk not in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226)))
--and  substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,5 ) = '2006'
-- not in ignore folder
and a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (72286))) = 0
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by 6 desc

-- high rated Events WITH an album
select count(*), avg(a.ZOVERALLAESTHETICSCORE) as avg, min(a.ZOVERALLAESTHETICSCORE) as min, max(a.ZOVERALLAESTHETICSCORE) as max, 
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC,
	(max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 as rating
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
-- no child folder of HighRatedEventsIntake
and 
a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226)))
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
--by rating
--order by (max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 desc
-- by event count
order by 1 desc
-- by weighted count
--order by count(*)*((max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2) desc

-- high rated Events WITH an album - details
select a.ZOVERALLAESTHETICSCORE, aaa.ZORIGINALFILENAME,
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
-- no child folder of HighRatedEventsIntake
and 
a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226)))
-- order by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11), 
order by a.ZOVERALLAESTHETICSCORE desc

    
-- high rated Events details
select a.ztrashedstate as del,
a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226)))
as inHR,
datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime') as dateCreated,
aaa.zoriginalfilename as fileName, a.ZOVERALLAESTHETICSCORE as score,
aaa.zoriginalfilesize as size, ea.zcameramodel, a.zfavorite,
case 
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2004-06-19', '2004-06-20') 
		and ea.zcameramodel in ('KODAK DX6490 ZOOM DIGITAL CAMERA')
		and a.zfavorite = '1'
	then 'June 2004 - Cleveland Chicago Indianapolis'
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2006-06-18') 
		and ea.zcameramodel in ('EX-S600')
		and a.zfavorite = '1'
	then '18 June 2006 - Poolparty Lee'
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2021-12-29') 
		and ea.zcameramodel in ('iPhone 12')
		and a.zfavorite = '1'
	then '29 December 2021 - Museum of Natural History'
	when 
		substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in ('2017-05-30') 
		and ea.zcameramodel in ('NIKON 1 J1')
		and a.zfavorite = '1'
	then '30 May 2017 - Grand Canyon'
END 
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (156))) as inAll
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 39517))) as inAllTopScoreAlbums        
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226))) as inHighRatedAlbums        
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (39629))) as excluded
,a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (72286))) as inIgnore
,a.z_pk,
datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepoch', 'localtime') as analysisDate,
julianday('now') - julianday(datetime(coalesce(cast(strftime('%s',replace(substr(a.ZANALYSISSTATEMODIFICATIONDATE,-19,10),':','-') || ' ' || substr(a.ZANALYSISSTATEMODIFICATIONDATE,-8,8)) as int),
(a.ZANALYSISSTATEMODIFICATIONDATE + 978303599.796)), 'unixepo
ch', 'localtime')) as analysiDateDiff
from zasset a
left join zadditionalassetattributes aaa on aaa.zasset = a.z_pk
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
-- hide deleted
and a.ztrashedstate = 0
-- no child folder of HighRatedEventsIntake
--and 			
--a.z_pk not in (select z_pk from zasset where z_pk in 
--    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226)))
-- filter by HighRated Events
and substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) in (:mediaDate) 
--and a.ZOVERALLAESTHETICSCORE >= :score --0.82
order by a.ZOVERALLAESTHETICSCORE desc, datetime(coalesce(cast(strftime('%s',replace(substr(aaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(aaa.zexiftimestampstring,-8,8)) as int), 
(a.zdatecreated + 978303599.796)), 'unixepoch', 'localtime')

select ztitle, * 
from ZGENERICALBUM z
where z.ZTITLE is not null
order by z.ZTITLE 


select ZTITLE, * 
from zmoment 
where ZTITLE is not null
order by Z_PK desc

select * 
from ZASSET a 
where a.ZADJUSTMENTSSTATE 

select ZUUID, ZKIND, ZTITLE , ZPARENTFOLDER, * 
from ZGENERICALBUM z 
order by z_pk desc
--23 Oct 2023	72226	72228
--22 Feb 2006	72226	72227
--HighRatedEvents	8	72226
--09 Sep 2021	72226	72225

select * 
from Z_30ASSETS za 
where Z_30ALBUMS = 72228


SELECT ZASSET.ZFILENAME, ZASSET.ZDIRECTORY, ZASSET.ZDATECREATED
FROM ZGENERICALBUM
JOIN Z_30ASSETS ON ZGENERICALBUM.Z_PK = Z_30ASSETS.Z_30ALBUMS
JOIN ZASSET ON Z_30ASSETS.Z_3ASSETS = ZASSET.Z_PK
WHERE ZGENERICALBUM.ZUUID = 'D01DD757-9310-4A3C-B354-5495A1ED0EF4';

SELECT ZGENERICALBUM.ZTITLE
FROM ZGENERICALBUM
JOIN Z_30ASSETS ON ZGENERICALBUM.Z_PK = Z_30ASSETS.Z_30ALBUMS
JOIN ZASSET ON Z_30ASSETS.Z_3ASSETS = ZASSET.Z_PK
WHERE ZASSET.ZFILENAME = 'IMG_5407.HEIC';

select aa.zoriginalfilename, z.Z_PK,
z.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 72226))) as HighRatedEventsIntakeAlbums  
from ZASSET z 
join ZADDITIONALASSETATTRIBUTES aa on aa.ZASSET = z.Z_PK 
where aa.zoriginalfilename = 'IMG_5407.HEIC'
--IMG_5407.HEIC	68780
--IMG_5407.HEIC	86490
--IMG_5407.HEIC	234071

select * 
from Z_30ASSETS za 
WHERE za.Z_3ASSETS in (68780, 86490, 234071)

select z.ZTITLE, z.ZKIND, *
from ZGENERICALBUM z 
where z.Z_PK in (274, 322, 38701, 39619, 38610, 72239)


-- Test database
-- get UUID of the best rated picture in the best rated event
select a.ZUUID
from ZASSET a
join ZADDITIONALASSETATTRIBUTES aaa on aaa.ZASSET = a.z_pk
where substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) = 
(
select 
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90', 'KODAK EASYSHARE CX7300 DIGITAL CAMERA')
and a.ztrashedstate = 0
and 
a.z_pk not in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 73)))
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (72286))) = 0 --Exclude Album
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by (max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 desc
limit 1
)
and a.ztrashedstate = 0
and 
a.z_pk not in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid from zgenericalbum al where al.zparentfolder = 73))) 
order by a.ZOVERALLAESTHETICSCORE desc
limit 1

select z.ZTRASHEDSTATE, z.ZTITLE, z.Z_PK, z.ZPARENTFOLDER 
from ZGENERICALBUM z 
where z.ztitle = '2003-08-17'


-- high rated Events without an album
select count(*), min(a.ZOVERALLAESTHETICSCORE) as min, avg(a.ZOVERALLAESTHETICSCORE) as avg, max(a.ZOVERALLAESTHETICSCORE) as max, 
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC,
	(max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 as rating
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90', 'KODAK EASYSHARE CX7300 DIGITAL CAMERA')
-- hide deleted
and a.ztrashedstate = 0
-- no child folder of HighRatedEventsIntake
and 
a.z_pk not in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid 
    from zgenericalbum al 
    join ZGENERICALBUM p on p.Z_PK = al.zparentfolder
    where p.ztitle = '01-High Rated Events Intake')))
--and  substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,5 ) = '2006'
-- not in ignore folder
--and a.z_pk  in (select z_pk from zasset where z_pk in 
--    (select z_3assets from z_30assets where Z_30albums in (72286))) = 0
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by 6 desc
--limit 1

-- high rated Events WITH an album
select count(*), avg(a.ZOVERALLAESTHETICSCORE) as avg, min(a.ZOVERALLAESTHETICSCORE) as min, max(a.ZOVERALLAESTHETICSCORE) as max, 
	substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateC,
	(max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 as rating
from ZASSET a
left join zextendedattributes ea on ea.zasset = a.z_pk
where ea.zcameramodel not in ('DSC-H2', 'NIKON D90')
-- no child folder of HighRatedEventsIntake
and 
a.z_pk  in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid 
    from zgenericalbum al 
    join ZGENERICALBUM p on p.Z_PK = al.zparentfolder
    where p.ztitle = '01-High Rated Events Intake')))
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
--by rating
--order by (max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 desc
-- by event count
order by 1 desc
-- by weighted count
--order by count(*)*((max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2) desc


select z_pk 
from zasset 
where z_pk in 
    (
    select z_3assets 
    from z_30assets 
    where Z_30albums in 
    (select al.z_pk as albumid 
    from zgenericalbum al 
    join ZGENERICALBUM p on p.Z_PK = al.zparentfolder
    where p.ztitle = '01-High Rated Events Intake'))
    
    
-- 2025-02-25 
select count(*)
from ZASSET za
where za.ZOVERALLAESTHETICSCORE > 0.7
-- total in asset table - 199,684
-- > 0.7 -> 1,540

        
select z.ZTRASHEDSTATE, z.ZTITLE, z.Z_PK, z.ZPARENTFOLDER 
from ZGENERICALBUM z 
where z.ztitle = 'High Aesthetic Photos'

-- all assets in High Aestetic Photos album
select za.ZOVERALLAESTHETICSCORE, zaa.ZORIGINALFILESIZE, zaa.ZORIGINALFILENAME, za.ZDATECREATED,
datetime(coalesce(cast(strftime('%s',replace(substr(zaa.zexiftimestampstring,-19,10),':','-') || ' ' || substr(zaa.zexiftimestampstring,-8,8)) as int), 
(za.zdatecreated + 978303599.796)), 'unixepoch', 'localtime') as dateCreated
from zasset za
join ZADDITIONALASSETATTRIBUTES zaa on zaa.ZASSET = za.Z_PK
where za.z_pk in 
    (
    select z_3assets 
    from z_30assets 
    where Z_30albums in 
    (72337))
    and ztrashedstate = 0
order by za.ZDATECREATED

select datetime((a.zaddeddate + 978303599.796), 'unixepoch', 'localtime') as dateAdded,
substr(datetime((a.zaddeddate + 978303599.796), 'unixepoch', 'localtime'),0,11) as dateAddedT, * 
from zasset a
order by a.zaddeddate desc

