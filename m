Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB40710E34B
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Aug 2023 13:39:13 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Aug 2023 19:08:08 +0530
Message-Id: <20230801133811.975849-8-swati2.sharma@intel.com>
In-Reply-To: <20230801133811.975849-1-swati2.sharma@intel.com>
References: <20230801133811.975849-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v6 07/10] tests/i915/kms_dsc: add test summary
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
 tests/i915/kms_dsc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index f2eed7df0..5bdac57e2 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -42,6 +42,24 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 
+/*
+ * Starting from gen11, intel driver supports DSC1.1. For validating
+ * DSC, the first step is to verify if the sink supports DSC.
+ * If the sink does support DSC, we will validate different
+ * scenarios by forcing dsc. Outline of the tests is as follows:
+ * (i) basic modeset (ii) input bpc (iii) pixel formats
+ * (iv) output formats
+ * In the basic subtest, we perform modeset with default parameters.
+ * Input bpc and pixel formats subtests, we perform modeset
+ * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
+ * respectively. From MTL+, we can verify DSC YCBCR420 output format.
+ * The tests are executed with the RGB444 output format by default.
+ * However, in the output-format subtest, we verify different
+ * output formats (RGB/YCBCR444/YCBCR420). Also, test is added to
+ * validate output formats with different input bpc (12/10/8).
+ */
+
+
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
-- 
2.25.1
