package ua.dto.filter;

import java.util.regex.Pattern;

public class DepositFilter {

	private static final Pattern PEATTERN = Pattern.compile("[0-9]+");

	private String search = "";
	
	private String maxPrice = "";
	
	private String minPrice = "";
	
	private Integer max;
	
	private Integer min;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public Integer getMin() {
		return min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	public static Pattern getPeattern() {
		return PEATTERN;
	}
	
	
	

}
