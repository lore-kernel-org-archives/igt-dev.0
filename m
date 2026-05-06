Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16112CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 08:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D7A10E522;
	Wed,  6 May 2026 08:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQJNPgkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29C610E522
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778057239; x=1809593239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/P8zmmcf2fM4UbGKYOOMHWkUxykzv68AhunynfKG4A=;
 b=OQJNPgkliW05cC6nUj/+QPrQ4/0wZkqKSRBCzV2p+Z275NeiK17Wo3cu
 3QF6BerMR53H1g00zKICqjPzcZeiIOxws0PbRnoa1+MmdTqCUwhUL5/qK
 dKvFn4ecQZp6KVYuvW/m8MnuPh08v3sML/m4QDE2uTa5yf/c4iJNfr1Aw
 PXDusnBCx7EKr9pAx45FoFFtI7CrkRyNFQxHrbWZxrQkcHiEodnnfHWO7
 hOVY+Edh+MPvvdjlhNuzvlOz4RowPQeAIMsYrSxD76/QHCeuE7PyUE9yK
 2NBzCDL7Q+SWbPYc7HWguElmNBFzG/8xEzokdwR/bAo/sltni+U+n5s/z A==;
X-CSE-ConnectionGUID: 9MIvMOtbRxKAWpY7tPiS7Q==
X-CSE-MsgGUID: QI+ESysgSjmp/VCaaV+PBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82585319"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82585319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:47:19 -0700
X-CSE-ConnectionGUID: b3xv3rIPRYSc+BXkjmMEEA==
X-CSE-MsgGUID: f7/S8gXrQXSXu+olRGf7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="266434280"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 01:47:16 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/1] tests/fbdev: skip non-zero pan on mixed-size
 multi-display
Date: Wed,  6 May 2026 13:52:42 +0530
Message-Id: <20260506082242.2605199-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506082242.2605199-1-chaitanya.kumar.borah@intel.com>
References: <20260506082242.2605199-1-chaitanya.kumar.borah@intel.com>
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

fbdev virtual dimensions are derived from the largest active display
layout, while the visible fbdev resolution reflects the smallest
active display. Since fbdev pan offsets are applied globally to all CRTCs,
non-zero pan requests on mixed-size multi-display setups can still fail
source bounds validation even when var info appears to indicate available
pan space.

Example:

In a dual display setup with 1920x1200 and 3840x2160 displays,
IGT receives the following values:

xres=1920 yres=1200 xres_virtual=3840 yres_virtual=2160

The framebuffer allocated by kernel is based on the largest display
(3840x2160), This leaves no room for panning. The computed non-zero
offsets therefore exceed the framebuffer bounds, causing
drm_atomic_plane_check() to fail with -ENOSPC.

[drm:drm_atomic_check_only] [PLANE:203:plane 1B] invalid source coordinates 3840.000000x2160.000000+1920.000000+960.000000 (fb 3840x2160)

Therefore, detect mixed-size active displays using DRM mode APIs and,
in that case, skip the two non-zero expected-success cases:
  - Jump to opposite end of virtual screen
  - Jump to maximum extend

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488
Assisted-by: GitHub Copilot:Claude Haiku 4.5
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/fbdev.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 92 insertions(+), 8 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index a1f855ea4..edef9b5a6 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -43,6 +43,7 @@
 #include <unistd.h>
 
 #include <linux/fb.h>
+#include <xf86drmMode.h>
 
 #include "igt.h"
 
@@ -111,6 +112,77 @@ static void pan_test(int fd, const struct fb_var_screeninfo *var, int expected_r
 		     pan_var.xoffset, pan_var.yoffset, new_var.xoffset, new_var.yoffset);
 }
 
