
<script>
  $(function() {
     $("li.pending").click(function() {
            
     	      $('#home1').show();
     	      $("#menu12").hide();
              $("#menu21").hide();

              
    });    
});
   $(function() {
     $("li.confirmed").click(function() {
     	      $("#home1").hide();
            
            $("#menu12").show();
     	      
              $("#menu21").hide();
    });    
});
    $(function() {
     $("li.cancelled").click(function() {
     	      $("#menu21").show();
     	      $("#menu12").hide();
              $("#home1").hide();
    });    
});
 </script>