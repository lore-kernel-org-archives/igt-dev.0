Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDA4CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B264210E3B9;
	Mon, 10 Nov 2025 13:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="x7C4iz/C";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FA10E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0DE3EC108F0;
 Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C2C5606F5;
 Mon, 10 Nov 2025 13:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D2BB1037191E; Mon, 10 Nov 2025 14:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=q9TEyL910IZDgwz/P0MhS2gzn9E+RY6/6BR7N30kPZ4=;
 b=x7C4iz/C2Wj1PsVPkqY5SbL5ya5GUEitkLPXWH1al4q1I3LCWYCVQvdz5PWIYVVOQNDcpz
 HfYlzqgAYfxRHUNwHOVeS01yh2joyzpruC01jB5brsbsy1xLk3uinw0HGIh8XnMbTPPfn9
 DguToAa8Vcc8g+jp/fPB6RtZX/ayo6lDxYNxPte2H6Xdu/rqN+rtu+trJ8ARe8uDQckinU
 qQoriudpnEbxHjkBvTs5vwavcxOLmXIqyJa94XtJrmjraaKEfmV/XhvqGFf3wFyycu2kst
 ttzTop7iXoNG/4dE0shq5Lr18YuCCswVnSq+BvZMZCdPkSAuGtxrjpE74j1xew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:44 +0000
Subject: [PATCH i-g-t v4 42/46] lib/igt_dp: Create generic helpers for DP
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-42-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7403;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sIRFZTkFE4Qp1bBeSwfXvpnHYg6q8YW+EdfUdtyUwuw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesTB59ngTGfSMmX+9vIgAGkSi4gd/UXGajfX
 yz9xmRJj+CJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEwAKCRAgrS7GWxAs
 4v7zD/4rY56o5TpJTiqgN7Ny+BjYH7SlMw8UoG9KXNRdDmliZl0uclMOuasO538/cIVoBOHb03U
 WBUHGkCDylGYpVbO3SNmh2WbiqVXXgpsMsKXXKG31yZ2f4UiiXjfan0s4oTnFPrKMj7FUzbQQdY
 MRFWOdDNkQoNhmZMP2zoU1K2743pFu1k/WDP+7SaxnDPvLlOytDVQ3v/918ifggYhgtKd0vFm70
 eMgSROygEaPvLTNTb5gwwppdtKBKAHr3diHrpmRRG9ndGUtKWZxZpPH60Qu/HxO0riv6vHs2FjW
 eiI56y3n5+q/R7PyqNyfwRWM0tkhwqQc7i1wiBK29qIdEvoBrRstgkMWKnbeEyAe2RjL+qiT3HM
 qC+CjVKUHiPmNPifZOVvXBHgID4xSgeuXuo2cEhACoMRhcsAmHbaVsdteWajcTsjXaBASlXhjmu
 U+jDVujqCasEPWIfdgx6HvCFMUsgHebBrhQbbJgwy60+zVmHcEDX/tofFebZdaq9V7A983JEcRj
 1vEJU1XuAbs164yHqCGMSFMJgJqVx6hXcUbwUPL4zvA0L9/Ctu+iAlaQ+T6TL0VtEZsUbpcDctf
 mLMGJyIShdZWXFaV/HSiXlw/3r/godAKgMxHtlVRa1bH7rsUkyIFTjyo/aD8Bm3LkNaNM8jgejN
 9ZPGwEhxLNRkzzg==
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
 lib/igt_dp.c    | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dp.h    |  89 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/meson.build |   1 +
 3 files changed, 191 insertions(+)

diff --git a/lib/igt_dp.c b/lib/igt_dp.c
new file mode 100644
index 000000000000..ca344e4440cf
--- /dev/null
+++ b/lib/igt_dp.c
@@ -0,0 +1,101 @@
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
+int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		// i915_dp_get_current_link_rate returns the value in tens of kb/s because
+		// that what the kernel uses. Convert it to kb/s to be sane...
+		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
+
+	igt_assert_f(false, "Current drm device is not able to report used link rate\n");
+	return -EINVAL;
+}
+
+int igt_dp_get_current_lane_count(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		return i915_dp_get_current_lane_count(drm_fd, output);
+
+	igt_assert_f(false, "Current drm device is not able to report used lane count\n");
+	return -EINVAL;
+}
+
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
+int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		return i915_dp_get_max_lane_count(drm_fd, output);
+
+	igt_assert_f(false, "Current drm device is not able to report max lane count\n");
+	return -EINVAL;
+}
+
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
+int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
+{
+	if (is_intel_device(drm_fd))
+		return i915_dp_get_pending_retrain(drm_fd, output);
+
+	igt_assert_f(false, "Current drm device does not support pending retrain count checking\n");
+	return -EINVAL;
+}
+
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
index 000000000000..dacd0e598412
--- /dev/null
+++ b/lib/igt_dp.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _IGT_DP_H_
+#define _IGT_DP_H_
+
+#include "igt_kms.h"
+
+/**
+ * igt_dp_get_current_link_rate: Get current link rate on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The current link rate in kb/s, or a negative error code on failure.
+ */
+int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output);
+
+/**
+ * igt_dp_get_current_lane_count: Get current lane count on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The number of active lanes, or a negative error code on failure.
+ */
+int igt_dp_get_current_lane_count(int drm_fd, igt_output_t *output);
+
+/**
+ * igt_dp_get_max_link_rate: Get maximum link rate on a display port
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ *
+ * Returns:
+ * The maximum link rate in kb/s, or a negative error code on failure.
+ */
+int igt_dp_get_max_link_rate(int drm_fd, igt_output_t *output);
+
+int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output);
+
+/**
+ * igt_dp_get_max_lane_count: Get maximum lane count on a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * Returns:
+ * The maximum number of lanes, or a negative error code on failure.
+ */
+int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output);
+
+/**
+ * igt_dp_force_link_retrain: Force link retraining on a display port
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ * @retrain_count:	Number of times to retrain the link
+ */
+void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+
+/**
+ * igt_dp_get_link_retrain_disabled: Check if link retraining is disabled
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ *
+ * Returns:
+ * true if link retraining is disabled, false otherwise
+ */
+bool igt_dp_get_link_retrain_disabled(int drm_fd, igt_output_t *output);
+
+/**
+ * igt_dp_get_pending_retrain: Get pending link retrain count
+ * @drm_fd:		DRM file descriptor
+ * @output:		igt_output_t object representing the display port
+ *
+ * Returns:
+ * The number of pending retrain operations, or a negative error code on failure.
+ */
+int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
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
+void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index fa4663abc0ab..cd5face9e943 100644
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
2.51.0

