Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3F010E87C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 01:23:02 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 06:47:47 +0530
Message-Id: <20220927011747.18882-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220927011747.18882-1-nidhi1.gupta@intel.com>
References: <20220927011747.18882-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_writeback: Convert tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Convert the existing subtests to dynamic subtests.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_writeback.c | 55 ++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 708fa5cd..5159ff7b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -214,32 +214,38 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 		uint32_t fb_id;
 		bool ptr_valid;
 		int32_t *out_fence_ptr;
+		const char *name;
 	} invalid_tests[] = {
 		{
 			/* No output buffer, but the WRITEBACK_OUT_FENCE_PTR set. */
 			.fb_id = 0,
 			.ptr_valid = true,
 			.out_fence_ptr = &out_fence,
+			.name = "Writeback-out-fence-ptr-set",
 		},
 		{
 			/* Invalid output buffer. */
 			.fb_id = invalid_fb->fb_id,
 			.ptr_valid = true,
 			.out_fence_ptr = &out_fence,
+			.name = "Invalid-output-buffer",
 		},
 		{
 			/* Invalid WRITEBACK_OUT_FENCE_PTR. */
 			.fb_id = valid_fb->fb_id,
 			.ptr_valid = false,
 			.out_fence_ptr = (int32_t *)0x8,
+			.name = "Invalid-writeback-out-fence-ptr",
 		},
 	};
 
 	for (i = 0; i < ARRAY_SIZE(invalid_tests); i++) {
-		ret = do_writeback_test(output, invalid_tests[i].fb_id,
-					invalid_tests[i].out_fence_ptr,
-					invalid_tests[i].ptr_valid);
-		igt_assert(ret != 0);
+		igt_dynamic_f("%s", invalid_tests[i].name) {
+			ret = do_writeback_test(output, invalid_tests[i].fb_id,
+						invalid_tests[i].out_fence_ptr,
+						invalid_tests[i].ptr_valid);
+			igt_assert(ret != 0);
+		}
 	}
 }
 
@@ -247,18 +253,35 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 {
 
 	int ret;
+	struct {
+		const char *name;
+		uint32_t fb_id;
+		int i, expected_ret;
+	} fb_id_tests[] = {
 
-	/* Invalid object for WRITEBACK_FB_ID */
-	ret = do_writeback_test(output, output->id, NULL, false);
-	igt_assert(ret == -EINVAL);
-
-	/* Zero WRITEBACK_FB_ID */
-	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert(ret == 0);
+		{
+			.name = "Invalid-object",
+			.fb_id = output->id,
+			.expected_ret = -EINVAL,
+		},
+		{
+			.name = "Zero-writeback-fb-id",
+			.fb_id = 0,
+			.expected_ret = 0,
+		},
+		{
+			.name = "Valid-output-buffer",
+			.fb_id = valid_fb->fb_id,
+			.expected_ret = 0,
+		},
+	};
 
-	/* Valid output buffer */
-	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
-	igt_assert(ret == 0);
+	for (int i = 0; i < ARRAY_SIZE(fb_id_tests); i++) {
+		igt_dynamic_f("%s", fb_id_tests[i].name) {
+			ret = do_writeback_test(output, fb_id_tests[i].fb_id, NULL, false);
+			igt_assert(ret == fb_id_tests[i].expected_ret);
+		}
+	}
 }
 
 static void fill_fb(igt_fb_t *fb, uint32_t pixel)
@@ -554,7 +577,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_describe("Writeback has a couple of parameters linked together"
 		     "(output framebuffer and fence); this test goes through"
 		     "the combination of possible bad options");
-	igt_subtest("writeback-invalid-parameters") {
+	igt_subtest_with_dynamic("writeback-invalid-parameters") {
 		igt_fb_t invalid_output_fb;
 
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
@@ -570,7 +593,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id") {
+	igt_subtest_with_dynamic("writeback-fb-id") {
 		igt_fb_t output_fb;
 
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-- 
2.36.0
