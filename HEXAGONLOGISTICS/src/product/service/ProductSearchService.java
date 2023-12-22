package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import connection.ConnectionProvider;
import product.dao.ProductDao;
import product.model.Product;

public class ProductSearchService {

	private ProductDao productDao = new ProductDao();
	// 지정된 상품 번호에 해당하는 상품을 검색하는 메서드
	// 指定された商品番号に対応する商品を検索するメソッド

	public Product SearchProduct(int pageNum) {
		// pageNum 검색할 상품의 번호
		// pageNum 検索する商品の番号
		try (Connection conn = ConnectionProvider.getConnection()) {
			// 상품 정보
			// 商品情報
			Product product = productDao.selectById(conn, pageNum);
			System.out.println(product);
			return product;

		} catch (SQLException e) {
			throw new RuntimeException(e);
			// RuntimeException 데이터베이스 연결 등의 예외 발생 시 런타임 예외로 처리
			// RuntimeException データベース接続などの例外が発生した場合、実行時例外として処理

		}
	}

}
