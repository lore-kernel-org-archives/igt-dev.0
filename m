Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCFE6E19C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 May 2021 06:12:40 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Tue,  4 May 2021 06:12:26 +0000
Message-Id: <20210504061226.4508-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_chamelium: Retry DP FSM on Failure
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We have a thread called chamelium_fsm_mon which monitors HPD events
triggered by chamelium, Unfortunately not always the HPD event arrives
in a fixed interval (mostly does), Quick fix to this is to retry.

Fixes :- https://gitlab.freedesktop.org/drm/intel/-/issues/262
         https://jira.devtools.intel.com/browse/VLK-8093
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 7085122a7..39f0d01bf 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -522,15 +522,39 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
 {
 	xmlrpc_value *res;
 	va_list va_args;
+	int fsm_trials_left = 5;
 
-	va_start(va_args, format_str);
-	res = __chamelium_rpc_va(chamelium, fsm_port, method_name,
-				 format_str, va_args);
-	va_end(va_args);
+	if (strcmp(method_name, "CaptureVideo") == 0) {
 
-	igt_assert_f(!chamelium->env.fault_occurred,
-		     "Chamelium RPC call failed: %s\n",
-		     chamelium->env.fault_string);
+		while (fsm_trials_left) {
+
+			va_start(va_args, format_str);
+			res = __chamelium_rpc_va(chamelium, fsm_port,
+						 method_name, format_str,
+						 va_args);
+			va_end(va_args);
+
+			if (!chamelium->env.fault_occurred)
+				break;
+
+			igt_debug("DP FSM failed retrying, tries left %d\n", fsm_trials_left);
+			--fsm_trials_left;
+		}
+
+		igt_assert_f(!chamelium->env.fault_occurred,
+			     "Chamelium RPC call failed: %s\n",
+			     chamelium->env.fault_string);
+	} else {
+
+		va_start(va_args, format_str);
+		res = __chamelium_rpc_va(chamelium, fsm_port, method_name,
+					 format_str, va_args);
+		va_end(va_args);
+
+		igt_assert_f(!chamelium->env.fault_occurred,
+			     "Chamelium RPC call failed: %s\n",
+			     chamelium->env.fault_string);
+	}
 
 	return res;
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
