Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA40310E1B0
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Feb 2023 23:22:11 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l7so109487ioa.7
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Feb 2023 15:22:11 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Feb 2023 18:22:07 -0500
Message-Id: <20230201232207.3332996-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] Chamelium: Get Chamelium Logs on RPC failure.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, ihf@google.com, amstan@chromium.org,
 seanpaul@chromium.org, khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

[Why]
Currently, Chamelium acts like a black box, we can't tell what is going on there when a failure occur. Seeing its logs will allow us to debug better.

[How]
On chamelium_rpc failure, print out the logs in debug so it wouldn't clutter good tests.

v2:
- Added missing #includes

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c                    | 38 ++++++++++++++++++++++++--
 lib/igt_chamelium.h                    |  1 +
 tests/chamelium/kms_chamelium_helper.c | 16 +++++++++++
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a235f3c8..65531671 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -658,6 +658,8 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
 	xmlrpc_value *res;
 	va_list va_args;
 	int fsm_trials_left = 5;
+	bool did_fault_occur = false;
+	char fault_string[1024];
 
 	if (strcmp(method_name, "CaptureVideo") == 0
 	    || strcmp(method_name, "StartCapturingVideo") == 0) {
@@ -680,9 +682,23 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
 					 format_str, va_args);
 		va_end(va_args);
 	}
-	igt_assert_f(!chamelium->env.fault_occurred,
-		     "Chamelium RPC call[%s] failed: %s\n", method_name,
-		     chamelium->env.fault_string);
+
+	did_fault_occur = chamelium->env.fault_occurred;
+	if (did_fault_occur) {
+		// Save the fault string before getting the logs which will
+		// clear the string if it is works.
+		strncpy(fault_string, chamelium->env.fault_string, 1024);
+		// To avoid recursive calls for logs, don't call for logs if we
+		// fail on getting the logs.
+		if (strcmp(method_name, "GetChameleondLogs") != 0) {
+			char *logs = chamelium_get_logs(chamelium);
+			igt_debug("CHAMELIUM LOGS:\n%s\n", logs);
+			free(logs);
+		}
+	}
+
+	igt_assert_f(!did_fault_occur, "Chamelium RPC call [%s] failed: %s\n",
+		     method_name, fault_string);
 
 	return res;
 }
@@ -737,6 +753,22 @@ void chamelium_assert_reachable(struct chamelium *chamelium, int timeout)
 		     "Couldn't connect to Chamelium for %ds", timeout);
 }
 
+char *chamelium_get_logs(struct chamelium *chamelium)
+{
+	xmlrpc_value *res;
+	const char *logs = NULL;
+
+	igt_debug(
+		"Calling GetChameleondLogs - Logs returned are from the last time "
+		"this was called.\n");
+
+	res = chamelium_rpc(chamelium, NULL, "GetChameleondLogs", "(s)", "IGT");
+	xmlrpc_read_string(&chamelium->env, res, &logs);
+	xmlrpc_DECREF(res);
+
+	return logs;
+}
+
 /**
  * chamelium_plug:
  * @chamelium: The Chamelium instance to use
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index d979de4a..e9096519 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -159,6 +159,7 @@ chamelium_reset_state(igt_display_t *display,
 
 bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
 void chamelium_assert_reachable(struct chamelium *chamelium, int timeout);
+char *chamelium_get_logs(struct chamelium *chamelium);
 void chamelium_plug(struct chamelium *chamelium, struct chamelium_port *port);
 void chamelium_unplug(struct chamelium *chamelium, struct chamelium_port *port);
 bool chamelium_is_plugged(struct chamelium *chamelium,
diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
index 197d29be..bc32329c 100644
--- a/tests/chamelium/kms_chamelium_helper.c
+++ b/tests/chamelium/kms_chamelium_helper.c
@@ -24,7 +24,19 @@
  *    Lyude Paul <lyude@redhat.com>
  */
 
+#include <fcntl.h>
+#include <stdint.h>
+#include <string.h>
+#include <stdatomic.h>
+#include <xf86drmMode.h>
+
+#include "config.h"
+#include "igt.h"
+#include "igt_chamelium.h"
 #include "igt_edid.h"
+#include "igt_eld.h"
+#include "igt_vc4.h"
+#include "igt_infoframe.h"
 #include "kms_chamelium_helper.h"
 
 void chamelium_init_test(chamelium_data_t *data)
@@ -47,6 +59,10 @@ void chamelium_init_test(chamelium_data_t *data)
 	/* we need to initalize chamelium after igt_display_require */
 	data->chamelium = chamelium_init(data->drm_fd, &data->display);
 	igt_require(data->chamelium);
+	// Get the logs so we can reset the chamelium logs at this cursor.
+	// The logs are then retrieved when any call fails so we can debug
+	// chamelium if needed.
+	free(chamelium_get_logs(data->chamelium));
 
 	data->ports = chamelium_get_ports(data->chamelium, &data->port_count);
 
-- 
2.39.1.456.gfc5497dd1b-goog
