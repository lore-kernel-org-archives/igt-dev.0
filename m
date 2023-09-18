Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441A310E0DF
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 05:49:06 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 11:19:26 +0530
Message-Id: <20230918054926.238027-6-swati2.sharma@intel.com>
In-Reply-To: <20230918054926.238027-1-swati2.sharma@intel.com>
References: <20230918054926.238027-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v10 5/5] tests/intel/kms_dsc: remove redundant
 documentation
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

With the introduction of testplan documentation, test documentation
seems redundant. Remove it.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 9b137ef87..59a1e670b 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -69,27 +69,6 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
 
-/*
- * Starting from gen11, intel driver supports DSC1.1. For validating
- * DSC, the first step is to verify if the sink supports DSC.
- * If the sink does support DSC, we will validate different
- * scenarios by forcing dsc. Outline of the tests is as follows:
- * (i) basic modeset (ii) input bpc (iii) pixel formats
- * (iv) output formats (v) fractional bpp
- * In the basic subtest, we perform modeset with default parameters.
- * Input bpc and pixel formats subtests, we perform modeset
- * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
- * respectively. From MTL+, we can verify DSC YCBCR420 output format.
- * The tests are executed with the RGB444 output format by default.
- * However, in the output-format subtest, we verify different
- * output formats (RGB/YCBCR444/YCBCR420). Also, test is added to
- * validate output formats with different input bpc (12/10/8).
- * Lastly, fractional bpp is tested with default parameters.
- * In this, driver will ignore integer compressed bpp value and
- * will do modeset with fractional bpp only. Test is added to
- * validate fractional bpp with different input bpc (12/10/8).
- */
-
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
-- 
2.25.1
