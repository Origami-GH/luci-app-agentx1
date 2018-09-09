module("luci.controller.luci-app-agentx1", package.seeall)

function index()
    entry({"admin", "network", "agentx1"}, cbi("agentx1-gui/agentx1-gui"), _("agentx1"))
end