Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF89C79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 19:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A1F10E4B8;
	Mon,  7 Sep 2026 19:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljRImPat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBE710E4B8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788810148; x=1820346148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GzhXTtkzGBJP2wmuYQuqZsz7VXitZ4puaQYb1xHKjqY=;
 b=ljRImPatzyRu0WY0sfR8JPSAyCtKhHkEtEvLKhen+F+hI0PBzdCsi3na
 grGxNzeCfAOJxZg2WWg4Ksz0VPIL7pPCcUqUo4OoAMg5AX+LW/GsdDUkI
 B20yiR/l6dwif9oSKa/cB8kNSNonsMsgvYUF2bsNs4KDcOK1bRvaAP/rv
 Fk+q9opG5Z777gsUCvhuufF4288emHE+dw0CGxzrZvFpO4FsGgPYmSSHj
 VDnbf7UEmdQpyQcm8KcaxktYbth5QTfX/1UmtGx1IVAmRdWA/xY3NSGUh
 0lOoHphkHonJ1bdQEY4pJ/H9RB/LRKW1QFVPQ0n0X8Xd3AmNOaTIUT3M8 w==;
X-CSE-ConnectionGUID: 15vzy/mISg6tpOdly77v+g==
X-CSE-MsgGUID: khArBkeARzuVz+2NKOJ87w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="92912775"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92912775"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:42:28 -0700
X-CSE-ConnectionGUID: XvY2+CtsSG6UZ3gvZTNKzA==
X-CSE-MsgGUID: 361kWUdjRZCIoaH9LLCQJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294260137"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:42:26 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, swati2.sharma@intel.com,
 mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_vrr: Add VRR helper library for display
 refresh rate testing
Date: Tue,  8 Sep 2026 01:12:27 +0530
Message-ID: <20260907194229.3170868-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907194229.3170868-1-ramanaidu.naladala@intel.com>
References: <20260907194229.3170868-1-ramanaidu.naladala@intel.com>
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
v4: Address below review comments.
    - Add source and rationale for standard timing refresh
      rates. (Chaitanya)
    - Restrict target RR debugfs helper to Intel devices. (Chaitanya)
    - Make Intel target RR debugfs helper return bool instead of
      asserting in the library. (Mitul)
    - Avoid assertions in library functions and return status
      instead. (karthik)
    - Reorder source list as per naming convention.
    - Rename cmrr_supported() to igt_vrr_target_refresh_rate_supported()
      for consistency. (Chaitanya)
    - Move CMRR-specific macros and enums from the library to the test
      file. (Chaitanya)
v5: Address below review comments:
    - Add space after subject prefix. (Kamil)
    - Add blank line between system and local include headers. (Kamil)
    - meson: fix indentation for igt_vrr entry. (Kamil)
    - Rename target refresh rate helpers. (Chaitanya)
    - Change FPS count type to uint32_t. (Mitul)

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_vrr.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  30 +++++++++
 lib/meson.build |   1 +
 3 files changed, 197 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
