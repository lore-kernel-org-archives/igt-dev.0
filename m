Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9D18999E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 08:39:11 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 24 Mar 2020 10:38:48 +0200
Message-ID: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] chamelium: Retry XMLRPC call when chamelond
 fails talking with a receiver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

All the I2C errors we get from chameleond happen when it is talking the
receiver and seem to have nothing to do with the HDMI/DisplayPort
upstream.

Let's try reaching the receiver 3 times before we give up and settle on
an error.

Fixes: https://gitlab.freedesktop.org/drm/intel/issues/217
Issue: https://bugs.chromium.org/p/chromium/issues/detail?id=993738
Cc: Imre Deak <imre.deak@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_chamelium.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index f98f6746..7d8f057d 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -280,12 +280,6 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
 	struct fsm_monitor_args monitor_args;
 	pthread_t fsm_thread_id;
 
-	/* Cleanup the last error, if any */
-	if (chamelium->env.fault_occurred) {
-		xmlrpc_env_clean(&chamelium->env);
-		xmlrpc_env_init(&chamelium->env);
-	}
-
 	/* Unfortunately xmlrpc_client's event loop helpers are rather useless
 	 * for implementing any sort of event loop, since they provide no way
 	 * to poll for events other then the RPC response. This means in order
@@ -300,9 +294,25 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
 			       &monitor_args);
 	}
 
-	xmlrpc_client_call2f_va(&chamelium->env, chamelium->client,
-				chamelium->url, method_name, format_str, &res,
-				va_args);
+	for (int retries = 3; retries > 0; retries--) {
+		/* Cleanup the last error, if any */
+		if (chamelium->env.fault_occurred) {
+			xmlrpc_env_clean(&chamelium->env);
+			xmlrpc_env_init(&chamelium->env);
+		}
+
+		xmlrpc_client_call2f_va(&chamelium->env, chamelium->client,
+					chamelium->url, method_name, format_str, &res,
+					va_args);
+
+		if (!chamelium->env.fault_occurred)
+			break;
+
+		if (NULL == strstr(chamelium->env.fault_string, "I2C"))
+			break;
+
+		/* i2c error, let's try to retry */
+	}
 
 	if (fsm_port) {
 		pthread_cancel(fsm_thread_id);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
