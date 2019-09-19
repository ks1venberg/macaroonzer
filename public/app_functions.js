$(function() {
	$('[data-toggle="popover"]').popover({
	container: "body",
	trigger: "hover",
	placement: "auto",
	boundary: "window"
	})
})

$(function() {
  $('[data-toggle="tooltip"]').tooltip()
})

function add_to_cart(id, title)
{
  var key = 'item-id:' + id + ',title:' + title;

  var x = window.localStorage.getItem(key);
    x = x*1 + 1;
    window.localStorage.setItem(key, x);
  update_cart();
  update_orders_button();
}

function update_cart()
{
  var orders_str = cart_get_orders();
  $('#orders_input').val(orders_str);

}

function update_orders_button()
{
  var text = 'Cart (' + cart_items() + ')';
  $('#orders_button').val(text);
}

function cart_get_orders()
{
    var orders_str = '';

  for(var i=0; i < window.localStorage.length; i++)
  {
    var key = window.localStorage.key(i);
    var value = window.localStorage.getItem(key);

    if(key.indexOf('item-id:') == 0)
    {
      orders_str = orders_str + key + ',amount:' + value + ';';
    }
  }
  return orders_str;
}

function cart_items()
{
    var cnt = 0;

  for(var i=0; i < window.localStorage.length; i++)
  {
    var key = window.localStorage.key(i);
    var value = window.localStorage.getItem(key);

    if(key.indexOf('item-id:') == 0)
    {
      cnt = cnt + value*1;
    }
  }
  return cnt;
}

function cancel_order()
{
  window.localStorage.clear()

  update_cart();
  update_orders_button();

    alert('Your order has cancelled');
  window.location.href="/main";

  return false;
}

function alert_message()
{
  alert('Thank you for message!');
  window.location.href="/main";
  return true;
}
