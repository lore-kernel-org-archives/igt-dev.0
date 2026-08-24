Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C195FC5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 18:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8B10E0F5;
	Mon, 24 Aug 2026 18:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hR0p/uYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AE910E0F5
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597777; x=1819133777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=swFKYtYavVWoXwadw/CuzXnAnD3QZlP3EDmJp1NKHKs=;
 b=hR0p/uYyBMyDqOm5+psCJh9IMN5+4+Z1cJ5N0P18zBmpPpoJZ6UCxs5v
 tebcOqfkRY2pPy+fRg30pedtVKQl/47dMN3Foh+VFa1FaBQWbDBvPHypV
 qqwt7qMR1gk9cAV8+d9ZKthAWLo7Yf7muPHgirO+EflZJQSJ8sHXlTWwZ
 8byWBWlO7UF4mLqsnjvvMVqru3rs+LZCuKq8Uk8TIyI4G4dXQtv0pfz/C
 r7rVorycZyRo6p4DhWXr8UX1Zuw1IQCe2tIda7Jboo/v1VDvfdQy4aAyu
 c5NzpCTcrqtG3XeSUd5cDIwxfBFk3hL6ViZM9u1Wzgn6OHVi4RUt1Pw1a w==;
X-CSE-ConnectionGUID: CC2pd/PER8O9bM6CEGQ4Fw==
X-CSE-MsgGUID: UxCKI7hKTV6afTvkHYkB+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110842261"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="110842261"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:56:16 -0700
X-CSE-ConnectionGUID: u6vXUIV1QRyFd2PVuDgQ4w==
X-CSE-MsgGUID: A7uiY7eIQPKVX/sYt2VygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="272298309"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:56:14 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane: fix planar subtest documentation
Date: Tue, 25 Aug 2026 00:35:22 +0530
Message-Id: <20260824190522.314000-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Document only the parent subtest and keep dynamic descriptions
as comments above their test functions.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane.c | 47 +++++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 14d2d810f..388b869ea 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -41,31 +41,9 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: planar-pixel-format-settings@nv12-odd-width
- * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
- *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
- * Driver requirement: i915, xe
- *
- * SUBTEST: planar-pixel-format-settings@nv12-odd-height
- * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
- *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
- * Driver requirement: i915, xe
- *
- * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
- * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
- *              the kernel on Intel hardware (display ver < 35 expects -EINVAL).
- * Driver requirement: i915, xe
- *
- * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
- * Description: Verify odd vertical pan on P016 framebuffer and check CRC
- *              matches a reference XRGB8888 blue fill on Intel hardware.
- * Driver requirement: i915, xe
- *
- * SUBTEST: planar-pixel-format-settings@nv12-tile4-src-y
- * Description: Verify that an NV12 Tile4 framebuffer with src_y=1 renders
- *              correctly on Intel hardware. CRC comparison detects
- *              corruption.
- * Driver requirement: xe
+ * SUBTEST: planar-pixel-format-settings
+ * Description: Verify planar pixel format settings are accepted or rejected
+ *              correctly on Intel hardware.
  *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
@@ -1386,6 +1364,10 @@ planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 }
 
+/*
+ * Verify odd-width (257px) NV12 framebuffer is rejected by the kernel on
+ * Intel hardware (display ver < 20 expects -EINVAL).
+ */
 static void
 test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		    int display_ver)
@@ -1415,6 +1397,10 @@ test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		     rval, expected_rval);
 }
 
+/*
+ * Verify odd-height (257px) NV12 framebuffer is rejected by the kernel on
+ * Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
+ */
 static void
 test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		     int display_ver)
@@ -1444,6 +1430,10 @@ test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		     rval, expected_rval);
 }
 
+/*
+ * Verify odd horizontal pan on NV12 framebuffer is rejected by the kernel on
+ * Intel hardware (display ver < 35 expects -EINVAL).
+ */
 static void
 test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
 			     igt_output_t *output, int display_ver)
@@ -1475,6 +1465,10 @@ test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
 		     rval, expected_rval);
 }
 
+/*
+ * Verify odd vertical pan on P016 framebuffer and check CRC matches a
+ * reference XRGB8888 blue fill on Intel hardware.
+ */
 static void
 test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
 			   igt_output_t *output, int display_ver)
@@ -1540,7 +1534,8 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
 }
 
 /*
- * test_nv12_tile4_src_y - NV12 Tile4 with src_y=1 CRC correctness check.
+ * Verify that an NV12 Tile4 framebuffer with src_y=1 renders correctly on
+ * Intel hardware. CRC comparison detects corruption.
  *
  * If kernel program wrong UV DPT va, hardware read chroma from
  * an unmapped page, producing incorrect picture and crc mismatch
-- 
2.25.1

