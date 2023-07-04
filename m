Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F72910E306
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 17:31:43 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 23:00:59 +0530
Message-Id: <20230704173107.842296-2-swati2.sharma@intel.com>
In-Reply-To: <20230704173107.842296-1-swati2.sharma@intel.com>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 1/9] tests/i915/kms_dsc: add new test flag
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

Add new test flag TEST_DSC_FORMAT.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
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
