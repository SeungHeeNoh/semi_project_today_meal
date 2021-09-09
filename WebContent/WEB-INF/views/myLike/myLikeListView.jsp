<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>
<link href="<%= request.getContextPath() %>/resources/css/myLike/myLikeListView.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="container">
		<nav class="snb">
			<div class="snb_inner">
				
			</div>
		</nav>
		<div class="contents">
			<div class="contents_inner">
				<h2>나의 좋아요 목록</h2>
				<div class="like_list">
					<div class="list_header">
						<div>
							<input type="checkbox" name="selectAll" id="selectAll">
							<label for="selectAll">전체 선택</label>
						</div>
						<button type="button" class="green_button" disabled>선택 삭제</button>
					</div>
					<div class="list_body">
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area no_option">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button" disabled>장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div class="option_area">
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div><input type="checkbox" name="select_row"></div>
							<div class="image_area"><img src="https://via.placeholder.com/95" alt="음식 대표 사진"></div>
							<div class="description_area">
								<h4>오뎅탕 세트</h4>
								<p>본품 수량 : <span>5</span>개</p>
								<div>
									<button type="button" class="green_button">옵션 전체 보기</button>
									<div class="option_layer">
										<div>
											<dl>
												<dt>우엉마끼</dt>
												<dd>1</dd>
											</dl>
											<dl>
												<dt>시로볼 아까볼</dt>
												<dd>5</dd>
											</dl>
											<dl>
												<dt>생선 두부 튀김</dt>
												<dd>7</dd>
											</dl>
											<dl>
												<dt>크림치즈 어묵볼</dt>
												<dd>1</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="price_area">
								<p>25,000원</p>
							</div>
							<div class="button_area">
								<div>
									<button type="button" class="green_button">장바구니</button>
									<button type="button" class="green_button">삭제하기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="paging">
					
					</div>
				</div>
			</div>
		</div>
		<div class="dimmed">
			<div id ="modal">
				<div class="modal_inner">
					
				</div>
				<button type="button" class="close_button"></button>
			</div>
		</div>
	</div>
</body>
</html>