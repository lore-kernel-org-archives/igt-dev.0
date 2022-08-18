Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09210F39F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 04:15:44 +0000 (UTC)
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Aug 2022 21:15:28 -0700
Message-Id: <20220818041528.751930-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] docs/chamelium: Document debugging network
 issues
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: charlton.lin@intel.com, petri.latvala@intel.com,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some tips on how to debug network issue if Chamelium is not reachable
over the network

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 docs/chamelium.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/chamelium.txt b/docs/chamelium.txt
index c4c224689bde..f180e8364d3f 100644
--- a/docs/chamelium.txt
+++ b/docs/chamelium.txt
@@ -185,6 +185,34 @@ On V3:
 Chameleon v3 uses systemd to manage the chameleond service. The logs can be
 accessed using  `$ journalctl -u chameleond`, or the  .GetChameleonLogs()  XMLRPC call.
 
+* If Chamelium is not reachable over the network, some options to check:
+
+1- Connect to Chamelium using serial console and make sure a service is
+listening on port 9992 as following:
+
+$ netstat -a -n -t
+Active Internet connections (servers and established)
+Proto Recv-Q Send-Q Local Address           Foreign Address         State
+tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN
+tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
+tcp        0      0 127.0.0.1:53            0.0.0.0:*               LISTEN
+tcp        0      0 0.0.0.0:9992            0.0.0.0:*               LISTEN
+
+2-  Check if a proxy setting prevents the access to Chamelium services from
+    the host where IGT tests are running:
+     $ curl --noproxy '*' 192.168.1.2:9992
+     or using wireshark/tcpdump to see if the HTTP requests forwarded to
+     Chamelium or not:
+     $ tcpdump 'tcp port 9992'
+
+A successful connection can be checked on Chamelium as below:
+
+$ netstat -a -n -t
+Active Internet connections (servers and established)
+Proto Recv-Q Send-Q Local Address           Foreign Address         State
+tcp        0      0 0.0.0.0:9992            0.0.0.0:*               LISTEN
+tcp        0      0 192.168.1.2:9992        192.168.1.9:51530       TIME_WAIT
+
 Daemon Source, Build and Deploy [V2 only]
 -----------------------------------------
 
-- 
2.25.1
