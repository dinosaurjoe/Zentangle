// function changeSelect( selectNo ){
//   var sels = document.getElementById("subcats").getElementsByTagName('SELECT');
//   for( var j=0; j<sels.length; j++ ){
//     sels[j].style.display = "none";
//     if ( j===(selectNo-1) ){
//       sels[j].style.display = '';
//     }
//   }
// }

// <select name="category" onchange="changeSelect( this.value )">
// <option value="0">Select Category</option>
// <option value="1">ABC</option>
// <option value="2">123</option>
// <option value="3">abc</option>
// </select>
// <div id="subcats">
// <select name="subcategory" style="display:none">
// <option value="0">Select Sub-Category</option>
// <option value="1">A</option>
// <option value="2">B</option>
// <option value="3">C</option>
// </select>

// <select name="subcategory" style="display:none">
// <option value="0">Select Sub-Category</option>
// <option value="1">1</option>
// <option value="2">2</option>
// <option value="3">3</option>
// </select>

// <select name="subcategory" style="display:none">
// <option value="0">Select Sub-Category</option>
// <option value="1">a</option>
// <option value="2">b</option>
// <option value="3">c</option>
// </select>

// <select name="subcategory" id="art" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:art].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="film" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:film].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="design" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:design].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="film" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:fashion].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="film" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:photography].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="film" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:journalism].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="film" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:art].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
//                 <select name="subcategory" id="film" style="display:none">
//                 <option value="0">Select Sub-Category</option>
//                 <%= Project.cat_hash[:art].each do |sub| %>
//                 <option value="<%= sub %>"><%= sub %></option>
//                 <% end %>
//                 </select>
