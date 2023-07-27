Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D74910E5CF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 16:54:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jul 2023 22:23:52 +0530
Message-Id: <20230727165401.926688-2-swati2.sharma@intel.com>
In-Reply-To: <20230727165401.926688-1-swati2.sharma@intel.com>
References: <20230727165401.926688-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 01/10] tests/i915/kms_dsc: add new test flag
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

Add new test flag TEST_DSC_FORMAT. This flag is added to
differentiate the basic dsc test and the tests where we want to
change different plane pixel formats.

v2: -update commit message (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 0a3e29924..23ccbca00 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -37,6 +37,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 enum dsc_test_type {
 	TEST_DSC_BASIC,
 	TEST_DSC_BPC,
+	TEST_DSC_FORMAT,
 	TEST_DSC_OUTPUT_FORMAT,
 };
 
@@ -302,7 +303,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "with default parameters and creating fb with diff formats");
 	igt_subtest_with_dynamic("dsc-with-formats") {
 		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
-			test_dsc(&data, TEST_DSC_BASIC, 0,
+			test_dsc(&data, TEST_DSC_FORMAT, 0,
 				 format_list[k], DSC_FORMAT_RGB);
 	}
 
-- 
2.25.1
