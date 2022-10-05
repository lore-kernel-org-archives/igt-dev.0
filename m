Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7810E774
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 20:18:22 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Oct 2022 01:42:07 +0530
Message-Id: <20221005201207.194079-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220929185139.31587-1-mohammed.thasleem@intel.com>
References: <20220929185139.31587-1-mohammed.thasleem@intel.com>
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

v2: Created a new functions for each subtest instead
    of managing the full logic within the igt_subtest().
v3: Minor changes.
v4: Replaced igt_assert_f with igt_require_f in prune-stale-modes.
v5: Added goto statement if connector_id found true.
v6: Minor changes.
v7: Added func pointer to subtests.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_force_connector_basic.c | 454 ++++++++++++++++--------------
 1 file changed, 243 insertions(+), 211 deletions(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 6259cec5..cde47e92 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -58,6 +58,215 @@ static void reset_connectors(void)
 	close(drm_fd);
 }
 
+static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
+{
+	int i, j, w = 64, h = 64;
+	drmModePlaneRes *plane_resources;
+	drmModeConnector *temp;
+	struct igt_fb xrgb_fb, argb_fb;
+
+	/* No load detect on HDMI. */
+	igt_require(connector->connector_type == DRM_MODE_CONNECTOR_VGA);
+
+	igt_create_fb(drm_fd, w, h, DRM_FORMAT_XRGB8888, 0, &xrgb_fb);
+	igt_create_fb(drm_fd, w, h, DRM_FORMAT_ARGB8888, 0, &argb_fb);
+	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1) == 0);
+
+	/*
+	 * Disable all outputs to make sure we have a
+	 * free crtc available for load detect.
+	 */
+	kmstest_unset_all_crtcs(drm_fd, res);
+
+	igt_set_module_param_int(drm_fd, "load_detect_test", 1);
+
+	plane_resources = drmModeGetPlaneResources(drm_fd);
+	igt_assert(plane_resources);
+
+	for (i = 0; i < plane_resources->count_planes; i++) {
+		drmModePlane *drm_plane;
+		bool found = false;
+		uint32_t plane_id = plane_resources->planes[i];
+
+		drm_plane = drmModeGetPlane(drm_fd, plane_id);
+		igt_assert(drm_plane);
+
+		for (j = 0; j < drm_plane->count_formats; j++) {
+			uint32_t format = drm_plane->formats[j];
+			uint32_t crtc = ffs(drm_plane->possible_crtcs) - 1;
+			uint32_t crtc_id = res->crtcs[crtc];
+
+			if (format == DRM_FORMAT_XRGB8888)
+				do_or_die(drmModeSetPlane(drm_fd, plane_id, crtc_id,
+						xrgb_fb.fb_id,
+						0, 0, 0, w, h,
+						0, 0, IGT_FIXED(w, 0), IGT_FIXED(h, 0)));
+			else if (format == DRM_FORMAT_ARGB8888)
+				do_or_die(drmModeSetPlane(drm_fd, plane_id, crtc_id,
+						argb_fb.fb_id,
+						0, 0, 0, w, h,
+						0, 0, IGT_FIXED(w, 0), IGT_FIXED(h, 0)));
+			else
+				continue;
+
+			found = true;
+			break;
+		}
+		drmModeFreePlane(drm_plane);
+		igt_assert(found);
+	}
+
+	/*
+	 * This can't use drmModeGetConnectorCurrent
+	 * because connector probing is the point of this test.
+	 */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+
+	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
+
+	igt_assert(temp->connection != DRM_MODE_UNKNOWNCONNECTION);
+
+	drmModeFreeConnector(temp);
+
+	/* Look if planes are unmodified. */
+	for (i = 0; i < plane_resources->count_planes; i++) {
+		drmModePlane *drm_plane;
+
+		drm_plane = drmModeGetPlane(drm_fd,
+					    plane_resources->planes[i]);
+		igt_assert(drm_plane);
+
+		igt_assert(drm_plane->crtc_id);
+		igt_assert(drm_plane->fb_id);
+
+		if (drm_plane->fb_id != xrgb_fb.fb_id)
+			igt_assert_eq(drm_plane->fb_id, argb_fb.fb_id);
+
+		drmModeFreePlane(drm_plane);
+	}
+}
+
+static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
+{
+	igt_display_t display;
+	drmModeConnector *temp;
+
+	igt_display_require(&display, drm_fd);
+
+	/* Reset display before attempt to use it. */
+	igt_display_reset(&display);
+	igt_display_commit(&display);
+
+	/* Force the connector on and check the reported values. */
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+	igt_assert_eq(temp->connection, DRM_MODE_CONNECTED);
+	igt_assert_lt(0, temp->count_modes);
+	drmModeFreeConnector(temp);
+
+	/* Force the connector off. */
+	kmstest_force_connector(drm_fd, connector,
+				FORCE_CONNECTOR_OFF);
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+	igt_assert_eq(temp->connection, DRM_MODE_DISCONNECTED);
+	igt_assert_eq(0, temp->count_modes);
+	drmModeFreeConnector(temp);
+
+	/* Check that the previous state is restored. */
+	kmstest_force_connector(drm_fd, connector,
+				FORCE_CONNECTOR_UNSPECIFIED);
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+	igt_assert_eq(temp->connection, connector->connection);
+	drmModeFreeConnector(temp);
+
+	igt_display_fini(&display);
+}
+
+static void force_edid(int drm_fd, drmModeConnectorPtr connector)
+{
+	drmModeConnector *temp;
+
+	kmstest_force_connector(drm_fd, connector,
+				FORCE_CONNECTOR_ON);
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	/* Test edid forcing. */
+	kmstest_force_edid(drm_fd, connector,
+			   igt_kms_get_base_edid());
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+
+	igt_debug("num_conn %i\n", temp->count_modes);
+
+	CHECK_MODE(temp->modes[0], 1920, 1080, 60);
+	/*
+	 * Don't check non-preferred modes to avoid to tight coupling
+	 * with the in-kernel EDID parser.
+	 */
+
+	drmModeFreeConnector(temp);
+
+	/* Remove edid. */
+	kmstest_force_edid(drm_fd, connector, NULL);
+	kmstest_force_connector(drm_fd, connector,
+				FORCE_CONNECTOR_UNSPECIFIED);
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+	/*
+	 * The connector should now have the same number of modes that
+	 * it started with.
+	 */
+	igt_assert_eq(temp->count_modes, connector->count_modes);
+	drmModeFreeConnector(temp);
+
+}
+
+static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
+{
+	int i;
+	drmModeConnector *temp;
+
+	kmstest_force_connector(drm_fd, connector,
+				FORCE_CONNECTOR_ON);
+
+	/* Test pruning of stale modes. */
+	kmstest_force_edid(drm_fd, connector,
+			   igt_kms_get_alt_edid());
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+
+	for (i = 0; i < temp->count_modes; i++) {
+		if (temp->modes[i].hdisplay == 1400 &&
+		    temp->modes[i].vdisplay == 1050)
+			break;
+	}
+	igt_require_f(i != temp->count_modes, "1400x1050 not on mode list\n");
+	drmModeFreeConnector(temp);
+
+	kmstest_force_edid(drm_fd, connector,
+			   igt_kms_get_base_edid());
+	temp = drmModeGetConnectorCurrent(drm_fd,
+					  connector->connector_id);
+
+	for (i = 0; i < temp->count_modes; i++) {
+		if (temp->modes[i].hdisplay == 1400 &&
+		    temp->modes[i].vdisplay == 1050)
+			break;
+	}
+	igt_assert_f(i == temp->count_modes, "1400x1050 not pruned from mode list\n");
+
+	drmModeFreeConnector(temp);
+
+	kmstest_force_edid(drm_fd, connector, NULL);
+	kmstest_force_connector(drm_fd, connector,
+				FORCE_CONNECTOR_UNSPECIFIED);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -79,22 +288,37 @@ const char *help_str =
 
 igt_main_args("", long_opts, help_str, opt_handler, NULL)
 {
-	/* force the VGA output and test that it worked */
-	int drm_fd = 0;
+	/* Force the VGA output and test that it worked. */
+	int i, drm_fd = 0;
 	drmModeRes *res;
-	drmModeConnector *connector = NULL, *temp;
-	int start_n_modes, start_connection;
+	drmModeConnector *connector = NULL;
+	struct {
+		const char *name;
+		const char *desc;
+		void (*func)(int, drmModeConnector *);
+	} tests[] = {
+		{ "force-connector-state",
+		  "Test to check the forced connector state.",
+		  force_connector_state },
+		{ "force-edid",
+		  "Test to check the values after forcing edid.",
+		  force_edid },
+		{ "prune-stale-modes",
+		  "Tests pruning of stale modes.",
+		  prune_stale_modes }
+	};
 
 	igt_fixture {
 		unsigned connector_id = 0;
 
 		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
 
 		res = drmModeGetResources(drm_fd);
 		igt_require(res);
 
-		/* find a vga connector */
-		for (int i = 0; i < res->count_connectors; i++) {
+		/* Find a vga connector. */
+		for (i = 0; i < res->count_connectors; i++) {
 			connector = drmModeGetConnectorCurrent(drm_fd,
 							       res->connectors[i]);
 
@@ -112,8 +336,11 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 			drmModeFreeConnector(connector);
 		}
 
-		/* find a hdmi connector if we didn't find vga */
-		for (int i = 0; i < res->count_connectors; i++) {
+		if (connector_id)
+			goto end;
+
+		/* Find a hdmi connector if we didn't find vga. */
+		for (i = 0; i < res->count_connectors; i++) {
 			connector = drmModeGetConnectorCurrent(drm_fd,
 							       res->connectors[i]);
 
@@ -134,214 +361,19 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 
 		igt_require(connector_id);
 
-		/* Reacquire status after clearing any previous overrides */
+end:
+		/* Reacquire status after clearing any previous overrides. */
 		connector = drmModeGetConnector(drm_fd, connector_id);
-
-		start_n_modes = connector->count_modes;
-		start_connection = connector->connection;
 	}
 
 	igt_describe("Test to detect forced load.");
-	igt_subtest("force-load-detect") {
-		int i, j, w = 64, h = 64;
-		drmModePlaneRes *plane_resources;
-		struct igt_fb xrgb_fb, argb_fb;
-
-		/* no load detect on HDMI */
-		igt_require(connector->connector_type == DRM_MODE_CONNECTOR_VGA);
-
-		igt_create_fb(drm_fd, w, h, DRM_FORMAT_XRGB8888, 0, &xrgb_fb);
-		igt_create_fb(drm_fd, w, h, DRM_FORMAT_ARGB8888, 0, &argb_fb);
-		igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1) == 0);
-
-		/*
-		 * disable all outputs to make sure we have a
-		 * free crtc available for load detect
-		 */
-		kmstest_set_vt_graphics_mode();
-		kmstest_unset_all_crtcs(drm_fd, res);
-
-		igt_set_module_param_int(drm_fd, "load_detect_test", 1);
-
-		plane_resources = drmModeGetPlaneResources(drm_fd);
-		igt_assert(plane_resources);
-
-		for (i = 0; i < plane_resources->count_planes; i++) {
-			drmModePlane *drm_plane;
-			bool found = false;
-			uint32_t plane_id = plane_resources->planes[i];
-
-			drm_plane = drmModeGetPlane(drm_fd, plane_id);
-			igt_assert(drm_plane);
-
-			for (j = 0; j < drm_plane->count_formats; j++) {
-				uint32_t format = drm_plane->formats[j];
-				uint32_t crtc = ffs(drm_plane->possible_crtcs) - 1;
-				uint32_t crtc_id = res->crtcs[crtc];
-
-				if (format == DRM_FORMAT_XRGB8888)
-					do_or_die(drmModeSetPlane(drm_fd, plane_id, crtc_id,
-							xrgb_fb.fb_id,
-							0, 0, 0, w, h,
-							0, 0, IGT_FIXED(w, 0), IGT_FIXED(h, 0)));
-				else if (format == DRM_FORMAT_ARGB8888)
-					do_or_die(drmModeSetPlane(drm_fd, plane_id, crtc_id,
-							argb_fb.fb_id,
-							0, 0, 0, w, h,
-							0, 0, IGT_FIXED(w, 0), IGT_FIXED(h, 0)));
-				else
-					continue;
-
-				found = true;
-				break;
-			}
-			drmModeFreePlane(drm_plane);
-			igt_assert(found);
-		}
-
-		/* This can't use drmModeGetConnectorCurrent
-		 * because connector probing is the point of this test.
-		 */
-		temp = drmModeGetConnector(drm_fd, connector->connector_id);
-
-		igt_set_module_param_int(drm_fd, "load_detect_test", 0);
-
-		igt_assert(temp->connection != DRM_MODE_UNKNOWNCONNECTION);
-
-		drmModeFreeConnector(temp);
-
-		/* Look if planes are unmodified. */
-		for (i = 0; i < plane_resources->count_planes; i++) {
-			drmModePlane *drm_plane;
+	igt_subtest("force-load-detect")
+		force_load_detect(drm_fd, connector, res);
 
-			drm_plane = drmModeGetPlane(drm_fd,
-						    plane_resources->planes[i]);
-			igt_assert(drm_plane);
-
-			igt_assert(drm_plane->crtc_id);
-			igt_assert(drm_plane->fb_id);
-
-			if (drm_plane->fb_id != xrgb_fb.fb_id)
-				igt_assert_eq(drm_plane->fb_id, argb_fb.fb_id);
-
-			drmModeFreePlane(drm_plane);
-		}
-
-		igt_remove_fb(drm_fd, &xrgb_fb);
-		igt_remove_fb(drm_fd, &argb_fb);
-	}
-
-	igt_describe("Test to check the forced connector state.");
-	igt_subtest("force-connector-state") {
-		igt_display_t display;
-
-		/* force the connector on and check the reported values */
-		kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-		igt_assert_eq(temp->connection, DRM_MODE_CONNECTED);
-		igt_assert_lt(0, temp->count_modes);
-		drmModeFreeConnector(temp);
-
-		/* attempt to use the display */
-		kmstest_set_vt_graphics_mode();
-		igt_display_require(&display, drm_fd);
-		igt_display_commit(&display);
-		igt_display_fini(&display);
-
-
-		/* force the connector off */
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_OFF);
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-		igt_assert_eq(temp->connection, DRM_MODE_DISCONNECTED);
-		igt_assert_eq(0, temp->count_modes);
-		drmModeFreeConnector(temp);
-
-		/* check that the previous state is restored */
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_UNSPECIFIED);
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-		igt_assert_eq(temp->connection, start_connection);
-		drmModeFreeConnector(temp);
-	}
-
-	igt_describe("Test to check the values after forcing edid.");
-	igt_subtest("force-edid") {
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_ON);
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-		drmModeFreeConnector(temp);
-
-		/* test edid forcing */
-		kmstest_force_edid(drm_fd, connector,
-				   igt_kms_get_base_edid());
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-
-		igt_debug("num_conn %i\n", temp->count_modes);
-
-		CHECK_MODE(temp->modes[0], 1920, 1080, 60);
-		/* Don't check non-preferred modes to avoid to tight coupling
-		 * with the in-kernel EDID parser. */
-
-		drmModeFreeConnector(temp);
-
-		/* remove edid */
-		kmstest_force_edid(drm_fd, connector, NULL);
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_UNSPECIFIED);
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-		/* the connector should now have the same number of modes that
-		 * it started with */
-		igt_assert_eq(temp->count_modes, start_n_modes);
-		drmModeFreeConnector(temp);
-
-	}
-
-	igt_describe("Tests pruning of stale modes.");
-	igt_subtest("prune-stale-modes") {
-		int i;
-
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_ON);
-
-		/* test pruning of stale modes */
-		kmstest_force_edid(drm_fd, connector,
-				   igt_kms_get_alt_edid());
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-
-		for (i = 0; i < temp->count_modes; i++) {
-			if (temp->modes[i].hdisplay == 1400 &&
-			    temp->modes[i].vdisplay == 1050)
-				break;
-		}
-		igt_require_f(i != temp->count_modes, "1400x1050 not on mode list\n");
-
-		drmModeFreeConnector(temp);
-
-		kmstest_force_edid(drm_fd, connector,
-				   igt_kms_get_base_edid());
-		temp = drmModeGetConnectorCurrent(drm_fd,
-						  connector->connector_id);
-
-		for (i = 0; i < temp->count_modes; i++) {
-			if (temp->modes[i].hdisplay == 1400 &&
-			    temp->modes[i].vdisplay == 1050)
-				break;
-		}
-		igt_assert_f(i == temp->count_modes, "1400x1050 not pruned from mode list\n");
-
-		drmModeFreeConnector(temp);
-
-		kmstest_force_edid(drm_fd, connector, NULL);
-		kmstest_force_connector(drm_fd, connector,
-					FORCE_CONNECTOR_UNSPECIFIED);
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("%s", tests[i].desc);
+		igt_subtest_f("%s", tests[i].name)
+			tests[i].func(drm_fd, connector);
 	}
 
 	igt_fixture {
-- 
2.25.1
