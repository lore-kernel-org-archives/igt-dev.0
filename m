Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BE0D3B994
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 14:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB35D10E8CD;
	Tue, 26 Nov 2024 14:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAm7oAZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D687410E8CD
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732631083; x=1764167083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hBZ0xYzC/gybQaZ3TPYan6SPdctnW0Yl5MhuppmNG3I=;
 b=hAm7oAZdfzhfIMzH5MPoUleBM7PJccBuLiM09s8P1NGWVWGB/877+f7P
 dswXS6W4gJcERudpaOgIkaulI6x+wZsbDx9r86RHhVqI6akt9MfOAQsfW
 sLq+vJDPdR4HUZaXyE29rIg7vDsedwoJB4G60jYfDRdYdFre6pAKf80bj
 OcjoHbKoikcdtkeI7EZ/ooUpad94mkex1lx/gK9DH1YcNn2dYNPP53aTi
 zC8H2cY3bLv3t9HcAPe8eTIrZ0c2qy33BsaCOqsS2LSMEdOHX/6OmQABK
 EZT4BIBCKFqyCG0Zg+FhgPGJT6pXsvtAjgqH05/3kkziPtOwLYAcZ1CWx w==;
X-CSE-ConnectionGUID: 6fG/69nGQDuErCSHPfouwQ==
X-CSE-MsgGUID: MMk5H8ITTpK6KCe6kpBzFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33045365"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="33045365"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 06:24:43 -0800
X-CSE-ConnectionGUID: jEZNHB0MQC2yyEaTJJX4Ng==
X-CSE-MsgGUID: +k1Mdq6ATPyIAdrf8sswPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122611969"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 06:24:42 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Tue, 26 Nov 2024 19:49:58 +0530
Message-Id: <20241126141958.1138489-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126141958.1138489-1-santhosh.reddy.guddati@intel.com>
References: <20241126141958.1138489-1-santhosh.reddy.guddati@intel.com>
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
    extend support for all pipes (Rama Naidu).

v3: Add new subtest to scatter dirty rectangles at differnt places in a
    frame and commit all rectangles at once (Rama Naidu).
    Add a negative case with invalid coordinates (Vinod)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 233 +++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index b7e3f7379..730e02b04 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -57,6 +57,14 @@
  * Description: Sanity test to enable FBC on a plane.
  * Functionality: fbc
  *
+ * SUBTEST: plane-fbc-dr
+ * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
+ * Functionality: fbc
+ *
+ * SUBTEST: plane-fbc-dr-scatter
+ * Description: Sanity test to verify FBC DR by sending multiple damaged areas scattered.
+ * Functionality: fbc
+ *
  * SUBTEST: pipe-fbc-rte
  * Description: Sanity test to enable FBC on each pipe.
  * Functionality: fbc
