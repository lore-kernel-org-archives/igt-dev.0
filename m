Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB6E10F8A8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 21:32:45 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 5 May 2022 17:32:25 -0400
Message-ID: <20220505213226.2614662-4-dingchen.zhang@amd.com>
In-Reply-To: <20220505213226.2614662-1-dingchen.zhang@amd.com>
References: <20220505213226.2614662-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/4] tests/amdgpu/amd_psr: use double framebuffers
 to emulate MPO case
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
Current implementation to emulate the MPO video playback is via
creating 20 framebuffers (FB) and each FB has a colorful strip
pattern in a different position. From usrmode's view, in general
it would not create so many FBs for primary plane. Instead, it
only creates double or tripple buffers.

[how]
- drop the 20 framebuffers in current implementation
- use the double primary plane framebuffers defined in data struct
  and update the strip pattern alternatively on the double FBs and
  do page flip for each iteration

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 76 +++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 27 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 29982605..81ebebd3 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -40,10 +40,11 @@ IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP display
 #define N_FLIPS 6
 /* DMCUB takes some time to actually enable PSR. Worst case delay is 4 seconds */
 #define PSR_SETTLE_DELAY 4
-/* # of framebuffers for PSR-SU MPO test case to emulate video playback */
-#ifndef N_MPO_TEST_RECT_FB
-#define N_MPO_TEST_RECT_FB 20
-#endif
+
+typedef struct {
+	int x, y;
+	int w, h;
+} pos_t;
 
 /* Common test data. */
 typedef struct data {
@@ -138,6 +139,29 @@ static void draw_color_cursor(igt_fb_t *fb, int size, double r, double g, double
 	igt_put_cairo_ctx(cr);
 }
 
+/* update the given framebuffer and draw colorful strip in new position */
+static void update_color_strip(igt_fb_t *fb, pos_t *old, pos_t *new, double r, double g, double b)
+{
+	cairo_t *cr;
+
+	if (!fb || !new || !old)
+		return;
+
+	cr = igt_get_cairo_ctx(fb->fd, fb);
+	igt_assert_f(cr, "Failed to get cairo context\n");
+
+	/**
+	 * we'd draw the strip in the new position w/ given color
+	 * and make the background of the framebuffer as black
+	 * - render black BG in the old position of strip instead of rendering the whole FB
+	 * - render colorful strip in the new position
+	 */
+	igt_paint_color(cr, old->x, old->y, old->w, old->h, .0, .0, .0);
+	igt_paint_color(cr, new->x, new->y, new->w, new->h, r, g, b);
+
+	igt_put_cairo_ctx(cr);
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
@@ -314,12 +338,12 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 static void run_check_psr_su_mpo(data_t *data)
 {
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
-	igt_fb_t rect_fb[N_MPO_TEST_RECT_FB]; 	/* rectangle fbs for primary, emulate as video playback region */
 	igt_fb_t ref_fb;	/* reference fb */
 	igt_fb_t *flip_fb;
 	int ret;
 	const int run_sec = 5;
 	int frame_rate = 0;
+	pos_t old[2], new;
 
 	/* skip the test run if no eDP sink detected */
 	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
@@ -327,6 +351,10 @@ static void run_check_psr_su_mpo(data_t *data)
 	/* init */
 	test_init(data);
 	frame_rate = data->mode->vrefresh;
+	memset(&old, 0, sizeof(pos_t) * 2);
+	memset(&new, 0, sizeof(pos_t));
+	old[0].w = old[1].w = new.w = 30;
+	old[0].h = old[1].h = new.h = data->pfb_h;
 
 	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
 	igt_skip_on(!psr_su_supported(data));
@@ -347,25 +375,14 @@ static void run_check_psr_su_mpo(data_t *data)
 	 */
 	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0, &data->ov_fb[0]);
-	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i) {
-		cairo_t *cr;
-		int strip_w = data->w / (2 * N_MPO_TEST_RECT_FB);
-
-		igt_create_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			      &rect_fb[i]);
-		cr = igt_get_cairo_ctx(data->fd, &rect_fb[i]);
-		igt_assert_f(cr, "Failed to get cairo context\n");
-		/* background in black */
-		igt_paint_color(cr, 0, 0, data->pfb_w, data->pfb_h, .0, .0, .0);
-		/* foreground (megenta strip) */
-		igt_paint_color(cr, i * strip_w, 0, strip_w, data->pfb_h, 1.0, .0, 1.0);
-
-		igt_put_cairo_ctx(cr);
-	}
+	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, .0, .0, &data->pm_fb[0]);
+	igt_create_color_fb(data->fd, data->pfb_w, data->pfb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, .0, .0, &data->pm_fb[1]);
 
 	/* tie fbs to planes and set position/size/blending */
 	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
-	igt_plane_set_fb(data->primary, &rect_fb[0]);
+	igt_plane_set_fb(data->primary, &data->pm_fb[1]);
 	igt_plane_set_position(data->primary, 0, 0);
 	igt_plane_set_size(data->primary, data->pfb_w, data->pfb_h);
 
@@ -389,23 +406,28 @@ static void run_check_psr_su_mpo(data_t *data)
 	igt_info("\n start flipping ...\n");
 
 	for (int i = 0; i < run_sec * frame_rate; ++i) {
-		igt_info(" About to commit a primary plane (FB %d), loop %d \n", i % N_MPO_TEST_RECT_FB, i);
-		flip_fb = &rect_fb[i % N_MPO_TEST_RECT_FB];
+		flip_fb = &data->pm_fb[i & 1];
+		/* draw the color strip onto primary plane FB */
+		update_color_strip(flip_fb, &old[i & 1], &new, 1.0, .0, 1.0);
 
 		igt_plane_set_fb(data->primary, flip_fb);
 		igt_output_set_pipe(data->output, data->pipe_id);
 
-		ret = drmModePageFlip(data->fd, data->output->config.crtc->crtc_id,
-				      flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
 		kmstest_wait_for_pageflip(data->fd);
+
+		/* update strip position */
+		old[i & 1].x = new.x;
+		new.x += 3;
+		new.x = (new.x + new.w > data->pfb_w) ? 0 : new.x;
 	}
 
 	/* fini */
 	igt_remove_fb(data->fd, &ref_fb);
 	igt_remove_fb(data->fd, &data->ov_fb[0]);
-	for (int i = 0; i < N_MPO_TEST_RECT_FB; ++i)
-		igt_remove_fb(data->fd, &rect_fb[i]);
+	igt_remove_fb(data->fd, &data->pm_fb[0]);
+	igt_remove_fb(data->fd, &data->pm_fb[1]);
 	test_fini(data);
 }
 
-- 
2.25.1
