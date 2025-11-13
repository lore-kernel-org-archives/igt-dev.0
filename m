Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2058CD6E7D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 15:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3110E85D;
	Thu, 13 Nov 2025 15:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+24HynV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357810E85D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763046782; x=1794582782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xLJ8OknUQOwE1tXxBVo2ewQKF0RAa8JXSMJ3waTIfe8=;
 b=n+24HynVDwXHdN0y/6dIKJYULq1hJlLx3Cjs8IcvLYPpGmLUh5Cn6tKZ
 7JRj7joaXNBWtX4GP6Gmtif6bKtpaPBGSuG86jCzDsQlSczPHaPmKAtpa
 Cd3tJhB9CZliFkAu7a8ELua7GXvUlqMaaiUsu9rXUwcn1jAOTXz5WBRsx
 YqNZ5aosMoG4yIDifwwuls1/ghPtERO+uPf68+h2GDDiIzgo7qLHaBD1v
 y1CSm0Z7Battg9XRm8V072pc2LKMXEuM2tjH3GDwubC4wrtgRGxEuMRz7
 sTmXDek7myRbLU67FDFN00U45mC/6lnY+NQrK6qOSb+87T9zA3VN0RbzN Q==;
X-CSE-ConnectionGUID: P4LBQOTLQUqwepyxWWDKJg==
X-CSE-MsgGUID: 9jbNqqPLTNKvaj0alcjvYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82759894"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="82759894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:13:01 -0800
X-CSE-ConnectionGUID: 4Fv/HUWiRl26jAQXHLfo7w==
X-CSE-MsgGUID: pxhBcmqkQWynSq2jb/0+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189167408"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:12:59 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v17 2/3] tests/kms_prime: Enable basic-modeset for xe
Date: Thu, 13 Nov 2025 20:36:45 +0530
Message-Id: <20251113150646.945848-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113150646.945848-1-santhosh.reddy.guddati@intel.com>
References: <20251113150646.945848-1-santhosh.reddy.guddati@intel.com>
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

Add support for basic-modeset subtest for xe driver.

V2: Update commit description to reflect the changes (Kamil)
V3: Fix the modifier in igt_init_fb (Kunal)
v4: Add DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM to xe_bo_create

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_prime.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 18b27daf6..aa3cc386c 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -458,6 +458,9 @@ static void test_basic_modeset(int drm_fd)
 	enum pipe pipe;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	uint32_t bo;
+	int ret;
+	uint32_t offsets[4] = { 0 };
 
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
@@ -466,6 +469,39 @@ static void test_basic_modeset(int drm_fd)
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
+	if (is_xe_device(drm_fd) && xe_has_vram(drm_fd)) {
+		uint32_t strides[4] = { ALIGN(mode->hdisplay * 4, 64) };
+
+		igt_info("Doing modeset on discrete\n");
+
+		igt_init_fb(&fb, drm_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&fb);
+
+		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		igt_require(bo);
+
+		ret = __kms_addfb(drm_fd, bo,
+				  mode->hdisplay, mode->vdisplay,
+				  DRM_FORMAT_XRGB8888,
+				  DRM_FORMAT_MOD_LINEAR,
+				  strides, offsets, 1,
+				  DRM_MODE_FB_MODIFIERS, &fb.fb_id);
+		igt_assert_eq(ret, 0);
+
+		set_fb(&fb, &display, output);
+		gem_close(drm_fd, bo);
+
+		cairo_surface_destroy(fb.cairo_surface);
+		do_or_die(drmModeRmFB(drm_fd, fb.fb_id));
+
+		igt_display_fini(&display);
+		igt_info("Modeset on discrete done\n");
+		return;
+	}
+
 	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
 
-- 
2.34.1

