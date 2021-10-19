Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FFA6E8A1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 20:19:50 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 19 Oct 2021 23:19:37 +0300
Message-Id: <20211019201940.31729-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
References: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/kms_tiled_display: Replace the
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No point in storing a pointer when we can just store the struct itself.
The lifetime is the same.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 9eb980285b02..cb4762d7c6b1 100644
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
@@ -139,8 +139,8 @@ static void get_connectors(data_t *data)
 	igt_output_t *output;
 	data_connector_t *conns = data->conns;
 
-	for_each_connected_output(data->display, output) {
-		conns[count].connector = drmModeGetConnector(data->display->drm_fd,
+	for_each_connected_output(&data->display, output) {
+		conns[count].connector = drmModeGetConnector(data->display.drm_fd,
 							     output->id);
 
 		igt_assert(conns[count].connector);
@@ -185,11 +185,11 @@ static void reset_mode(data_t *data)
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
@@ -204,7 +204,7 @@ static void test_cleanup(data_t *data)
 		}
 	}
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
-	igt_display_commit2(data->display, data->commit);
+	igt_display_commit2(&data->display, data->commit);
 	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
 }
 static void setup_mode(data_t *data)
@@ -224,10 +224,10 @@ static void setup_mode(data_t *data)
 	reset_mode(data);
 
 	for (count = 0; count < data->num_h_tiles; count++) {
-		output = igt_output_from_connector(data->display,
+		output = igt_output_from_connector(&data->display,
 						   conns[count].connector);
 
-		for_each_pipe(data->display, pipe) {
+		for_each_pipe(&data->display, pipe) {
 			pipe_in_use = false;
 			found = false;
 
@@ -264,7 +264,7 @@ static void setup_mode(data_t *data)
 		igt_require(found);
 		igt_output_override_mode(output, mode);
 	}
-	igt_display_commit_atomic(data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
 				  NULL);
 }
 
@@ -323,7 +323,7 @@ static data_connector_t *conn_for_crtc(data_t *data, unsigned int crtc_id)
 	for (int i = 0; i < data->num_h_tiles; i++) {
 		data_connector_t *conn = &data->conns[i];
 
-		if (data->display->pipes[conn->pipe].crtc_id == crtc_id)
+		if (data->display.pipes[conn->pipe].crtc_id == crtc_id)
 			return conn;
 	}
 
@@ -408,7 +408,7 @@ static void test_with_chamelium(data_t *data)
 				data->ports[i], data->edids[i]);
 			chamelium_plug(data->chamelium,
 				       data->ports[i]);
-			chamelium_wait_for_conn_status_change(data->display,
+			chamelium_wait_for_conn_status_change(&data->display,
 							      data->chamelium,
 							      data->ports[i],
 							      DRM_MODE_CONNECTED);
@@ -436,7 +436,7 @@ void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
 		setup_mode(data);
 		setup_framebuffer(data);
 		timerclear(&data->first_ts);
-		igt_display_commit_atomic(data->display,
+		igt_display_commit_atomic(&data->display,
 			DRM_MODE_ATOMIC_NONBLOCK |
 			DRM_MODE_PAGE_FLIP_EVENT, data);
 		while (!got_all_page_flips(data)) {
@@ -448,21 +448,20 @@ void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
 
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
 
@@ -492,6 +491,6 @@ igt_main
 		free(data.conns);
 		close(data.drm_fd);
 		kmstest_restore_vt_mode();
-		igt_display_fini(data.display);
+		igt_display_fini(&data.display);
 	}
 }
-- 
2.32.0
