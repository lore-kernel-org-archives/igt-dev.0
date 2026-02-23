Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A979DEA4FB7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046D10E389;
	Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZXeGsPWR";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4362210E374
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 35E991A1170;
 Mon, 23 Feb 2026 12:09:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D50F55FD43;
 Mon, 23 Feb 2026 12:09:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA83C10368FBA; Mon, 23 Feb 2026 13:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rmyNdWjlS5p7R3sAPaLiAMbaNOHhrhOwqPBE3XX0P5Y=;
 b=ZXeGsPWRY6B5ZGDrILPE6pIO2VbGYCM0bbtZURcrfJFRYOuggzBci8K/8nWjo8KVSAf5YW
 vMyIzJx4eiEvsWwgyN2nr9MC0yJbyAD9xEZ3mRivcCQN/jQ3kDHYhbZziujaSGS4QrEYIo
 qczv3k5DgFszt9e1Y5HrvBHqGZHE3eX6TLfAi8ag1BZE8xUYnBiPP9Kd6ooe6MJbPEsioD
 KqTYNkkBryfm6t83NU1rn3iC059E3t+VDLvVkV/0eyD4VgEUvlgrVJCMsvoHpVGQ1ouvkL
 241WAzbLWqZJVQFFWa449irge/2klkiZx8AkF7BOyCXQpYBJiaLyhPayy2zoKA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:48 +0100
Subject: [PATCH i-g-t v7 41/48] lib/igt_dp: Create generic helpers for DP
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-unigraf-integration-v7-41-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7616;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0tZITIn8uPj5Mq3INxx6jw5nngAIaLPs9gnSkTzkYcg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENsPmdtvM7VNtLXnJraKja3hC3x9zNXa2XFR
 A8bmGHUK26JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDbBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK6tA/8CN7nRheqbcfgo4syE6Z3lYUSO/33+Jk
 CpX7kOjvJLhjpiPrp/Fy7Di3HOcZu45Pm4fK/u2Nh1Nmv2mDEpL52g2pxrGLuMTUNL3cVMnJWAh
 dscMHWVO/heXCmnPYoZcvXqkw5wNtlfhlFpeRG+0WQ4+C8/ICHXzKQqiesP/sHco+cGsF1T7SYk
 5jTd1/Y5WsqqHhfotwDLbdr7BFXvR1Jae0ZtHIeE0F8YzTlQTinLJkqpXt5Dr7AOQY35vVDjjey
 gkuIS5KTQkHpdFg3B0CbM7oDNV2cfCXRaxaZJaXE2QEzdwqL6vgr9YOyncZ6uvvjPU7AgTkGQ9J
 HQrk7R7iIEzv7TEEV10sjZZYl53n5DeLXoEVG9bYlTRtL1I8WGXAdGbplnYII2RZgNKW1pA6ZoW
 cxfo3miyzHWKtxMMbOysonYnyHOBUk+I9b7sBtxh8KH1CXrbyDo0IUztcYZB/goFU/dQiF9onS/
 93fzwKdPjVAPUOOwIDP34OvjIDMaYkj6YX7k6Xcjif47Tmyqiqq/U9jbpT6a8HIr+8aXxdYQ75r
 AlvbRURveu2F2MdA1Swci6vT11oRUzxFj8PQ7g3kKUS9B/bInttsD2mXq1H8C3lE3OFo05x8yk9
 wG99oAk9AHbvJoqc/BBYtloHty5QJ2mlb3fPkqc+MeOxEr48epxo=
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

With the introduction of unigraf tests, there is no reason to limit the
implementation to intel. Create easly extendable generic functions to
help supporting multiple GPU.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_dp.c    | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dp.h    |  30 ++++++++++
 lib/meson.build |   1 +
 3 files changed, 208 insertions(+)

