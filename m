Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCA5CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F110510E3C3;
	Mon, 10 Nov 2025 13:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="y0gHeK73";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B7B10E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3C97F4E41608
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13931606F5;
 Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EF6D1037191A; Mon, 10 Nov 2025 14:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AHZh/mMWKkx3enNInE3ZVbPJ1SVEP3K/3hrvydTHZ5s=;
 b=y0gHeK73tR4l/vj3Oh35CmEPZFh2/qM/peu//we0WQD2rGFv6gpdSACo9tD7R3q0sDePOg
 vSBY0y2vdmHYNstvYSwi6AVwM7EBM26+1a/6RtgMG3bHkf3xfMHHMsHD0d6GE14mIsg+wV
 IMWUXVR9nPub/fMMNwIYWNy7wHJya4Y6iMLhwzNaktK8/kgC14z1LWnTi+5NIziZQCpIal
 CAxdFR1+6VTi6Lnzf62TM9SVuB6RfRZNNFsJfIcRZZtjkm9n7zIcpxcIy7+lyT/qtl17GO
 2AZ7Y4423u0jQNG1UbMgUYkl8Vnb5ssokNUeuWzkGYRizzQUUD8frQut/iAJhw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:41 +0000
Subject: [PATCH i-g-t v4 39/46] lib/i915/dp: Move DP-related function for
 i915 to proper folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-39-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23206;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3uxJx3GXF8VaE8Bl5Nqwn0B9WmN7ICZtFdmeZt8i9O4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesTSUNlHoyKWtKgvEkHtvgJd0uN+8ho1L1w1
 K8wHHMqrbWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEwAKCRAgrS7GWxAs
 4syoD/0bBGCCat+ozmNxXw7lDGYelJmKKMU9byMU30qTIdOjHkxjABdTSZKznHfgLihJxplZaTQ
 xn5pyKMiXcGW8CX/VwR2wnd/8m8dyPJAGco/uqf+Gg3k5uGuZCrniQzMrknovTCRMoN/dfXfeXu
 t54DyGWJgM4Y+bRmPKmtEYy9WL+5NUJPByiw/ojW0NUtnJOOOX6rcaK7XSpDZvX6Qlja3fCaRco
 PoEq+RpIaxKpXjAG9RMJAXgmCShCnYG4Lr1HQKvFFaN8YjfC5zUhS0jntPasPqZLfeFpZVqJC02
 luQJXWafXUk65cOFO77LRy1B6ATlDa31Uk1hHK62fcFxuzaASmzpokAKPYjTatV+1uwy4TRpAiS
 h46+pigteMpsbPfkAby0Kb7IgwO5p3w2Kc4krm7d79bQKtIaf5O42zx9U4nUrX+SAVmTS9yo7vc
 U0C9UkwsDmU8C0Npn0s5KNNznBHO4qh1+GtDOd9a5ib6Rq6ooZLjI4uIig8oGwqnOrxok33P0zl
 aH6ezb0BC3tdgvtUFpKlUJ3nGkKpLszgXcRKjAwl2RIsMdSd64vNhDmkCU7DkEaBV5YdJroaWyA
 dXMlVXOYH1elNhe2ENYGdeAQ3MYofcBnUkb02E0B+4XH01xk00c2KTkC62HeciTYIk0xsSep+63
 s+EP5GSwtbdOeng==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Some functions, prefixed with igt_ are not generic but specific to the
i915 intel driver. To avoid confusion and allows the introduction of
generic helpers, move those to a dedicated file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c                      | 318 ++++++++++++++++++++++++++++++++
 lib/i915/i915_dp.h                      |  22 +++
 lib/igt_kms.c                           | 310 -------------------------------
 lib/igt_kms.h                           |  13 --
 lib/meson.build                         |   1 +
 tests/intel/kms_dp_link_training.c      |   1 +
 tests/intel/kms_dp_linktrain_fallback.c |   1 +
 7 files changed, 343 insertions(+), 323 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
