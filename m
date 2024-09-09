Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C334CE7AB0
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 04:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A510E2A8;
	Mon,  9 Sep 2024 04:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoLNWlwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028BE10E2A8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 04:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725855533; x=1757391533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ej+6gKf1cooQpJOFS+RZwvDkx2fy+sF6iEh7gXWvxc4=;
 b=OoLNWlwvmAOP8gexSdmyrxobSHBnNOAnGMwiQcSzhn92U2pzfMt7HY7b
 hdbUT3WxV2kZ5vNKgSioX+yARZ/8pCBsF3mKg6zVjeZXk4kJc29qnq3Of
 cJOoNQePbBp441vbjmwoeBgzt8o+pTFNUc5ClTENJnluG+wrlwC6+rXyx
 JOMDVRGcady/G4iuoOGpZGpk/O6a3J4hDv9P8hhk85MS+CPmNuGK1fHqh
 UrgCpvSSpHres9vCnuQvTUoahaM3sh8qEstm3p+Ey4k1MgCN0PuiHTzpf
 Twi9uIuKC4ZuaIQOz3RmN8hrvIHjl4qo4AVwem5l1ejkjc2Qz4lRdKGmG A==;
X-CSE-ConnectionGUID: JHZJPFybQKeJ3Nm1h6C1pA==
X-CSE-MsgGUID: ATj3ibrmQmGqO31EtZ4mvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24469951"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24469951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 21:18:52 -0700
X-CSE-ConnectionGUID: y2A15uarSiKPm9BjlxsmgA==
X-CSE-MsgGUID: a7af29ESSw6D62I+QRBNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66763508"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:18:50 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] RFC tests/intel/kms_frontbuffer_tracking: Introduce
 plane-fbc-dr test
Date: Mon,  9 Sep 2024 09:44:41 +0530
Message-Id: <20240909041441.528638-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
References: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
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

Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
and fill the damaged rectangles on the plane with framebuffer
coordinates and verify that fbc dirty ctl is enabled.

v2: Fix typo , add version check for feature support,
    extend support for all pipes (Rama Naidu)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 78 ++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e45d17dd6..b15527209 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -57,6 +57,10 @@
  * Description: Sanity test to enable FBC on a plane.
  * Functionality: fbc
  *
+ * SUBTEST: plane-fbc-dr
+ * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
+ * Functionality: fbc
+ *
  * SUBTEST: pipe-fbc-rte
  * Description: Sanity test to enable FBC on each pipe.
  * Functionality: fbc
@@ -1168,6 +1172,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define MAX_DIRTY_RECT 3
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
@@ -4288,6 +4293,73 @@ static int opt_handler(int option, int option_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
+static void fbc_dr_subtest(const struct test_mode *t) {
+	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
+	uint32_t color;
+	drmModeModeInfo *mode;
+
+	igt_require_f(drm.display_ver > 20, "FBC with dirty region is not supported\n");
+
+	prepare_subtest_data(t, NULL);
+
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	mode = igt_output_get_mode(prim_mode_params.output);
+
+	for (int i = 0; i < MAX_DIRTY_RECT; i++) {
+		// Full Frame update
+		rect_data[0].x1 = 0;
+		rect_data[0].y1 = 0;
+		rect_data[0].x2 = mode->hdisplay;
+		rect_data[0].y2 = mode->vdisplay;
+
+		// Half Frame update till last-1 scanline
+		rect_data[1].x1 = mode->hdisplay / 2;
+		rect_data[1].y1 = mode->vdisplay / 2;
+		rect_data[1].x2 = mode->hdisplay - 1;
+		rect_data[1].y2 = mode->vdisplay - 1;
+
+		// last 10 scanlines update
+		rect_data[2].x1 = mode->hdisplay - 10;
+		rect_data[2].y1 = mode->vdisplay - 10;
+		rect_data[2].x2 = mode->hdisplay - 1;
+		rect_data[2].y2 = mode->vdisplay - 1;
+
+		igt_debug("Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n",
+					rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
+					rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
+					rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);
+	}
+
+	for(int i = 0; i < MAX_DIRTY_RECT; i++) {
+		igt_plane_t *primary = igt_output_get_plane_type(prim_mode_params.output, DRM_PLANE_TYPE_PRIMARY);
+		igt_fb_t fb[MAX_DIRTY_RECT];
+
+		create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb[i]);
+		color = pick_color(&fb[i], COLOR_PRIM_BG);
+		igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb[i], t->method,
+			rect_data[i].x1, rect_data[i].y1, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1,
+			color);
+
+		igt_plane_set_fb(primary, &fb[i]);
+		igt_plane_set_position(primary, rect_data[i].x1, rect_data[i].y1);
+		igt_plane_set_size(primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
+		igt_fb_set_size(&fb[i], primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
+		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS, &rect_data[i], sizeof(rect_data[i]));
+
+		igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		fbc_update_last_action();
+		do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
+		igt_assert_f(fbc_enable_per_plane(primary->index + 1, prim_mode_params.pipe), "FBC disabled\n");
+
+		igt_remove_fb(drm.fd, &fb[i]);
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(&drm.display, COMMIT_ATOMIC);
+	}
+}
+
 const char *help_str =
 "  --no-status-check           Don't check for enable/disable status\n"
 "  --no-crc-check              Don't check for CRC values\n"
@@ -4513,6 +4585,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		plane_fbc_rte_subtest(&t);
 	}
 
+	igt_subtest_f("plane-fbc-dr") {
+		t.feature = FEATURE_FBC;
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(prim_mode_params.pipe))
+			fbc_dr_subtest(&t);
+	}
+
 	igt_subtest_group {
 		igt_subtest_with_dynamic("pipe-fbc-rte") {
 
-- 
2.34.1