@@ -1168,6 +1176,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define MAX_DIRTY_RECT 3
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
@@ -4282,6 +4291,204 @@ static int opt_handler(int option, int option_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
+static void set_damage_clip(struct drm_mode_rect *damage, int x1, int y1, int x2, int y2)
+{
+	damage->x1 = x1;
+	damage->y1 = y1;
+	damage->x2 = x2;
+	damage->y2 = y2;
+}
+
+static void fbc_dirty_rectangle_basic(const struct test_mode *t)
+{
+	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
+	uint32_t color;
+	drmModeModeInfo *mode;
+	int width, height, x, y;
+
+	prepare_subtest_data(t, NULL);
+
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	mode = igt_output_get_mode(prim_mode_params.output);
+
+	set_damage_clip(&rect_data[0], 0, 0, mode->hdisplay - 1, mode->vdisplay - 1);
+	set_damage_clip(&rect_data[1], mode->hdisplay / 2, mode->vdisplay / 2,
+			mode->hdisplay - 1, mode->vdisplay - 1);
+	set_damage_clip(&rect_data[2], mode->hdisplay - 10, mode->vdisplay - 10,
+			mode->hdisplay - 1, mode->vdisplay - 1);
+
+	igt_debug("Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n",
+		   rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
+		   rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
+		   rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);
+
+	for (int i = 0; i < MAX_DIRTY_RECT; i++) {
+		igt_plane_t *primary;
+		igt_fb_t fb[MAX_DIRTY_RECT];
+
+		primary = igt_output_get_plane_type(prim_mode_params.output,
+						    DRM_PLANE_TYPE_PRIMARY);
+		width = rect_data[i].x2 - rect_data[i].x1;
+		height = rect_data[i].y2 - rect_data[i].y1;
+		x = rect_data[i].x1;
+		y = rect_data[i].y1;
+
+		create_fb(t->format, width, height, t->tiling, t->plane, &fb[i]);
+		color = pick_color(&fb[i], COLOR_PRIM_BG);
+		igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb[i], t->method,
+				 x, y, width, height, color);
+		igt_plane_set_fb(primary, &fb[i]);
+		igt_plane_set_position(primary, x, y);
+		igt_plane_set_size(primary, width, height);
+		igt_fb_set_size(&fb[i], primary, width, height);
+		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+					    &rect_data[i], sizeof(rect_data[i]));
+
+		igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		fbc_update_last_action();
+		do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
+		igt_assert_f(fbc_enable_per_plane(primary->index + 1,
+			     prim_mode_params.pipe), "FBC disabled\n");
+
+		igt_remove_fb(drm.fd, &fb[i]);
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(&drm.display, COMMIT_ATOMIC);
+	}
+}
+
+static void fbc_dirty_rectangle_scatter(const struct test_mode *t)
+{
+	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
+	uint32_t color;
+	drmModeModeInfo *mode;
+	int width, height, x, y;
+	int hdisplay, vdisplay;
+	igt_plane_t *primary;
+	igt_fb_t fb[MAX_DIRTY_RECT];
+
+	prepare_subtest_data(t, NULL);
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	mode = igt_output_get_mode(prim_mode_params.output);
+	hdisplay = mode->hdisplay;
+	vdisplay = mode->vdisplay;
+
+	// Set damage clips
+	set_damage_clip(&rect_data[0], 0, 0, hdisplay / 4, vdisplay / 4);
+	set_damage_clip(&rect_data[1], hdisplay / 2, vdisplay / 2,
+			hdisplay / 2 + 50, vdisplay / 2 + 50);
+	set_damage_clip(&rect_data[2], hdisplay - 100,
+			vdisplay - 100, hdisplay - 1, vdisplay - 1);
+
+	igt_debug("Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n",
+		   rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
+		   rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
+		   rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);
+
+	primary = igt_output_get_plane_type(prim_mode_params.output,
+					    DRM_PLANE_TYPE_PRIMARY);
+
+	for (int i = 0; i < MAX_DIRTY_RECT; i++) {
+		width = rect_data[i].x2 - rect_data[i].x1;
+		height = rect_data[i].y2 - rect_data[i].y1;
+		x = rect_data[i].x1;
+		y = rect_data[i].y1;
+
+		create_fb(t->format, width, height, t->tiling, t->plane, &fb[i]);
+		color = pick_color(&fb[i], COLOR_PRIM_BG);
+		igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb[i], t->method,
+				 x, y, width, height, color);
+		igt_plane_set_fb(primary, &fb[i]);
+		igt_plane_set_position(primary, x, y);
+		igt_plane_set_size(primary, width, height);
+		igt_fb_set_size(&fb[i], primary, width, height);
+	}
+
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    rect_data, sizeof(rect_data));
+
+	igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	fbc_update_last_action();
+	do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
+	igt_assert_f(fbc_enable_per_plane(primary->index + 1,
+					  prim_mode_params.pipe),
+					  "FBC disabled\n");
+
+	for (int i = 0; i < MAX_DIRTY_RECT; i++)
+		igt_remove_fb(drm.fd, &fb[i]);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit2(&drm.display, COMMIT_ATOMIC);
+}
+
+static void fbc_dirty_rectangle_negative(const struct test_mode *t)
+{
+	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
+	uint32_t color, ret;
+	drmModeModeInfo *mode;
+	int width, height, x, y;
+	igt_plane_t *primary;
+	igt_fb_t fb[MAX_DIRTY_RECT];
+
+	prepare_subtest_data(t, NULL);
+
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	mode = igt_output_get_mode(prim_mode_params.output);
+
+	// Set invalid damage clips
+	set_damage_clip(&rect_data[0], -10, -10,
+			mode->hdisplay / 4, mode->vdisplay / 4);
+	set_damage_clip(&rect_data[1], mode->hdisplay / 2, mode->vdisplay / 2,
+			mode->hdisplay / 2 + 50, mode->vdisplay / 2 + 50);
+	set_damage_clip(&rect_data[2], mode->hdisplay - 100, mode->vdisplay - 100,
+			mode->hdisplay + 10, mode->vdisplay + 10);
+
+	igt_debug("Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n",
+		   rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
+		   rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
+		   rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);
+
+	primary = igt_output_get_plane_type(prim_mode_params.output, DRM_PLANE_TYPE_PRIMARY);
+
+	for (int i = 0; i < MAX_DIRTY_RECT; i++) {
+		width = rect_data[i].x2 - rect_data[i].x1;
+		height = rect_data[i].y2 - rect_data[i].y1;
+		x = rect_data[i].x1;
+		y = rect_data[i].y1;
+
+		create_fb(t->format, width, height, t->tiling, t->plane, &fb[i]);
+		color = pick_color(&fb[i], COLOR_PRIM_BG);
+		igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb[i], t->method,
+				 x, y, width, height, color);
+		igt_plane_set_fb(primary, &fb[i]);
+		igt_plane_set_position(primary, x, y);
+		igt_plane_set_size(primary, width, height);
+		igt_fb_set_size(&fb[i], primary, width, height);
+	}
+
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    rect_data, sizeof(rect_data));
+
+	ret = igt_display_try_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_assert_eq(ret, -EINVAL);
+
+	fbc_update_last_action();
+	do_assertions(ASSERT_FBC_DISABLED | ASSERT_NO_ACTION_CHANGE);
+
+	for (int i = 0; i < MAX_DIRTY_RECT; i++)
+		igt_remove_fb(drm.fd, &fb[i]);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit2(&drm.display, COMMIT_ATOMIC);
+}
+
 const char *help_str =
 "  --no-status-check           Don't check for enable/disable status\n"
 "  --no-crc-check              Don't check for CRC values\n"
@@ -4507,6 +4714,32 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		plane_fbc_rte_subtest(&t);
 	}
 
+	igt_subtest_group {
+		igt_subtest_with_dynamic("plane-fbc-dr") {
+			t.feature = FEATURE_FBC;
+			igt_require_f(drm.display_ver > 20,
+				      "FBC with dirty region is not supported\n");
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(prim_mode_params.pipe))
+			fbc_dirty_rectangle_basic(&t);
+		}
+
+		igt_subtest_with_dynamic("plane-fbc-dr-scatter") {
+			t.feature = FEATURE_FBC;
+			igt_require_f(drm.display_ver > 20,
+				      "FBC with dirty region is not supported\n");
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(prim_mode_params.pipe))
+			fbc_dirty_rectangle_scatter(&t);
+		}
+
+		igt_subtest_with_dynamic("plane-fbc-dr-negative") {
+			t.feature = FEATURE_FBC;
+			igt_require_f(drm.display_ver > 20,
+					  "FBC with dirty region is not supported\n");
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(prim_mode_params.pipe))
+			fbc_dirty_rectangle_negative(&t);
+		}
+	}
+
 	igt_subtest_group {
 		igt_subtest_with_dynamic("pipe-fbc-rte") {
 
-- 
2.34.1

