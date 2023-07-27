Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D2410E5D8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 16:54:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jul 2023 22:24:00 +0530
Message-Id: <20230727165401.926688-10-swati2.sharma@intel.com>
In-Reply-To: <20230727165401.926688-1-swati2.sharma@intel.com>
References: <20230727165401.926688-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 09/10] tests/i915/kms_dsc: add test summary
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

v2: -drop DSC1.2 reference (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 81b5a59cc..121d47c1b 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -43,6 +43,26 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
 
+/*
+ * Starting from gen11, intel driver supports DSC1.1. For validating
+ * DSC, the first step is to verify if the sink supports DSC.
+ * If the sink does support DSC, we will validate the following
+ * scenarios. In all the scenarios, we are forcing dsc.
+ * (i) basic modeset (ii) input bpc (iii) pixel formats
+ * (iv) output formats (v) fractional bpp
+ * In the basic subtest, we perform modeset with default parameters.
+ * Input bpc and pixel formats subtests, we perform modeset
+ * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
+ * respectively. From MTL+, we can verify fractional bpp and
+ * DSC YCBCR420 output format. The tests are executed with the
+ * RGB444 output format by default. However, in the output-format
+ * subtest, we verify output formats (RGB/YCBCR444/YCBCR420).
+ * Fractional bpp is tested with default parameter. In this,
+ * driver will ignore integer compressed bpp value and will do
+ * modeset with fractional bpp only. Also, tests are added to
+ * validate output format and fractional bpp with different input bpc.
+ */
+
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
-- 
2.25.1
