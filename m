Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECA06E8D5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 11:19:20 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 20 Jan 2020 09:50:27 +0530
Message-Id: <1579494027-2018-4-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
References: <1579494027-2018-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 3/3] Added a subtest where chamelium acts
 as a tiled panel.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Split kms_dp_tiled_display into to two subtest.First to execute the
basic test with physical tiled panel and second with chamelium.

v2:Revised to just have basic test if chamelium dependencies are not present.
   Reset ports after the test executes.Changed subtest name from with-chamelium
   to basic-test-pattern-with-chamelium

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_tiled_display.c | 111 +++++++++++++++++++++++++++++++++----------
 1 file changed, 87 insertions(+), 24 deletions(-)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index b1160fe..21c13d9 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -40,6 +40,7 @@
 #include "poll.h"
 #include "drm_mode.h"
 #include "drm_fourcc.h"
+#include "igt_edid.h"
 
 IGT_TEST_DESCRIPTION("Test for Transcoder Port Sync for Display Port Tiled Displays");
 
@@ -61,6 +62,13 @@ typedef struct {
 	struct timeval first_ts;
 } data_t;
 
+void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd);
+
+#ifdef HAVE_CHAMELIUM
+static void test_with_chamelium(data_t data,
+				struct data_chamelium_t *data_cham);
+#endif
+
 static int drm_property_is_tile(drmModePropertyPtr prop)
 {
 	return (strcmp(prop->name, "TILE") ? 0 : 1) &&
@@ -206,7 +214,6 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(data->display, data->commit);
 	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
 }
-
 static void setup_mode(data_t *data)
 {
 	int count = 0, prev = 0, i = 0;
@@ -380,21 +387,84 @@ static bool got_all_page_flips(data_t *data)
 	return true;
 }
 
+#ifdef HAVE_CHAMELIUM
+static void test_with_chamelium(data_t data,
+				struct data_chamelium_t *data_cham)
+{
+	int i, count = 0;
+	uint8_t htile = 2, vtile = 1;
+	struct edid **edid;
+
+	data_cham->chamelium = chamelium_init(data.drm_fd);
+	igt_assert(data_cham->chamelium);
+	data_cham->ports = chamelium_get_ports
+		(data_cham->chamelium, &data_cham->port_count);
+	require_displayport_connector_present(
+		data_cham, DRM_MODE_CONNECTOR_DisplayPort);
+	edid = igt_kms_get_tiled_edid(htile-1, vtile-1);
+
+	for (i = 0; i < 2; i++)
+		data_cham->edids[i] =
+			chamelium_new_edid(data_cham->chamelium, edid[i]);
+
+	for (i = 0; i < data_cham->port_count; i++) {
+		if (chamelium_port_get_type(data_cham->ports[i]) ==
+				DRM_MODE_CONNECTOR_DisplayPort) {
+
+			chamelium_port_set_tiled_edid(data_cham->chamelium,
+				data_cham->ports[i], data_cham->edids[i]);
+			chamelium_plug(data_cham->chamelium,
+				       data_cham->ports[i]);
+			wait_for_connector(data_cham, data_cham->ports[i],
+				DRM_MODE_CONNECTED);
+			count++;
+		}
+		if (count == 2)
+			break;
+	}
+}
+#endif
+
+void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
+{
+		int ret;
+
+		get_number_of_h_tiles(data);
+		igt_debug("Number of Horizontal Tiles: %d\n",
+			  data->num_h_tiles);
+		igt_require(data->num_h_tiles > 0);
+		data->conns = calloc(data->num_h_tiles,
+				     sizeof(data_connector_t));
+		igt_assert(data->conns);
+
+		get_connectors(data);
+		setup_mode(data);
+		setup_framebuffer(data);
+		timerclear(&data->first_ts);
+		igt_display_commit_atomic(data->display,
+			DRM_MODE_ATOMIC_NONBLOCK |
+			DRM_MODE_PAGE_FLIP_EVENT, data);
+		while (!got_all_page_flips(data)) {
+			ret = poll(pfd, 1, 1000);
+			igt_assert(ret == 1);
+			drmHandleEvent(data->drm_fd, drm_event);
+		}
+}
+
 igt_main
 {
 	igt_display_t display;
 	data_t data = {0};
+	#ifdef HAVE_CHAMELIUM
+	struct data_chamelium_t data_cham = {0};
+	#endif
 	struct pollfd pfd = {0};
 	drmEventContext drm_event = {0};
-	int ret;
-
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, data.drm_fd);
 		igt_display_reset(&display);
-
 		data.display = &display;
 		pfd.fd = data.drm_fd;
 		pfd.events = POLLIN;
@@ -402,33 +472,26 @@ igt_main
 		drm_event.page_flip_handler2 = page_flip_handler;
 		data.commit = data.display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
 		igt_require(data.commit == COMMIT_ATOMIC);
-
-		get_number_of_h_tiles(&data);
-		igt_debug("Number of Horizontal Tiles: %d\n", data.num_h_tiles);
-		igt_require(data.num_h_tiles > 0);
-		data.conns = calloc(data.num_h_tiles, sizeof(data_connector_t));
 	}
 
 	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
 		     "page flips for all tiled CRTCs in one vblank.");
 	igt_subtest("basic-test-pattern") {
-		igt_assert(data.conns);
-
-		get_connectors(&data);
-		setup_mode(&data);
-		setup_framebuffer(&data);
-		timerclear(&data.first_ts);
-		igt_display_commit_atomic(data.display, DRM_MODE_ATOMIC_NONBLOCK |
-					  DRM_MODE_PAGE_FLIP_EVENT, &data);
-		while (!got_all_page_flips(&data)) {
-			ret = poll(&pfd, 1, 1000);
-			igt_assert(ret == 1);
-			drmHandleEvent(data.drm_fd, &drm_event);
-		}
-
+		basic_test(&data, &drm_event, &pfd);
 		test_cleanup(&data);
 	}
 
+	#ifdef HAVE_CHAMELIUM
+	igt_subtest_f("basic-test-pattern-with-chamelium") {
+		int i;
+
+		test_with_chamelium(data, &data_cham);
+		basic_test(&data, &drm_event, &pfd);
+		test_cleanup(&data);
+		for (i = 0; i < data_cham.port_count; i++)
+			reset_state(&data_cham, data_cham.ports[i]);
+	}
+	#endif
 	igt_fixture {
 		free(data.conns);
 		close(data.drm_fd);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
