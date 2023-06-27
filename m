Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AD810E2E7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:21:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:50:24 +0530
Message-Id: <20230627122030.675526-4-swati2.sharma@intel.com>
In-Reply-To: <20230627122030.675526-1-swati2.sharma@intel.com>
References: <20230627122030.675526-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/9] tests/i915/kms_dsc: use #define for
 default bpc
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

For default bpc, use #define. By setting bpc as 0, means driver
will set its own value and we are not enforcing input bpc.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 4b5e034bf..84bd5dbbc 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -34,6 +34,8 @@
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
+#define DEFAULT_BPC	0
+
 enum {
 	TEST_DSC_BASIC = 1 << 0,
 	TEST_DSC_BPC = 1 << 1,
@@ -295,7 +297,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters");
 	igt_subtest_with_dynamic("dsc-basic")
-			test_dsc(&data, TEST_DSC_BASIC, 0,
+			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
 				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
 
 	igt_describe("Tests basic display stream compression functionality if supported "
@@ -303,7 +305,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "with default parameters and creating fb with diff formats");
 	igt_subtest_with_dynamic("dsc-with-formats") {
 		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
-			test_dsc(&data, TEST_DSC_FORMAT, 0,
+			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
 				 format_list[k], DSC_FORMAT_RGB);
 	}
 
@@ -322,8 +324,9 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
 			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT, bpc_list[j],
-				format_list[k], DSC_FORMAT_RGB);
+				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
+				bpc_list[j], format_list[k],
+				DSC_FORMAT_RGB);
 			}
 		}
 	}
@@ -333,7 +336,8 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "that support it");
 	igt_subtest_with_dynamic("dsc-with-output-formats") {
 		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
-			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, 0, DRM_FORMAT_XRGB8888,
+			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
+				 DRM_FORMAT_XRGB8888,
 				 output_format_list[k]);
 	}
 
-- 
2.25.1
