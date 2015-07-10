-module (m_inet).

-compile (export_all).

ip_str () ->
    "192.168.0.1" == inet:ntoa ({192, 168, 0, 1}).