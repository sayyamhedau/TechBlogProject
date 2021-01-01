function doLike(pid, uid) {

	const d = {
		pid : pid,
		uid : uid,
		operation : 'like'
	};

	$.ajax({
		url : './postLike',
		data : d,
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trim() == 'true') {
				let count = $(".like-counter").html();
				count++;
				$('.like-counter').html(count);
			}
		},
		error : function(data, textStatus, errorThrown) {
			console.log(data)
		}
	});
}



