- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/messages" ? "active" : ""
a class="nav-item #{active}" href="/messages" Messages History
