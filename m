Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B32F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08B10E292;
	Mon, 16 Mar 2026 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="svSakFK0";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D5110E52A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 44FB5C55048
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F4D05FC4A;
 Mon, 16 Mar 2026 16:23:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 311B710372212; Mon, 16 Mar 2026 17:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Aj0dlGvNT8JiWv6Aszx+DNo+rJP5PJWRka9TV/VWC6o=;
 b=svSakFK0u3vBvRlKO6qsQxdjVeIGnCLhIp4L3pD/KipmxhbsTvvivQnPNAakNs2xx0/NE7
 Bll4jjDS1gDyxreoDvrQBK1fkSE5P2LYJxajUYof25Hk6vPveWmqLYqn0FJqeWqJq6e2Tv
 DHf8zS41HK7eDFWO8ukNe0p7mmptW3LGxjG7sIiZK5LhT58q8Dmu2tUMPhpT+djnNzwofs
 rHcisVJ4ZjdIOKE4ofvd4xTg1oaDH6zaRTOHoPiB7InmvtjvlXV5A0arKZSuRqKUMKq3cv
 hxgeVpm+WsjKPg9EhXz9xcnzI/7dCg8r02sY4WTVyR2kgWuNenLL7rXkEQjD6Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:58 +0100
Subject: [PATCH i-g-t v9 37/49] lib/i915/dp: Move DP-related function for
 i915 to proper folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-unigraf-integration-v9-37-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=24600;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OJRm63h4E2gaOQiQGJMA3Lz2JDbBN6t2rZ3v6X4pBxw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Oep4nZTe4wGazdwnaDCkHFNOPLgh0+KgCd
 kBzpElelrOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLZbQ//YeoO+h8kdGTshpRJNF5wt306pOdy8FX
 vpAuFz/0nHUc0jjdUiLD8JcfUUE1tPVCKKn5TjFDC94KwLuQ5KTM+kZzykT3zcr1uYshjGrbo8S
 uZJRVfs8Vy1PkrL5+sqIOPo9ohS0wmAR2VjfEakHTNREAsSt7uXh5MV8Upki+XhcozHWxGf+AWF
 upBOqXmqn15kMQtDMqR5VJgqZkIr1G3VVosLf8hF7PjLPzowFQBBP9wkWyCjEsw7SLLiq1ATk0F
 bJHIRrDjE1fqUMyhHKWmFxQLpQ7IpXtidDaWBBckSUT5C5WZc6KAGkEUXPTMG54sEF6RsiDCTs4
 WnbTIizDI/YxGJCZlalItGEldCj6BWLrtS6kHWDO8TP5KU2uDTFHTKJAmvOJqcOHctv/i/QQ/rE
 dNzVa+ASkVRkcKp1UklT4ey2zyYcwC65k5Oc6jLXZLJEr32yDXmbX7A3OKtd4Cp3ksYEBMrwy9q
 irXTHnCUbOfYMB0Xg6/Tho78LFOXaOMgtCZjntP40pjsiA9nWKmm9CzE60PsDA2UvbCPIyhUUMr
 25gRm10Y3pFnixoT1UkGmBavGwEVwWW1AkIwTyA0GkrE+e/94t/cHI7N6DivbBGv26ZEphKK3xj
 yaczEldqvbeaUwCRJwUZG+4+3OMq09qLtPW/Ud5IsYgVRHDe0qfc=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c                      | 345 ++++++++++++++++++++++++++++++++
 lib/i915/i915_dp.h                      |  22 ++
 lib/igt_kms.c                           | 310 ----------------------------
 lib/igt_kms.h                           |  13 --
 lib/meson.build                         |   1 +
 tests/intel/kms_dp_link_training.c      |   1 +
 tests/intel/kms_dp_linktrain_fallback.c |   1 +
 7 files changed, 370 insertions(+), 323 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
new file mode 100644
index 000000000000..024fe3b00210
--- /dev/null
+++ b/lib/i915/i915_dp.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright © 2013 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Daniel Vetter <daniel.vetter@ffwll.ch>
+ *	Damien Lespiau <damien.lespiau@intel.com>
+ */
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
index 000000000000..2bcc9e2cb031
--- /dev/null
+++ b/lib/i915/i915_dp.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _I915_DP_H_
+#define _I915_DP_H_
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
index 064d5b35aa54..2f1f5cf4a5f3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7461,316 +7461,6 @@ int igt_crtc_num_scalers(igt_crtc_t *crtc)
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
index aa1599592e68..042fac6b21b0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1284,19 +1284,6 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int igt_crtc_num_scalers(igt_crtc_t *crtc);
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
index 268f3238cbfa..17cbed2a0faa 100644
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
index d859db64b4ff..57d31934a7ac 100644
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
index 91dde2a7dcee..bb779b52564b 100644
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
2.52.0

