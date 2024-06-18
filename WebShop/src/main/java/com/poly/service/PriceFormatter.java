package com.poly.service;

import java.text.DecimalFormat;

public class PriceFormatter {
	private static final DecimalFormat decimalFormat = new DecimalFormat("#,###");

    public static String format(double price) {
        return decimalFormat.format(price).replace(",", ".") + " đ";
    }
}
