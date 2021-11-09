package com.cos.greencinema;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.web.client.RestTemplate;
public class Test {
	Document doc;
	@org.junit.jupiter.api.Test
	public void getCraw() {

		RestTemplate rt = new RestTemplate();


			String url="http://www.cgv.co.kr/movies/";
			String html = rt.getForObject(url, String.class);
			
			Document doc = Jsoup.parse(html);

			/* Elements */
			Elements ranks = doc.select(".rank");

			Elements imgs = doc.select(".thumb-image > img");

			Elements movieAges = doc.select(".ico-grade");

			Elements movieTitles = doc.select("div.box-contents strong.title");

			Elements movieRates = doc.select(".percent span");

			Elements movieOpenDates = doc.select(".txt-info strong");

			Elements likes = doc.select(".count strong>i");
			System.out.println(ranks);
		}
}
