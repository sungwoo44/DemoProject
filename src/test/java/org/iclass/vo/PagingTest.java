package org.iclass.vo;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iclass.dao.CommunityDao;
import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;
@Slf4j
class PagingTest {

	@Test
	void test(){
		
//		 2페이지를 보고싶으 글의 총 갯수는 240개 , 1 페이지 글목록 10개ㅐ
		Paging page = new Paging(12, 240, 10);
		log.info("page 프로퍼티 계산 결과:{}",page);
	}
	
	@Test
	void getPageList(){
		
		// 2페이지의 글 목록 가져오기
		Paging page = new Paging(2, 240, 10);
		Map<String,Integer> map = new HashMap<>();
		map.put("start", page.getStartNo());
		map.put("end", page.getEndNo());
		CommunityDao dao = CommunityDao.getInstance();
		List<Community> list = dao.pagelist(map);
		log.info("2페이지의 글 목록 가져오기 :{}",list);
		
	}
	
	@Test
	void getArticle(){
		//idx 230인 글 1개 가져오기 
		CommunityDao dao = CommunityDao.getInstance();
		Community com = dao.selectByIdx(230);
		log.info("idx 230번 글 :{}",com);
		
		
		
		
	}
	

}
