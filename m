Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E25EC87FD3
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 11:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CD610E4ED;
	Fri,  8 Aug 2025 11:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldDBD3Cb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7C010E4ED
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Aug 2025 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754652197; x=1786188197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mhole9GbYfHXFwZGfx39crDCLAsJ7D2kH4HoAfQ5meE=;
 b=ldDBD3CbA5ahwbkJF62VjAfAzTWd8hjewHAAUg/cahJd+HI/cXufolDu
 7TfrT7o9/skAXS1YRe/p1kwwxTfald5c+LdlLoNG1POFxyTQoGYPxmia2
 RSg5Jm1Pb2ownRxPmeS3cYJKa8kS72NACba9Dx/eJ+BZBU+dbrQ/zuqZ8
 f2INV5TJGrW/Xcw59BwqYLJiY42oEQCBodMYVRCu6r1rH48WxB1kkYYJB
 4O5YfyN/d+z2l/dF+9O+D6bV7ZaNlt2ctGwPOvAU1U0By++pmj56Vf2vD
 RNQtbCA/hjyYGTVoScrLJg1JRtvG121y/xCK/JyBPoX3Xm5U1N0WFArAo w==;
X-CSE-ConnectionGUID: 11eKVCawQuaMcTkwKar0LQ==
X-CSE-MsgGUID: GPXLGRpySheeNrHI/gFt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56876369"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56876369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:23:17 -0700
X-CSE-ConnectionGUID: GqL4TiBKTdSZ46GOTYbD4g==
X-CSE-MsgGUID: lIseftnoSHWdyOuKqbWaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169515357"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:23:14 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@gmail.com,
 anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 2/2] tests/kms_prime: Enable basic-modeset for xe
Date: Fri,  8 Aug 2025 16:50:50 +0530
Message-Id: <20250808112050.987926-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808112050.987926-1-santhosh.reddy.guddati@intel.com>
References: <20250808112050.987926-1-santhosh.reddy.guddati@intel.com>
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

Remove unused setup_hybrid_display , add support for basic-modeset
subtest for xe driver.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index c6720e984..2193f3539 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -457,6 +457,9 @@ static void test_basic_modeset(int drm_fd)
 	enum pipe pipe;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	uint32_t bo;
+	int ret;
+	uint32_t offsets[4] = { 0 };
 
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
@@ -465,6 +468,38 @@ static void test_basic_modeset(int drm_fd)
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
+	if (is_xe_device(drm_fd) && xe_has_vram(drm_fd)) {
+		uint32_t strides[4] = { ALIGN(mode->hdisplay * 4, 64) };
+
+		igt_info("Doing modeset on discrete\n");
+
+		igt_init_fb(&fb, drm_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&fb);
+
+		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0), 0);
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

