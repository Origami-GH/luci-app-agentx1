require("luci.sys")

m = Map("agentx1", "agentx1", translate("WARNING:Read operators manual before use"))

s = m:section(TypedSection, "conn", translate("Settings"))
s.addremove = false
s.anonymous = true

laif = s:option(ListValue, "lan", translate("LAN"))
for k, v in pairs(luci.sys.net.devices()) do
    if v ~= "lo" then
        laif:value(v)
    end
end

waif = s:option(Value, "wan", translate("WAN"))
for k, v in pairs(luci.sys.net.devices()) do
    if v ~= "lo" then
        waif:value(v)
    end
end

cm = s:option(ListValue, "connMode", translate("Promiscuous Mode"))
cm:value("NONUSE", "NONUSE")
cm:value("LOCAL", "LOCAL")
cm:value("BOTH", "BOTH")

gi = s:option(ListValue, "getIP", translate("DHCP"))
gi:value("NONE", "NONE")
gi:value("AFTER", "AFTER")
gi:value("BEFORE", "BEFORE")
gi:value("BETWEEN", "BETWEEN")

sa = s:option(Value, "staticIP", translate("Static address"))
sa.rmempty = true
nm = s:option(Value, "mask", translate("Netmask"))
nm.rmempty = true

gw = s:option(Value, "gateway", translate("Gateway"))
gw.rmempty = true
dn = s:option(Value, "dns", translate("DNS"))
dn.rmempty = true

un = s:option(Value, "user", translate("Username"))
un.rmempty = true

local apply=luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/agentx1 restart")
end

return m