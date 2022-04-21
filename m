Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C8FC57CB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 08:58:40 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:20:44 +0530
Message-Id: <20220421145044.39871-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220421145044.39871-1-mohammed.thasleem@intel.com>
References: <20220421145044.39871-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 2/2] tests/kms_lease: Test Cleanup
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

v2: Minor changes.
v3: Moved display reset and commit in to igt_subtest_with_dynamic_f.
v4: Separated display and non-display subsets.
v5: Minor changes.
v6: Removed connector_id_to_output,crtc_id_to_pipe & pipe_to_crtc_id
    function calls.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 224 ++++++++++++++++++++++------------------------
 1 file changed, 105 insertions(+), 119 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index d36f56aa..758c0297 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -64,36 +64,12 @@ typedef struct {
 	uint32_t plane_id;
 } data_t;
 
-static uint32_t pipe_to_crtc_id(igt_display_t *display, enum pipe pipe)
-{
-	return display->pipes[pipe].crtc_id;
-}
-
-static enum pipe crtc_id_to_pipe(igt_display_t *display, uint32_t crtc_id)
-{
-	enum pipe pipe;
-
-	for_each_pipe(display, pipe) {
-		if(display->pipes[pipe].crtc_id == crtc_id)
-			return pipe;
-	}
-	return -1;
-}
-
-static igt_output_t *connector_id_to_output(igt_display_t *display, uint32_t connector_id)
-{
-	drmModeConnector		connector;
-
-	connector.connector_id = connector_id;
-	return igt_output_from_connector(display, &connector);
-}
-
-static int prepare_crtc(lease_t *lease, uint32_t connector_id, uint32_t crtc_id)
+static int prepare_crtc(lease_t *lease, data_t *data)
 {
 	drmModeModeInfo *mode;
 	igt_display_t *display = &lease->display;
-	igt_output_t *output = connector_id_to_output(display, connector_id);
-	enum pipe pipe = crtc_id_to_pipe(display, crtc_id);
+	igt_output_t *output = data->output;
+	enum pipe pipe = data->pipe;
 	igt_plane_t *primary;
 	int ret;
 
@@ -136,7 +112,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 }
 
@@ -238,14 +214,13 @@ static void simple_lease(data_t *data)
 	igt_display_require(&lease.display, lease.fd);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&lease, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&lease, data));
 
 	/* Paint something attractive */
 	paint_fb(lease.fd, &lease.primary_fb, "simple_lease",
 		 lease.mode->name, igt_output_name(lease.output), kmstest_pipe_name(data->pipe));
 	igt_debug_wait_for_keypress("lease");
-	cleanup_crtc(&lease,
-		     connector_id_to_output(&lease.display, data->connector_id));
+	cleanup_crtc(&lease, data->output);
 
 	terminate_lease(&lease);
 }
@@ -292,7 +267,7 @@ static void page_flip_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
 	/* sanity check */
 	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
@@ -300,10 +275,9 @@ static void page_flip_implicit_plane(data_t *data)
 			      0, NULL));
 
 	display = &data->master.display;
-	pipe = crtc_id_to_pipe(display, data->crtc_id);
 
 	igt_wait_for_vblank(data->master.fd,
-			display->pipes[pipe].crtc_offset);
+			display->pipes[data->pipe].crtc_offset);
 
 	do_or_die(drmModePageFlip(mcl.fd, data->crtc_id,
 			      data->master.primary_fb.fb_id,
@@ -313,10 +287,8 @@ static void page_flip_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = wrong_plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
 
-	pipe = crtc_id_to_pipe(display, data->crtc_id);
-
 	igt_wait_for_vblank(data->master.fd,
-			display->pipes[pipe].crtc_offset);
+			display->pipes[data->pipe].crtc_offset);
 
 	igt_assert_eq(drmModePageFlip(mcl.fd, data->crtc_id,
 				      data->master.primary_fb.fb_id,
@@ -324,8 +296,7 @@ static void page_flip_implicit_plane(data_t *data)
 		      -EACCES);
 	close(mcl.fd);
 
-	cleanup_crtc(&data->master,
-		     connector_id_to_output(&data->master.display, data->connector_id));
+	cleanup_crtc(&data->master, data->output);
 }
 
 static void setcrtc_implicit_plane(data_t *data)
@@ -334,9 +305,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	struct drm_mode_create_lease mcl;
 	drmModePlaneRes *plane_resources;
 	uint32_t wrong_plane_id = 0;
-	igt_output_t *output =
-		connector_id_to_output(&data->master.display,
-				       data->connector_id);
+	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 	int i;
 
@@ -363,7 +332,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
 	/* sanity check */
 	do_or_die(drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
@@ -383,8 +352,7 @@ static void setcrtc_implicit_plane(data_t *data)
 				 0, 0, 0, NULL, 0, NULL));
 	close(mcl.fd);
 
