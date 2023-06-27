Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9693810E2E0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:21:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:50:29 +0530
Message-Id: <20230627122030.675526-9-swati2.sharma@intel.com>
In-Reply-To: <20230627122030.675526-1-swati2.sharma@intel.com>
References: <20230627122030.675526-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/9] tests/i915/kms_dsc: add subtest
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

New subtest is added to validate fractional bpp with different
input bpc.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3a7d499a2..7ffa193ed 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -388,6 +388,16 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
 				 DSC_FORMAT_RGB);
 
+	igt_describe("Tests fractional compressed bpp functionality if supported "
+		     "by a connector by forcing fractional_bpp on all connectors that support it "
+		     "with certain input BPC for the connector.");
+	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
+		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
+				 bpc_list[j], DRM_FORMAT_XRGB8888,
+				 DSC_FORMAT_RGB);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.25.1