+static bool mixed_size_multihead_active(void)
+{
+	int drm_fd;
+	drmModeRes *res;
+	unsigned int active_w = 0, active_h = 0;
+	bool first_active = true;
+	bool mixed = false;
+
+	drm_fd = drm_open_driver(DRIVER_ANY);
+	if (drm_fd < 0)
+		return false;
+
+	res = drmModeGetResources(drm_fd);
+	if (!res) {
+		close(drm_fd);
+		return false;
+	}
+
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *conn;
+		drmModeEncoder *enc;
+		drmModeCrtc *crtc;
+
+		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (!conn)
+			continue;
+
+		if (conn->connection != DRM_MODE_CONNECTED || !conn->encoder_id) {
+			drmModeFreeConnector(conn);
+			continue;
+		}
+
+		enc = drmModeGetEncoder(drm_fd, conn->encoder_id);
+		if (!enc || !enc->crtc_id) {
+			if (enc)
+				drmModeFreeEncoder(enc);
+			drmModeFreeConnector(conn);
+			continue;
+		}
+
+		crtc = drmModeGetCrtc(drm_fd, enc->crtc_id);
+		drmModeFreeEncoder(enc);
+		drmModeFreeConnector(conn);
+		if (!crtc)
+			continue;
+
+		if (!crtc->mode_valid) {
+			drmModeFreeCrtc(crtc);
+			continue;
+		}
+
+		if (first_active) {
+			active_w = crtc->mode.hdisplay;
+			active_h = crtc->mode.vdisplay;
+			first_active = false;
+		} else if (crtc->mode.hdisplay != active_w ||
+			   crtc->mode.vdisplay != active_h) {
+			mixed = true;
+			drmModeFreeCrtc(crtc);
+			break;
+		}
+
+		drmModeFreeCrtc(crtc);
+	}
+
+	drmModeFreeResources(res);
+	close(drm_fd);
+
+	return mixed;
+}
+
 static void mode_tests(int fd)
 {
 	struct fb_var_screeninfo var_info;
@@ -168,26 +240,38 @@ static void mode_tests(int fd)
 	igt_describe("Check panning / page flipping");
 	igt_subtest("pan") {
 		struct fb_var_screeninfo pan_var;
+		bool has_mixed_size_displays;
 		int expected_ret;
 
 		memset(&pan_var, 0, sizeof(pan_var));
+		has_mixed_size_displays = mixed_size_multihead_active();
 
 		/*
 		 * Tests that are expected to succeed.
 		 */
 
-		igt_debug("Jump to opposite end of virtual screen\n");
-		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres - var_info.xoffset);
-		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres - var_info.yoffset);
-		pan_test(fd, &pan_var, 0);
+		if (!has_mixed_size_displays) {
+			igt_debug("Jump to opposite end of virtual screen\n");
+			pan_var.xoffset =
+				XOFFSET(var_info.xres_virtual - var_info.xres - var_info.xoffset);
+			pan_var.yoffset =
+				YOFFSET(var_info.yres_virtual - var_info.yres - var_info.yoffset);
+			pan_test(fd, &pan_var, 0);
+		} else {
+			igt_debug("Skipping non-zero pans on mixed-size multi-display topology\n");
+		}
 		igt_debug("Jump to (0, 0)\n");
 		pan_var.xoffset = XOFFSET(0);
 		pan_var.yoffset = YOFFSET(0);
 		pan_test(fd, &pan_var, 0);
-		igt_debug("Jump to maximum extend\n");
-		pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres);
-		pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres);
-		pan_test(fd, &pan_var, 0);
+		if (!has_mixed_size_displays) {
+			igt_debug("Jump to maximum extend\n");
+			pan_var.xoffset = XOFFSET(var_info.xres_virtual - var_info.xres);
+			pan_var.yoffset = YOFFSET(var_info.yres_virtual - var_info.yres);
+			pan_test(fd, &pan_var, 0);
+		} else {
+			igt_debug("Skipping non-zero pan on mixed-size multi-display topology\n");
+		}
 
 		/*
 		 * Tests that are expected to fail.
-- 
2.25.1

