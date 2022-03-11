Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3210EA64
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 19:45:16 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 14:44:52 -0500
Message-ID: <20220311194452.291714-5-dingchen.zhang@amd.com>
In-Reply-To: <20220311194452.291714-1-dingchen.zhang@amd.com>
References: <20220311194452.291714-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 4/4] tests/amdgpu/amd_psr: add PSR-SU MPO
 subtest case
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
We need a test case to imitate the multiplane overlay (MPO) video
playback use case and check PSR-SU enablement during test run.

[how]
The test run only works for PSR-SU capable sink device and skip for
any non-eDP or non-PSR-SU connector or kernel driver not supporting
PSR-SU feature.

To emulate the video playback and MPO scenario, we use overlay plane
w/ size of addressable and primary plane w/ size of quater of overlay
acting as video playback region.

Create couple of framebuffers w/ size of primary plane and with
the pattern of vertical color strip on different position on the
FB. During test run, we flip the primary framebuffer and expect the
visual effect of moving strip within the region of primary plane
acting as video playback. The primary plane during test run is not
moving position or resizing.

changes in v2
----------------
* move #define statement to top of the source file.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 lib/igt_amd.h          |  25 ++++++++
 tests/amdgpu/amd_psr.c | 138 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index f87c1991..e4e12ce5 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -90,6 +90,31 @@ enum dc_link_training_type {
 	LINK_TRAINING_NO_PATTERN
 };
 
+/*
+ * enumeration of PSR STATE below should be aligned to the upstreamed
+ * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
+ */
+enum amdgpu_psr_state {
+	PSR_STATE0 = 0x0,
+	PSR_STATE1,
+	PSR_STATE1a,
+	PSR_STATE2,
+	PSR_STATE2a,
+	PSR_STATE2b,
+	PSR_STATE3,
+	PSR_STATE3Init,
+	PSR_STATE4,
+	PSR_STATE4a,
+	PSR_STATE4b,
+	PSR_STATE4c,
+	PSR_STATE4d,
+	PSR_STATE5,
+	PSR_STATE5a,
+	PSR_STATE5b,
+	PSR_STATE5c,
+	PSR_STATE_INVALID = 0xFF
+};
+
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
 void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
 unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 88e824c3..d80820c8 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -32,6 +32,7 @@
 /* hardware requirements:
  * 1. eDP panel that supports PSR (multiple panel can be connected at the same time)
  * 2. Optional DP display for testing a regression condition (setting crtc to null)
+ * 3. eDP panel that supports PSR-SU
  */
 IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP displays");
 
@@ -39,22 +40,39 @@ IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP display
 #define N_FLIPS 6
 /* DMCUB takes some time to actually enable PSR. Worst case delay is 4 seconds */
 #define PSR_SETTLE_DELAY 4
+/* # of framebuffers for PSR-SU MPO test case to emulate video playback */
+#ifndef N_MPO_TEST_RECT_FB
+#define N_MPO_TEST_RECT_FB 20
+#endif
 
 /* Common test data. */
 typedef struct data {
         igt_display_t display;
         igt_plane_t *primary;
         igt_plane_t *cursor;
+	igt_plane_t *overlay;
         igt_output_t *output;
         igt_pipe_t *pipe;
         igt_pipe_crc_t *pipe_crc;
         drmModeModeInfo *mode;
         enum pipe pipe_id;
         int fd;
+	int debugfs_fd;
         int w;
         int h;
 } data_t;
 
+static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
+		             double r, double g, double b, double a)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	igt_paint_color_alpha(cr, x, y, w, h, r, g, b, a);
+
+	igt_put_cairo_ctx(cr);
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
@@ -68,9 +86,11 @@ static void test_init(data_t *data)
 
         data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
         igt_require(data->output);
+	igt_info("output %s\n", data->output->name);
 
         data->mode = igt_output_get_mode(data->output);
         igt_assert(data->mode);
+	kmstest_dump_mode(data->mode);
 
         data->primary =
                 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -78,6 +98,9 @@ static void test_init(data_t *data)
         data->cursor =
                 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
+	data->overlay =
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+
         data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id, "auto");
 
         igt_output_set_pipe(data->output, data->pipe_id);
@@ -181,6 +204,114 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 	test_fini(data);
 }
 
