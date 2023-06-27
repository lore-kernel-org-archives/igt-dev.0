Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3030E10E2E0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:21:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:50:30 +0530
Message-Id: <20230627122030.675526-10-swati2.sharma@intel.com>
In-Reply-To: <20230627122030.675526-1-swati2.sharma@intel.com>
References: <20230627122030.675526-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 9/9] tests/i915/kms_dsc: add test summary
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

Add test summary giving overall summary of subtests.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 7ffa193ed..c3d789077 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -36,6 +36,27 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define DEFAULT_BPC	0
 
+/*
+ * Starting from gen11+, i915 driver supports DSC1.1. For validating
+ * DSC, the first step is to verify if the sink supports DSC.
+ * If the sink does support DSC, we will validate the following
+ * scenarios:
+ * (i) basic modeset (ii) input bpc (iii) pixel formats
+ * (iv) output formats (v) fractional bpp
+ * In the basic subtest, we perform modeset with default parameters.
+ * Input bpc and pixel formats subtests, we perform modeset
+ * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
+ * respectively. With the support of DSC1.2 from MTL, we can
+ * verify fractional bpp and DSC YCBCR420 output format. The tests
+ * are executed with the RGB444 output format by default. However,
+ * in the output-format subtest, we verify output formats
+ * (RGB/YCBCR444/YCBCR420). Fractional bpp is tested with default
+ * parameter. In this, driver will ignore integer compressed bpp
+ * value and will do modeset with fractional bpp only. Also,
+ * tests are added to validate output format and fractional bpp
+ * with different input bpc.
+ */
+
 enum {
 	TEST_DSC_BASIC = 1 << 0,
 	TEST_DSC_BPC = 1 << 1,
-- 
2.25.1
