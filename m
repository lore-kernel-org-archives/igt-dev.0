Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ECBC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 13:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9F10EFC9;
	Wed, 12 Aug 2026 13:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mdd+vQzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CD510EFC9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786540053; x=1818076053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7T8rs/+Kv7CAEDiW7fgb6B/xcz6w+gBsIVMA3ClF9qs=;
 b=Mdd+vQzZ3JAt34CV2OZbuYuXdcKc0rnr5OXRyLhFPMVSzFGL4u1YxNKC
 6S/Vuc/WVjYK7pBZPSGaNsG3q2HaNkLzleI18mFQb6Rh6TW9fcqN9DVtX
 Cdbv76s/UWZ9z7UrzZX84mAeZNvBhBJp+I6XYb5Zjfn7vOwahYkgmPXE0
 FZMLflhWqLKFweAkB+6P1jG0gPpniBNWYITRBHWY/cxysnAku4OWe+/Gn
 dzGV9r2gGUdieN2nwMlOkqbl0Ybo1jIBsl65rJkLrz0hnPnzNcCUssf8+
 qpo2Sej56y+81N70cXjsBThQBg+gj4cJHpZMuAZzE0nfN+IWFYGwhMYwJ g==;
X-CSE-ConnectionGUID: Idw+C+oiQO2KSgAfv9W2LA==
X-CSE-MsgGUID: dSRtQJ83S1ShI/gGtP72sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98454601"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98454601"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:07:33 -0700
X-CSE-ConnectionGUID: 4TJkGTeYRj+dFOym4kxnMQ==
X-CSE-MsgGUID: MsQJEPQiSaqL1T9kRThs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267503549"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 06:07:32 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/igt_vrr:Add VRR helper library for display
 refresh rate testing
Date: Wed, 12 Aug 2026 18:37:35 +0530
Message-ID: <20260812130738.1242659-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Introduce a new helper library for Variable Refresh Rate (VRR).

Add helpers to validate targeted refresh-rate testing.

v2: Modify debugfs with helpers.
v3: Add helper to check cmrr support.
    Address review comments. (Mitul)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_vrr.c   | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  44 ++++++++++++++
 lib/meson.build |   1 +
 3 files changed, 199 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