-	cleanup_crtc(&data->master,
-		     connector_id_to_output(&data->master.display, data->connector_id));
+	cleanup_crtc(&data->master, data->output);
 }
 
 static void cursor_implicit_plane(data_t *data)
@@ -404,7 +372,7 @@ static void cursor_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
 	/* sanity check */
 	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
@@ -419,8 +387,7 @@ static void cursor_implicit_plane(data_t *data)
 		      -EACCES);
 	close(mcl.fd);
 
-	cleanup_crtc(&data->master,
-		     connector_id_to_output(&data->master.display, data->connector_id));
+	cleanup_crtc(&data->master, data->output);
 }
 
 static void atomic_implicit_crtc(data_t *data)
@@ -642,8 +609,8 @@ static void lease_unleased_crtc(data_t *data)
 	for_each_pipe(&data->master.display, p) {
 		if (bad_crtc_id != 0)
 			break;
-		if (pipe_to_crtc_id(&data->master.display, p) != data->crtc_id)
-			bad_crtc_id = pipe_to_crtc_id(&data->master.display, p);
+		if (data->master.display.pipes[p].crtc_id != data->crtc_id)
+			bad_crtc_id = data->master.display.pipes[p].crtc_id;
 	}
 
 	/* Give up if there isn't another crtc */
@@ -729,7 +696,7 @@ static void lease_revoke(data_t *data)
 	igt_assert_eq(revoke_lease(data->master.fd, &mrl), 0);
 
 	/* Try to use the leased objects */
-	ret = prepare_crtc(&lease, data->connector_id, data->crtc_id);
+	ret = prepare_crtc(&lease, data);
 
 	/* Ensure that the expected error is returned */
 	igt_assert_eq(ret, -ENOENT);
@@ -1185,83 +1152,102 @@ igt_main
 	igt_output_t *output;
 	igt_display_t *display = &data.master.display;
 
