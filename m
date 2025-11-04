Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E88CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A74310E58A;
	Tue,  4 Nov 2025 09:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTeKO2YV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284CA10E58A
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762246935; x=1793782935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqQEs+OIMCaqdljZop1CcPBiTGLzIX3cVJGrYqVjQgM=;
 b=KTeKO2YVNp9xLRBrgmNERCh2XGjA9Ni51lf3gTpoqOHiRF+Qmk+tVbQ2
 3ULAhpdQvCbIA98MgvSPSbXXp2MSsR8LWMHqu71UO0NspH9XJlim4HFEA
 rnYnhKkwnhv5U/NYVNlNuXs5bTS0WmIkPifwrQghjoZCYZ4H5QQF03yks
 VJF24HgFUpStUxW1BpMhfx88Azc/jjSL2TAOdwyvErtyKwX/Ht9FaDzp7
 3l+a+V/XosYw7r5ZA8zWmukLZUbu8KXdZdftlYY/tIZEaCnwBmBeqmJo5
 ZIbQGX4n1zDg6+0JdY1T/eSZOJVpgg87JhQDdZveuZagMWNOSgD1DoiQe g==;
X-CSE-ConnectionGUID: KzPlNc++SBib/vqSPDa5wA==
X-CSE-MsgGUID: fE5R1+uuTcqw4mFNG4f59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64032935"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64032935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:15 -0800
X-CSE-ConnectionGUID: WKdxR4BBTSe2O0cprz3Hqg==
X-CSE-MsgGUID: 0JWr+3voTmaLRjNp/9Fgiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="224354212"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:11 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v16 2/3] tests/kms_prime: Enable basic-modeset for xe
Date: Tue,  4 Nov 2025 14:26:39 +0530
Message-Id: <20251104085640.795121-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
References: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
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
---
 tests/kms_prime.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index d210f23a9..d644ee288 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -460,6 +460,9 @@ static void test_basic_modeset(int drm_fd)
 	enum pipe pipe;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	uint32_t bo;
+	int ret;
+	uint32_t offsets[4] = { 0 };
 
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
@@ -468,6 +471,39 @@ static void test_basic_modeset(int drm_fd)
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

