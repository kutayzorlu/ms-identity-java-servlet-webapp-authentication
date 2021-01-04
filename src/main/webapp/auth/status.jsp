<jsp:useBean id="msalAuth" scope="session" class="com.microsoft.azuresamples.authentication.MsalAuthSession" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">
    <h5 class="card-header bg-primary">
        <% out.println(msalAuth.getAuthenticated()? "You're signed in!" : "You're not signed in."); %>
    </h5>
    <div class="card-body">
        <!-- <h5 class="card-title"></h5> -->
        <p class="card-text">
            <% if (msalAuth.getAuthenticated()) { %>
                Click here to get your <a class="btn btn-success" href="<c:url value="./auth_token_details"></c:url>">ID Token Details</a>
            <% } else { %>
                Use the button on the top right to sign in.
                Attempts to get your <a href="<c:url value="./auth_token_details"></c:url>">ID Token Details</a> will result in a 401 error.
            <% } %>
        </p>
        <!-- <div class="card-footer"></div> -->
    </div>
</div>