-	const struct {
-		const char *name;
-		void (*func)(data_t *);
-		const char *desc;
-	} funcs[] = {
-		{ "simple_lease", simple_lease, "Check if create lease ioctl call works" },
-		{ "empty_lease", empty_lease, "Check that creating an empty lease works" },
-		{ "lessee_list", lessee_list, "Check if listed lease is same as created one" },
-		{ "lease_get", lease_get, "Tests getting the required contents of a lease" },
-		{ "lease_unleased_connector", lease_unleased_connector, "Negative test by trying to"
-			" use an unleased connector " },
-		{ "lease_unleased_crtc", lease_unleased_crtc, "Negative test by trying to use an unleased crtc" },
-		{ "lease_revoke", lease_revoke, "Tests revocation of lease" },
-		{ "lease_again", lease_again, "Tests leasing objects more than once" },
-		{ "lease_invalid_connector", lease_invalid_connector, "Tests leasing an invalid connector" },
-		{ "lease_invalid_crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
-		{ "lease_invalid_plane", lease_invalid_plane, "Tests leasing an invalid plane" },
-		{ "page_flip_implicit_plane", page_flip_implicit_plane, "Negative test by using a "
-			"non-primary plane with the page flip ioctl" },
-		{ "setcrtc_implicit_plane", setcrtc_implicit_plane, "Negative test by using a "
-			"non-primary plane with the setcrtc ioctl" },
-		{ "cursor_implicit_plane", cursor_implicit_plane, "Negative test by using a non-primary"
-			" plane with setcursor ioctl" },
-		{ "atomic_implicit_crtc", atomic_implicit_crtc, "Negative test by using a different"
-			" crtc with atomic ioctl" },
-		{ }
-	}, *f;
-
 	igt_fixture {
 		data.master.fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(display, data.master.fd);
 	}
 
-	for (f = funcs; f->name; f++) {
-
-		igt_describe(f->desc);
-		igt_subtest_with_dynamic_f("%s", f->name) {
-			for_each_pipe_with_valid_output(display, data.pipe, data->output) {
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
-					      igt_output_name(output)) {
-					data.crtc_id = pipe_to_crtc_id(display, data.pipe);
-					data.connector_id = output->id;
-					data.plane_id =
-						igt_pipe_get_plane_type(&data.master.display.pipes[data.pipe],
-								DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
-					f->func(&data);
+	/*Display dependent subtests*/
+	igt_subtest_group {
+
+		const struct {
+			const char *name;
+			void (*func)(data_t *);
+			const char *desc;
+		} funcs[] = {
+			{ "simple_lease", simple_lease, "Check if create lease ioctl call works" },
+			{ "empty_lease", empty_lease, "Check that creating an empty lease works" },
+			{ "lessee_list", lessee_list, "Check if listed lease is same as created one" },
+			{ "lease_get", lease_get, "Tests getting the required contents of a lease" },
+			{ "lease_unleased_connector", lease_unleased_connector, "Negative test by trying to"
+				" use an unleased connector " },
+			{ "lease_unleased_crtc", lease_unleased_crtc, "Negative test by trying to use an unleased crtc" },
+			{ "lease_revoke", lease_revoke, "Tests revocation of lease" },
+			{ "lease_again", lease_again, "Tests leasing objects more than once" },
+			{ "lease_invalid_connector", lease_invalid_connector, "Tests leasing an invalid connector" },
+			{ "lease_invalid_crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
+			{ "lease_invalid_plane", lease_invalid_plane, "Tests leasing an invalid plane" },
+			{ "page_flip_implicit_plane", page_flip_implicit_plane, "Negative test by using a "
+				"non-primary plane with the page flip ioctl" },
+			{ "setcrtc_implicit_plane", setcrtc_implicit_plane, "Negative test by using a "
+				"non-primary plane with the setcrtc ioctl" },
+			{ "cursor_implicit_plane", cursor_implicit_plane, "Negative test by using a non-primary"
+				" plane with setcursor ioctl" },
+			{ "atomic_implicit_crtc", atomic_implicit_crtc, "Negative test by using a different"
+				" crtc with atomic ioctl" },
+			{ }
+		}, *f;
+
+		igt_fixture
+			igt_display_require_output(display);
+
+		for (f = funcs; f->name; f++) {
+
+			igt_describe(f->desc);
+			igt_subtest_with_dynamic_f("%s", f->name) {
+				for_each_pipe_with_valid_output(display, data.pipe, data->output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
+						      igt_output_name(output)) {
+						igt_display_reset(display);
+						igt_display_commit(display);
+						data.crtc_id = display->pipes[data.pipe].crtc_id;
+						data.connector_id = output->id;
+						data.master.output = output;
+						data.plane_id =
+							igt_pipe_get_plane_type(&data.master.display.pipes[data.pipe],
+									DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
+						f->func(&data);
+					}
 				}
 			}
 		}
 	}
 
-	igt_describe("Tests error handling while creating invalid corner-cases for "
-		     "create-lease ioctl");
-	igt_subtest("invalid-create-leases")
-		invalid_create_leases(&data);
-
-	igt_describe("Tests that  possible_crtcs logically match between master and "
-		     "lease, and that the values are correctly renumbered on the lease side.");
-	igt_subtest("possible-crtcs-filtering")
-		possible_crtcs_filtering(&data);
-
-	igt_describe("Tests the drop/set_master interactions.");
-	igt_subtest("master-vs-lease")
-		master_vs_lease(&data);
-
-	igt_describe("Tests that the 2nd master can only create leases while being active "
-		     "master, and that leases on the first master don't prevent lease creation "
-		     "for the 2nd master.");
-	igt_subtest("multimaster-lease")
-		multimaster_lease(&data);
-
-	igt_describe("Tests the implicitly added planes.");
-	igt_subtest("implicit-plane-lease")
-		implicit_plane_lease(&data);
-
-	igt_describe("Tests all the uevent cases");
-	igt_subtest("lease-uevent")
-		lease_uevent(&data);
+	/*Non-Display dependent subtests*/
+	igt_subtest_group {
+
+		igt_describe("Tests error handling while creating invalid corner-cases for "
+			     "create-lease ioctl");
+		igt_subtest("invalid-create-leases")
+			invalid_create_leases(&data);
+
+		igt_describe("Tests that  possible_crtcs logically match between master and "
+			     "lease, and that the values are correctly renumbered on the lease side.");
+		igt_subtest("possible-crtcs-filtering")
+			possible_crtcs_filtering(&data);
+
+		igt_describe("Tests the drop/set_master interactions.");
+		igt_subtest("master-vs-lease")
+			master_vs_lease(&data);
+
+		igt_describe("Tests that the 2nd master can only create leases while being active "
+			     "master, and that leases on the first master don't prevent lease creation "
+			     "for the 2nd master.");
+		igt_subtest("multimaster-lease")
+			multimaster_lease(&data);
+
+		igt_describe("Tests the implicitly added planes.");
+		igt_subtest("implicit-plane-lease")
+			implicit_plane_lease(&data);
+
+		igt_describe("Tests all the uevent cases");
+		igt_subtest("lease-uevent")
+			lease_uevent(&data);
+	}
+
+	igt_fixture {
+		igt_display_fini(display);
+		close(data.master.fd);
+	}
 }
-- 
2.25.1
