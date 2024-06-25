package com.poly.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.springframework.stereotype.Service;

import com.poly.entity.Order;
import com.poly.entity.OrderDetail;

@Service
public class PdfService {

	public ByteArrayInputStream generateInvoice(Order order, List<OrderDetail> orderDetails) throws IOException {
		try (ByteArrayOutputStream out = new ByteArrayOutputStream(); PDDocument document = new PDDocument()) {

			PDPage page = new PDPage(PDRectangle.A4);
			document.addPage(page);

			File fontFile = new File("src/main/resources/DejaVuSans.ttf");
			PDType0Font font = PDType0Font.load(document, fontFile);

			try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
				contentStream.setFont(font, 20);
				contentStream.beginText();
				contentStream.setLeading(14.5f);
				contentStream.newLineAtOffset(220, 750);
				contentStream.showText("HOÁ ĐƠN");
				contentStream.endText();

				contentStream.setFont(font, 12);
				contentStream.beginText();
				contentStream.newLineAtOffset(25, 700);
				contentStream.showText("ElectroEdge");
				contentStream.newLine();
				contentStream.showText("electroEdge@gmail.com");
				contentStream.endText();

				contentStream.beginText();
				contentStream.newLineAtOffset(25, 670);
				contentStream.showText("Khách hàng " + order.getAccount().getFullname());
				contentStream.newLine();
//				contentStream.showText("Email khách hàng: " + order.getAccount().getEmail().toString());
				contentStream.newLine();
				contentStream.showText("Địa chỉ khách hàng: " + order.getAddress());
				contentStream.newLine();
				contentStream.showText("Hoá đơn #" + (order.getId() != null ? order.getId().toString() : ""));
				contentStream.newLine();
				contentStream
						.showText("Ngày " + (order.getCreateDate() != null ? order.getCreateDate().toString() : ""));
				contentStream.endText();

				// Table Header
				contentStream.setFont(font, 12);
				contentStream.beginText();
				contentStream.newLineAtOffset(25, 620);
				contentStream.showText("Mục");
				contentStream.newLineAtOffset(200, 0);
				contentStream.showText("Số lượng");
				contentStream.newLineAtOffset(100, 0);
				contentStream.showText("Đơn giá");
				contentStream.newLineAtOffset(100, 0);
				contentStream.showText("Thành tiền");
				contentStream.endText();

				// Draw line under header
				contentStream.moveTo(25, 615);
				contentStream.lineTo(575, 615);
				contentStream.stroke();

				// Table Content
				int yPosition = 600;
				for (OrderDetail detail : orderDetails) {
					contentStream.beginText();
					contentStream.newLineAtOffset(25, yPosition);
					contentStream.showText(detail.getProduct() != null ? detail.getProduct().getName() : "");
					contentStream.newLineAtOffset(200, 0);
					contentStream.showText(detail.getQuantity() != null ? detail.getQuantity().toString() : "");
					contentStream.newLineAtOffset(100, 0);
					contentStream.showText(detail.getPrice() != null ? detail.getPrice().toString() : "");
					contentStream.newLineAtOffset(100, 0);
					contentStream.showText((detail.getPrice() != null && detail.getQuantity() != null)
							? String.valueOf(detail.getPrice() * detail.getQuantity())
							: "");
					contentStream.endText();

					// Draw line under each item row
					contentStream.moveTo(25, yPosition - 5);
					contentStream.lineTo(575, yPosition - 5);
					contentStream.stroke();

					yPosition -= 20;
				}

				// Footer
				yPosition -= 10;
				contentStream.beginText();
				contentStream.newLineAtOffset(25, yPosition);
				contentStream.showText("Tổng cộng: " + (order.getTotal() != null ? order.getTotal().toString() : "0"));
				contentStream.newLine();
				contentStream.showText("Thuế (0%): 0đ");
				contentStream.newLine();
				contentStream.showText("Tổng tiền: " + (order.getTotal() != null ? order.getTotal().toString() : "0"));
				contentStream.endText();

				yPosition -= 60;
				contentStream.beginText();
				contentStream.newLineAtOffset(25, yPosition);
				contentStream.showText("Thông tin Thanh toán");
				contentStream.newLine();
				contentStream.showText("Ngân hàng VCB");
				contentStream.newLine();
				contentStream.showText("Tên tài khoản: ElectroEdge");
				contentStream.newLine();
				contentStream.showText("Số tài khoản: 123-456-789");
				contentStream.newLine();
				contentStream.showText("Ngày thanh toán: 16/01/2026");
				contentStream.endText();

				yPosition -= 40;
				contentStream.beginText();
				contentStream.newLineAtOffset(25, yPosition);
				contentStream.showText("electroEdge@gmail.com | 123 Đường ABC, Thành phố DEF | +84 912 345 678");
				contentStream.endText();
			}

			document.save(out);
			return new ByteArrayInputStream(out.toByteArray());
		}
	}

}
