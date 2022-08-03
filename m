Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEE2113DF1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 10:34:04 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  3 Aug 2022 15:59:27 +0530
Message-Id: <20220803102927.134117-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220803102927.134117-1-mohammed.thasleem@intel.com>
References: <20220803102927.134117-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] tests/kms_lease: Test Cleanup
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index d734143c..1bfcd22a 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -88,12 +88,12 @@ static igt_output_t *connector_id_to_output(igt_display_t *display, uint32_t con
 	return igt_output_from_connector(display, &connector);
 }
 
-static int prepare_crtc(lease_t *lease, uint32_t connector_id, uint32_t crtc_id)
+static int prepare_crtc(lease_t *lease, data_t *data)
 {
 	drmModeModeInfo *mode;
 	igt_display_t *display = &lease->display;
-	igt_output_t *output = connector_id_to_output(display, connector_id);
-	enum pipe pipe = crtc_id_to_pipe(display, crtc_id);
+	igt_output_t *output = connector_id_to_output(display, data->connector_id);
+	enum pipe pipe = data->pipe;
 	igt_plane_t *primary;
 	int ret;
 
@@ -136,7 +136,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 }
 
@@ -238,7 +238,7 @@ static void simple_lease(data_t *data)
 	igt_display_require(&lease.display, lease.fd);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&lease, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&lease, data));
 
 	/* Paint something attractive */
 	paint_fb(lease.fd, &lease.primary_fb, "simple_lease",
@@ -292,7 +292,7 @@ static void page_flip_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
 	/* sanity check */
 	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
@@ -363,7 +363,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
 	/* sanity check */
 	do_or_die(drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
@@ -404,7 +404,7 @@ static void cursor_implicit_plane(data_t *data)
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
+	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
 	/* sanity check */
 	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
@@ -729,7 +729,7 @@ static void lease_revoke(data_t *data)
 	igt_assert_eq(revoke_lease(data->master.fd, &mrl), 0);
 
 	/* Try to use the leased objects */
-	ret = prepare_crtc(&lease, data->connector_id, data->crtc_id);
+	ret = prepare_crtc(&lease, data);
 
 	/* Ensure that the expected error is returned */
 	igt_assert_eq(ret, -ENOENT);
@@ -1246,6 +1246,8 @@ igt_main
 			for_each_pipe_with_valid_output(&data.master.display, p, output) {
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p),
 					      igt_output_name(output)) {
+					igt_display_reset(&data.master.display);
+					igt_display_commit(&data.master.display);
 					run_test(&data, f->func, p, output);
 				}
 			}
@@ -1279,4 +1281,9 @@ igt_main
 	igt_describe("Tests all the uevent cases");
 	igt_subtest("lease-uevent")
 		lease_uevent(&data);
+
+	igt_fixture {
+		igt_display_fini(&data.master.display);
+		close(data.master.fd);
+	}
 }
-- 
2.25.1
