$(function() {
	var json = [{
		"id": 1,
		"name": "公共课政治全程班"
	}, {
		"id": 2,
		"name": "公共课英语一全程班"
	}, {
		"id": 3,
		"name": "公共课英语二全程班"
	}, {
		"id": 4,
		"name": "公共课数学一全程班"
	}, {
		"id": 5,
		"name": "公共课数学二全程班"
	}, {
		"id": 6,
		"name": "公共课数学三全程班"
	}, {
		"id": 7,
		"name": "公共课政治精品班"
	}, {
		"id": 8,
		"name": "公共课英语一精品班"
	}, {
		"id": 9,
		"name": "公共课英语二精品班"
	}, {
		"id": 10,
		"name": "公共课数学一精品班"
	}, {
		"id": 11,
		"name": "公共课数学二精品班"
	}, {
		"id": 12,
		"name": "公共课数学三精品班"
	}, {
		"id": 13,
		"name": "致简集训班"
	}, {
		"id": 14,
		"name": "致简密训班"
	}, {
		"id": 15,
		"name": "致简特训班"
	}, {
		"id": 16,
		"name": "致简管理联考版"
	}, {
		"id": 17,
		"name": "致简法律硕士直通班"
	}]

	$('.course_list1 .swiper-slide').click(function() {
		var idx = $(this).index() + 13;
		var href = 'to/mdetail.html' + '?type=' + idx;
		console.log(href)
		window.location.href = href;
	})
	$('.course_list2 .swiper-slide').click(function() {
		var id = $(this).index() + 1;
		var href = 'to/pub_detail.html' + '?type=' + id;
		window.location.href = href;
	})
	$('.course_list3 .swiper-slide').click(function() {
		var id = $(this).index() + 7;
		var href = 'to/pub_detail.html' + '?type=' + id;
		window.location.href = href;
	})
})