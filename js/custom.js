/* ���������ɫ */
function randomColor() {
	return "rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")";
}

/* �����������Ч */
var a_idx = 0;
var a_click = 1;
var a = new Array("��ǿ", "����", "����", "��г", "����", "ƽ��", "����" ,"����", "����", "��ҵ", "����", "����",
			"�ϸ���", "���ҷ�", "������word��", "����������", "�����㹽", "�������ֲ���?", "���������ֲ���",
			"ƤƤϺ������", "Ц�����", "ʯ��־", "�����ڵ�", "�ڳ�!", "��Ҫ�³�!", "����ֻ�Ǹ�����", "�벻Ҫ�Ź���",
			"������ϲ?", "�ⲻ����?", "����һ���󵨵��뷨", "������Ĳ���ʹ��", "�������û��b����", "û��,�Һ�����",
			"��", "����", "�¶���", "�ٻ�֮��", "�컯������", "��ȥ�򼸸�����", "���վ�ڴ˵�", "��Ҫ�߶�",
			"�ҿ��ܶ��˼���", "ƶ���������ҵ�������", "��call", "��Ȼ��ѡ��ԭ������", "����freestyle��",
			"������������", "��֪������ǿ��", "�ڴ�����ܿ���", "һ������������", "��ͨ��ͥ����",
			"�����", "����������", "�㻹��", "���ٵ�!", "�б��¼�����!", "������", "��Ͷ��",
			"w(������)w", "(#`O��)", "��/T��T)/", "�ѩҩn�ѩ�", "_(:3����)_");
jQuery(document).ready(function($) {
    $("body").click(function(e) {
		/* ���Ƶ�ʣ�������ξͻ����� */
		var frequency = 2;
		if (a_click % frequency === 0) {
			
			var $i = $("<span/>").text(a[a_idx]);
			a_idx = (a_idx + 1) % a.length;
			var x = e.pageX,
			y = e.pageY;
			$i.css({
				"z-index": 9999,
				"top": y - 20,
				"left": x,
				"position": "absolute",
				"font-weight": "bold",
				"color": randomColor(),
				"-webkit-user-select": "none",
				"-moz-user-select": "none",
				"-ms-user-select": "none",
				"user-select": "none"
			});
			$("body").append($i);
			$i.animate({
				"top": y - 180,
				"opacity": 0
			},
			1500,
			function() {
				$i.remove();
			});
			
		}
	a_click ++;
		
    });
});

/* ��ķ��ķ�ص�������ײ���ť */
$(function() {
	$("#lamu img").eq(0).click(function() {
		$("html,body").animate({scrollTop:$(document).height()},800);
		return false;
	});
	$("#leimu img").eq(0).click(function() {
		$("html,body").animate({scrollTop:0},800);
		return false;
	});
});

/* �ֲ�����ͼƬ */
$(function () {
	$.backstretch([
		  "/images/background/60c97d3a34045c61594c91463b846f39.jpg",
		  "/images/background/798fe8e1617a8f99f185fa8e4a350932.jpg",
		  "/images/background/390f3fb55dd7fa45cb5e479fa9dc318c.jpg"
	], { duration: 60000, fade: 1500 });
});
