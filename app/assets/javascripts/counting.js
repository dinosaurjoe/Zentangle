$(function(){
  //Example #1
  $("#descr").characterCounter();
  $("#no-resize").characterCounter();
  //Example #2
  $(".count_me").characterCounter();
  //Example #3
  $("#custom_format_1").characterCounter({
    counterFormat: '%1 characters remaining.'
  });
  $("#custom_format_2").characterCounter({
    counterFormat: 'Characters Remaining: %1'
  });
  //Example #4
  $("#callback").characterCounter({
    onExceed: function(){
      alert("Limit exceeded.");
    },
    onDeceed: function(){
      alert("Limit deceeded.");
    }
  });
  //Exampe #5
  $("#custom_fields").characterCounter({
    customFields: {
      'class': 'test this class',
      'data-id': 'custom-field-example'
    }
  });

  //Example #6
  $("#counter_selector").characterCounter({
    counterSelector: '#my_counter'
  });

  //Example #6
  $("#multiple_counters").characterCounter({
    counterSelector: '.a_counter'
  });
});

// thanking dtisgodsson on gitub for this code
