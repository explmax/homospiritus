// Generated by CoffeeScript 1.3.3
(function(){$(function(){var e;e=new Showdown.converter;return $(".markdown").each(function(){var t,n;n=$(this).html();t=e.makeHtml(n);return $(this).html(t)})})}).call(this);