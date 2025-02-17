Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DCCC021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 17:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C008110E564;
	Mon, 17 Feb 2025 17:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnjqkOue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4573610E564
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739813521; x=1771349521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F3xEr+G6b63aFeVnwX8vBwxEfte1+OGbDUYRZML0yB8=;
 b=JnjqkOueABP6aHu/TvrOZqsuupPeXsekhCOVXIVB++8cjE7m699JxD5r
 CkPsYD7v5ADm01g1GXBAolojDEH0UN9Zc4F4TG1TFAdAYrsGUAIaPyNoU
 J6cHvvYGuot4gCEb1TykN6MFHvC8uG9ilREOsCsG5SPs31mKqS3ENrIf1
 yE/FYW7sDLzLmWStaEUZBvt9DeioB2DRLgG8C6JhrCr/ih0EkhOFfAh32
 OweW296BiVAk/k/9SfnH1ymnKqEHiq97DaNr6+Jp/FNj1PL954yYTgY5d
 n6GafdIsQOrih/2VpVKbkQX0DeQ/+vOndIay7TroGF/gDvY1gXKu+W3m5 g==;
X-CSE-ConnectionGUID: lez9k6dyRPiBlLZK8Z2d3g==
X-CSE-MsgGUID: ic7fp/YpT5q3a7wjRNYBMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40528126"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="40528126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:32:01 -0800
X-CSE-ConnectionGUID: FscqMbxHTpaHOxbTFKOVGQ==
X-CSE-MsgGUID: l6iMFyg/R+2nEz7Y+Id2ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114157050"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:32:00 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_fb_tiling: convert to subtest
 basic-x-tiling
Date: Mon, 17 Feb 2025 18:31:49 +0100
Message-ID: <20250217173149.157360-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Refactor test and create one subtest basic-x-tiling.
It should improve debugs logs in case of fails or skips,
also it shows which format is used for testing.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_fb_tiling.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index 849e37164..8d95416f7 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -32,28 +32,38 @@
  * Functionality: object tiling
  * Feature: mapping
  *
- * SUBTEST:
+ * SUBTEST: basic-x-tiling
  */
 
 IGT_TEST_DESCRIPTION("Object tiling must be fixed after framebuffer creation.");
 
-igt_simple_main
+igt_main
 {
-	int drm_fd = drm_open_driver_master(DRIVER_INTEL);
+	int drm_fd;
 	struct igt_fb fb;
-	int ret;
 
-	igt_require(gem_available_fences(drm_fd) > 0);
+	igt_fixture {
+		drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		igt_require(gem_available_fences(drm_fd) > 0);
+	}
 
-	igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &fb);
+	igt_subtest("basic-x-tiling") {
+		int ret, ret2;
 
-	ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_X, fb.strides[0]);
-	igt_assert_eq(ret, 0);
+		igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
+			      I915_FORMAT_MOD_X_TILED, &fb);
 
-	ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_NONE, fb.strides[0]);
-	igt_assert_eq(ret, -EBUSY);
+		ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_X, fb.strides[0]);
 
-	igt_remove_fb(drm_fd, &fb);
-	drm_close_driver(drm_fd);
+		if (!ret)
+			ret2 = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_NONE, fb.strides[0]);
+
+		igt_remove_fb(drm_fd, &fb);
+
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(ret2, -EBUSY);
+	}
+
+	igt_fixture
+		drm_close_driver(drm_fd);
 }
-- 
2.48.1

