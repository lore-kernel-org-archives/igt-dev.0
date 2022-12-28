Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329E10E37F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Dec 2022 08:43:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Dec 2022 14:13:31 +0530
Message-Id: <20221228084331.6997-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dsc: Add negative test for
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 330fc050..172010d2 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -50,7 +50,8 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 enum dsc_test_type {
 	TEST_DSC_BASIC,
-	TEST_DSC_BPC
+	TEST_DSC_BPC,
+	TEST_DSC_INVALID_BPC,
 };
 
 typedef struct {
@@ -78,6 +79,7 @@ const struct {
 };
 
 uint32_t bpc_list[] = {12, 10, 8};
+uint32_t invalid_bpc_list[] = {100, 1};
 
 static inline void manual(const char *expected)
 {
@@ -238,7 +240,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 	save_force_dsc_en(data);
 	force_dsc_enable(data);
 
-	if (test_type == TEST_DSC_BPC) {
+	if (test_type == TEST_DSC_BPC || test_type == TEST_DSC_INVALID_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
 		force_dsc_enable_bpc(data);
 	}
@@ -262,7 +264,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
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
@@ -276,15 +283,15 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 				mode->vrefresh,
 				enabled ? "ON" : "OFF");
 
-	restore_force_dsc_en();
-	igt_debug("Reset compression BPC\n");
-	data->input_bpc = 0;
-	force_dsc_enable_bpc(data);
-
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
 		     output->name,
 		     kmstest_pipe_name(data->pipe));
+cleanup:
+	restore_force_dsc_en();
+	igt_debug("Reset compression BPC\n");
+	data->input_bpc = 0;
+	force_dsc_enable_bpc(data);
 
 	test_cleanup(data);
 }
@@ -314,7 +321,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
-		if (test_type == TEST_DSC_BPC)
+		if (test_type == TEST_DSC_BPC || test_type == TEST_DSC_INVALID_BPC)
 			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(plane_format));
 		else
 			snprintf(name, sizeof(name), "-%s", igt_format_str(plane_format));
@@ -364,6 +371,14 @@ igt_main
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
