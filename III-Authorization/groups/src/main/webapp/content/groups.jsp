<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
    <h5 class="card-header bg-primary">
        See Group Memberships
    </h5>
    <div class="card-body">
        <p class="card-text">
            <c:if test = "${!groupsOverage}">
                Your groups are within the maximum emittable group membership limits for ID tokens (>200). If you have any group memberships, you'll see them in the token details page.
                <br>
            </c:if>
            <c:if test = "${groupsOverage && groupsFromGraph == ''}">
                Your groups have exceeded maximum number of groups allowed in the ID token (>200). Note the <strong>_claim_names</strong> and <strong>_claim_sources</strong> claims on the token details page.
                <br>
                <a class="btn btn-warning" href="<c:url value="/overage"></c:url>">get groups from Graph</a>
            </c:if>
            <c:if test = "${groupsOverage && groupsFromGraph != ''}">
                Your groups have exceeded maximum number of groups allowed in the ID token (>200) but we got all of them from Graph. Displaying <strong>10</strong> of them:
                <br><br>
                ${groupsFromGraph}
                <br>
            </c:if>
            <a class="btn btn-success" href="<c:url value="/token_details"></c:url>">Token Details</a>
            <a class="btn btn-success" href="<c:url value="/admin_only"></c:url>">Admins Only</a>
            <a class="btn btn-success" href="<c:url value="/regular_user"></c:url>">Regular Users</a>
        </p>
    </div>
</div>
