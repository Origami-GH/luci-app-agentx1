module("luci.controller.agentx1-gui", package.seeall)

function index()
    entry({"admin", "network", "agentx1"}, cbi("agentx1-gui"), _("agentx1"))
end