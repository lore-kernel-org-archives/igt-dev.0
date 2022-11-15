Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C420710E434
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 18:55:21 +0000 (UTC)
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 15 Nov 2022 13:55:37 -0500
Message-ID: <20221115185537.227658-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu/amd_psr: add a SSU case that
 tests FB_DAMAGE_CLIPS support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, David Zhang <dingchen.zhang@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, we don't have any test coverage that covers FB_DAMAGE_CLIPS.
So, add a test case that renders a thin horizontal slice covering the
width of the plane (at a current height of 5 pixels) and for each
iteration in test run, corresponding damaged clip before
atomic commit. Also, if visual confirm is enabled we should see a green
bar moving from the top of the display to the bottom on the right side
of the display.

Co-developed-by: David Zhang <dingchen.zhang@amd.com>
Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 lib/igt_amd.h          |   3 +
 tests/amdgpu/amd_psr.c | 121 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 428bfe6f..5997144c 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -52,6 +52,9 @@
 /* amdgpu DM interface entries */
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
 
+/* Maximum damaged clips that can be handled in DMUB FW */
+#define DC_MAX_DIRTY_RECTS 3
+
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
 	DSC_FORCE_ON,
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 966a0dcc..a55439e1 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -59,6 +59,8 @@ typedef struct data {
 	igt_fb_t pm_fb[2];
 	igt_fb_t cs_fb;		/* cursor framebuffer */
 	drmModeModeInfo *mode;
+	/* test # of damaged clips exceeding DMUB cap */
+	struct drm_mode_rect pm_clip[DC_MAX_DIRTY_RECTS + 1];
 	enum pipe pipe_id;
 	int fd;
 	int debugfs_fd;
@@ -676,6 +678,121 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	test_fini(data);
 }
 
+static void run_check_psr_su_slice(data_t *data, float mpo_scale_ratio,
+				   const int slice_height)
+{
+	cairo_t *cr;
+	igt_fb_t *flip_fb;
+	int i, iters, ret;
+	pos_t mpo_dst = {0};
+
+	/* skip the test run if no eDP sink detected */
+	igt_skip_on_f(check_conn_type(data, DRM_MODE_CONNECTOR_eDP) == -1,
+		      "no eDP connector found\n");
+
+	/* init */
+	test_init(data);
+	iters = data->pfb_h / slice_height;
+	mpo_dst.w = mpo_scale_ratio ? (int)(data->pfb_w * mpo_scale_ratio) :
+		data->pfb_w;
+	mpo_dst.h = mpo_scale_ratio ? (int)(data->pfb_h * mpo_scale_ratio) :
+		data->pfb_h;
+
+	/**
+	 * run the test iff both the eDP panel and kernel driver support PSR-SU
+	 */
+	igt_skip_on(!psr_su_supported(data));
+
+	/**
+	 * test run requires driver supports the plane property of damaged
+	 * clips
+	 */
+	igt_require_f(igt_plane_has_prop(data->primary,
+					 IGT_PLANE_FB_DAMAGE_CLIPS),
+		      "primary plane has NO property FB_DAMAGE_CLIPS!\n");
+
+	/**
+	 * create FBs for this test case, the primary plane cover the 3/4
+	 * screen. to have obvious visual confirm of SU (green bar at the
+	 * rightmost of the screen), initialize the primary plane FBs as blue
+	 * background, and update slice-by-slice in red
+	 */
+	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0,
+			    &data->ov_fb[0]);
+	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0.0,
+			    0.0, 1.0, &data->pm_fb[0]);
+	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0.0,
+			    0.0, 1.0, &data->pm_fb[1]);
+
+	/* tie fbs to planes and set position/size/blending */
+	draw_color_alpha(&data->ov_fb[0], mpo_dst.x, mpo_dst.y, mpo_dst.w,
+			 mpo_dst.h, 0.5, 0.5, 0.5, 0.0);
+	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
+	igt_plane_set_fb(data->primary, &data->pm_fb[1]);
+	igt_plane_set_position(data->primary, mpo_dst.x, mpo_dst.y);
+	igt_plane_set_size(data->primary, mpo_dst.w, mpo_dst.h);
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
+				  NULL);
+
+	igt_info("\n start flipping ...\n");
+	for (i = 0; i < iters; ++i) {
+		flip_fb = &data->pm_fb[i & 1];
+
+		/**
+		 * update red horizontal slice in FB such that red slices
+		 * cover the blue background from top to bottom
+		 */
+		cr = igt_get_cairo_ctx(data->fd, flip_fb);
+
+		/**
+		 * to save rendering time, only draw slice for limited region.
+		 * since using double buffers, each time draw two slices region
+		 * with exception of the 1st draw.
+		 */
+		if (!i)
+			igt_paint_color(cr, 0, slice_height * i, data->pfb_w,
+					slice_height, 1.0, 0.0, 0.0);
+		else
+			igt_paint_color(cr, 0, slice_height * (i - 1),
+					data->pfb_w, slice_height * 2, 1.0, 0.0,
+					0.0);
+		igt_put_cairo_ctx(cr);
+
+		igt_plane_set_fb(data->primary, flip_fb);
+		igt_plane_set_position(data->primary, mpo_dst.x, mpo_dst.y);
+		igt_plane_set_size(data->primary, mpo_dst.w, mpo_dst.h);
+
+		/**
+		 * set DRM damaged clip, in this case w/ slice update, only
+		 * single dirty RECT
+		 */
+		data->pm_clip[0].x1 = 0;
+		data->pm_clip[0].y1 = slice_height * i;
+		data->pm_clip[0].x2 = data->pm_clip[0].x1 + data->pfb_w;
+		data->pm_clip[0].y2 = data->pm_clip[0].y1 + slice_height;
+		igt_plane_replace_prop_blob(data->primary,
+					    IGT_PLANE_FB_DAMAGE_CLIPS,
+					    &data->pm_clip[0],
+					    sizeof(struct drm_mode_rect));
+
+		ret = igt_display_try_commit_atomic(&data->display,
+						    DRM_MODE_PAGE_FLIP_EVENT,
+						    NULL);
+		igt_require(!ret);
+		kmstest_wait_for_pageflip(data->fd);
+	}
+
+	/* fini */
+	igt_remove_fb(data->fd, &data->pm_fb[0]);
+	igt_remove_fb(data->fd, &data->pm_fb[1]);
+	igt_remove_fb(data->fd, &data->ov_fb[0]);
+	test_fini(data);
+}
+
 const char *help_str =
 "  --visual-confirm           PSR visual confirm debug option enable\n";
 
@@ -755,6 +872,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 0.75");
 	igt_subtest("psr_su_mpo_scaling_0_75") run_check_psr_su_mpo(&data, true, .75);
 
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to validate FB_DAMAGE_CLIPS support");
+	igt_subtest("psr_su_slice_5") run_check_psr_su_slice(&data, 0.0, 5);
+
 	igt_fixture
 	{
 		if (opt.visual_confirm) {
-- 
2.38.1
