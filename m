Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1886FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551FD10ECD1;
	Tue, 31 Mar 2026 17:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UR8c7amS";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89EC10EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 97E261A30C8;
 Tue, 31 Mar 2026 17:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D8826029D;
 Tue, 31 Mar 2026 17:11:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76D6E104504A4; 
 Tue, 31 Mar 2026 19:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m9HzGRAkb6xkdHtJHbRDRzA0WpQ8Lr0fU48D+a4V/yI=;
 b=UR8c7amSNk9UTlwn1CipWKboJyRlZo7jMQZ5q4f7ya2gjmrQ8A2Fb9EcbdwjbBxLaSntjy
 S9r+GGkd/3ht7ojhD17Lj1zLHgjJrFmjrt6AjqJIMZrXe2d69eU6+ogYMlqd+m8ZhXYezT
 dlimIAZ1A3wqDmT/bNtXecd06nOZc/LBSG23+b3bSRoCHKpBctYWdqDWtxrdZSQbNbj/W+
 TD8JGVEg6ttfgYfDpKgnJk0UIngVLwy5tT3ykn/WAyK7iYxGoc5wzW/kEbhxwZ8XU3s/RI
 kJU9axqtsNR675pbMdTg6R6lyZTpbPEiUPDVs6h6yTBB9j8yzBdxTMXCzsddyQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:59 +0200
Subject: [PATCH i-g-t v10 42/49] lib/igt_dp: Create generic helpers for DP
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-unigraf-integration-v10-42-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7516;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2AMM0qMlUrRbcnI3jNbWnLnf2mJEu7aVHvXCby1ESAU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABB4gLc7k49dHdvhaafs0CF+7cjn8SuZIuQO
 5CbqN/2sAKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJpEhAAnmQ2yByTKU7BGQGhVYQq5lmJklF6V6D
 8r4ZDbSTm9nKwIBti2UmOqqGaI3I/cXH/vyQa0TFnJux24TuG3qGKGaMEm9ytuu635imzCLOCTB
 HLeCOVxohJfQHyBqDSzeKi+hvr/hJON2BC06vjSkjJNitDI3lKfvz7FPoS3K/CfKbRivaEv4w0h
 pOQTQWCNwN8kav+hciaThjSRXpxsNZJzVcOv9wz3m6W0p1fXUVzzCR9ingSXAXmlC21jlfgteEP
 cFkOTs/AGMmJD+85b/WubDOz6MaKnzR9zhV92kSC0m5vH4q/ftKZ4n5aESotvkJ04trKqO76+gL
 D/fDhTCzhenMb4dFa4dALx1NMB9g2lzMnDljiLkZYRh7nEG5K8qsLquuHT1+WOTACU//1Zrb9m1
 SuB3+868bZ/HPG8wm6V1EC99zU+xk/a95zrsTyev9ZD5gtOUfKUVfp7eRFQ/ijmOx5nNnf5B649
 B9/YsD/rUlITuOoVch8vVb+43O3B+W5hJAIkQAPtXur4WiH0R+UfquhwzJG2D3901MaWuMZ24mT
 FGDmR5EPm3XZ//I9ZQ5O7XKhm6vqe0CU5zcI7F9xlmocMPsvf8eEoyNQQdLc0MfiHvcZcTq5dcJ
 JZsxahSu8v8Ro5ehvzPvYwR31bKGKmL2KuHi3AGzoJg++J6ef4ig=
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
 lib/igt_dp.c    | 175 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dp.h    |  30 ++++++++++
 lib/meson.build |   1 +
 3 files changed, 206 insertions(+)

diff --git a/lib/igt_dp.c b/lib/igt_dp.c
new file mode 100644
index 000000000000..9f71c9e72bbc
--- /dev/null
+++ b/lib/igt_dp.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
+
+#include <stdint.h>
+
+#include "drmtest.h"
+#include "i915/i915_dp.h"
+#include "igt_core.h"
+#include "igt_kms.h"
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
+
+	igt_assert_eq(igt_gettime(&start), 0);
+
+	while (1) {
+		if (!igt_dp_get_pending_retrain(drm_fd, output))
+			return;
+
+		igt_assert_eq(igt_gettime(&now), 0);
+
+		if (igt_time_elapsed(&start, &now) >= timeout)
+			break;
+
+		usleep(10000);
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
index fd4259d1b947..7d48daddc641 100644
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

