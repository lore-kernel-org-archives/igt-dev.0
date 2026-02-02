Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73996E7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1381B10E4F8;
	Mon,  2 Feb 2026 14:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KPuTLAFc";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87A10E4F6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4BC5D1A2C16;
 Mon,  2 Feb 2026 14:33:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 237AD60767;
 Mon,  2 Feb 2026 14:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E90A9119A8911; Mon,  2 Feb 2026 15:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3iONabodQo7qytkxkEy05NURUjC7AiTV95rryIWpblI=;
 b=KPuTLAFc4VzYShBrLHfs7D12zggRdfbVgo/y/pGR/PuLipnUdMACzCWI0XWtOSHjvU+a2M
 iUmvPUZD0xFuBBaSgaNPckPbTAf0ZE0mhzwIhNJoH0WX7uN7c+bdNTRuwnVtQWVBA79YTb
 ABzmQhJ8Htf6trle1j8oJpghfVJB/pqR90h2/h52rcKywoOvmZKCAEZnEMfPi4WseQmRCw
 hDbluY38mEPrr4Q+uJody9yJg/O40BJSD2Xo/WQRH6zLzMKiooInSuxpROa3Kz/11rz8t6
 zlvtQdjnFExQdHDnKb7GofDsgMu2XFGbFWWbAp14gk492wG1tHFEYs/A8dWr0Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:20 +0100
Subject: [PATCH i-g-t v6 41/48] lib/igt_dp: Create generic helpers for DP
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-41-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7327;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bPz/8GRe3RUf3ZFOZkOBs0/x2mKn2ndUzvRk3iJwT9k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWUmU5cfY8Phv4R2srEr7FLAC8xKK+Ams9ow
 e5d2qvnBl+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJe5BAA06JwvV6F8LBUzNj2CKRYvS1WhQUdWQL
 GG8f+2kCFrEKhZjfIsLtTFLUu8mjonE+MHFiw26hjrWfSQegQi/chzfFBxEUiFfn4+vxH1vX/un
 S+wD57Fj70fjuMl91X6sfPyFYQ/NGzKNefb08BMlXgmUIhTPYh/kDvJnGBT4GLw1GO1LgpQF4ZK
 sOs9R6NPE82FRMAAroR0fGTt4a+VM2uP+DRXXONNwqrvjjBTUE8DwT4LV0E/jrzfSso8+dAsuRI
 U3+WI1DAFC4hSCcCruTsFXFXZx5UwUQw8556YFFqM/2c+VSnaUOt0tf8ilGDM006DQoPr4K02zf
 Yqh2t6YybLcfxVAaMm9jqNG46vOTcHz+sYqyrDyhkF8T8wxWA0bTBxQwWQVrWX5+cWVKLW6hkgh
 j+rZ+P0R2jfIwAgWQ2f0UDN2g6t3L8XK8SiDjUmw9XtNc+6LBkW62orjidoV6oTFpozCGQ/aqE3
 MpnIhwzma7III91Psri0fy236AVvY7tpFNPBZ+MvkohJhnqsGCgL1fARDlt28tFhI8ikPnZWAgS
 8QFNXvkP7yenNGRghIIAZcTY9hNlgweNzczyrFrxssah/86y+DSusHFDst0ucoMf9qlpCVX9ZYL
 bpSy5JYtAw9EM7Eoo2LFWz4PRapQjIkSnIojPtmITpeFTDHV86Oo=
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
index adf2443173cf..12063258eaa1 100644
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

