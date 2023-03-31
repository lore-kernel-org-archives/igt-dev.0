Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3385910F1F7
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 11:47:07 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:19:23 +0530
Message-Id: <20230331114924.15396-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_dsc: Add negative test for
 invalid input bpc
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

Negative test is added to check driver behavior with invalid input bpc.
-EINVAL is returned when we try to commit.

v2: -rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index b3c5e60c7..5c39c2e72 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -36,7 +36,8 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 enum dsc_test_type {
 	TEST_DSC_BASIC,
-	TEST_DSC_BPC
+	TEST_DSC_BPC,
+	TEST_DSC_INVALID_BPC,
 };
 
 typedef struct {
@@ -54,6 +55,7 @@ typedef struct {
 
 static int format_list[] =  {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
 static uint32_t bpc_list[] = {12, 10, 8};
+uint32_t invalid_bpc_list[] = {100, 1};
 
 static inline void manual(const char *expected)
 {
@@ -116,7 +118,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	save_force_dsc_en(data->drm_fd, data->output);
 	force_dsc_enable(data->drm_fd, data->output);
 
-	if (test_type == TEST_DSC_BPC) {
+	if (test_type == TEST_DSC_BPC || test_type == TEST_DSC_INVALID_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
 		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
 	}
@@ -140,7 +142,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 			      &data->fb_test_pattern);
 
 	igt_plane_set_fb(primary, &data->fb_test_pattern);
-	igt_display_commit(display);
+	if (test_type == TEST_DSC_INVALID_BPC) {
+		igt_assert_eq(igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL), -EINVAL);
+		goto cleanup;
+	} else {
+		igt_display_commit(display);
+	}
 
 	/* until we have CRC check support, manually check if RGB test
 	 * pattern has no corruption.
@@ -154,16 +161,17 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 				mode->vrefresh,
 				enabled ? "ON" : "OFF");
 
-	restore_force_dsc_en();
-	igt_debug("Reset compression BPC\n");
-	data->input_bpc = 0;
-	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
-
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
 		     output->name,
 		     kmstest_pipe_name(data->pipe));
 
+cleanup:
+	restore_force_dsc_en();
+	igt_debug("Reset compression BPC\n");
+	data->input_bpc = 0;
+	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
+
 	test_cleanup(data);
 }
 
@@ -193,7 +201,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
-		if (test_type == TEST_DSC_BPC)
+		if (test_type == TEST_DSC_BPC || test_type == TEST_DSC_INVALID_BPC)
 			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(data->plane_format));
 		else
 			snprintf(name, sizeof(name), "-%s", igt_format_str(data->plane_format));
@@ -244,6 +252,14 @@ igt_main
 			test_dsc(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
 	}
 
+	igt_describe("Tests negative basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC on all connectors that support it "
+		     "with wrong input BPC for the connector");
+	igt_subtest_with_dynamic("dsc-with-invalid-bpc") {
+		for (int j = 0; j < ARRAY_SIZE(invalid_bpc_list); j++)
+			test_dsc(&data, TEST_DSC_INVALID_BPC, invalid_bpc_list[j], DRM_FORMAT_XRGB8888);
+	}
+
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with certain input BPC for the connector with diff formats");
-- 
2.25.1
