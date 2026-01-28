Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66903D25B5C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB55A10E6DC;
	Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="24bTb8mV";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C8110E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D517F4E422FC;
 Wed, 28 Jan 2026 13:15:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A63D06071F;
 Wed, 28 Jan 2026 13:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A21CA119A8812; Wed, 28 Jan 2026 14:15:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uqlFXq0JtEJzllHWv3MXd9xhnF1IfvhgVHShYWhuQUo=;
 b=24bTb8mVQpk88xa//BACTEflEtFhsIp/vjuncyuEjcogVMs2Leqtr5qOYvEefk9/7eEabW
 bRzoN/xjUs6cOV3WSFL9VWdjjBdBNKhlwVBEp3b+OcXL6P6bH/2nRY+czngU/zRfKoEK3b
 ViYV6IPyyytPoc8s8HBWcewq23BtJUIdHuYK5IP5zUod/gogZlnCuoCsOAhB/0+yIAJ3xo
 9x9wYRFWuvaGdvW7h3fixdUD+cQSKBiu66oulkpC4sbwUXLg2UAI5eXQ2JwzZMTwdD3OMz
 kgm+SWm7/8JZGAv5CZbqu8chGEjRaMrBqF+yamIYXo9KfQIGtHn9ozKHOQhw3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:12 +0100
Subject: [PATCH i-g-t v5 41/48] lib/igt_dp: Create generic helpers for DP
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-41-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7327;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=krxdvM7/9eWd7DL/qnZbSpRUWOzptt1q1dIreTLCibg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvN3FKotiDybmUcRTzhyT5HhtlGpmj5XThLO
 qBaTxeB+d+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIFvxAAsXZ6ak4qjw4PZO9HHUy3rWh6TDbTotu
 JVhdQTIhmrqK0BFybgUXGXrwzXTxe9EU/wqtTusQhT744r0J5og/X94JhRYiLNO8JOFXXH+qVD0
 j1PoCrYgORbPeRNp8rg0v9ePv6zQZjrrD2AAia198T5pm/T2HhxqExPzdkJkc2R6n3yv1rS6+uA
 XURbfhdIWoAA+0H7YnCnuSl5y4Sh1qw8DvnvjAV67Ye57SrTOHjHo7UlAlO1RNBOTUBPWNIaEw6
 PITk9qj1HH1/ZBGCgvhvDCCYahccjDJP/fuC8zHohYdIrh/yntpQ+Qcw08/56WBGja9IFCThsYM
 Pvum9Dne+hJuZgWGYO9GiT6Hz1RzFsG/GFrEi+H4IvGTLYOmBjQdsFf9zABTIn7rYdMKtaJphBV
 V+VLJAAh90TYioHDd2YJxU5s39KzkCF1mrvYn1iH0N2LMOOsAvQxDjFR/1yGz5HnN4KaZM1GY31
 l9f1gLz8MarD0iEtzFR6753Gdv0YK3Xd0yAHjNBxAv5/NbPTTPYZ1S9sbQk0RwV0wbrIFJLOtzr
 x7AmO6oOAlidJC1aILwH7EUhI4t2e49FanLDPdpcuRdu7QxdknLsc/Gg4j+KVLC3UuUJ1Khkezb
 Y7PbLLm5EXzdUugnRz0e+914GSR/HesQ1RBCuJu6PErfxYeC7s/Q=
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
 lib/igt_dp.c    | 164 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dp.h    |  24 +++++++++
 lib/meson.build |   1 +
 3 files changed, 189 insertions(+)

diff --git a/lib/igt_dp.c b/lib/igt_dp.c
new file mode 100644
index 000000000000..f2ee1f7b9975
--- /dev/null
+++ b/lib/igt_dp.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: MIT
+//
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
+		// i915_dp_get_current_link_rate returns the value in tens of kb/s because
+		// that what the kernel uses. Convert it to kb/s to have a sane unit...
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
+		// i915_dp_get_current_link_rate returns the value in tens of kb/s because
+		// that what the kernel uses. Convert it to kb/s to be sane...
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
+		// i915_dp_get_current_link_rate returns the value in tens of kb/s because
+		// that what the kernel uses. Convert it to kb/s to be sane...
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
+		if (igt_dp_get_pending_retrain(drm_fd, output) == 0)
+			return;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed = (now.tv_sec - start.tv_sec) +
+					(now.tv_nsec - start.tv_nsec) / 1e9;
+
+		if (elapsed >= timeout)
+			break;
+	}
+	igt_assert_f(false, "Timeout waiting for pending retrain to complete\n");
+}
diff --git a/lib/igt_dp.h b/lib/igt_dp.h
new file mode 100644
index 000000000000..535ea5c9183d
--- /dev/null
+++ b/lib/igt_dp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
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
index c1ff44d67afb..468eae660a5b 100644
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

