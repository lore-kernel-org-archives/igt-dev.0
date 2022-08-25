Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BE310EB6D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 11:23:18 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 25 Aug 2022 16:48:25 +0530
Message-Id: <20220825111825.74620-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_force_connector_basic: Test
 Cleanup
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

Sanitize the system state before starting the subtest.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_force_connector_basic.c | 51 ++++++++-----------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 683d3672..6ae2da09 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -31,36 +31,11 @@ IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
 	igt_assert_eq(m.hdisplay, h); igt_assert_eq(m.vdisplay, w); \
 	igt_assert_eq(m.vrefresh, r);
 
-static void reset_connectors(void)
-{
-	int drm_fd = 0;
-	drmModeRes *res;
-	drmModeConnector *connector = NULL;
-
-	drm_fd = drm_open_driver_master(DRIVER_ANY);
-	res = drmModeGetResources(drm_fd);
-
-	for (int i = 0; i < res->count_connectors; i++) {
-
-		connector = drmModeGetConnectorCurrent(drm_fd,
-						       res->connectors[i]);
-
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_UNSPECIFIED);
-
-		kmstest_force_edid(drm_fd, connector, NULL);
-
-		drmModeFreeConnector(connector);
-	}
-
-	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
-}
-
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
 	case 'r':
-		reset_connectors();
+		igt_reset_connectors();
 		exit(0);
 		break;
 	}
@@ -80,6 +55,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 	/* force the VGA output and test that it worked */
 	int drm_fd = 0;
 	drmModeRes *res;
+	igt_display_t display;
 	drmModeConnector *connector = NULL, *temp;
 	int start_n_modes, start_connection;
 
@@ -87,6 +63,8 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		unsigned connector_id = 0;
 
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_display_require(&display, drm_fd);
+		kmstest_set_vt_graphics_mode();
 
 		res = drmModeGetResources(drm_fd);
 		igt_require(res);
@@ -156,8 +134,8 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		 * disable all outputs to make sure we have a
 		 * free crtc available for load detect
 		 */
-		kmstest_set_vt_graphics_mode();
-		kmstest_unset_all_crtcs(drm_fd, res);
+		igt_display_reset(&display);
+		igt_display_commit(&display);
 
 		igt_set_module_param_int(drm_fd, "load_detect_test", 1);
 
@@ -228,7 +206,10 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 
 	igt_describe("Test to check the forced connector state.");
 	igt_subtest("force-connector-state") {
-		igt_display_t display;
+
+		/*reset display before attempt to use it */
+		igt_display_reset(&display);
+		igt_display_commit(&display);
 
 		/* force the connector on and check the reported values */
 		kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
@@ -238,13 +219,6 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 		igt_assert_lt(0, temp->count_modes);
 		drmModeFreeConnector(temp);
 
-		/* attempt to use the display */
-		kmstest_set_vt_graphics_mode();
-		igt_display_require(&display, drm_fd);
-		igt_display_commit(&display);
-		igt_display_fini(&display);
-
-
 		/* force the connector off */
 		kmstest_force_connector(drm_fd, connector,
 					FORCE_CONNECTOR_OFF);
@@ -261,6 +235,8 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 						  connector->connector_id);
 		igt_assert_eq(temp->connection, start_connection);
 		drmModeFreeConnector(temp);
+
+		igt_display_fini(&display);
 	}
 
 	igt_describe("Test to check the values after forcing edid.");
@@ -341,8 +317,7 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		drmModeFreeConnector(connector);
+		igt_reset_connectors();
 		close(drm_fd);
-
-		reset_connectors();
 	}
 }
-- 
2.25.1
