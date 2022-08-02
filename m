Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854AD18AE4E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 06:50:00 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 Aug 2022 12:23:50 +0530
Message-Id: <20220802065350.26410-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220802065350.26410-1-nidhi1.gupta@intel.com>
References: <20220802065350.26410-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2: -Replace drm function call with existing library functions
     (Bhanu)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 60 ++++++++++++---------------------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 5c9feac9..eaa200b9 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -31,12 +31,12 @@
 
 struct modeset_params {
 	uint32_t crtc_id;
-	uint32_t connector_id;
 	drmModeModeInfoPtr mode;
 };
 
 int drm_fd;
-drmModeResPtr drm_res;
+igt_display_t display;
+igt_output_t *output;
 drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
 struct buf_ops *bops;
 igt_pipe_crc_t *pipe_crc;
@@ -64,27 +64,21 @@ struct modeset_params ms;
 
 static void find_modeset_params(void)
 {
-	int i;
 	uint32_t crtc_id;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
+	drmModeModeInfo *mode;
 
-	for (i = 0; i < drm_res->count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
+	igt_display_reset(&display);
+	igt_display_commit(&display);
 
-		if (c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
-	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
+	output = igt_get_single_output_for_pipe(&display, PIPE_A);
+	igt_require(output);
+	igt_output_set_pipe(output, PIPE_A);
+	
+	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
-	ms.connector_id = connector->connector_id;
+	crtc_id = display.pipes[PIPE_A].crtc_id;
+
 	ms.crtc_id = crtc_id;
 	ms.mode = mode;
 
@@ -144,8 +138,7 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
 	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method, 1, 1, 15, 15,
 			 get_color(drm_format, 0, 1, 1));
 
-	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
-			    &ms.connector_id, 1, ms.mode);
+	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_assert_eq(rc, 0);
 
 	igt_pipe_crc_collect_crc(pipe_crc, crc);
@@ -212,8 +205,7 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
 
 	igt_draw_fill_fb(drm_fd, &fb, 0xFF);
 
-	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
-			    &ms.connector_id, 1, ms.mode);
+	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_assert_eq(rc, 0);
 
 	igt_pipe_crc_collect_crc(pipe_crc, crc);
@@ -236,8 +228,7 @@ static void fill_fb_subtest(void)
 							 IGT_DRAW_MMAP_WC,
 			 0, 0, fb.width, fb.height, 0xFF);
 
-	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
-			    &ms.connector_id, 1, ms.mode);
+	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_assert_eq(rc, 0);
 
 	igt_pipe_crc_collect_crc(pipe_crc, &base_crc);
@@ -260,40 +251,25 @@ static void fill_fb_subtest(void)
 
 static void setup_environment(void)
 {
-	int i;
-
 	drm_fd = drm_open_driver_master(DRIVER_INTEL);
 	igt_require(drm_fd >= 0);
-
-	drm_res = drmModeGetResources(drm_fd);
-	igt_require(drm_res);
-	igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
-
-	for (i = 0; i < drm_res->count_connectors; i++)
-		drm_connectors[i] = drmModeGetConnectorCurrent(drm_fd,
-							       drm_res->connectors[i]);
+	igt_display_require(&display, drm_fd);
+	igt_display_require_output(&display);
 
 	kmstest_set_vt_graphics_mode();
 
 	bops = buf_ops_create(drm_fd);
 
 	find_modeset_params();
-	pipe_crc = igt_pipe_crc_new(drm_fd, kmstest_get_crtc_idx(drm_res, ms.crtc_id),
-				    INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(drm_fd, PIPE_A, INTEL_PIPE_CRC_SOURCE_AUTO);
 }
 
 static void teardown_environment(void)
 {
-	int i;
-
 	igt_pipe_crc_free(pipe_crc);
 
 	buf_ops_destroy(bops);
 
-	for (i = 0; i < drm_res->count_connectors; i++)
-		drmModeFreeConnector(drm_connectors[i]);
-
-	drmModeFreeResources(drm_res);
 	close(drm_fd);
 }
 
-- 
2.26.2
