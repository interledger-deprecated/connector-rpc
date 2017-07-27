const Koa = require('koa')
const Router = require('koa-router')
const Parser = require('koa-bodyparser')

const app = new Koa()
const router = Router()
const parser = Parser()
const connector = require('ilp-connector')

const port = process.env.CONNECTOR_PORT || 4000

router.post('/rpc', async (ctx) => {
  const { method, prefix } = ctx.query

  if (!method) return ctx.throw(400, 'missing "method"')
  if (!prefix) return ctx.throw(400, 'missing "prefix"')

  let plugin
  try {
    plugin = connector.getPlugin(prefix)
  } catch (e) {
    return ctx.throw(400, 'no plugin with prefix "' + prefix + '"')
  }

  // TODO: authorization

  ctx.body = await plugin.receive(method, ctx.request.body)
})

app
  .use(parser)
  .use(router.routes())
  .use(router.allowedMethods())
  .listen(port)

connector
  .listen()
