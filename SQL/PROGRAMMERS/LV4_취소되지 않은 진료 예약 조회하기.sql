#취소되지 않은 진료 예약 조회하기
SELECT A.apnt_no, B.pt_name, B.pt_no, C.mcdp_cd, C.dr_name, A.apnt_ymd
FROM appointment A INNER JOIN patient B ON A.pt_no = B.pt_no
INNER JOIN doctor C ON A.mddr_id = C.dr_id
WHERE YEAR(A.apnt_ymd) = 2022
AND MONTH(A.apnt_ymd) = 04
AND DAY(A.apnt_ymd) = 13
AND A.apnt_cncl_yn = 'N'
ORDER BY A.apnt_ymd;

-- DATE_FORMAT(APNT_YMD,'%Y%m%d') = '20220413'