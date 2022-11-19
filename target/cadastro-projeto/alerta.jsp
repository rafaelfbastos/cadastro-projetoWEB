<div class="my-5">
    <%if (alert != null && !alert.isEmpty()) {%>
    <%for (String mensagem : mensagens) {%>
    <div class="<%= classe %>" role="alert">
        <%= mensagem %>
    </div>
    <% }%>
    <% }%>
</div>
