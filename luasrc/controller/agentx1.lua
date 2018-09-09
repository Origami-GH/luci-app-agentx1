module("luci.controller.agentx1", package.seeall)

function index()
    entry({"admin", "network", "agentx1"}, cbi("agentx1/agentx1"), _("agentx1"))
end