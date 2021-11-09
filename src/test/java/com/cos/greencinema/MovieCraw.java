package com.cos.greencinema;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.cos.greencinema.domain.movie.Movie;
import com.cos.greencinema.domain.movie.MovieRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class MovieCraw {
	private final MovieRepository movieRepository;
	
	public void getCraw() {
		RestTemplate rt = new RestTemplate();
		List<Movie> movieList = new ArrayList<Movie>();
	
			
			
			String url="http://www.cgv.co.kr/movies/";
			String html = rt.getForObject(url, String.class);
			
			Document doc = Jsoup.parse(html);
			
			Elements ranks = doc.select(".rank");

			Elements imgs = doc.select(".thumb-image > img");

			Elements movieAges = doc.select(".ico-grade");

			Elements movieTitles = doc.select("div.box-contents strong.title");

			Elements movieRates = doc.select(".percent span");

			Elements movieOpenDates = doc.select(".txt-info strong");


			/*
			 * String rank = ranks.get(0).text(); String img = imgs.get(0).attr("src");
			 * String movieAge = movieAges.get(0).text(); String movieTitle =
			 * movieTitles.get(0).text(); String movieRate = movieRates.get(0).text();
			 * String movieOpenDate = movieOpenDates.get(0).text();
			 * System.out.println(rank); System.out.println(img);
			 * System.out.println(movieAge); System.out.println(movieTitle);
			 * System.out.println(movieRate); System.out.println(movieOpenDate);
			 */
			for (int i = 0; i < ranks.size(); i++) {
				String rank = ranks.get(i).text();
				String img = imgs.get(i).attr("src");
				String movieAge = movieAges.get(i).text();
				String movieTitle = movieTitles.get(i).text();
				String movieRate = movieRates.get(i).text();
				String movieOpenDate = movieOpenDates.get(i).text();
				Movie movie = Movie.builder()
						.rank(rank)
						.img(img)
						.movieAge(movieAge)
						.movieTitle(movieTitle)
						.movieRate(movieRate)
						.movieOpenDate(movieOpenDate)
						.build();
					
				movieList.add(movie);
			
		
	}
			System.out.println(movieList);
			movieRepository.saveAll(movieList);
			
	}

}
