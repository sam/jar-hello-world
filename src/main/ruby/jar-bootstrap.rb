#!/usr/bin/env jruby

require "java"

java_import org.eclipse.jetty.server.Server
java_import org.eclipse.jetty.server.handler.AbstractHandler

class HelloWorld < AbstractHandler
  include_package "javax.servlet.http"
  
  def handle(target, base_request, request, response)
    response.content_type = "text/html;charset=utf-8"
    response.status = HttpServletResponse::SC_OK
    base_request.handled = true
    response.writer.println "<h1>Hello World!</h1>"
  end
end

server = Server.new 9292
server.handler = HelloWorld.new

server.start
server.join