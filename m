Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DED510E1E7
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Apr 2022 16:59:43 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Apr 2022 12:59:24 -0400
Message-ID: <20220428165925.1406641-2-dingchen.zhang@amd.com>
In-Reply-To: <20220428165925.1406641-1-dingchen.zhang@amd.com>
References: <20220428165925.1406641-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] tests/amdgpu/amd_psr: add PSR-SU scaling test
 cases
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
We need a test cases to validate plane scaling scenario for PSR-SU
by visual confirm. From driver's perspective, any plane scaling
would result in that particular plane to be entirely marked as
dirty rectangle.

[how]
- create a test case to cover scenario of primary plane scaling,
  start downscaling and then upscaling, validate the SU region
  update by visual confirm.
- create a test case to cover scenario of primary plane scaling
  plus the cursor movement. The cursor is always positioned at the
  bottom-right corner of the primary plane along w/ the plane
  scaling. validate the SU region update which is the combination
  of dirty rectangles of primary plane scaling + cursor move.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 116 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 56858f79..2ca41927 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -56,12 +56,15 @@ typedef struct data {
 	igt_pipe_crc_t *pipe_crc;
 	igt_fb_t ov_fb[2];
 	igt_fb_t pm_fb[2];
+	igt_fb_t cs_fb;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
 	int fd;
 	int debugfs_fd;
 	int w;
 	int h;
+	int pb_w, pb_h;
+	int ob_w, ob_h;
 } data_t;
 
 enum cursor_move {
@@ -71,6 +74,11 @@ enum cursor_move {
 	INVALID
 };
 
+typedef struct {
+	int x, y;
+	int w, h;
+} rect_t;
+
 struct {
 	bool visual_confirm;
 } opt = {
@@ -170,6 +178,10 @@ static void test_init(data_t *data)
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
+	data->pb_w = data->w / 2;
+	data->pb_h = data->h / 2;
+	data->ob_w = data->w;
+	data->ob_h = data->h;
 }
 /* Common test cleanup. */
 static void test_fini(data_t *data)
@@ -609,6 +621,102 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	test_fini(data);
 }
 
+static void run_check_psr_su_scaling(data_t *data, bool test_cursor)
+{
+	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	rect_t pb_upscale, pb_downscale, pb;
+	rect_t cs;
+	int ret;
+
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	test_init(data);
+	igt_skip_on(!psr_su_supported(data));
+
+	/* size params for up/down scaling, scaling ratio = 1.5 / 0.5 respectively */
+	pb_upscale.x = pb_upscale.y = 0;
+	pb_upscale.w = data->pb_w * 3 / 2;
+	pb_upscale.h = data->pb_h * 3 / 2;
+	pb_downscale.x = pb_downscale.y = 0;
+	pb_downscale.w = data->pb_w / 2;
+	pb_downscale.h = data->pb_h / 2;
+
+	/*
+	 * primary & overlay FBs creation
+	 * - create primary FB of quarter screen size, i.e. width/height = 1/2 screen width/height
+	 * - create overlay FB of screen size of white color (default alpha 1.0)
+	 * - create cursor FB w/ a cursor pattern in magenta (if test_cursor flag set)
+	 */
+	igt_create_color_fb(data->fd, data->pb_w, data->pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, .0, 1.0, &data->pm_fb[0]);
+	igt_create_color_fb(data->fd, data->ob_w, data->ob_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0, &data->ov_fb[0]);
+	if (test_cursor) {
+		cs.x = data->pb_w;
+		cs.y = data->pb_h;
+		cs.w = cs.h = 64;
+		igt_create_fb(data->fd, cs.w, cs.h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &data->cs_fb);
+		draw_color_cursor(&data->cs_fb, cs.w, 1.0, .0, 1.0);
+	}
+
+	/* update alpha region within overlay plane for displaying upscaled primary plane */
+	draw_color_alpha(&data->ov_fb[0], pb_upscale.x, pb_upscale.y, pb_upscale.w, pb_upscale.h, 1.0, 1.0, 1.0, .0);
+
+	/* panning the primary plane at the top-left of screen */
+	igt_plane_set_fb(data->primary, &data->pm_fb[0]);
+	igt_plane_set_position(data->primary, 0, 0);
+	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
+	igt_plane_set_position(data->overlay, 0, 0);
+	if (test_cursor) {
+		igt_plane_set_fb(data->cursor, &data->cs_fb);
+		igt_plane_set_position(data->cursor, cs.x, cs.y);
+	}
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/*
+	 * test by scaling the primary plane
+	 * - downscaling
+	 * - upscaling
+	 */
+
+	/* downscaling */
+	igt_info("  downscaling primary plane from ratio 1.0 to 0.5 ...\n");
+	for (pb.w = data->pb_w, pb.h = data->pb_h, pb.x = pb.y = 0;
+	     pb.w >= pb_downscale.w;
+	     --pb.w, pb.h = pb.w * data->h / data->w, cs.x = pb.w, cs.y = pb.h) {
+		igt_plane_set_position(data->primary, pb.x, pb.y);
+		igt_plane_set_size(data->primary, pb.w, pb.h);
+		if (test_cursor)
+			igt_plane_set_position(data->cursor, cs.x, cs.y);
+
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_require(ret == 0);
+		kmstest_wait_for_pageflip(data->fd);
+	}
+
+	/* upscaling */
+	igt_info("  upscaling primary plane from ratio 0.5 to 1.5 ...\n");
+	for (pb.w = pb_downscale.w, pb.h = pb_downscale.h, pb.x = pb.y = 0;
+	     pb.w <= pb_upscale.w;
+	     ++pb.w, pb.h = pb.w * data->h / data->w, cs.x = pb.w, cs.y = pb.h) {
+		igt_plane_set_position(data->primary, pb.x, pb.y);
+		igt_plane_set_size(data->primary, pb.w, pb.h);
+		if (test_cursor)
+			igt_plane_set_position(data->cursor, cs.x, cs.y);
+
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_require(ret == 0);
+		kmstest_wait_for_pageflip(data->fd);
+	}
+
+	igt_remove_fb(data->fd, &data->pm_fb[0]);
+	igt_remove_fb(data->fd, &data->ov_fb[0]);
+	if (test_cursor)
+		igt_remove_fb(data->fd, &data->cs_fb);
+	test_fini(data);
+}
+
 const char *help_str =
 "  --visual-confirm           PSR visual confirm debug option enable\n";
 
@@ -680,6 +788,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		     "and to validate cursor movement + MPO scenario");
 	igt_subtest("psr_su_cursor_mpo") run_check_psr_su_cursor(&data, true);
 
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to validate primary plane scaling scenario");
+	igt_subtest("psr_su_scaling") run_check_psr_su_scaling(&data, false);
+
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to validate primary plane scaling + cursor movement scenario");
+	igt_subtest("psr_su_scaling_cursor") run_check_psr_su_scaling(&data, true);
+
 	igt_fixture
 	{
 		if (opt.visual_confirm) {
-- 
2.25.1
