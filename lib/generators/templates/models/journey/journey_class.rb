class Journey::<%= class_name %> < JourneyResource
  schema do
  	<% attributes.each do |attribute| %>
    attribute <%=attribute['name'] %>, :<%= attribute['type'] %>
    <% end %>
  end
end
