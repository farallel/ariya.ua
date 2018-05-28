<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getFullName()
        isAdmin = user.isAdmin()
        isEditor = user.isEditor()
    >
<#else>
    <#assign
        name = "unknown"
        isAdmin = false
        isEditor = false
    >
</#if>