new file mode 100644
index 000000000000..6cb212f20b1b
--- /dev/null
+++ b/lib/i915/i915_dp.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: MIT
+
+#include <ctype.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "i915_dp.h"
+#include "igt_core.h"
+
+/**
+ * igt_parse_marked_value:
+ * @buf: Buffer containing the content to parse
+ * @marked_char: The character marking the value to parse
+ * @result: Pointer to store the parsed value
+ *
+ * Finds the integer value in the buffer that is marked by the given character.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+static int igt_parse_marked_value(const char *buf, char marked_char, int *result)
+{
+	char *marked_ptr, *val_ptr;
+
+	/*
+	 * Look for the marked character
+	 */
+	marked_ptr = strchr(buf, marked_char);
+
+	if (marked_ptr) {
+		val_ptr = marked_ptr - 1;
+		while (val_ptr > buf && isdigit(*val_ptr))
+			val_ptr--;
+		val_ptr++;
+		if (sscanf(val_ptr, "%d", result) == 1)
+			return 0;
+	}
+	return -1;
+}
+
+ /**
+  * igt_get_current_link_rate:
+  * @drm_fd: A drm file descriptor
+  * @output: Target output
+  *
+  * Returns: link_rate if set for output else -1
+  */
+int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_link_rate",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
+		     output->name);
+	res = igt_parse_marked_value(buf, '*', &ret);
+	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
+	return ret;
+}
+
+/**
+ * igt_get_current_lane_count:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: lane_count if set for output else -1
+ */
+int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_lane_count",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_lane_count\n",
+		     output->name);
+	res = igt_parse_marked_value(buf, '*', &ret);
+	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
+	return ret;
+}
+
+/**
+ * igt_get_max_link_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: max_link_rate
+ */
+int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_max_link_rate",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
+		     output->name);
+
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_get_max_link_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: max_link_rate
+ */
+int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_max_lane_count",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
+		     output->name);
+
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_force_link_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @retrain_count: number of retraining required
+ *
+ * Force link retrain on the output.
+ */
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
+{
+	char value[2];
+	int res;
+
+	snprintf(value, sizeof(value), "%d", retrain_count);
+	res = igt_debugfs_write_connector_file(drm_fd, output->name,
+					       "i915_dp_force_link_retrain",
+					       value, strlen(value));
+	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_retrain\n",
+		     output->name);
+}
+
+/**
+ * igt_force_lt_failure:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @failure_count: 1 for same link param and
+ *		   2 for reduced link params
+ *
+ * Force link training failure on the output.
+ * @failure_count: 1 for retraining with same link params
+ *		   2 for retraining with reduced link params
+ */
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+{
+	char value[2];
+	int res;
+
+	snprintf(value, sizeof(value), "%d", failure_count);
+	res = igt_debugfs_write_connector_file(drm_fd, output->name,
+					       "i915_dp_force_link_training_failure",
+					       value, strlen(value));
+	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_training_failure\n",
+		     output->name);
+}
+
+/**
+ * igt_get_dp_link_retrain_disabled:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: True if link retrain disabled, false otherwise
+ */
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_link_retrain_disabled",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_link_retrain_disabled\n",
+		     output->name);
+	return strstr(buf, "yes");
+}
+
+/**
+ * Checks if the force link training failure debugfs
+ * is available for a specific output.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
+{
+	char buf[512];
+	int res;
+
+	res = igt_debugfs_read_connector_file(drmfd, output->name,
+					      "i915_dp_link_retrain_disabled",
+					      buf, sizeof(buf));
+	return res == 0;
+}
+
+/**
+ * igt_get_dp_pending_lt_failures:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Number of pending link training failures.
+ */
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_link_training_failure",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
+		     output->name);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_dp_pending_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Number of pending link retrains.
+ */
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_link_retrain",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
+		     output->name);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_reset_link_params:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Reset link rate and lane count to auto, also installs exit handler
+ * to set link rate and lane count to auto on exit
+ */
+void igt_reset_link_params(int drm_fd, igt_output_t *output)
+{
+	bool valid;
+	drmModeConnector *temp;
+
+	valid = true;
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_link_rate",
+						    "auto", "auto", true);
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_lane_count",
+						    "auto", "auto", true);
+	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
+	drmModeFreeConnector(temp);
+}
+
+/**
+ * igt_set_link_params:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * set link rate and lane count to given value, also installs exit handler
+ * to set link rate and lane count to auto on exit
+ */
+void igt_set_link_params(int drm_fd, igt_output_t *output,
+			 char *link_rate, char *lane_count)
+{
+	bool valid;
+	drmModeConnector *temp;
+
+	valid = true;
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_link_rate",
+						    link_rate, "auto", true);
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_lane_count",
+						    lane_count, "auto", true);
+	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
+	drmModeFreeConnector(temp);
+}
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
new file mode 100644
index 000000000000..3ca596f78e93
--- /dev/null
+++ b/lib/i915/i915_dp.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _I915_CRC_H_
+#define _I915_CRC_H_
+
+#include "igt_kms.h"
+
+int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
+int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
+int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
+int igt_get_max_lane_count(int drm_fd, igt_output_t *output);
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
+void igt_reset_link_params(int drm_fd, igt_output_t *output);
+void igt_set_link_params(int drm_fd, igt_output_t *output,
+			 char *link_rate, char *lane_count);
+
+#endif
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d429a1d5d605..326dde1fba33 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7063,316 +7063,6 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 	return num_scalers;
 }
 
