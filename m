Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B12B14B9E5
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 08:58:38 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:20:43 +0530
Message-Id: <20220421145044.39871-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220421145044.39871-1-mohammed.thasleem@intel.com>
References: <20220421145044.39871-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 1/2] tests/kms_lease: Create dynamic subtests
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

Modified tests/kms_lease to include dynamic test cases.

v2: Updated dynamic test cases to all test cases.
v3: Removed dynamic test for which it's not required.
v4: Moved content of for loop in to igt_dynamic.
v5: Minor changes.
v6: Removed run_test which is not required.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 55 ++++++++++++++---------------------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0bf102a6..d36f56aa 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -808,42 +808,6 @@ static void lease_invalid_plane(data_t *data)
 	assert_unleased(ret);
 }
 
-
-static void run_test(data_t *data, void (*testfunc)(data_t *))
-{
-	lease_t *master = &data->master;
-	igt_display_t *display = &master->display;
-	igt_output_t *output;
-	enum pipe p;
-	unsigned int valid_tests = 0;
-
-	for_each_pipe_with_valid_output(display, p, output) {
-		igt_info("Beginning %s on pipe %s, connector %s\n",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(p),
-			 igt_output_name(output));
-
-		data->pipe = p;
-		data->crtc_id = pipe_to_crtc_id(display, p);
-		data->connector_id = output->id;
-		data->plane_id =
-			igt_pipe_get_plane_type(&data->master.display.pipes[data->pipe],
-						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
-
-		testfunc(data);
-
-		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(p),
-			 igt_output_name(output));
-
-		valid_tests++;
-	}
-
-	igt_require_f(valid_tests,
-		      "no valid crtc/connector combinations found\n");
-}
-
 #define assert_double_id_err(ret) \
 	igt_assert_f((ret) == -EBUSY || (ret) == -ENOSPC, \
 		     "wrong return code %i, %s\n", ret, \
@@ -1218,6 +1182,9 @@ static void lease_uevent(data_t *data)
 igt_main
 {
 	data_t data;
+	igt_output_t *output;
+	igt_display_t *display = &data.master.display;
+
 	const struct {
 		const char *name;
 		void (*func)(data_t *);
@@ -1249,14 +1216,24 @@ igt_main
 	igt_fixture {
 		data.master.fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&data.master.display, data.master.fd);
+		igt_display_require(display, data.master.fd);
 	}
 
 	for (f = funcs; f->name; f++) {
 
 		igt_describe(f->desc);
-		igt_subtest_f("%s", f->name) {
-			run_test(&data, f->func);
+		igt_subtest_with_dynamic_f("%s", f->name) {
+			for_each_pipe_with_valid_output(display, data.pipe, data->output) {
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
+					      igt_output_name(output)) {
+					data.crtc_id = pipe_to_crtc_id(display, data.pipe);
+					data.connector_id = output->id;
+					data.plane_id =
+						igt_pipe_get_plane_type(&data.master.display.pipes[data.pipe],
+								DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
+					f->func(&data);
+				}
+			}
 		}
 	}
 
-- 
2.25.1
