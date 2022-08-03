Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8811321F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 10:34:01 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  3 Aug 2022 15:59:26 +0530
Message-Id: <20220803102927.134117-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220803102927.134117-1-mohammed.thasleem@intel.com>
References: <20220803102927.134117-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 1/2] tests/kms_lease: Create dynamic subtests
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 68 +++++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0bf102a6..d734143c 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -809,39 +809,20 @@ static void lease_invalid_plane(data_t *data)
 }
 
 
-static void run_test(data_t *data, void (*testfunc)(data_t *))
+static void run_test(data_t *data, void (*testfunc)(data_t *), enum pipe p, igt_output_t *output)
 {
 	lease_t *master = &data->master;
 	igt_display_t *display = &master->display;
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
 
-		testfunc(data);
+	data->pipe = p;
+	data->crtc_id = pipe_to_crtc_id(display, p);
+	data->connector_id = output->id;
+	data->plane_id =
+		igt_pipe_get_plane_type(&data->master.display.pipes[data->pipe],
+					DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 
-		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(p),
-			 igt_output_name(output));
-
-		valid_tests++;
-	}
+	testfunc(data);
 
-	igt_require_f(valid_tests,
-		      "no valid crtc/connector combinations found\n");
 }
 
 #define assert_double_id_err(ret) \
@@ -1020,19 +1001,23 @@ static void possible_crtcs_filtering(data_t *data)
 	mcl.flags = 0;
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-		int lease_fd;
 
-		object_ids[mcl.object_count - 1] =
-			resources->crtcs[i];
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(i)) {
+			int lease_fd;
 
-		igt_assert_eq(create_lease(master_fd, &mcl), 0);
-		lease_fd = mcl.fd;
+			object_ids[mcl.object_count - 1] =
+				resources->crtcs[i];
 
-		drmSetClientCap(lease_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+			igt_assert_eq(create_lease(master_fd, &mcl), 0);
+			lease_fd = mcl.fd;
 
-		check_crtc_masks(master_fd, lease_fd, 1 << i);
+			drmSetClientCap(lease_fd,
+					DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
-		close(lease_fd);
+			check_crtc_masks(master_fd, lease_fd, 1 << i);
+
+			close(lease_fd);
+		}
 	}
 
 	free(object_ids);
@@ -1218,6 +1203,8 @@ static void lease_uevent(data_t *data)
 igt_main
 {
 	data_t data;
+	igt_output_t *output;
+	enum pipe p;
 	const struct {
 		const char *name;
 		void (*func)(data_t *);
@@ -1255,8 +1242,13 @@ igt_main
 	for (f = funcs; f->name; f++) {
 
 		igt_describe(f->desc);
-		igt_subtest_f("%s", f->name) {
-			run_test(&data, f->func);
+		igt_subtest_with_dynamic_f("%s", f->name) {
+			for_each_pipe_with_valid_output(&data.master.display, p, output) {
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p),
+					      igt_output_name(output)) {
+					run_test(&data, f->func, p, output);
+				}
+			}
 		}
 	}
 
@@ -1267,7 +1259,7 @@ igt_main
 
 	igt_describe("Tests that  possible_crtcs logically match between master and "
 		     "lease, and that the values are correctly renumbered on the lease side.");
-	igt_subtest("possible-crtcs-filtering")
+	igt_subtest_with_dynamic("possible-crtcs-filtering")
 		possible_crtcs_filtering(&data);
 
 	igt_describe("Tests the drop/set_master interactions.");
-- 
2.25.1
