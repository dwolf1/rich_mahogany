$(document).ready(function() {

  var page_id = '46187720660';
  var access_token = '173640759751992|g8GTSDfNYTnhAngIFgGRIOmp7Hs';
  var page_url = 'https://graph.facebook.com/' + page_id + 
  '/posts?access_token=' + access_token;

  var fb_messages = [];
  var fb_story = [];
  var fb_id = [];
  var fb_time = []

  $.get(page_url, function(data) {
  console.log(data.data);
    for (j=0, i=0; i<5; i++, j++) {
      fb_messages[j] = data.data[i]['message'];
      fb_id[j] = data.data[i]['id'];
      fb_time[j] = data.data[i]['created_time'];
      if (data.data[i]['story'] != null) {
        fb_story[j] = data.data[i]['story'];
      } else {
        fb_story[j] = 'Rich Mahogany shared a post.';
      }

      fb_time[j] = new Date();
      console.log(fb_id[j]);

      $("#news_table").append('<tr><td class="fb_story"><a href="https://facebook.com/' + fb_id[j] + 
        '" target="_blank">' + fb_story[j] + '</a></td><td class="fb_msg">' + fb_messages[j] + '</td>' +
        '<td class="fb_time">' + fb_time[j] + '</td></tr>');
    }
  });
})
