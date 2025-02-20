#!/bin/bash

# Define the database location
# DB_PATH="$HOME/Photos Library DB/Test/database/Photos.sqlite"
DB_PATH="/Volumes/Extreme Pro/Photos Library/All-Media.photoslibrary/database/Photos.sqlite"
UUID_FILE="$HOME/dev/media-organizer/add_HP_to_photos_album/uuids.txt"


# Query SQLite for UUIDs of high rated photo/s/ 
sqlite3 "$DB_PATH" <<EOF > "$UUID_FILE"
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
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid 
    from zgenericalbum al 
    join ZGENERICALBUM p on p.Z_PK = al.zparentfolder
    where p.ztitle = '01-High Rated Events Intake')))
and a.z_pk in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (72286))) = 0 --Exclude Album
group by substr(datetime((a.zdatecreated + 978303599.796), 'unixepoch', 'localtime'),0,11)
order by (max(a.ZOVERALLAESTHETICSCORE)+avg(a.ZOVERALLAESTHETICSCORE))/2 desc
limit 1
)
and a.ztrashedstate = 0
and 
a.z_pk not in (select z_pk from zasset where z_pk in 
    (select z_3assets from z_30assets where Z_30albums in (select al.z_pk as albumid 
    from zgenericalbum al 
    join ZGENERICALBUM p on p.Z_PK = al.zparentfolder
    where p.ztitle = '01-High Rated Events Intake'))) 
order by a.ZOVERALLAESTHETICSCORE desc
limit 1;
EOF

echo "UUIDs saved to $UUID_FILE"