new file mode 100644
index 000000000..704eaa3a3
--- /dev/null
+++ b/lib/igt_vrr.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <inttypes.h>
+
+#include "igt_vrr.h"
+#include "igt_sysfs.h"
+
+const uint32_t igt_vrr_standard_video_timing_fps[] = {
+	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
+};
+
+const size_t igt_vrr_standard_video_timing_fps_count =
+	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
+
+/**
+ * igt_target_rr_debugfs_write:
+ * @fd: DRM file descriptor.
+ * @crtc_index: Index of the CRTC.
+ * @vrefresh: Target refresh rate to program.
+ * @numerator: Numerator component of the target refresh rate fraction.
+ * @denominator: Denominator component of the target refresh rate fraction.
+ *
+ * Write the target refresh rate configuration to the per-CRTC
+ * VRR debugfs interface.
+ *
+ * Returns: None.
+ */
+void
+igt_target_rr_debugfs_write(int fd, int crtc_index,
+			    uint32_t vrefresh,
+			    uint32_t numerator,
+			    uint32_t denominator)
+{
+	char buf[32];
+	int ret, dir;
+	uint64_t val;
+
+	val = vrefresh * numerator;
+
+	snprintf(buf, sizeof(buf), "%" PRIu64 "/%u",
+		 val, denominator);
+
+	dir = igt_debugfs_crtc_dir(fd, crtc_index);
+	igt_require_fd(dir);
+
+	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate",
+			      buf, sizeof(buf) - 1);
+	 close(dir);
+	 igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
+}
+
+/**
+ * igt_cmrr_debugfs_read:
+ * @fd: DRM file descriptor.
+ * @crtc_index: Index of the CRTC.
+ *
+ * Read the configured refresh rate from the per-CRTC VRR debugfs node.
+ *
+ * Return: None.
+ */
+void
+igt_target_rr_debugfs_read(int fd, int crtc_index)
+{
+	char buf[32];
+	int ret, dir;
+
+	dir = igt_debugfs_crtc_dir(fd, crtc_index);
+	igt_require_fd(dir);
+
+	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
+			     buf,  sizeof(buf) - 1);
+	close(dir);
+	igt_assert_f(ret >= 0,
+		     "Failed to read intel_vrr_target_refresh_rate.\n");
+
+	buf[ret] = '\0';
+
+	igt_info("vrr target RR: %s\n", buf);
+}
+
+/**
+ * igt_vrr_mode_line_refresh_hz:
+ * @mode: DRM display mode used for the calculation
+ *
+ * Compute the refresh rate directly from the mode timing parameters.
+ *
+ * Returns: Refresh rate in Hz as a floating-point value.
+ */
+double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
+{
+	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)mode->vtotal);
+}
+
+/**
+ * igt_vrr_get_mode_with_video_timing:
+ * @output: Display output containing connector mode list
+ * @fps: Requested integer refresh rate in Hz
+ * @matched_mode: Returned mode that matches @fps
+ *
+ * Find and return a connector mode that matches the requested
+ * video timing refresh rate in Hz.
+ *
+ * Returns: true when a mode is found, false otherwise
+ */
+
+bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
+					uint32_t fps,
+					drmModeModeInfo *matched_mode)
+{
+	drmModeConnectorPtr connector;
+
+	connector = output->config.connector;
+	if (!connector)
+		return false;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		if (connector->modes[i].vrefresh == fps) {
+			*matched_mode = connector->modes[i];
+			return true;
+		}
+	}
+	return false;
+}
+
+/**
+ * cmrr_supported:
+ * @fd: DRM device file descriptor.
+ * @crtc_index: Index of the CRTC.
+ *
+ * Checks whether the intel_vrr_target_refresh_rate debugfs node is present
+ * for the specified CRTC, indicating CMRR support.
+ *
+ * Returns: true if CMRR is supported, false otherwise.
+ */
+bool cmrr_supported(int fd, int crtc_index)
+{
+	int dir;
+
+	dir = igt_debugfs_crtc_dir(fd, crtc_index);
+
+	if (dir < 0)
+		return false;
+
+	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
+		close(dir);
+		return true;
+	}
+
+	close(dir);
+	return false;
+}
diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
new file mode 100644
index 000000000..a317d4684
--- /dev/null
+++ b/lib/igt_vrr.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_VRR_H
+#define IGT_VRR_H
+
+#include <stdbool.h>
+#include <stdint.h>
+#include "igt.h"
+#include "igt_kms.h"
+
+#define CMRR_NUMERATOR 1000ULL
+#define CMRR_DENOMINATOR 1000ULL
+#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
+#define TARGET_RR_SAMP_COUNT 100
+
+enum {
+	CMRR_VIDEO_MODE,
+	CMRR_NON_VIDEO_MODE,
+	CMRR_DISABLE,
+};
+
+extern const uint32_t igt_vrr_standard_video_timing_fps[];
+extern const size_t igt_vrr_standard_video_timing_fps_count;
+
+void
+igt_target_rr_debugfs_write(int fd, int crtc_index,
+			    uint32_t vrefresh,
+			    uint32_t numerator,
+			    uint32_t denominator);
+void
+igt_target_rr_debugfs_read(int fd, int crtc_index);
+
+double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
+
+bool igt_vrr_get_mode_with_video_timing(igt_output_t *output,
+					uint32_t fps,
+					drmModeModeInfo *matched_mode);
+
+bool cmrr_supported(int fd, int crtc_index);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..8675bd4a6 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -22,6 +22,7 @@ lib_sources = [
 	'igt_configfs.c',
 	'igt_facts.c',
 	'igt_crc.c',
+        'igt_vrr.c',
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
-- 
2.43.0