diff --git a/lib/igt_dp.c b/lib/igt_dp.c
new file mode 100644
index 000000000000..0920a43af5e9
--- /dev/null
+++ b/lib/igt_dp.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
+
+#include "drmtest.h"
+#include "i915/i915_dp.h"
+#include "igt_amd.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include <stdint.h>
+#include "igt_dp.h"
+
+/**
+ * igt_dp_get_current_link_rate: Get current link rate on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The current link rate in kb/s, or a negative error code on failure.
+ */
+int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		/*
+		 * i915_dp_get_current_link_rate returns the value in tens of kb/s because
+		 * that what the kernel uses. Convert it to kb/s to have a sane unit...
+		 */
+		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
+
+	igt_assert_f(false, "Current drm device is not able to report used link rate\n");
+	return -EINVAL;
+}
+
+/**
+ * igt_dp_get_current_lane_count: Get current lane count on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The number of active lanes, or a negative error code on failure.
+ */
+int igt_dp_get_current_lane_count(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		return i915_dp_get_current_lane_count(drm_fd, output);
+
+	igt_assert_f(false, "Current drm device is not able to report used lane count\n");
+	return -EINVAL;
+}
+
+/**
+ * igt_dp_get_max_link_rate: Get maximum link rate on a display port
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ *
+ * Returns:
+ * The maximum link rate in kb/s, or a negative error code on failure.
+ */
+int igt_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		/*
+		 * i915_dp_get_max_link_rate returns the value in tens of kb/s because
+		 * that what the kernel uses. Convert it to kb/s to have a sane unit...
+		 */
+		return i915_dp_get_max_link_rate(drm_fd, output) * 10;
+
+	igt_assert_f(false, "Current drm device is not able to report max link rate\n");
+	return -EINVAL;
+}
+
+/**
+ * igt_dp_get_max_supported_rate: Get maximum supported link rate on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The maximum supported link rate in kb/s, or a negative error code on failure.
+ */
+int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		/*
+		 * i915_dp_get_max_supported_rate returns the value in tens of kb/s because
+		 * that what the kernel uses. Convert it to kb/s to have a sane unit...
+		 */
+		return i915_dp_get_max_supported_rate(drm_fd, output) * 10;
+
+	igt_assert_f(false, "Current drm device is not able to report max link rate\n");
+	return -EINVAL;
+}
+
+/**
+ * igt_dp_get_max_lane_count: Get maximum lane count on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The maximum number of lanes, or a negative error code on failure.
+ */
+int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		return i915_dp_get_max_lane_count(drm_fd, output);
+
+	igt_assert_f(false, "Current drm device is not able to report max lane count\n");
+	return -EINVAL;
+}
+
+/**
+ * igt_dp_force_link_retrain: Force link retraining on a display port
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ * @retrain_count:	Number of times to retrain the link
+ */
+void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
+{
+	if (is_intel_device(drm_fd)) {
+		i915_dp_force_link_retrain(drm_fd, output, retrain_count);
+		return;
+	}
+
+	igt_assert_f(false, "Current drm device does not support link retraining\n");
+}
+
+/**
+ * igt_dp_get_pending_retrain: Get pending link retrain count
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ *
+ * Returns:
+ * The number of pending retrain operations, or a negative error code on failure.
+ */
+int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		return i915_dp_get_pending_retrain(drm_fd, output);
+
+	igt_assert_f(false, "Current drm device does not support pending retrain count checking\n");
+	return -EINVAL;
+}
+
+/**
+ * igt_dp_wait_pending_retrain: Wait for pending link retrain operations to complete
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ *
+ * This function waits for any pending link retrain operations to complete on the
+ * specified display port. It polls the debugfs interface for the pending retrain
+ * count until it reaches zero, indicating all retrain operations have completed.
+ */
+void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output)
+{
+	double timeout = igt_default_display_detect_timeout();
+	struct timespec start, now;
+	double elapsed;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	while (1) {
+		if (!igt_dp_get_pending_retrain(drm_fd, output))
+			return;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed = (now.tv_sec - start.tv_sec) +
+					(now.tv_nsec - start.tv_nsec) / 1e9;
+
+		if (elapsed >= timeout)
+			break;
+		usleep(10);
+	}
+	igt_assert_f(false, "Timeout waiting for pending retrain to complete\n");
+}
diff --git a/lib/igt_dp.h b/lib/igt_dp.h
new file mode 100644
index 000000000000..0c56ad2ec8b1
--- /dev/null
+++ b/lib/igt_dp.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
+
+#ifndef _IGT_DP_H_
+#define _IGT_DP_H_
+
+#include "igt_kms.h"
+
+int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output);
+
+int igt_dp_get_current_lane_count(int drm_fd, igt_output_t *output);
+
+int igt_dp_get_max_link_rate(int drm_fd, igt_output_t *output);
+
+int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output);
+
+int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output);
+
+void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+
+int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
+
+void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index e7f2d3a77799..98074685afda 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -29,6 +29,7 @@ lib_sources = [
 	'igt_drm_fdinfo.c',
         'igt_fs.c',
 	'igt_aux.c',
+	'igt_dp.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
 	'igt_hwmon.c',

-- 
2.52.0

