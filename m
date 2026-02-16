Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D494E83824
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 18:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F66410E0D7;
	Mon, 16 Feb 2026 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClQTKCDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE46910E0D7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771267962; x=1802803962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ab4BVRNf9wkFc6iYFYQT7dWIPq6x8tW1iOrA+IAcbqI=;
 b=ClQTKCDPGWH7XMa2z6xmB6EH4n+zhQdC7qYWK0HaQt7J/XPsq8/XnbsS
 J0Id9jmDdSl9ZOz8s/SVkPVct/c59x0yX0O2opSGCA3bNWoauJ/QjSbco
 X9ibzjo8psJr2prRk3a+18IRYoE7zcAq93d1wWEOnDYPldU9DM83QrSjB
 6HgNJXtw9XZVSaoyg8RCfNLdAUkqEeGFRwASn+QNOdVSVhiDezPzU+sWn
 JJ0VEVxleRf+RKrEDlRxjrn416IZ7dwljk5syKLKmZSVO+PzDjugzl79e
 Y36GlcXiPp3ICN+MSsSf0lbiKexo4DEzRt/kpJssykD0h9wh1MP3NBWOl Q==;
X-CSE-ConnectionGUID: Uzc44DgJQjmJWFEBBiXn9g==
X-CSE-MsgGUID: fGeXRvoLSb6kGN1vUysQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83788122"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83788122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:52:42 -0800
X-CSE-ConnectionGUID: gXcbVJdDSRaDwTvvoULXzA==
X-CSE-MsgGUID: RE5ySazWRtecNk+DVZ46DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218666917"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.237])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 10:52:40 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Leo Li <sunpeng.li@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings to
 pass on VKMS
Date: Mon, 16 Feb 2026 19:52:31 +0100
Message-ID: <20260216185231.164130-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

From: Renjun Wang <renjunw0@foxmail.com>

Enable planar-pixel-format-settings subtests when running on VKMS
driver. VKMS currently accepts odd width|height for NV12, odd
horizontal panning for NV12, and odd vertical panning for P016
formats.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
Reformatted descriptions, also left one comment for Intel. Kamil

 tests/kms_plane.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 362748cdb..a6dcb5585 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1331,11 +1331,9 @@ static void test_planar_settings(data_t *data)
 	int devid;
 	int display_ver = -1;
 	int rval;
+	bool is_intel = false;
+	bool is_vkms = false;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
 	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
 	if (is_intel_device(data->drm_fd)) {
 		igt_require_intel(data->drm_fd);
@@ -1343,6 +1341,9 @@ static void test_planar_settings(data_t *data)
 		igt_require(intel_display_ver(devid) >= 9);
 		display_ver = intel_display_ver(devid);
 		igt_require(display_ver >= 9);
+		is_intel = true;
+	} else if (is_vkms_device(data->drm_fd)) {
+		is_vkms = true;
 	}
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
@@ -1354,13 +1355,15 @@ static void test_planar_settings(data_t *data)
 	igt_display_commit_atomic(&data->display,
 				  DRM_MODE_ATOMIC_ALLOW_MODESET,
 				  NULL);
-
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/*
+	 * Test odd width for NV12 format.
+	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
+	 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20)
+		if ((is_intel && display_ver >= 20) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 257, 256,
@@ -1376,12 +1379,12 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd width NV12 framebuffer test skipped\n");
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/* Test odd height for NV12 format. */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20 && display_ver < 35)
+		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 256, 257,
@@ -1397,12 +1400,12 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd height NV12 framebuffer test skipped\n");
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/* Test odd horizontal panning for NV12 format. */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 35)
+		if ((is_intel && display_ver >= 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 810, 590,
@@ -1419,11 +1422,12 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
 	}
 
+	/* Test odd vertical panning for P016 format. */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
 					    DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20 && display_ver < 35)
+		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_color_fb(data->drm_fd, 256, 260,
-- 
2.53.0

