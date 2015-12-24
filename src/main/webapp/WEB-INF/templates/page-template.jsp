<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<head>
<meta charset="utf8" />
<meta name="description" content="My first demo jee application" />
<meta name="keywords" content="jee, java, web, demo, webtasks" />
<meta name="author" content="nata" />
<title>Demo web application</title>

<link rel="stylesheet" type="text/css"
	href="${CONTEXT }/resources/css/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" type="text/css"
	href="${CONTEXT }/resources/css/main.css" />
<script type="text/javascript"
	src="${CONTEXT }/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="${CONTEXT }/resources/js/webtasks.js"></script>
	<script type="text/javascript"
	src="${CONTEXT }/resources/js/jquery-ui-1.10.4.custom.js"></script>

<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type ="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd/mm/yy"
		});
		$("#anim").change(function() {
			$("#datepicker").datepicker("option", "showAnim", $(this).val());
		});
	});

	var context = "${CONTEXT}";
</script>
	<script>
	function chck(url) {
		var x=0;
		for (i=0; i<document.getElementsByName("id").length; i++) {
			if (document.getElementsByName("id")[i].checked) {
				document.getElementById("but1").value=document.getElementsByName("id")[i].value;
				x++;
			}
		}

		if (x<1) {
			alert("не выбрано ни одного поля");
			document.getElementById("form").action="";
		}
		if (x>1) {
			alert("выбрано ,больше одного поля");
			document.getElementById("form").action="";
		}
		if (x==1) {
			document.getElementById("form").action=url;
		}
	}

</script>
	<script>
		function chck1(url) {
			var x=0;
			for (i=0; i<document.getElementsByName("id").length; i++) {
				if (document.getElementsByName("id")[i].checked) {
					document.getElementById("but3").value=document.getElementsByName("id")[i].value;
					x++;
				}
			}

			if (x<1) {
				alert("не выбрано ни одно поле");
				document.getElementById("form2").action="";
			}
			if (x>1) {
				alert("выбрано ,больше одного поля");
				document.getElementById("form2").action="";
			}
			if (x==1) {
				document.getElementById("form2").action=url;
			}
		}

	</script>
	<script>
	function chckspace(url) {
	if (document.getElementById("1").value=="" || document.getElementById("2").value=="" || document.getElementById("3").value=="" || document.getElementById("datepicker").value==""){
		alert("не все поля заполнены");
		return false;
	}else{
		document.getElementById("form").action=url;
	}
	}
	</script>
	<script>
		function chckspace1(url) {
			if (document.getElementById("1").value==""){
				alert("не все поля заполнены");
				return false;
			}else{
				document.getElementById("form").action=url;
			}
		}
	</script>
	<script>
	function deleteStudents() {
	var items = $("input[type=checkbox]:checked");
	if (items.length == 0) {
	alert("Пожалуйста выберите поля");
	return;
	}
	var ids = "";
	for ( var i = 0; i < items.length; i++) {
	ids += $(items[i]).attr("value");
	if (i < items.length - 1) {
	ids += ",";
	}
	}
	console.log(ids);
	console.log("ids=" + ids);
	var form = '<form id="deleteStudentForm" action="'
+ context
+ '/admin//student/studentDelete.php" method="post"><input type="hidden" name="ids" /></form>';
	$("body").append(form);
	$('#deleteStudentForm input').val(ids);
	$('#deleteStudentForm').submit();
	}
	</script>
	<script>
		function deleteDisc() {
			var items = $("input[type=checkbox]:checked");
			if (items.length == 0) {
				alert("Пожалуйста выберите поля");
				return;
			}
			var ids = "";
			for ( var i = 0; i < items.length; i++) {
				ids += $(items[i]).attr("value");
				if (i < items.length - 1) {
					ids += ",";
				}

			}
			console.log(ids);
			console.log("ids=" + ids);
			var form = '<form id="deleteStudentForm" action="'
					+ context
					+ '/admin/discipline/disciplineDelete.php" method="post"><input type="hidden" name="ids" /></form>';
			$("body").append(form);
			$('#deleteStudentForm input').val(ids);
			$('#deleteStudentForm').submit();
		}
	</script>
	<script>
		function selected() {
			var val;
			select = document.getElementById("comboStud");
			val = select.options[select.selectedIndex].value;
			alert(val);
			return false;
		}
	</script>

	<script>
		function send() {
			var val;
			val=document.getElementById("textTerm").text;
			document.getElementById("form1").action="${CONTEXT}${CURRENT_MAPPING}/term/termModify.php?sel="+val;
		}
	</script>
	<script>
		function send1() {
			var val;
			val=document.getElementById("textTerm").text;
			document.getElementById("form1").action="${CONTEXT}${CURRENT_MAPPING}/term/termCreate.php?sel="+val;
		}
	</script>
	<script>
		function send2() {
			var val;
			val=document.getElementById("textTerm").text;
			document.getElementById("form1").action="${CONTEXT}${CURRENT_MAPPING}/term/termDelete.php?sel="+val;
		}
	</script>
	<script>
		function multi() {
			var options = $('#selectedT')[0].options;
			var i;
			var mass="";
			for (i=0; i<options.length; i++) {
				if (options[i].selected==true) {
					mass=options[i].value+","+mass;
					alert(mass)
				}
			}
			$('#mass').val(mass);
		}
	</script>
    <script>
    function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
    vars[key] = value;
    });
    return vars;
    }
    </script>
    <script>
        function push()
        {
            var sel = getUrlVars()["sel"];
            alert(sel);
            return sel;
        }
    </script>


</head>

<body>
<header class="maxw">
	<ul>
		<li id='box'>
			Системма управления студентами и их успеваемостью
		</li>
		<li ><jsp:include page="logout/logoutLink.jsp" flush="true" /></li>
	</ul>
	</header>
	<section>
		<jsp:include page="${currentPage}" flush="true" />
	</section>
</body>
</html>