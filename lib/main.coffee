{ resolve } = require 'path'

Router = require 'a-http-server-router'

module.exports = class Component extends Router

  constructor: (@server) ->

    super @server

    { prefix, static: staticPaths } = @config

    Object.keys(staticPaths).map (url) =>

      path = resolve staticPaths[url].path

      @app.use "#{prefix}#{url}", @server.static path

    return @app
