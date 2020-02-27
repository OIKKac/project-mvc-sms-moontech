<%--
  Created by IntelliJ IDEA.
  User: ACJ_NOTEBOOK1
  Date: 2020-02-20
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<jsp:useBean id="currTime" class="java.util.Date" />

<jsp:include page="/resources/include/header.jsp" />
<div>
    ---<hr>
    <form role="form" method="post" action="/matIn/write">
        <!-- hidden value for summit -->
        <input type="hidden" name="matSqList" id="matSqList">
        <input type="hidden" name="stockAmtList" id="stockAmtList">
        <input type="hidden" name="inAmtList" id="inAmtList">
        <!--
        <input type="hidden" name="empNo" value="${empNo}">
        <input type="hidden" name="inSq" value="${inSq}">
        <input type="hidden" name="purSq" id="purSq" value="${purSq}">
        -->
        <!-- Summit Data for Test -->
        <input type="hidden" name="empNo" value="1">
        <input type="hidden" name="inSq" value="${inSq}">
        <input type="hidden" name="purSq" id="purSq" value="1">


        <!-- Main Session -->
        <div class="col-xl-12 order-xl-1">
            <div class="card bg-secondary shadow">
                <!-- Page Header -->
                <div class="card-header bg-white border-0">
                    <div class="row align-items-center">
                        <div class="col-8">
                            <h3 class="mb-0">입고서 작성</h3>
                        </div>
                        <div class="col-4 text-right">
                            <div class="progress-label">
							<span><fmt:formatDate value="${currTime}"
                                                  pattern="yyyy년 MM월 dd일" /></span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- MatIn Insert Form -->
                <div class="card-body">
                    <div class="pl-lg-4">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group focused">
                                    <label class="form-control-label" for="input-username">입고번호</label>
                                    <input type="text" id="input-username"
                                           class="form-control form-control-alternative"
                                           value="${inSq}" disabled>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-username">거래처</label>
                                        <input type="text" name="purNm"   id="purNm"
                                               class="form-control form-control-alternative" >
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <br><input type="button" value = "검색" onclick = "openPopUp()"  class="btn btn-icon btn-3 btn-primary"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr class="my-4">

                    <div class="card-body">
                        <div class="row">
                            <!-- 1.list -->


                            <!-- 3.registList -->

                        </div>
                    </div>


                    <!-- RegistDe -->
                    <div class="row">
                        <!-- listAll -->
                        <div class="col-xl-13">
                            <div class="card shadow cj">
                                <div class="card-header border-0">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h3 class="mb-0">재료 선택</h3>
                                        </div>
                                    </div>
                                </div>
                                <tr>
                                    <div class="col-xl-auto">
                                        <div class="form-group">
                                            <div class="input-group mb-4">
                                                <div class="input-group-prepend">
												<span class="input-group-text"><i
                                                        class="ni ni-zoom-split-in"></i> </span>
                                                </div>
                                                <input class="form-control" placeholder="Search" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </tr>
                                <div class="table-responsive-cus1">
                                    <!-- Projects table -->
                                    <table class="table align-items-center table-flush cj"
                                           id="stuList">
                                        <thead class="thead-light">
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="mat">
                                            <tr>
                                                <td><input type="checkbox" name="check" value="${mat.matSq}"></td>
                                                <td>${mat.matNm}</td>
                                                <td>${mat.stockAmt}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>




                        <!-- registList -->
                        <div class="col-xl-13">
                            <div class="col-xl-auto">
                                <div class="card shadow cj">
                                    <div class="card-header border-0">
                                        <div class="row align-items-center">
                                            <div class="col">
                                                <h3 class="mb-0">입고 재료</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <tr>
                                        <div class="col-xl-auto">
                                            <div class="form-group">
                                                <div class="input-group mb-4">
                                                    <div class="input-group-prepend">
													<span class="input-group-text"><i
                                                            class="ni ni-zoom-split-in"></i> </span>
                                                    </div>
                                                    <input class="form-control" placeholder="Search" type="text">
                                                </div>
                                            </div>
                                        </div>
                                    </tr>
                                    <div class="table-responsive-cus1">
                                        <!-- Projects table -->
                                        <table class="table align-items-center table-flush cj"
                                               id="attList">
                                            <thead class="thead-light">
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- 2.btn -->
                        <button class="btn btn-primary" id="add" type="button">추가</button>
                        <button class="btn btn-danger" id="delete" type="button">삭제</button>
                        <button class="btn btn-Secondary" type="button" id="btn-submit">등록</button>
                    </div>
                </div>
            </div>
    </form>
</div>


<script>

  // 추가
  $("#add").click(function() {
    var checkbox = $("input[name=check]:checked");
    checkbox.each(function() {
      var tr = $(this).parent().parent();
      var td = tr.children();
      var matSq = $(this).val();
      var matNm = td.eq(1).text();
      var stockAmt = td.eq(2).text();
      var row =
          "<tr>" +
            "<td>" + "<input type=\"checkbox\" class=\"checkBox2\" name=\"check2\" value=\"" + matSq + "\"" + ">" + "</td>" +
            "<td class=\"matNm\">" + matNm + "</td>" +
            "<td>" + stockAmt + "</td>" +
            "<td>" + "<input type=\"text\" class=\"inAmt\" name=\"inAmt\" value=\"0\"></td>" +
            "<td>" + "<input type=\"hidden\" class=\"stockAmt\" value=\"" + stockAmt + "\"" + ">" + "</td>" +
          "</tr>";
      // 숨긴 값의 체크박스를 false 상태로 바꿈"
      $(this).prop("checked", false);
      tr.remove();
      $("#attList > tbody").append(row);
      $("#allCheck1").prop("checked", false);
    })
  });

  //삭제
  $("#delete").click(function() {
    var checkbox = $("input[name=check2]:checked");
    checkbox.each(function() {

      var tr = $(this).parent().parent();

      var td = tr.children();

      var picture = td.eq(1).text();

      var matNm = td.eq(2).text();

      var stockAmt = td.eq(3).text();

      var matSq = $(this).val();



      var row = "<tr class=\"stu"+ matSq +"\"> "
          + "<td>"
          + "<input type=\"checkbox\" class=\"checkBox\" name=\"check\" value=\"" + matSq + "\"" + ">"
          + "</td>" + "<td>" + picture
          + "</td>" + "<td>" + matNm
          + "</td>" + "<td>" + stockAmt
          + "</td>" + "</tr>";

      // 숨긴 값의 체크박스를 false 상태로 바꿈
      $(this).prop("checked", false);
      tr.remove();
      $("#stuList > tbody").append(row);

      $("#allCheck2").prop("checked", false);

    })

  });

  //submit 버튼
  $(document).ready(function(){
    var formObj = $("form[role='form']");
    $("#btn-submit").on("click", function(){
      var array_matSq = Array();
      var array_stockAmt = Array();
      var array_inAmt = Array();

      var chkbox = $(".checkBox2");
      var stockAmt = $(".stockAmt");
      var inAmt = $(".inAmt");

      for(i=0; i<chkbox.length; i++) {
        array_matSq[i] = chkbox[i].value;
        array_stockAmt[i] = stockAmt[i].value;
        array_inAmt[i] = inAmt[i].value;
      }

      $("#matSqList").val(array_matSq);
      $("#stockAmtList").val(array_stockAmt);
      $("#inAmtList").val(array_inAmt);
      formObj.submit();
    });
  });
</script>
<jsp:include page="/resources/include/footer.jsp" />
