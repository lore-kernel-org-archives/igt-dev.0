Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A0610E327
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 05:43:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 11:12:21 +0530
Message-Id: <20230509054221.162805-4-swati2.sharma@intel.com>
In-Reply-To: <20230509054221.162805-1-swati2.sharma@intel.com>
References: <20230509054221.162805-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/kms_dsc: Add test summary
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

Add test summary giving overall view of what all is being validated
in the test.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 8aaec288..cbb77d6a 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -34,6 +34,25 @@
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
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
+ * (RGB/YCBCR444/YCBCR420). Finally, we also test fractional bpp
+ * with default parameter. In this, driver will ignore integer
+ * compressed bpp value and will do modeset with fractional bpp only.
+ */
+
 enum dsc_test_type {
 	TEST_DSC_BASIC,
 	TEST_DSC_BPC,
-- 
2.25.1
