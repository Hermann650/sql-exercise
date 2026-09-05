select name, capacity from room
where status = 'available'
order by capacity desc
--nomor 1

select name, code from subject
where code like 'M%' or code like 'E%'
order by name asc

select name as nama_exam, count(q.question_number) as jumlah_soal from exam e
join question q on e.id = q.exam_id
group by nama_exam
order by jumlah_soal desc

select name as nama_exam, max(es.score) as score_tertinggi from exam e
join exam_student_relation es on e.id = es.exam_id
group by nama_exam
order by score_tertinggi desc

with stable as (
    select s.name as subject_name, e.name as exam_name, count(es.student_id) as jumlah_peserta, avg(es.score) as rata_rata_score from exam e
    join subject s on e.subject_id = s.id
    join exam_student_relation es on e.id = es.exam_id
    where es.status = 'completed'
    group by e.name
)
select sb.subject_name, sb.exam_name, sb.jumlah_peserta, sb.rata_rata_score from stable sb
where sb.rata_rata_score > (
	select avg(score) from exam_student_relation
)
order by sb.rata_rata_score desc

select name, capacity from habitat
where status = 'operational'
order by capacity desc

select count(a.name) as jumlah_hewan, h.name as nama_habitat from habitat h
join animal a on h.id =  a.habitat_id
group by nama_habitat
order by jumlah_hewan desc

select avg(weight) as rata_rata_berat, a.name as nama_hewan from animal_info ai
join animal a on ai.id =  a.animal_info_id
group by nama_hewan
order by rata_rata_berat desc

select h.name as nama_habitat, count(1) as jumlah_hewan, avg(a.weight) as rata_rata_berat from habitat h
join animal a on h.id = a.habitat_id
where a.status = 'active' 
group by nama_habitat
having rata_rata_berat > (
    select avg(weight) from animal
    where status = 'active'
    )
order by rata_rata_berat desc

with ztable as (
    select z.fullname, h.name as habitat_name, count(hz.day_name) as jumlah_hari_piket from habitat_zookeeper_relation hz
    join zookeeper z on hz.zookeeper_id = z.id
    join habitat h on hz.habitat_id = h.id
    group by habitat_name, z.email
)
select zt.fullname, zt.habitat_name, zt.jumlah_hari_piket from ztable zt
where zt.jumlah_hari_piket >= (
	select avg(zt.jumlah_hari_piket) from ztable
)
order by zt.jumlah_hari_piket desc