new file mode 100644
index 000000000..1eaf0c3f7
--- /dev/null
+++ b/lib/igt_vrr.c
@@ -0,0 +1,166 @@
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
+/**
+ * Integer refresh rates that sinks advertise as standard video timings, and
+ * for which a fractional (rate * 1000/1001) counterpart is also defined:
+ *
+ *  - 24, 25, 30, 50 and 60 Hz are the film and broadcast (PAL/NTSC) cadences
+ *    carried over into the CTA-861 video formats.
+ *  - 48, 96, 100, 120, 200 and 240 Hz are the integer multiples of those
+ *    cadences, also listed as CTA-861 video formats.
+ *  - 75, 90, 144, 165 and 180 Hz are VESA DMT/CVT and adaptive-sync panel
+ *    rates in common use.
+ *
+ * The fractional variant of each entry (e.g. 60 -> 59.94) is what a target
+ * refresh rate in video mode programs.
+ */
+const uint32_t igt_vrr_standard_video_timing_fps[] = {
+	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
+};
+
+const uint32_t igt_vrr_standard_video_timing_fps_count =
+	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
+
+/**
+ * igt_vrr_target_rr_debugfs_write:
+ * @fd: DRM file descriptor.
+ * @crtc_index: Index of the CRTC.
+ * @rr_numerator: Numerator of the target refresh rate fraction.
+ * @rr_denominator: Denominator of the target refresh rate fraction.
+ *
+ * Write the target refresh rate configuration to the per-CRTC
+ * VRR debugfs interface. Passing 0/0 clears the target refresh
+ * rate.
+ *
+ * The debugfs interface is Intel specific, so this returns false on
+ * other drivers. Other drivers can add their own debugfs node here.
+ *
+ * Returns:
+ * true if the target refresh rate was written successfully, false otherwise.
+ */
+bool
+igt_vrr_target_rr_debugfs_write(int fd, int crtc_index,
+				uint32_t rr_numerator,
+				uint32_t rr_denominator)
+{
+	char buf[32];
+	int ret, dir, len;
+
+	if (!is_intel_device(fd)) {
+		igt_info("Not an Intel device\n");
+		return false;
+	}
+
+	len = snprintf(buf, sizeof(buf), "%u/%u", rr_numerator, rr_denominator);
+	if (len <= 0 || len >= (int)sizeof(buf))
+		return false;
+
+	dir = igt_debugfs_crtc_dir(fd, crtc_index);
+	if (dir < 0)
+		return false;
+
+	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, len);
+	close(dir);
+
+	return ret == len;
+}
+
+/**
+ * igt_vrr_target_rr_debugfs_read:
+ * @fd: DRM file descriptor.
+ * @crtc_index: Index of the CRTC.
+ * @buf: Buffer to store the target refresh rate string.
+ * @size: Size of @buf in bytes.
+ *
+ * Read the target refresh rate from the per-CRTC VRR debugfs interface.
+ * The returned string is always NUL-terminated on success.
+ *
+ * The debugfs interface is Intel specific, so this returns false on
+ * other drivers. Other drivers can add their own debugfs node here.
+ *
+ * Return:
+ * true if the target refresh rate was read successfully, false otherwise.
+ */
+bool
+igt_vrr_target_rr_debugfs_read(int fd, int crtc_index, char *buf, size_t size)
+{
+	int ret, dir;
+
+	if (!buf || !size)
+		return false;
+
+	if (!is_intel_device(fd)) {
+		igt_info("Not an Intel device\n");
+		return false;
+	}
+
+	dir = igt_debugfs_crtc_dir(fd, crtc_index);
+	if (dir < 0)
+		return false;
+
+	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
+			     buf, size - 1);
+	close(dir);
+
+	if (ret < 0)
+		return false;
+
+	buf[ret] = '\0';
+
+	return true;
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
+ * igt_vrr_target_refresh_rate_supported:
+ * @fd: DRM device file descriptor.
+ * @crtc_index: Index of the CRTC.
+ *
+ * Checks whether the target refresh rate debugfs node is present for the
+ * specified CRTC, indicating CMRR support.
+ *
+ * The debugfs interface is Intel specific, so this returns false on
+ * other drivers. Other drivers can add their own debugfs node here.
+ *
+ * Returns: true if CMRR is supported, false otherwise.
+ */
+bool igt_vrr_target_refresh_rate_supported(int fd, int crtc_index)
+{
+	int dir;
+
+	if (!is_intel_device(fd))
+		return false;
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
index 000000000..84d26cd1d
--- /dev/null
+++ b/lib/igt_vrr.h
@@ -0,0 +1,30 @@
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
+
+#include "igt.h"
+#include "igt_kms.h"
+
+extern const uint32_t igt_vrr_standard_video_timing_fps[];
+extern const uint32_t igt_vrr_standard_video_timing_fps_count;
+
+bool
+igt_vrr_target_rr_debugfs_write(int fd, int crtc_index,
+				uint32_t rr_numerator,
+				uint32_t rr_denominator);
+bool
+igt_vrr_target_rr_debugfs_read(int fd, int crtc_index,
+			       char *buf, size_t size);
+
+double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
+
+bool igt_vrr_target_refresh_rate_supported(int fd, int crtc_index);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index a7cde027e..d1a770b6d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -56,6 +56,7 @@ lib_sources = [
 	'igt_vec.c',
 	'igt_vgem.c',
 	'igt_vkms.c',
+	'igt_vrr.c',
 	'igt_x86.c',
 	'instdone.c',
 	'intel_allocator.c',
-- 
2.43.0