+static void run_check_psr_su_mpo(data_t *data)
+{
+	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	bool sink_support_psrsu = false;
+	bool drv_suport_psrsu = false;
+	igt_fb_t ov_fb;		// fb for overlay
+	igt_fb_t rect_fb[N_MPO_TEST_RECT_FB]; 	// rectangle fbs for primary, emulate as video playback region
+	igt_fb_t ref_fb;	// reference fb
+	igt_fb_t *flip_fb;
+	int ret;
+	const int run_sec = 5;
+	enum amdgpu_psr_state psr_state = PSR_STATE0;
+	int frame_rate = 0;
+
+	/* skip the test run if no eDP sink detected */
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	/* init */
+	test_init(data);
+	frame_rate = data->mode->vrefresh;
+
+	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
+	igt_skip_on(!igt_amd_output_has_psr_cap(data->fd, data->output->name));
+	igt_skip_on(!igt_amd_output_has_psr_state(data->fd, data->output->name));
+	sink_support_psrsu = igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2);
+	igt_skip_on_f(!sink_support_psrsu, "output %s not support PSR-SU\n", data->output->name);
+	drv_suport_psrsu = igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2);
+	igt_skip_on_f(!drv_suport_psrsu, "kernel driver not support PSR-SU\n");
+
+	/* reference background pattern in grey */
+	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .5, .5, .5, &ref_fb);
+	igt_plane_set_fb(data->primary, &ref_fb);
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/*
+	 * overlay and primary fbs creation
+	 * for MPO vpb use case, the vpb is always in the primary plane as an underlay,
+	 * while the control panel/tool bar such icons/items are all in the overlay plane,
+	 * and alpha for vpb region is adjusted to control the transparency.
+	 * thus the overlay fb be initialized w/ ARGB pixel format to support blending
+	 */
+	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0, &ov_fb);
+	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i) {
+		cairo_t *cr;
+		int strip_w = data->w / (2 * N_MPO_TEST_RECT_FB);
+
+		igt_create_fb(data->fd, data->w / 2, data->h / 2, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &rect_fb[i]);
+		cr = igt_get_cairo_ctx(data->fd, &rect_fb[i]);
+		igt_assert_f(cr, "Failed to get cairo context\n");
+		/* background in black */
+		igt_paint_color(cr, 0, 0, data->w, data->h, .0, .0, .0);
+		/* foreground (megenta strip) */
+		igt_paint_color(cr, i * strip_w, 0, strip_w, data->h, 1.0, .0, 1.0);
+
+		igt_put_cairo_ctx(cr);
+	}
+
+	/* tie fbs to planes and set position/size/blending */
+	igt_plane_set_fb(data->overlay, &ov_fb);
+	igt_plane_set_fb(data->primary, &rect_fb[0]);
+	igt_plane_set_position(data->primary, 0, 0);
+	igt_plane_set_size(data->primary, data->w / 2, data->h / 2);
+
+	/* adjust alpha for vpb (primary plane) region in overlay */
+	draw_color_alpha(&ov_fb, 0, 0, data->w / 2, data->h / 2, .5, .5, .5, .3);
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	/* multiplane overlay to emulate video playback use case */
+	igt_info("\n start flipping ...\n");
+
+	for (int i = 0; i < run_sec * frame_rate; ++i) {
+		igt_info(" About to commit a primary plane (FB %d), loop %d \n", i % N_MPO_TEST_RECT_FB, i);
+		flip_fb = &rect_fb[i % N_MPO_TEST_RECT_FB];
+
+		igt_plane_set_fb(data->primary, flip_fb);
+		igt_output_set_pipe(data->output, data->pipe_id);
+
+		ret = drmModePageFlip(data->fd, data->output->config.crtc->crtc_id,
+				      flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_require(ret == 0);
+		kmstest_wait_for_pageflip(data->fd);
+
+		/* check PSR state */
+		if (i > PSR_SETTLE_DELAY * frame_rate) {
+			psr_state = igt_amd_read_psr_state(data->fd, data->output->name);
+			igt_fail_on_f(psr_state == PSR_STATE0,
+				"PSR was not enabled for connector %s\n", data->output->name);
+			igt_fail_on_f(psr_state == PSR_STATE_INVALID,
+				"PSR is invalid for connector %s\n", data->output->name);
+			igt_fail_on_f(psr_state != PSR_STATE3,
+				"PSR state is expected to be STATE_3 for connector %s\n", data->output->name);
+		}
+	}
+
+	/* fini */
+	igt_remove_fb(data->fd, &ref_fb);
+	igt_remove_fb(data->fd, &ov_fb);
+	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i) igt_remove_fb(data->fd, &rect_fb[i]);
+	test_fini(data);
+	close(data->fd);
+}
+
 igt_main
 {
 	data_t data;
@@ -191,6 +322,8 @@ igt_main
 	igt_fixture
 	{
 		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
+		if (data.fd == -1) igt_skip("Not an amdgpu driver.\n");
+		data.debugfs_fd = igt_debugfs_dir(data.fd);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -205,8 +338,13 @@ igt_main
 	igt_describe("Test whether setting CRTC to null triggers any warning with PSR enabled");
 	igt_subtest("psr_enable_null_crtc") run_check_psr(&data, true);
 
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to imitate Multiplane Overlay video playback scenario");
+	igt_subtest("psr_su_mpo") run_check_psr_su_mpo(&data);
+
 	igt_fixture
 	{
+		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
 	}
 }
-- 
2.25.1