-/**
- * igt_parse_marked_value:
- * @buf: Buffer containing the content to parse
- * @marked_char: The character marking the value to parse
- * @result: Pointer to store the parsed value
- *
- * Finds the integer value in the buffer that is marked by the given character.
- *
- * Returns: 0 on success, -1 on failure
- */
-static int igt_parse_marked_value(const char *buf, char marked_char, int *result)
-{
-	char *marked_ptr, *val_ptr;
-
-	/*
-	 * Look for the marked character
-	 */
-	marked_ptr = strchr(buf, marked_char);
-
-	if (marked_ptr) {
-		val_ptr = marked_ptr - 1;
-		while (val_ptr > buf && isdigit(*val_ptr))
-			val_ptr--;
-		val_ptr++;
-		if (sscanf(val_ptr, "%d", result) == 1)
-			return 0;
-	}
-	return -1;
-}
-
-/**
- * igt_get_current_link_rate:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: link_rate if set for output else -1
- */
-int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res, ret;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					       "i915_dp_force_link_rate",
-					       buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
-			       output->name);
-	res = igt_parse_marked_value(buf, '*', &ret);
-	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
-	return ret;
-}
-
-/**
- * igt_get_current_lane_count:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: lane_count if set for output else -1
- */
-int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res, ret;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					      "i915_dp_force_lane_count",
-					      buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_lane_count\n",
-			       output->name);
-	res = igt_parse_marked_value(buf, '*', &ret);
-	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
-	return ret;
-}
-
-/**
- * igt_get_max_link_rate:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: max_link_rate
- */
-int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res, ret;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					       "i915_dp_max_link_rate",
-					       buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
-		     output->name);
-
-	sscanf(buf, "%d", &ret);
-	return ret;
-}
-
-/**
- * igt_get_max_link_rate:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: max_link_rate
- */
-int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res, ret;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					       "i915_dp_max_lane_count",
-					       buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
-		     output->name);
-
-	sscanf(buf, "%d", &ret);
-	return ret;
-}
-
-/**
- * igt_force_link_retrain:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- * @retrain_count: number of retraining required
- *
- * Force link retrain on the output.
- */
-void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
-{
-	char value[2];
-	int res;
-
-	snprintf(value, sizeof(value), "%d", retrain_count);
-	res = igt_debugfs_write_connector_file(drm_fd, output->name,
-					       "i915_dp_force_link_retrain",
-					       value, strlen(value));
-	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_retrain\n",
-			  output->name);
-}
-
-/**
- * igt_force_lt_failure:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- * @failure_count: 1 for same link param and
- *		   2 for reduced link params
- *
- * Force link training failure on the output.
- * @failure_count: 1 for retraining with same link params
- *		   2 for retraining with reduced link params
- */
-void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
-{
-	char value[2];
-	int res;
-
-	snprintf(value, sizeof(value), "%d", failure_count);
-	res = igt_debugfs_write_connector_file(drm_fd, output->name,
-					       "i915_dp_force_link_training_failure",
-					       value, strlen(value));
-	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_training_failure\n",
-			  output->name);
-}
-
-/**
- * igt_get_dp_link_retrain_disabled:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: True if link retrain disabled, false otherwise
- */
-bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					      "i915_dp_link_retrain_disabled",
-					      buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_link_retrain_disabled\n",
-			       output->name);
-	return strstr(buf, "yes");
-}
-
-/**
- * Checks if the force link training failure debugfs
- * is available for a specific output.
- *
- * @drmfd: file descriptor of the DRM device.
- * @output: output to check.
- * Returns:
- *  true if the debugfs is available, false otherwise.
- */
-bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
-{
-	char buf[512];
-	int res;
-
-	res = igt_debugfs_read_connector_file(drmfd, output->name,
-					      "i915_dp_link_retrain_disabled",
-					      buf, sizeof(buf));
-	return res == 0;
-}
-
-/**
- * igt_get_dp_pending_lt_failures:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: Number of pending link training failures.
- */
-int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res, ret;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					      "i915_dp_force_link_training_failure",
-					      buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
-			       output->name);
-	sscanf(buf, "%d", &ret);
-	return ret;
-}
-
-/**
- * igt_dp_pending_retrain:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Returns: Number of pending link retrains.
- */
-int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
-{
-	char buf[512];
-	int res, ret;
-
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
-					      "i915_dp_force_link_retrain",
-					      buf, sizeof(buf));
-	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
-			       output->name);
-	sscanf(buf, "%d", &ret);
-	return ret;
-}
-
-/**
- * igt_reset_link_params:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * Reset link rate and lane count to auto, also installs exit handler
- * to set link rate and lane count to auto on exit
- */
-void igt_reset_link_params(int drm_fd, igt_output_t *output)
-{
-	bool valid;
-	drmModeConnector *temp;
-
-	valid = true;
-	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
-						    "i915_dp_force_link_rate",
-						    "auto", "auto", true);
-	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
-						    "i915_dp_force_lane_count",
-						    "auto", "auto", true);
-	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
-	dump_connector_attrs();
-	igt_install_exit_handler(reset_connectors_at_exit);
-
-	/*
-	 * To allow callers to always use GetConnectorCurrent we need to force a
-	 * redetection here.
-	 */
-	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
-	drmModeFreeConnector(temp);
-}
-
-/**
- * igt_set_link_params:
- * @drm_fd: A drm file descriptor
- * @output: Target output
- *
- * set link rate and lane count to given value, also installs exit handler
- * to set link rate and lane count to auto on exit
- */
-void igt_set_link_params(int drm_fd, igt_output_t *output,
-			   char *link_rate, char *lane_count)
-{
-	bool valid;
-	drmModeConnector *temp;
-
-	valid = true;
-	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
-						    "i915_dp_force_link_rate",
-						    link_rate, "auto", true);
-	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
-						    "i915_dp_force_lane_count",
-						    lane_count, "auto", true);
-	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
-	dump_connector_attrs();
-	igt_install_exit_handler(reset_connectors_at_exit);
-
-	/*
-	 * To allow callers to always use GetConnectorCurrent we need to force a
-	 * redetection here.
-	 */
-	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
-	drmModeFreeConnector(temp);
-}
-
 /**
  * igt_backlight_read:
  * @result:	Pointer to store the result
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9dc0362300aa..86e5b3224df3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1289,19 +1289,6 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
-int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
-int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
-int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
-int igt_get_max_lane_count(int drm_fd, igt_output_t *output);
-void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
-void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
-bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
-bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
-int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
-int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
-void igt_reset_link_params(int drm_fd, igt_output_t *output);
-void igt_set_link_params(int drm_fd, igt_output_t *output,
-			   char *link_rate, char *lane_count);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 uint32_t igt_get_connected_output_count(igt_display_t *display);
diff --git a/lib/meson.build b/lib/meson.build
index fd98e280637c..fa4663abc0ab 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -16,6 +16,7 @@ lib_sources = [
 	'i915/intel_fbc.c',
 	'i915/intel_memory_region.c',
 	'i915/i915_crc.c',
+	'i915/i915_dp.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_configfs.c',
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index fb9b42608f25..ddc98b7f570b 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -21,6 +21,7 @@
  * Description: Test we can drive non-UHBR rates over MST.
  */
 
+#include "i915/i915_dp.h"
 #include "igt.h"
 #include "igt_kms.h"
 #include "intel/kms_joiner_helper.h"
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index fa58999e8269..80b113885e47 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -12,6 +12,7 @@
  */
 
 #include <sys/types.h>
+#include "i915/i915_dp.h"
 #include "igt_sysfs.h"
 #include "igt.h"
 #include "kms_mst_helper.h"

-- 
2.51.0

