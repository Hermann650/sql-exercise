select concat('Chef: ', fullname) as chef_name, concat('+62 ', substring(phone, 2)) as contact_number from chef
order by fullname asc