/**
 * 
 */

(function() {
	let body = document.querySelector("body"),
		container = body.querySelector("#container"),
		dimmed = body.querySelector(".dimmed"),
		modal = dimmed.querySelector("#modal");
	
	let detailReviewInner = modal.querySelector(".detail_review_inner");

	let resultOption = container.querySelector(".result_option"),
		resultCount = resultOption.querySelector("span"),
		resultOrderSelect = resultOption.querySelector("select");

	let resultArea = container.querySelector(".result_area"),
		filter = resultArea.querySelector(".filter"),
		search = filter.querySelector(".search"),
		searchInput = search.querySelector("input"),
		searchButton = filter.querySelector("button"),
		category = filter.querySelector(".category"),
		categoryCheckBox = category.querySelectorAll("input"),
		result = resultArea.querySelector(".result"),
		resultList = result.querySelector(".result_list"),
		moreButton = resultArea.querySelector(".more_button"),
		form = resultArea.querySelector("form"),
		page = form.querySelector("#page"),
		allItemCount = form.querySelector("#all_item_count"),
		itemCount = form.querySelector("#item_count");
	
	let categoryURLArray = [];

	function init() {
		category.addEventListener("change", categoryChangeEventHandler);
		searchButton.addEventListener("click", searchButtonClickEventHandler);
		result.addEventListener("click", resultClickEventHandler);
		modal.addEventListener("click", modalClickEventListener);
		resultOrderSelect.addEventListener("change", resultOrderChangeEventHandler);
		categoryInit();
		searchInputInit();
	}
	
	function categoryInit() {
		let queryString = window.location.href.split("?")[1];

		if(queryString != undefined && queryString.indexOf("categoryList") >= 0) {
			queryString = queryString.split("&")[0].replace("categoryList=", "");
			let categoryList = queryString.split(",");

			for(let categoryName of categoryList) {
				categoryURLArray.push(categoryName);
			}
		}
	}
	
	function searchInputInit() {
		let queryString = window.location.href.split("keyword=")[1];

		if(queryString != undefined) {
			searchInput.value = decodeURI(queryString);
		}
	}

	function categoryChangeEventHandler(e) {
		if(e.target.tagName == "INPUT") {
			if(e.target.classList.contains("active")) {
				e.target.classList.remove("active");
				
				let index = categoryURLArray.indexOf(e.target.name);
				if(index > -1) {
					categoryURLArray.splice(index, 1);
				}
			} else {
				categoryURLArray.push(e.target.name);
				e.target.classList.add("active");
			}
			updateResultList(resultOrderSelect.value, searchInput.value);
		}
	}
	
	function searchButtonClickEventHandler() {
		updateResultList();
	}

	function updateURL() {
		let originURL = window.location.href.split("?")[0];

		if(categoryURLArray.length > 0 || searchInput.value != "") {
			let query = createQuery("", "categoryList", categoryURLArray);
			query = createQuery(query, "keyword", searchInput.value);

			history.replaceState(null, null, originURL + "?" + query);
		} else {
			let url = window.location.href;

			if(url.indexOf("?") > 0) {
				history.replaceState(null, null, originURL);
			}
		}
	}
	
	function updateResultList(st, keyword) {
		let xhr = new XMLHttpRequest();
		let query = createQuery("", "categoryList", categoryURLArray);
		query = createQuery(query, "st", resultOrderSelect.value);
		query = createQuery(query, "keyword", searchInput.value);
		console.log(query);

		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				if((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
					let responseTextJson = JSON.parse(xhr.responseText);
					resultCount.innerHTML = responseTextJson.listCount;
					page.value = 1;
					allItemCount.value = responseTextJson.listCount;
					itemCount.value = responseTextJson.reviewList.length;
					
					resultList.innerHTML = "";
					if(itemCount.value > 0) {
						result.classList.remove("empty_result");
						appendCard(responseTextJson.reviewList);
						moreButton.removeAttribute("disabled");
						if(itemCount.value == allItemCount.value) {
							moreButton.classList.add("hidden");
						} else {
							moreButton.classList.remove("hidden");
						}
					} else {
						result.classList.add("empty_result");
						resultList.insertAdjacentHTML("beforeend", "<li>아직 등록된 리뷰가 없습니다.</li>");
					}
					updateCategoryCount(responseTextJson.categoryCountInfo);
				} else {
					console.log("ajax 통신 실패");
				}
			}
		}
		
		updateURL();

		xhr.open("POST", "categoryList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;");
		xhr.send(query);
	}
	
	function updateCategoryCount(categoryCount) {
		for(let checkBox of categoryCheckBox) {
			if(categoryCount[checkBox.name] != undefined) {
				checkBox.closest("li").querySelector("span").innerHTML = "(" + categoryCount[checkBox.name] + ")"; 
			} else {
				checkBox.closest("li").querySelector("span").innerHTML = "";
			}
		}
	}

	function resultClickEventHandler(e) {
		if(e.target.tagName == "BUTTON") {
			if(e.target.classList.contains("detail_button")) {
				detailButtonClickEventHandler(e.target);
			} else if(e.target.classList.contains("buy_button")) {
				buyButtonClickEventHandler();
			} else if(e.target.classList.contains("more_button")) {
				moreButtonClickEventHandler();
			} else {
				likeButtonToggleEventHandler(e.target);
			}
		}
	}

	function detailButtonClickEventHandler(detailButton) {
		detailButton.setAttribute("disabled", true);
		
		let xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				if((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
					let responseTextJson = JSON.parse(xhr.responseText);
					detailReviewInner.innerHTML = "";
					appendModal(responseTextJson);
					detailButton.removeAttribute("disabled");
				} else {
					console.log("ajax 통신 실패");
				}
			}
		}
		
		xhr.open("POST", "detailModal");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;");
		xhr.send("rno="+detailButton.getAttribute("data-review-no"));

		openModal();
		modal.classList.add("detail_review");
	}
	
	function appendModal(detailData) {
		let html = "";

		html += '<div class="image_area">';
		html += 	'<img src="../' + (detailData.reviewImagePath == undefined ? detailData.product.representationImage : detailData.reviewImagePath) + '" alt="리뷰 대표 이미지">';
		html += '</div>';
		html += '<div class="info_area">';
		html +=		'<div class="star_info">';
		html +=			'<div class="star_base">';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html += 		'</div>';
		html += 	'<div class="star_rating_warpper" style="width:' + (24 * detailData.point + 4 * (detailData.point - detailData.point%1) ) + 'px">';
		html +=			'<div class="star_rating">';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=				'<span class="star"></span>';
		html +=			'</div>';
		html +=		'</div>';
		html +=	'</div>';	
		html += '<div class="write_info">';
		html +=		'<p>' + detailData.uid + '</p>';
		html +=		'<p>' + detailData.registerDate + '</p>';
		html += '</div>';
		html += '<div class="menu_info">';
		html += 	'<h4>' + detailData.product.pname + '</h4>';
		html +=		'<div class="option_area">';
		html += 		'<button type="button" class="green_button option">옵션 전체 보기</button>';
		html +=			'<div class="option_layer">';
		html +=				'<div>';
		for(let option of detailData.product.optionList) {
		html +=					'<dl>';
		html +=						'<dt>' + option.name + '</dt>';
		html +=						'<dd>' + option.buyQuantity + '</dd>';
		html +=					'</dl>';
		}
		html += 			'</div>';
		html += 		'</div>';
		html += 	'</div>';
		html += '</div>';
		html += '<div class="text_review">' + detailData.reviewText + '</div>';
		html +=	'<div class="button_area">';
		html += 	'<div>';
		html += 		'<p>리뷰가 맘에 드셨나요?</p>';
		html += 		'<div class="like_area">';
		html += 		'<button>좋아요 버튼</button>';
		html +=			'<span>0</span>';
		html +=		'</div>';
		html += '</div>';
		html += '<button class="green_button buy_button"' + (detailData.status ? "" : "disabled") + '>이 구성 구매하기</button>';

		detailReviewInner.insertAdjacentHTML("beforeend", html);
	}

	function buyButtonClickEventHandler() {
		openModal();
		modal.classList.add("cart");
	}
	
	function moreButtonClickEventHandler() {
		moreButton.setAttribute("disabled", true);
		page.value = Number(page.value) + 1;
		let pageValue = page.value;
		let query = createQuery("", "page", pageValue);
		query = createQuery(query, "categoryList", categoryURLArray);
		query = createQuery(query, "st", resultOrderSelect.value);
		query = createQuery(query, "keyword", searchInput.value);
		
		let xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				if((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
					let responseTextJson = JSON.parse(xhr.responseText);
					appendCard(responseTextJson);
					itemCount.value = Number(itemCount.value) + responseTextJson.length;

					if(itemCount.value < allItemCount.value) {
						moreButton.removeAttribute("disabled");
					} else {
						moreButton.classList.add("hidden");
					}
				} else {
					console.log("ajax 통신 실패");
				}
			}
		}
		
		xhr.open("POST", "listMore");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;");
		xhr.send(query);
	}
	
	function createQuery(query, key, value) {
		console.log(value);
		if(value != "") {
			query += ((query.length > 0) ? "&" : "") + key + "=" + value;
		}

		return query;
	}
	
	function numberFormat(number) {
		let regexp = /\B(?=(\d{3})+(?!\d))/g;
		return number.toString().replace(regexp, ',');
	}
	
	function appendCard(cardInformations) {
		let html = "",
			length = cardInformations.length;

		for(let i=0; i<length; i++) {
			let cardInformation = cardInformations[i];
			let cardHtml = "";

			cardHtml += '<li class="card">';
			cardHtml +=		'<div class="like_area">'
			cardHtml += 		'<button>좋아요 버튼</button>'
			cardHtml += 	'</div>'
			cardHtml +=		'<div class="image_area">';
			cardHtml += 		'<img src="../' + (cardInformation.reviewImagePath == undefined ? cardInformation.product.representationImage : cardInformation.reviewImagePath) + '" alt="리뷰 대표 이미지">';
			cardHtml +=		'</div>';
			cardHtml +=		'<div class="info_area">';
			cardHtml += 		'<div class="star_area">';
			cardHtml += 			'<div class="star_base">';
			cardHtml += 				'<span class="star"></span>';
			cardHtml += 				'<span class="star"></span>';
			cardHtml += 				'<span class="star"></span>';
			cardHtml += 				'<span class="star"></span>';
			cardHtml += 				'<span class="star"></span>';
			cardHtml += 			'</div>';
			cardHtml +=				'<div class="star_rating_warpper" style="width:' + (24 * cardInformation.point + 4 * (cardInformation.point - cardInformation.point%1) ) + 'px">';
			cardHtml +=					'<div class="star_rating">';
			cardHtml +=						'<span class="star"></span>';
			cardHtml +=						'<span class="star"></span>';
			cardHtml +=						'<span class="star"></span>';
			cardHtml +=						'<span class="star"></span>';
			cardHtml +=						'<span class="star"></span>';
			cardHtml +=					'</div>';
			cardHtml +=				'</div>';
			cardHtml +=			'</div>';
			cardHtml +=			'<div class="name">' + cardInformation.product.pname + '</div>';
			cardHtml +=			'<div class="price">' + numberFormat(cardInformation.sum) + '</div>';
			cardHtml +=			'<div class="option_list">';
			cardHtml += 			'<ul>';
			if(cardInformation.product.optionList != undefined) {
				for(let j=0; j<3 && j<cardInformation.product.optionList.length; j++) {
					let option = cardInformation.product.optionList[j];
			cardHtml += 				'<li>' + option.name + '</li>';
				}
			}
			cardHtml += 			'</ul>';
			cardHtml +=			'</div>';
			cardHtml +=		'</div>';
			cardHtml +=		'<div class="button_area">';
			cardHtml +=			'<button type="button" class="detail_button" data-review-no="' + cardInformation.rno + '">자세히 보기</button>';
			cardHtml +=			'<button type="button" class="green_button buy_button" ' + (cardInformation.status ? "" : "disabled") + '>이 구성 구매하기</button>';
			cardHtml +=		'</div>';
			cardHtml +=	'</li>';
			
			html += cardHtml;
		}
		resultList.insertAdjacentHTML("beforeend", html);
	}

	function likeButtonToggleEventHandler(likeButton) {
		if(likeButton.classList.contains("active")) {
			likeButton.classList.remove("active");
			likeButton.innerHTML = "좋아요 버튼";
		} else {
			likeButton.classList.add("active");
			likeButton.innerHTML = "좋아요 해제 버튼";
		}
	}

	function modalClickEventListener(e) {
		if(e.target.tagName == "BUTTON") {
			if(e.target.classList.contains("close_button")) {
				closeModal();
			} else if(e.target.closest(".detail_review_inner")) {
				if(e.target.classList.contains("buy_button")) {
					closeModal();
				} else if(e.target.classList.contains("option")) {
					optionButtonToggleEventHandler(e.target);
				} else if(e.target.closest(".like_area")){
					likeButtonToggleEventHandler(e.target);
				}
			} else if(e.target.closest(".cart_inner")) {
				if(e.target.classList.contains("confirm_button")) {

				} else {
					closeModal();
				}
			}
		}
	}

	function openModal() {
		body.classList.add("modal_open");
		dimmed.classList.add("show");
	}

	function closeModal() {
		body.classList.remove("modal_open");
		dimmed.classList.remove("show");
		modal.classList.remove("detail_review");
		modal.classList.remove("cart");
	}

	function optionButtonToggleEventHandler(optionButton) {
		let optionArea = optionButton.closest(".option_area");

		if (optionArea.classList.contains("layer_open")) {
			optionArea.classList.remove("layer_open");
		} else {
			optionArea.classList.add("layer_open");
		}
	}
	
	function resultOrderChangeEventHandler(e) {
		for(let option of resultOrderSelect.querySelectorAll("option")) {
			option.removeAttribute("selected");
		}
		resultOrderSelect.querySelector("option[value=" + e.target.value + "]").setAttribute("selected", true);

		updateResultList(e.target.value, searchInput.value);
	}

	window.addEventListener("DOMContentLoaded", init);
})();