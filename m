Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1E210E308
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 17:31:45 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 23:01:03 +0530
Message-Id: <20230704173107.842296-6-swati2.sharma@intel.com>
In-Reply-To: <20230704173107.842296-1-swati2.sharma@intel.com>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 5/9] tests/i915/kms_dsc: add subtest
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

New subtest is added validating output format with different
input bpc.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index df9b27225..d1935dcd3 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -357,6 +357,19 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 				 output_format_list[k]);
 	}
 
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC and output format on all connectors "
+		     "that support it with certain input BPC for the connector");
+	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
+		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
+				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
+					 bpc_list[j], DRM_FORMAT_XRGB8888,
+					 output_format_list[k]);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1
