Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69510E551
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:18:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:47 +0300
Message-Id: <20230601130850.26359-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/7] tests/kms_tiled_display: Replace the
 igt_display pointer with a struct
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No point in storing a pointer when we can just store the struct itself.
The lifetime is the same.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 53 ++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 75cda62db28e..5a75caf77d27 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -56,7 +56,7 @@ typedef struct {
 	int drm_fd;
 	int num_h_tiles;
 	igt_fb_t fb_test_pattern;
-	igt_display_t *display;
+	igt_display_t display;
 	data_connector_t *conns;
 	enum igt_commit_style commit;
 	struct timeval first_ts;
@@ -132,8 +132,8 @@ static void get_connectors(data_t *data)
 	igt_output_t *output;
 	data_connector_t *conns = data->conns;
 
-	for_each_connected_output(data->display, output) {
-		conns[count].connector = drmModeGetConnector(data->display->drm_fd,
+	for_each_connected_output(&data->display, output) {
+		conns[count].connector = drmModeGetConnector(data->display.drm_fd,
 							     output->id);
 
 		igt_assert(conns[count].connector);
@@ -178,11 +178,11 @@ static void reset_mode(data_t *data)
 	data_connector_t *conns = data->conns;
 
 	for (count = 0; count < data->num_h_tiles; count++) {
-		output = igt_output_from_connector(data->display,
+		output = igt_output_from_connector(&data->display,
 						   conns[count].connector);
 		igt_output_set_pipe(output, PIPE_NONE);
 	}
-	igt_display_commit2(data->display, data->commit);
+	igt_display_commit2(&data->display, data->commit);
 }
 
 static void test_cleanup(data_t *data)
@@ -197,7 +197,7 @@ static void test_cleanup(data_t *data)
 		}
 	}
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
-	igt_display_commit2(data->display, data->commit);
+	igt_display_commit2(&data->display, data->commit);
 	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
 }
 static void setup_mode(data_t *data)
@@ -217,10 +217,10 @@ static void setup_mode(data_t *data)
 	reset_mode(data);
 
 	for (count = 0; count < data->num_h_tiles; count++) {
-		output = igt_output_from_connector(data->display,
+		output = igt_output_from_connector(&data->display,
 						   conns[count].connector);
 
-		for_each_pipe(data->display, pipe) {
+		for_each_pipe(&data->display, pipe) {
 			pipe_in_use = false;
 			found = false;
 
@@ -257,9 +257,8 @@ static void setup_mode(data_t *data)
 		igt_require(found);
 		igt_output_override_mode(output, mode);
 	}
-	igt_require(i915_pipe_output_combo_valid(data->display));
-	igt_display_commit_atomic(data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
-				  NULL);
+	igt_require(i915_pipe_output_combo_valid(&data->display));
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
 static void setup_framebuffer(data_t *data)
@@ -317,7 +316,7 @@ static data_connector_t *conn_for_crtc(data_t *data, unsigned int crtc_id)
 	for (int i = 0; i < data->num_h_tiles; i++) {
 		data_connector_t *conn = &data->conns[i];
 
-		if (data->display->pipes[conn->pipe].crtc_id == crtc_id)
+		if (data->display.pipes[conn->pipe].crtc_id == crtc_id)
 			return conn;
 	}
 
@@ -375,13 +374,13 @@ static bool got_all_page_flips(data_t *data)
 }
 
 #ifdef HAVE_CHAMELIUM
-static void test_with_chamelium(data_t *data, igt_display_t *display)
+static void test_with_chamelium(data_t *data)
 {
 	int i, count = 0;
 	uint8_t htile = 2, vtile = 1;
 	struct edid **edid;
 
-	data->chamelium = chamelium_init(data->drm_fd, display);
+	data->chamelium = chamelium_init(data->drm_fd, &data->display);
 	igt_require(data->chamelium);
 	data->ports = chamelium_get_ports
 		(data->chamelium, &data->port_count);
@@ -402,7 +401,7 @@ static void test_with_chamelium(data_t *data, igt_display_t *display)
 				data->ports[i], data->edids[i]);
 			chamelium_plug(data->chamelium,
 				       data->ports[i]);
-			chamelium_wait_for_conn_status_change(data->display,
+			chamelium_wait_for_conn_status_change(&data->display,
 							      data->chamelium,
 							      data->ports[i],
 							      DRM_MODE_CONNECTED);
@@ -414,8 +413,7 @@ static void test_with_chamelium(data_t *data, igt_display_t *display)
 }
 #endif
 
-static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd,
-		       igt_display_t *display)
+static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
 {
 		int ret;
 
@@ -431,7 +429,7 @@ static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *
 		setup_mode(data);
 		setup_framebuffer(data);
 		timerclear(&data->first_ts);
-		igt_display_commit_atomic(data->display,
+		igt_display_commit_atomic(&data->display,
 			DRM_MODE_ATOMIC_NONBLOCK |
 			DRM_MODE_PAGE_FLIP_EVENT, data);
 		while (!got_all_page_flips(data)) {
@@ -443,28 +441,27 @@ static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *
 
 igt_main
 {
-	igt_display_t display;
 	data_t data = {0};
 	struct pollfd pfd = {0};
 	drmEventContext drm_event = {0};
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&display, data.drm_fd);
-		igt_display_reset(&display);
-		data.display = &display;
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_reset(&data.display);
+
 		pfd.fd = data.drm_fd;
 		pfd.events = POLLIN;
 		drm_event.version = 3;
 		drm_event.page_flip_handler2 = page_flip_handler;
-		data.commit = data.display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
+		data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
 		igt_require(data.commit == COMMIT_ATOMIC);
 	}
 
 	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
 		     "page flips for all tiled CRTCs in one vblank.");
 	igt_subtest("basic-test-pattern") {
-		basic_test(&data, &drm_event, &pfd, &display);
+		basic_test(&data, &drm_event, &pfd);
 		test_cleanup(&data);
 	}
 
@@ -474,11 +471,11 @@ igt_main
 	igt_subtest_f("basic-test-pattern-with-chamelium") {
 		int i;
 
-		test_with_chamelium(&data, &display);
-		basic_test(&data, &drm_event, &pfd, &display);
+		test_with_chamelium(&data);
+		basic_test(&data, &drm_event, &pfd);
 		test_cleanup(&data);
 		for (i = 0; i < data.port_count; i++)
-			chamelium_reset_state(data.display, data.chamelium,
+			chamelium_reset_state(&data.display, data.chamelium,
 					      data.ports[i], data.ports,
 					      data.port_count);
 	}
@@ -487,7 +484,7 @@ igt_main
 	igt_fixture {
 		free(data.conns);
 		kmstest_restore_vt_mode();
-		igt_display_fini(data.display);
+		igt_display_fini(&data.display);
 		close(data.drm_fd);
 	}
 }
-- 
2.39.3
