package com.kh.marathon.model.service;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.kh.common.JDBCTemplate;
import com.kh.marathon.model.dao.MarathonDao;

public class MarathonService {
	private String baseURL = "http://www.roadrun.co.kr/schedule/list.php";
	
    public int insertMarthon(){
        Connection conn = new JDBCTemplate().getConnection();
        int result=0;
        JSONArray jArr = crawling();
        JSONObject jobj = new JSONObject();
        for (int i=0;i<jArr.size();i++){
            jobj=(JSONObject) jArr.get(i);
            result = new MarathonDao().insertMarathon(conn,jobj);
            
            if(result<0){
                System.out.println("오류발생");
                break;
            }
        }
        if(result>0){
            JDBCTemplate.commit(conn);
        }
        else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
        return result;
    }
    
    public JSONArray crawling(){
        Document doc = null;
        try {
            //jsoup 라이브러리 등록
            doc = Jsoup.connect(baseURL).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        JSONArray jArr = new JSONArray();
        // 
        int num =Integer.parseInt(doc.select("font[color=red]").first().text());
        Document doc2=null;
        for(int i=0;i<num;i++) {
            try {
                String href = doc.select("td[width=29%] a").eq(i).attr("href");
                if (href.isEmpty()) {
                    System.out.println("종료");
                    break;
                }
                String subHref = href.substring(href.indexOf(",") + 3, href.indexOf(",", href.indexOf(",") + 1) - 1);
                String URL2 = "http://www.roadrun.co.kr/schedule/" + subHref;

                //가져온 주소로 새로 크롤링

                doc2 = Jsoup.parse(new URL(URL2).openStream(), "euc-kr", URL2);
                String marathonName = doc2.select("td[width=430]").eq(0).text();
                String location = doc2.select("td[width=430]").eq(7).text();
                String location2 = doc2.select("div .iw_inner").text();
                String marathonDate = doc2.select("td[width=430]").eq(3).text();
                String applicationDate = doc2.select("td[width=430]").eq(9).text();
                String organizer = doc2.select("td[width=430]").eq(1).text();
                String organizerPhone = doc2.select("td[width=430]").eq(4).text();
                String organizationHost = doc2.select("td[width=430]").eq(8).text();
                String region = doc2.select("td[width=430]").eq(6).text();
                String marathonSite = doc2.select("td[width=430]").eq(10).text();
                String otherIntroduction = doc2.select("td[width=430]").eq(11).text();
                JSONObject jObj = new JSONObject();
                jObj.put("marathonName",marathonName);
                jObj.put("location",location);
                jObj.put("location2",location2);
                jObj.put("marathonDate",marathonDate);
                jObj.put("applicationDate",applicationDate);
                jObj.put("organizer",organizer);
                jObj.put("organizerPhone",organizerPhone);
                jObj.put("organizerHost",organizationHost);
                jObj.put("region",region);
                jObj.put("marathonSite",marathonSite);
                jObj.put("otherIntroduction",otherIntroduction);
                jArr.add(jObj);
                } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return jArr;
    }
	public int deleteAllMarathon() {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MarathonDao().deleteAllMarathon(conn);
		if(result>0){
            JDBCTemplate.commit(conn);
        }
        else {
            JDBCTemplate.rollback(conn);
        }
        JDBCTemplate.close(conn);
		return result;
	}
}
