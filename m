Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288B410ECFF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 20:17:04 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 12 May 2022 16:16:26 -0400
Message-ID: <20220512201626.724930-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu/amd_psr: add slice selective update
 test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[why]
The current PSR-SU MPO test case is to update the MPO plane w/ a
vertical moving strip covering the entire MPO plane height, which
is to expect to observe green bar w/ height of MPO plane on the
right side of screen if visual confirm option is enabled.

We'd have another test case to validate PSR-SU enabled and the SU
region of height smaller than the entire plane height.

[how]
- the test run of selective update slice requires driver support
  the plane property FB_DAMAGE_CLIPS
- instead of updating MPO content w/ vertical moving strip, we do
  rendering only a thin horizontal slice covering the width of the
  plane (current set height of 5 pixels). And for each iteration
  in test run, we update the corresponding damaged clip before
  atomic commit.
- by enabling the visual confirm option, we'd expect that green
  bar appears during test run w/ the height of slice height, and
  moving from top of screen to the bottom of MPO plane on screen.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 lib/igt_amd.h          |  2 +
 tests/amdgpu/amd_psr.c | 95 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 42cb2e17..fae0038b 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -52,6 +52,8 @@
 /* amdgpu DM interface entries */
 #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
 
+#define DC_MAX_DIRTY_RECTS 3	/* maximum damaged clips that can be handled in DMUB FW */
+
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
 	DSC_FORCE_ON,
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 695ea5a8..2878e1f1 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -59,6 +59,7 @@ typedef struct data {
 	igt_fb_t pm_fb[2];
 	igt_fb_t cs_fb;		/* cursor framebuffer */
 	drmModeModeInfo *mode;
+	struct drm_mode_rect pm_clip[DC_MAX_DIRTY_RECTS + 1]; /* test # of damaged clips exceeding DMUB cap */
 	enum pipe pipe_id;
 	int fd;
 	int debugfs_fd;
@@ -675,6 +676,96 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	test_fini(data);
 }
 
+static void run_check_psr_su_slice(data_t *data, bool scaling, float mpo_scale_ratio, const int slice_height)
+{
+	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_fb_t *flip_fb;
+	int ret, iters;
+	pos_t mpo_dst = {0};
+	cairo_t *cr;
+
+	/* skip the test run if no eDP sink detected */
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	/* init */
+	test_init(data);
+	iters = data->pfb_h / slice_height;
+	mpo_dst.w = scaling ? (int)(data->pfb_w * mpo_scale_ratio) : data->pfb_w;
+	mpo_dst.h = scaling ? (int)(data->pfb_h * mpo_scale_ratio) : data->pfb_h;
+
+	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU */
+	igt_skip_on(!psr_su_supported(data));
+
+	/* test run requires driver supports the plane property of damaged clips */
+	igt_require_f(igt_plane_has_prop(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS),
+		      "primary plane has NO property FB_DAMAGE_CLIPS!\n");
+
+	/**
+	 * create FBs
+	 * for this test case, the primary plane cover the 3/4 screen.
+	 * to have obvious visual confirm of SU (green bar at rightmost of screen), initialize the
+	 * primary plane FBs as blue background, and update slice-by-slice in red.
+	 */
+	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0, &data->ov_fb[0]);
+	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, .0, 1.0, &data->pm_fb[0]);
+	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, .0, 1.0, &data->pm_fb[1]);
+
+	/* tie fbs to planes and set position/size/blending */
+	draw_color_alpha(&data->ov_fb[0], mpo_dst.x, mpo_dst.y, mpo_dst.w, mpo_dst.h, .5, .5, .5, .0);
+	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
+	igt_plane_set_fb(data->primary, &data->pm_fb[1]);
+	igt_plane_set_position(data->primary, mpo_dst.x, mpo_dst.y);
+	igt_plane_set_size(data->primary, mpo_dst.w, mpo_dst.h);
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_info("\n start flipping ...\n");
+	for (int i = 0; i < iters; ++i) {
+		flip_fb = &data->pm_fb[i & 1];
+		/**
+		 * update RED horizontal slice in FB such that red slices
+		 * cover the blue background from top to bottom
+		 */
+		cr = igt_get_cairo_ctx(data->fd, flip_fb);
+		/**
+		 * to save rendering time, only draw slice for limited region.
+		 * since using double buffers, each time draw two slices region
+		 * with exception of the 1st draw.
+		 */
+		if (i == 0)
+			igt_paint_color(cr, 0, slice_height * i, data->pfb_w, slice_height, 1.0, .0, .0);
+		else
+			igt_paint_color(cr, 0, slice_height * (i - 1), data->pfb_w, slice_height * 2, 1.0, .0, .0);
+		igt_put_cairo_ctx(cr);
+
+		igt_plane_set_fb(data->primary, flip_fb);
+		igt_plane_set_position(data->primary, mpo_dst.x, mpo_dst.y);
+		igt_plane_set_size(data->primary, mpo_dst.w, mpo_dst.h);
+		/* set DRM damaged clip, in this case w/ slice update, only single dirty RECT */
+		data->pm_clip[0].x1 = 0;
+		data->pm_clip[0].y1 = slice_height * i;
+		data->pm_clip[0].x2 = data->pm_clip[0].x1 + data->pfb_w;
+		data->pm_clip[0].y2 = data->pm_clip[0].y1 + slice_height;
+		igt_plane_replace_prop_blob(data->primary,
+					    IGT_PLANE_FB_DAMAGE_CLIPS,
+					    &data->pm_clip[0],
+					    sizeof(struct drm_mode_rect));
+
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_require(ret == 0);
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
 
@@ -754,6 +845,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 0.75");
 	igt_subtest("psr_su_mpo_scaling_0_75") run_check_psr_su_mpo(&data, true, .75);
 
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to validate slice selective update on primary plane");
+	igt_subtest("psr_su_slice_5") run_check_psr_su_slice(&data, false, 0, 5);
+
 	igt_fixture
 	{
 		if (opt.visual_confirm) {
-- 
2.25.1
