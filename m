Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8FF10F30E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 08:16:36 +0000 (UTC)
From: venkata.sai.patnana@intel.com
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Apr 2022 13:29:11 +0530
Message-Id: <20220411075911.21067-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20220308032112.12119-1-venkata.sai.patnana@intel.com>
References: <20220308032112.12119-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: IGT clean up for kms_dsc
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

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Remove redundent code and clean up added in individual test
block.

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/i915/kms_dsc.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 22d2216e90..8814073664 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -121,19 +121,6 @@ static void restore_force_dsc_en(void)
 	force_dsc_restore_fd = -1;
 }
 
-static void test_cleanup(data_t *data)
-{
-	igt_plane_t *primary;
-
-	if (data->output) {
-		primary = igt_output_get_plane_type(data->output,
-						    DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_display_commit(&data->display);
-	}
-}
-
 static void kms_dsc_exit_handler(int sig)
 {
 	restore_force_dsc_en();
@@ -211,9 +198,8 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	bool enabled;
 	igt_plane_t *primary;
 
-	/* Disable the output first */
-	igt_output_set_pipe(data->output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	/* Sanitize the state before starting the subtest. */
+	igt_display_reset(&data->display);
 
 	igt_debug("DSC is supported on %s\n", data->conn_name);
 	save_force_dsc_en(data);
@@ -253,6 +239,10 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
 		     data->conn_name,
 		     kmstest_pipe_name(data->pipe));
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit(&data->display);
 }
 
 static void run_test(data_t *data, enum dsc_test_type test_type)
@@ -307,7 +297,6 @@ igt_main
 {
 	data_t data = {};
 	drmModeRes *res;
-	drmModeConnector *connector = NULL;
 	int i, j;
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -350,10 +339,6 @@ igt_main
 	}
 
 	igt_fixture {
-		if (connector)
-			drmModeFreeConnector(connector);
-		test_cleanup(&data);
-		drmModeFreeResources(res);
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
 	}
-- 
2.25.1
