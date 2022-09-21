Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717E010E3B0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 05:37:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Sep 2022 11:04:13 +0530
Message-Id: <20220921053415.1893828-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220921053415.1893828-1-bhanuprakash.modem@intel.com>
References: <20220921053415.1893828-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/3] tests/kms_vrr: Add Negative tests to validate
 VRR
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

This patch will try to enable VRR on Non-VRR panel. VRR should
not be enabled on the Non-VRR panel. Hence Kernel should reject
the commit.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8976d4a6..1074488f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -45,6 +45,7 @@ enum {
 	TEST_DPMS = 1 << 0,
 	TEST_SUSPEND = 1 << 1,
 	TEST_FLIPLINE = 1 << 2,
+	TEST_NEGATIVE = 1 << 3,
 };
 
 typedef struct range {
@@ -179,11 +180,16 @@ static vtest_ns_t get_test_rate_ns(range_t range)
 	return vtest_ns;
 }
 
-/* Returns true if an output supports VRR. */
+/* Returns true if driver supports VRR. */
 static bool has_vrr(igt_output_t *output)
 {
-	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+}
+
+/* Returns true if an output supports VRR. */
+static bool vrr_capable(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
 }
 
 /* Toggles variable refresh rate on the pipe. */
@@ -244,6 +250,35 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+static void prepare_negative_test(data_t *data, igt_output_t *output, enum pipe pipe)
+{
+	drmModeModeInfo *mode;
+
+	/* Reset output */
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(output, pipe);
+
+	/* Capture VRR range */
+	data->range = get_vrr_range(data, output);
+
+	/* Prepare resources */
+	mode = igt_output_get_mode(output);
+	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+				 DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				 &data->fb0));
+
+	/* Take care of any required modesetting before the test begins. */
+	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(data->primary, &data->fb0);
+
+	/*
+	 * Clear vrr_enabled state before enabling it, because
+	 * it might be left enabled if the previous test fails.
+	 */
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
 /* Performs an atomic non-blocking page-flip on a pipe. */
 static void
 do_flip(data_t *data, igt_fb_t *fb)
@@ -430,6 +465,36 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
+/* VRR on Non-VRR panel: VRR should not be enabled on the Non-VRR panel.
+ * Kernel should reject the commit.
+ */
+static void
+test_negative_basic(data_t *data, enum pipe pipe,
+		    igt_output_t *output, uint32_t flags)
+{
+	int ret;
+
+	igt_info("VRR Negative Test execution on %s, PIPE_%s.\n",
+			output->name, kmstest_pipe_name(pipe));
+
+	prepare_negative_test(data, output, pipe);
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 1);
+
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	igt_assert_f(ret, "VRR shouln't be enabled on Non-VRR panel.\n");
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	igt_assert_f(ret, "VRR shouln't be enabled without selecting a connector.\n");
+
+	/* Clean-up */
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	set_vrr_on_pipe(data, pipe, false);
+
+	igt_remove_fb(data->drm_fd, &data->fb0);
+}
+
 /* Runs tests on outputs that are VRR capable. */
 static void
 run_vrr_test(data_t *data, test_t test, uint32_t flags)
@@ -442,6 +507,13 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 		if (!has_vrr(output))
 			continue;
 
+		/* For Negative tests, panel should be non-vrr. */
+		if ((flags & TEST_NEGATIVE) && vrr_capable(output))
+			continue;
+
+		if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
+			continue;
+
 		for_each_pipe(&data->display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
 				igt_dynamic_f("pipe-%s-%s",
@@ -486,6 +558,10 @@ igt_main
 	igt_subtest_with_dynamic("flipline")
 		run_vrr_test(&data, test_basic, TEST_FLIPLINE);
 
+	igt_describe("Make sure that VRR should not be enabled on the Non-VRR panel.");
+	igt_subtest_with_dynamic("negative-basic")
+		run_vrr_test(&data, test_negative_basic, TEST_NEGATIVE);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.37.3
