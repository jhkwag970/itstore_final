
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
<<<<<<< HEAD
    <link rel="stylesheet" href="/resources/static/css/cart.css" type="text/css">

</head>
<body>
<div class="wrapper2">
<h1>장바구니</h1>


<div class="wrapcart">
${qtyError}<br>
${qtyZero}<br>
<c:forEach items="${carts}" var="items">
    <div class="oneitem" id =${items.cart_id} >
            <div class="imagebox">
                <div class="image1"></div>
            </div>
           <div class="iteminfobox">

                <div class="iteminfo">
                ${items.productsVO.product_name} ${items.modelsVO.model_name}${items.specVO.spec_color}
                ${items.cart_id}
                </div>
               <div class="count">
                <select id="qty${items.cart_id}" onchange="updateQty(this.id, this.value)">
                    <c:forEach var="i" begin="1" end="${items.specVO.spec_qty}">
                        <c:choose>
                            <c:when test="${i eq items.cart_qty}">
                                <option value="${i}" selected>${i}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${i}">${i}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
               </div>
               <div class="price">
                   <span>₩</span>
                   <span id ="pri${items.cart_id}">${items.cart_price * items.cart_qty}</span>

            <div class= "delete" id="del${items.cart_id}" onclick="delCart(this.id)">
                삭제
            </div>
               </div>
           </div>
            <div class="carebox">
                <div class="carehave">보증있는지없는지</div>
            </div>
    </div>
</c:forEach>

        <div class="finalblock">
        <div class="finaltotal">
            <span class="finaltotalname"> 총계</span>
            <span id="totalPrice" class="totalPrice">
                ${totalPrice}
            </span>₩<br>
        </div>
        <div class="addressblock">
            <button class="goaddressbtn" onclick="location.href='/carts/member/mailinginformation' ">주소지 설정</button>
        </div>
        </div>
</div>
=======
</head>
<body>

<h1>장바구니</h1>
<hr>

${qtyError}<br>
${qtyZero}<br>
<c:forEach items="${carts}" var="items">
    <div id =${items.cart_id}>
        ${items.productsVO.product_name} ${items.modelsVO.model_name}${items.specVO.spec_color} <br>
        ${items.cart_id}
        <span id ="pri${items.cart_id}">${items.cart_price * items.cart_qty}</span>

        <select id="qty${items.cart_id}" onchange="updateQty(this.id, this.value)">
            <c:forEach var="i" begin="1" end="${items.specVO.spec_qty}">
                <c:choose>
                    <c:when test="${i eq items.cart_qty}">
                        <option value="${i}" selected>${i}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${i}">${i}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        <div id="del${items.cart_id}" onclick="delCart(this.id)">
            삭제
        </div>
        <hr>
    </div>
</c:forEach>



<span id="totalPrice">
    <h1 style="display: inline">${totalPrice}</h1>
</span><h1 style="display: inline">원</h1><br>
<a href="/carts/member/mailinginformation">주소지 설정</a>

>>>>>>> 32feb2bff50dcec39d042566e7c7477c0c32d463
<script>
    function updateQty(id ,value){
        var cartId = id.substring(3);
        var qty = value;

        //ajax work to remove from carts db
        $.ajax({
            url: "/carts/member/updateQty",
            type:"post",
            data:{
                cart_id:cartId,
                cart_qty:qty
            },
            dataType: "json",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                document.getElementById("totalPrice").innerHTML = "<h1 style='display: inline'>" + data.total + "</h1>";
                document.getElementById("pri"+cartId).innerHTML = data.itemPrice;
            },
            error: function() {
                alert("error");
            }
        });

    }
    function delCart(id){
        var cartId = id.substring(3);
        document.getElementById(cartId).remove();

        //ajax work to remove from carts db
        $.ajax({
            url: "/carts/member/deleteCart",
            type:"post",
            data:{cart_id:cartId},
            dataType: "json",
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                document.getElementById("totalPrice").innerHTML = "<h1 style='display: inline'>" + data.total + "</h1>";
            },
            error: function() {
                alert("error");
            }
        });
    }
</script>
<<<<<<< HEAD
</div>
</body>
</html>
=======

</body>
</html>
>>>>>>> 32feb2bff50dcec39d042566e7c7477c0c32d463
