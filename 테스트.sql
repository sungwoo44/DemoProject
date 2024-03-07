--게시판 라이브러리
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)
		WHERE r BETWEEN #{start} AND #{end};

--step1 : idx 내림차눗 정렬
	SELECT * FROM community ORDER BY idx DESC;
	

--step2 : rownum  컬럼값 사용
	SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f;


--step3 : 범위를 지정합니다. 1페이지 에 글이 10개 , 20개 보이므로start, end 값을 그 갯수에 따라 지정하기 
-- 1페이지의 글목록이 10개 일 때는 아래의 같이 실행되어야 한다. 
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)
		WHERE r BETWEEN 1 AND 10;		-- 1 페이지
	
	SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)
		WHERE r BETWEEN 11 AND 20;		--2 페이지
		
	SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)
		WHERE r BETWEEN 101 AND 110;		--10 페이지

--새 글 저장	
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','자비를 베푸소서 (외전증보판) 1','재미있게 잘 읽었습니다. 다음 편이 궁금해지네요.');


-- 현재 시퀀스 값 가져오기 
SELECT community_idx_seq.currval FROM dual;


-- 글 수정
UPDATE community
SET 
title='자비를 베푸소서 (외전증보판) 1', content='재미있게 잘 읽었습니다. 다음 편이 궁금해지네요.' ,ip='13.0.1.25'
WHERE 
idx=263;



SELECT * 
 		FROM 
 			community 
 		WHERE 
 			idx=262;

-- 글 삭제
DELETE FROM 
		community 
	WHERE 
		idx=263;

--글 갯수
SELECT count(*) FROM community



SELECT count(*) 
FROM communityComments 
WHERE 
mref=107;


--글 조회수 증가
UPDATE community 
		SET 
			READCOUNT = READCOUNT +1 
		WHERE 
			idx = 262;





-- 메인글의 댓글 갯수 업데이트  
UPDATE community 
SET COMMENTCOUNT = 
	(SELECT count(*) 
	 FROM communityComments 
	 WHERE mref=107)
WHERE idx = 107;

-- 메인 글의 댓글 목록 가져오기
SELECT * 
	FROM communityComments 
	WHERE 
		mref=107;