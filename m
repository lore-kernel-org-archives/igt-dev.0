Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D702FCAC597
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 09:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7EE10E6B6;
	Thu, 18 Sep 2025 09:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ6sw9D7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1FE10E6C9
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758187754; x=1789723754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/XtR+T6AvFY5DssNRYFdiSp4z/dcMjZEi/ejo5UWcog=;
 b=EQ6sw9D7lcIYeYQAKpDdQN7GheLLwyH4oueET3EUW4OW61ejwcOCtGa3
 YLdGvuF6lLswAeQ8/+yY/PDs0rh5EmkRwQ3/mI0ArVqY0wg9vr0EJPQnQ
 Itmr8M8NuovIH9aLArVGsGekBaore9OR9zPmutmR0+zq6jHoWinbzoOzX
 yoVGA8/bD39DHQdXc9S/BnuPeD1AuOpeZHoB3doIU//sXvJ8WGGBlSMiY
 d/r7qc5oK+m/CHLzI9QwAZ5tLmvH3LTdiA2geh1oS4/tJH/1daVKYWjsz
 p0qy+IKrNfUITlbtfmDgDxJfhW4bpS9tg6nOcoeopJVxGsUIEEyisz5uP g==;
X-CSE-ConnectionGUID: rTiTWEgsSA+dENZI3aukkQ==
X-CSE-MsgGUID: RlB0FDAqR++GXB4F/I10+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48082416"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="48082416"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:29:13 -0700
X-CSE-ConnectionGUID: 1fmNq4uHQl6u+5dIr5gRRw==
X-CSE-MsgGUID: lpUhFGV0SOGOtZbrUBoJZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206285799"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:29:11 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@gmail.com,
 anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v14 2/2] tests/kms_prime: Enable basic-modeset for xe
Date: Thu, 18 Sep 2025 14:56:51 +0530
Message-Id: <20250918092651.306828-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918092651.306828-1-santhosh.reddy.guddati@intel.com>
References: <20250918092651.306828-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 9082b3e51..9ccb85d49 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -459,6 +459,9 @@ static void test_basic_modeset(int drm_fd)
 	enum pipe pipe;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	uint32_t bo;
+	int ret;
+	uint32_t offsets[4] = { 0 };
 
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
@@ -467,6 +470,38 @@ static void test_basic_modeset(int drm_fd)
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

