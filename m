Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA10E108B8EB
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AEA10EACA;
	Fri, 20 Mar 2026 10:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpkOVkw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772BC10EACA
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774001773; x=1805537773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kls6eFRxUW3SkY/KLz8Cv2HvddoRUqykhDZS5aS7LxQ=;
 b=VpkOVkw7eKvR3QKpiovHGW31bsnLt9R8pVxxrRofxGWEXZ/h1DRv/aFX
 RjDyU3hRLGEAl+0pgHjsNMWegqiIPEO4NdipUFcnZhZ/CId+i+uBKkNab
 q63pFGrlh63nfNJlLXZfzWPlMpZixtKOAfwC8xVEqARj4+JKkrTYT6ADh
 Nmue97u6BBfmy8g7EpX7Qpt1OcKH7TVp7BS3tk1V0GB0nPfTYcn4629sh
 x1MOQcvXc6z4mmanLo+wx0DFMsKpQqN90aZMbPbTP8EiSu7mXXfteh+oK
 RU59HPdRWTesDxhvYz80xL66Geg3qLFwDkjpdHuoJ96gmD1SJlLXBi+tM Q==;
X-CSE-ConnectionGUID: ytG8kksNSFOEsRnVTZYWKQ==
X-CSE-MsgGUID: EhBYO61ySJKnFBCmnFOfJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92471397"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92471397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:16:12 -0700
X-CSE-ConnectionGUID: 4+cnoF6ZRRWnvjIRwPUYPQ==
X-CSE-MsgGUID: ZdFpfmJ6RuWqZ86bbfRRYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="228183608"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.84])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:16:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings to
 pass on VKMS
Date: Fri, 20 Mar 2026 11:16:06 +0100
Message-ID: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
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
format.

v2: remove is_intel var (Kamil), keep all comments (Swati)

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_plane.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d5bab62bb..7f7e2d9a6 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1365,11 +1365,8 @@ static void test_planar_settings(data_t *data)
 	int devid;
 	int display_ver = -1;
 	int rval;
+	bool is_vkms = false;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
 	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
 	if (is_intel_device(data->drm_fd)) {
 		igt_require_intel(data->drm_fd);
@@ -1377,6 +1374,8 @@ static void test_planar_settings(data_t *data)
 		igt_require(intel_display_ver(devid) >= 9);
 		display_ver = intel_display_ver(devid);
 		igt_require(display_ver >= 9);
+	} else if (is_vkms_device(data->drm_fd)) {
+		is_vkms = true;
 	}
 
 	crtc = igt_first_crtc_with_single_output(display, &output);
@@ -1387,13 +1386,15 @@ static void test_planar_settings(data_t *data)
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
+		if (display_ver >= 20 || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 257, 256,
@@ -1409,12 +1410,15 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd width NV12 framebuffer test skipped\n");
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/*
+	 * Test odd height for NV12 format.
+	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
+	 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20 && display_ver < 35)
+		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 256, 257,
@@ -1430,12 +1434,15 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd height NV12 framebuffer test skipped\n");
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/*
+	 * Test odd horizontal panning for NV12 format.
+	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
+	 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 35)
+		if (display_ver >= 35 || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 810, 590,
@@ -1452,11 +1459,15 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
 	}
 
+	/*
+	 * Test odd vertical panning for P016 format.
+	 * For Intel i915/xe test against intel_plane_check_src_coordinates()
+	 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
 					    DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20 && display_ver < 35)
+		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_color_fb(data->drm_fd, 256, 260,
-- 
2.53.0

