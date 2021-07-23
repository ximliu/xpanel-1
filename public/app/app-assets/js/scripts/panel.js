(function (window, document, $) {
  'use strict';
//#affiliate  
	layui.use('layer', function(){});
	new Clipboard('.copy-text');
	$(".copy-text").click(function () {
		layer.msg('Copied');
		
    });
    $(".reset-link").click(function () {
		layer.msg('Your invitation link has been reset');
        window.setTimeout("location.href='/portal/affiliate_reset'", 1000);
    });  

//#checkout
/*
			if ({$package->monthly_price != 0}){
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->monthly_price}+".00";	
				document.getElementById('total').innerHTML = "<b>¥ " + {$package->monthly_price}+".00</b>";
				$('.days').val("30");
				$('.money').val({$package->monthly_price});	
				$('.imoney').val({$package->monthly_price});
			}else if ({$package->quater_price != 0}){
			  	document.getElementById('sub-total').innerHTML = "¥ " + {$package->quater_price}+".00";	
				document.getElementById('total').innerHTML = "<b>¥ " + {$package->quater_price}+".00</b>";
				$('.days').val("90");
				$('.money').val({$package->quater_price});
				$('.imoney').val({$package->quater_price});	
			{else if $package->semiannual_price != 0}
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->semiannual_price}+".00";	
				document.getElementById('total').innerHTML = "<b>¥ " + {$package->semiannual_price}+".00</b>";
				$('.days').val("180");
				$('.money').val({$package->semiannual_price});
				$('.imoney').val({$package->semiannual_price});
			{else if $package->annual_price != 0}
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->annual_price}+".00";	
				document.getElementById('total').innerHTML = "<b>¥ " + {$package->annual_price}+".00</b>";
				$('.days').val("360");
				$('.money').val({$package->annual_price});
				$('.imoney').val({$package->annual_price});
			{else if $package->custom_exp()==1 || $package->type == 1}
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->price}+".00";	
				document.getElementById('total').innerHTML = "<b>¥ " + {$package->price}+".00</b>";
				$('.days').val({$package->expire()});
				$('.money').val({$package->price});
				$('.imoney').val({$package->price});
			{/if}
*/		
		var sub = "30";
		$(".sub").click(function(){
			sub = $(this).data('sub');
			if (sub == 30){
				$('#monthly').addClass("active");
				$('#quater').removeClass("active");
				$('#semiannual').removeClass("active");
				$('#annual').removeClass("active");
				var conn = document.getElementById('conn').value;
				var connector = {$package->connector()};
				var dev_toal = (((30/30)*{$Config['conn_price']})* conn).toFixed(2);
				var dev = Number(connector) + Number(conn);
				var total = (Number(dev_toal) + Number({$package->monthly_price})  - Number($('.discount').val())).toFixed(2);
				document.getElementById('dev').innerHTML = dev; 
				document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
				document.getElementById('total').innerHTML = "¥ " + total; 
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->monthly_price}+".00";
				$('.days').val(sub);
				$('.money').val(total);
				$('.conn_price').val(dev_toal);
				$('.imoney').val({$package->monthly_price});
			}else if (sub == 90){
				$('#monthly').removeClass("active");
				$('#quater').addClass("active");
				$('#semiannual').removeClass("active");
				$('#annual').removeClass("active");	
				var conn = document.getElementById('conn').value;
				var connector = {$package->connector()};
				var dev_toal = (((90/30)*{$Config['conn_price']})* conn).toFixed(2);
				var dev = Number(connector) + Number(conn);
				var total = (Number(dev_toal) + Number({$package->quater_price}) - Number($('.discount').val())).toFixed(2);
				document.getElementById('dev').innerHTML = dev; 
				document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
				document.getElementById('total').innerHTML = "¥ " + total; 
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->quater_price}+".00";
				$('.days').val(sub);
				$('.money').val(total);
				$('.conn_price').val(dev_toal);
				$('.imoney').val({$package->quater_price});
			}else if (sub == 180){	
				$('#monthly').removeClass("active");
				$('#quater').removeClass("active");
				$('#semiannual').addClass("active");
				$('#annual').removeClass("active");
				var conn = document.getElementById('conn').value;
				var connector = {$package->connector()};
				var dev_toal = (((180/30)*{$Config['conn_price']})* conn).toFixed(2);
				var dev = Number(connector) + Number(conn);
				var total = (Number(dev_toal) + Number({$package->semiannual_price}) - Number($('.discount').val())).toFixed(2);
				document.getElementById('dev').innerHTML = dev; 
				document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
				document.getElementById('total').innerHTML = "¥ " + total; 
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->semiannual_price}+".00";
				$('.days').val(sub);
				$('.money').val(total);
				$('.conn_price').val(dev_toal);
				$('.imoney').val({$package->semiannual_price});
			}else if (sub == 360){
				$('#monthly').removeClass("active");
				$('#quater').removeClass("active");
				$('#semiannual').removeClass("active");
				$('#annual').addClass("active");	
				var conn = document.getElementById('conn').value;
				var connector = {$package->connector()};
				var dev_toal = (((360/30)*{$Config['conn_price']})* conn).toFixed(2);
				var dev = Number(connector) + Number(conn);
				var total = (Number(dev_toal) + Number({$package->annual_price}) - Number($('.discount').val())).toFixed(2);
				document.getElementById('dev').innerHTML = dev; 
				document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
				document.getElementById('total').innerHTML = "¥ " + total; 
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->annual_price}+".00";
				$('.days').val(sub);
				$('.money').val(total);
				$('.conn_price').val(dev_toal);
				$('.imoney').val({$package->annual_price});
			}else {	
				$('#packageprice').addClass("active");
				var conn = document.getElementById('conn').value;
				var connector = {$package->connector()};
				var dev_toal = (((360/30)*{$Config['conn_price']})* conn).toFixed(2);
				var dev = Number(connector) + Number(conn);
				var total = (Number(dev_toal) + Number({$package->price}) - Number($('.discount').val())).toFixed(2);
				document.getElementById('dev').innerHTML = dev; 
				document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
				document.getElementById('total').innerHTML = "¥ " + total; 
				document.getElementById('sub-total').innerHTML = "¥ " + {$package->price}+".00";
				$('.days').val({$package->expire()});
				$('.money').val(total);
				$('.conn_price').val(dev_toal);
				$('.imoney').val({$package->price});
			}
		});
		
		var type = "2";
		if (type == 2){
					document.getElementById("alipay").hidden = false;
					document.getElementById("wechat").hidden = true;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = true;
					document.getElementById("paypal-button").hidden = true;
		}else if (type == 1){
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = false;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = true;
					document.getElementById("paypal-button").hidden = true;
		}else if (type == 4){
					document.getElementById("balance").hidden = false;
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = true;
					//document.getElementById("crypto").hidden = true;
					document.getElementById("paypal-button").hidden = true;
		}else if (type == 3){
					document.getElementById("paypal-button").hidden = false;
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = true;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = true;
		}else if (type == 5){
					document.getElementById("paypal-button").hidden = true;
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = true;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = false;
		}		
		$(".type").click(function(){
			type = $(this).data("pay");
				if (type == 2){
					document.getElementById("alipay").hidden = false;
					document.getElementById("wechat").hidden = true;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = true;
					document.getElementById("paypal-button").hidden = true;
					$('#alipay-tab').addClass("active");
					$('#wechat-tab').removeClass("active");
					$('#balance-tab').removeClass("active");
					$('#paypal-tab').removeClass("active");
				}else if (type == 1){
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = false;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = true;
					document.getElementById("paypal-button").hidden = true;
					$('#alipay-tab').removeClass("active");
					$('#wechat-tab').addClass("active");
					$('#balance-tab').removeClass("active");
					$('#paypal-tab').removeClass("active");
				}else if (type == 4){
					document.getElementById("balance").hidden = false;
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = true;
					//document.getElementById("crypto").hidden = true;
					document.getElementById("paypal-button").hidden = true;
					$('#alipay-tab').removeClass("active");
					$('#wechat-tab').removeClass("active");
					$('#balance-tab').addClass("active");
					$('#paypal-tab').removeClass("active");
				}else if (type == 3){
					document.getElementById("paypal-button").hidden = false;
					document.getElementById("alipay").hidden = true;
					document.getElementById("wechat").hidden = true;
					document.getElementById("balance").hidden = true;
					//document.getElementById("crypto").hidden = true;
					$('#alipay-tab').removeClass("active");
					$('#wechat-tab').removeClass("active");
					$('#balance-tab').removeClass("active");
					$('#paypal-tab').addClass("active");
				}
				//else if (type == 5){
				//	document.getElementById("paypal-button").hidden = true;
				//	document.getElementById("alipay").hidden = true;
				//	document.getElementById("wechat").hidden = true;
				//	document.getElementById("balance").hidden = true;
				//	document.getElementById("crypto").hidden = false;
				//}		
		});
		function mydev(){
			    var active = $('.days').val();
				//alert(active);
				if (active == "30"){
					var conn = document.getElementById('conn').value;
					var connector = {$package->connector()};
					var dev_toal = (((30/30)*{$Config['conn_price']})* conn).toFixed(2);
					var dev = Number(connector) + Number(conn);
					var total = (Number({$package->monthly_price}) + Number(dev_toal) - Number($('.discount').val())).toFixed(2);
					document.getElementById('dev').innerHTML = dev; 
					document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
					document.getElementById('total').innerHTML = "¥ " + total; 
					$('.money').val(total);
					$('.conn_price').val(dev_toal);
				}else if (active == "90"){
					var conn = document.getElementById('conn').value;
					var connector = {$package->connector()};
					var dev_toal = (((90/30)*{$Config['conn_price']})* conn).toFixed(2);
					var dev = Number(connector) + Number(conn);
					var total = (Number({$package->quater_price}) + Number(dev_toal) - Number($('.discount').val())).toFixed(2);
					document.getElementById('dev').innerHTML = dev; 
					document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
					document.getElementById('total').innerHTML = "¥ " + total;
					$('.money').val(total);	
					$('.conn_price').val(dev_toal);
				}else if (active == "180"){
					var conn = document.getElementById('conn').value;
					var connector = {$package->connector()};
					var dev_toal = (((180/30)*{$Config['conn_price']})* conn).toFixed(2);
					var dev = Number(connector) + Number(conn);
					var total = (Number({$package->semiannual_price}) + Number(dev_toal) - Number($('.discount').val())).toFixed(2);
					document.getElementById('dev').innerHTML = dev; 
					document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
					document.getElementById('total').innerHTML = "¥ " + total;
					$('.money').val(total);	
					$('.conn_price').val(dev_toal);
				}else if (active == "360"){
					var conn = document.getElementById('conn').value;
					var connector = {$package->connector()};
					var dev_toal = (((360/30)*{$Config['conn_price']})* conn).toFixed(2);
					var dev = Number(connector) + Number(conn);
					var total = (Number({$package->annual_price}) + Number(dev_toal) - Number($('.discount').val())).toFixed(2);
					document.getElementById('dev').innerHTML = dev; 
					document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
					document.getElementById('total').innerHTML = "¥ " + total;
					$('.money').val(total);	
					$('.conn_price').val(dev_toal);
				}else{
					var conn = document.getElementById('conn').value;
					var connector = {$package->connector()};
					var dev_toal = ((({$package->expire()}/30)*{$Config['conn_price']})* conn).toFixed(2);
					var dev = Number(connector) + Number(conn);
					var total = (Number({$package->price}) + Number(dev_toal) - Number($('.discount').val())).toFixed(2);
					document.getElementById('dev').innerHTML = dev; 
					document.getElementById('dev-total').innerHTML = "¥ " + dev_toal; 
					document.getElementById('total').innerHTML = "¥ " + total;
					$('.money').val(total);
					$('.conn_price').val(dev_toal);
				}
		}
		$("#coupon_input").click(function(){
			var coup = $("#coupon").val();
			if(coup==""||coup==null){
					layer.msg('Coupon code required');
					return;
			}		
			var conn_price = $('.conn_price').val();
			var amount = $('.imoney').val();
			var package = {$package->id};
			$.ajax({
				type: "POST",
				url: "/portal/coupon_check",
				dataType: "json",
				data: {
					package: package,
					amount: amount,
					conn_price:conn_price,
					coupon: $("#coupon").val()
				},
				success: (data) => {
					if (data.ret) {
						document.getElementById('credit').innerHTML = "¥ " + data.credit;
						document.getElementById('total').innerHTML = "¥ " + data.total;						
						 document.getElementById('sub-total').innerHTML = "¥ " + data.subtotal;	
						document.getElementById("coupon_input").hidden = true;
						document.getElementById("coup").hidden = false;	
						$('.discount').val(data.credit);
						$('.money').val(data.total);	
						layer.msg(data.msg);
						document.getElementById("coupon").disabled = true;
					} else {
						layer.msg(data.msg);	
						window.setTimeout("location.reload()", 2000);				

					}
				},
				error: (jqXHR) => {
						layer.msg('err');
				}
			})
		});

		$("#balance").click(function () {
			{if $user->expire_in < date("Y-m-d H:i:s") && $package->type == 1}
				layer.msg('Only for active (used up) Data Plan');
				return;
			{/if}
			var amount = $('.imoney').val();
			var conn_price = $('.conn_price').val();
			var conn_num = $('.conn').val();
			var days = $('.days').val();
			var package = {$package->id};
			$.ajax({
				type: "POST",
				url: "/portal/buy",
				dataType: "json",
				data: {
					package: package,
					coupon: $("#coupon").val(),
					conn_price:conn_price,
					conn_num:conn_num,
					amount:amount,
					days:days
				},
				success: (data) => {
					console.log(data);
					if (data.ret !=1) {
						layer.msg(data.msg);
						//window.setTimeout("location.reload()", 2000);
						
					} else if(data.ret=1){
						layer.msg(data.msg);
						window.setTimeout("location.href='/portal/order'", 2000);
					}
				},
				error: (jqXHR) => {
						layer.msg('err');
				}
			})
		});

		$("#crypto").click(function () {
			{if $user->expire_in < date("Y-m-d H:i:s") && $package->type == 1}
				layer.msg('Only for active (used up) Data Plan');
				return;
			{/if}			
			var package = {$package->id};
			var amount = $('.imoney').val();
			var days = $('.days').val();
			var conn_price = $('.conn_price').val();
			var conn_num = $('.conn').val();
			$.ajax({
				type: "POST",
				url: "/portal/crypto",
				dataType: "json",
				data: {
					package: package,
					coupon: $("#coupon").val(),
					amount:amount,
					conn_price:conn_price,
					conn_num:conn_num,
					days:days
				},
				success: (data) => {
					console.log(data);
					if (data.ret !=1) {
						layer.msg(data.msg);
						//window.setTimeout("location.reload()", 2000);
						
					} else if(data.ret=1){
						layer.msg('Redirecting to Payment 。。。。');
						window.location.href = data.url;
					}
				},
				error: (jqXHR) => {
						layer.msg('err');
				}
			})
		});

		$("#alipay").click(function(){
				{if $user->expire_in < date("Y-m-d H:i:s") && $package->type == 1}
					layer.msg('Only for active (used up) Data Plan');
					return;
				{/if}			
				var package = {$package->id};
				//var coupon = $("input:text").val();
				var amount = $('.imoney').val();
				var days = $('.days').val();
				var conn_price = $('.conn_price').val();
				var conn_num = $('.conn').val();
				$.ajax({
					type: "POST",
					url: "/portal/vpay",
					dataType: "json",
					data: {
						type: 2,
						package: package,
						coupon: $("#coupon").val(),
						amount:amount,
						conn_price:conn_price,
						conn_num:conn_num,
						days:days
					},
					success: (data) => {
								//console.log(data);
								if(data.ret) {
									if (data.id) {
										$order_id = data.id;
										document.getElementById('pay_amount').innerHTML = "¥ " + data.pay_amount;
										document.getElementById('payframm').src = data.url;
										$("#payment2").modal({
										backdrop: 'static',
										keyboard: false
										});	
										Ordestatus($order_id);
									}else if (data.bal){
										layer.msg(data.msg);	
										window.setTimeout("location.href='/portal/order'", 3000);
									}
								}else{
									layer.msg(data.msg);	
									window.setTimeout("location.reload()", 2000);						
								}	
					},
					error: (jqXHR) => {
							layer.msg("ERR");
					}
				});	
				{literal}
				function PayDelete(id) {
						$.ajax({
							type: "POST",
							url: "/portal/delorder",
							dataType: "json",
							data: {id},
							success: (data) => {
							//console.log(data);
										if (data.ret=1) {
											document.getElementById('payframm').src = data.url;
											$("#payment2").modal('hide');
											clearTimeout(qi);
											layer.msg('Order Cancelled');
											//window.setTimeout("location.href=window.location.href", 3000);
										} else {
											 layer.msg('err');
										}
							},
							error: (jqXHR) => {
											 layer.msg('err');
							}
						});
				}
				var qi;
				function Ordestatus(id) {
						$.ajax({
							type: "GET",
							url: "/portal/orderstatus", 
							dataType: "json",
							data: {id},
							success: (data) => {
									//console.log(data);
									if (data.ret ==1) {
										if (data.result == 1 || data.result == 2){
											clearTimeout(qi);
											$("#payment2").modal('hide');
											layer.msg('Payment Successful');
											window.setTimeout("location.href='/portal/order'", 2000);
											
										}else if (data.result == -1){
											 $("#payment2").modal('hide');
											 clearTimeout(qi);
											 layer.msg('PAYMENT TIMEOUT ,CONTACT ADMIN IF PAYMENT UNSUCCESSFUL AFTER PAYMENT COMPLETED');
											  
										}
									}else{
										layer.msg('err');
									}	
							},
							error: (jqXHR) => {
										clearTimeout(qi);
										//$("#payment2").modal('hide');
							}
						});
					qi = setTimeout(function () {
						Ordestatus(id);
					}, 2000);	
				};	
				{/literal}
				$('#delorder').unbind('click').click(function () {
						if (confirm("ARE YOU SURE YOU WANT TO CANCEL THE ORDER？")) {                   
							PayDelete($order_id);
							clearTimeout(qi);
						}
				 });
		});
		$("#wechat").click(function(){
				{if $user->expire_in < date("Y-m-d H:i:s") && $package->type == 1}
					layer.msg('Only for active (used up) Data Plan');
					return;
				{/if}
				var package = {$package->id};
				var amount = $('.imoney').val();
				var days = $('.days').val();
				//var coupon = $("input:text").val();
				var conn_price = $('.conn_price').val();
				var conn_num = $('.conn').val();
				$.ajax({
					type: "POST",
					url: "/portal/vpay",
					dataType: "json",
					data: {
						type: 1,
						package: package,
						coupon: $("#coupon").val(),
						amount:amount,
						conn_price:conn_price,
						conn_num:conn_num,
						days:days
					},
					success: (data) => {
								//console.log(data);
								if(data.ret) {
									if (data.id) {
										$order_id = data.id;
										document.getElementById('pay_amount').innerHTML = "¥ " + data.pay_amount;
										document.getElementById('payframm').src = data.url;
										$("#payment2").modal({
										backdrop: 'static',
										keyboard: false
										});	
										Ordestatus($order_id);
									}else if (data.bal){
										layer.msg(data.msg);	
										window.setTimeout("location.href='/portal/order'", 3000);
									}
								}else{
									layer.msg(data.msg);	
									window.setTimeout("location.reload()", 2000);						
								}
					},
					error: (jqXHR) => {
							layer.msg('err');
					}
				});	
				{literal}
				function PayDelete(id) {
						$.ajax({
							type: "POST",
							url: "/portal/delorder",
							dataType: "json",
							data: {id},
							success: (data) => {
										if (data.ret=1) {
											//console.log(data);
											document.getElementById('payframm').src = data.url;
											$("#payment2").modal('hide');
											clearTimeout(qi);
											layer.msg('Order Cancelled');
											//window.setTimeout("location.href=window.location.href", 3000);
										} else {
											 layer.msg('err');
										}
							},
							error: (jqXHR) => {
											 layer.msg('err');
							}
						});
				}
				var qi;
				function Ordestatus(id) {
						$.ajax({
							type: "GET",
							url: "/portal/orderstatus", 
							dataType: "json",
							data: {id},
							success: (data) => {
									//console.log(data);
									if (data.ret ==1) {
										if (data.result == 1 || data.result == 2){
											clearTimeout(qi);
											$("#payment2").modal('hide');
											layer.msg('Payment Successful');
											window.setTimeout("location.href='/portal/order'", 2000);
											
										}else if (data.result == -1){
											 $("#payment2").modal('hide');
											 clearTimeout(qi);
											 layer.msg('PAYMENT TIMEOUT ,CONTACT ADMIN IF PAYMENT UNSUCCESSFUL AFTER PAYMENT COMPLETED');
											  
										}
									}else{
										layer.msg('err');
									}	
							},
							error: (jqXHR) => {
										clearTimeout(qi);
										//$("#payment2").modal('hide');
							}
						});
					qi = setTimeout(function () {
						Ordestatus(id);
					}, 2000);	
				};	
				{/literal}
				$('#delorder').unbind('click').click(function () {
						if (confirm("ARE YOU SURE YOU WANT TO CANCEL THE ORDER？")) {
							PayDelete($order_id);
							clearTimeout(qi);
						}
				 }); 
		});

        paypal_sdk.Buttons({			
			style: {
                color:  'blue',
                shape:  'pill',
                label:  'pay', 
				layout: 'horizontal',
                height: 40
            },	
            createOrder: function(data, actions) {			
			{if $user->expire_in < date("Y-m-d H:i:s") && $package->type == 1}
				layer.msg('Only for active (used up) Data Plan');
				return;
			{/if}
				var package = {$package->id};				
				var amount = $('.imoney').val();
				var days = $('.days').val();
				var conn_price = $('.conn_price').val();
				var conn_num = $('.conn').val();
                return fetch("/portal/paypal", {
                    method: 'post',
					 headers: {
					  'content-type': 'application/json',
					  'Access-Control-Allow-Origin': '*'
					},body: JSON.stringify({
						action: "create-online",
						package: package,
						coupon: $("#coupon").val(),
						amount:amount,
						conn_price:conn_price,
						conn_num:conn_num,
						days:days
						
					})
                }).then(function(res) {
                    return res.json();
                }).then(function(orderData) {
					if(orderData.ret==0){
						layer.msg(orderData.msg);
						return;
					}else{
						return orderData.id;
					}
                });
            },
            // Call your server to finalize the transaction
			onApprove: function(data, actions){
				return fetch("/portal/paypal", {
					method: "POST",
					headers: {
						'content-type': 'application/json',
						'Access-Control-Allow-Origin': '*'
					},
					body: JSON.stringify({
						action: "save-order",
						id: data.orderID
					})
				}).then(function(res) {
					return res.json();
				}).then(function(data){
					//=== Redirect to thank you/success page after saving transaction
					if(data.success){
						layer.msg('Payment Successful');
						window.setTimeout("location.href='/portal/order'", 500);
					}
				});
			},         
			onCancel: function(data, actions) {
					return fetch("/portal/paypal", {
					method: "POST",
					headers: {
						'content-type': 'application/json',
						'Access-Control-Allow-Origin': '*'
					},
					body: JSON.stringify({
						action: "cancel-order",
						id: data.orderID
					})
				}).then(function(res) {
					return res.json();
				}).then(function(data){
					if(data.success){
						layer.msg('Payment Cancelled');
					}
				});
			}
        }).render('#paypal-button');
})(window, document, jQuery); 