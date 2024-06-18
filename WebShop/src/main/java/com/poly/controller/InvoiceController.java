package com.poly.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ProductDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Report;
import com.poly.service.OrderService;
import com.poly.service.PdfService;

@Controller
public class InvoiceController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private PdfService pdfService;

	@GetMapping("/invoice/{orderId}")
	public String getInvoice(@PathVariable("orderId") Long orderId, Model model) {
		Order order = orderService.getOrderById(orderId);
		List<OrderDetail> orderDetails = orderService.getOrderDetailsByOrderId(orderId);
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		String formattedPrice = decimalFormat.format(order.getTotal()).replace(",", ".") + " đ";
		order.setTotalFormatted(formattedPrice);
		for (OrderDetail product : orderDetails) {
			String formattedPrice1 = decimalFormat.format(product.getPrice()).replace(",", ".") + " đ";
			product.setPriceFormatted(formattedPrice1);
		}
		model.addAttribute("order", order);
		model.addAttribute("orderDetails", orderDetails);
		return "export/invoice";
	}

	@GetMapping("/invoice/pdf/{orderId}")
	public ResponseEntity<InputStreamResource> generateInvoicePdf(@PathVariable("orderId") Long orderId)
			throws IOException {
		Order order = orderService.getOrderById(orderId);
		List<OrderDetail> orderDetails = orderService.getOrderDetailsByOrderId(orderId);

		ByteArrayInputStream bis = pdfService.generateInvoice(order, orderDetails);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename=invoice.pdf");

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(bis));
	}

//	@GetMapping("/invoice/pdf/{orderId}")
//    public void generateInvoice(@PathVariable Long orderId, HttpServletResponse response) throws IOException, DocumentException {
//        Order order = orderService.getOrderById(orderId);
//        List<OrderDetail> orderDetails = orderService.getOrderDetailsByOrderId(orderId);
//
//        ByteArrayInputStream pdf = pdfService.generateInvoice(order, orderDetails);
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "inline; filename=invoice.pdf");
//
//        response.getOutputStream().write(pdf.readAllBytes());
//    }

	@Autowired
	ProductDAO dao;

	@RequestMapping("/report/inventory")
	public String inventory(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "export/report";
	}
}
