Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E410E36D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 06:50:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_dsc: add new constraint
Date: Fri,  5 Jan 2024 12:22:36 +0530
Message-Id: <20240105065236.57782-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

If output max bpc is less than min dsc bpc (8) which is supported
by intel driver, don't execute test.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1066
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 3433e0907..8ea15f4d2 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -63,6 +63,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define LEN		20
 #define DEFAULT_BPC	0
+#define MIN_DSC_BPC	8
 
 #define TEST_DSC_BASIC		(0<<0)
 #define TEST_DSC_BPC		(1<<0)
@@ -283,6 +284,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		      check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe)))
 			continue;
 
+		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
+			continue;
+
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
 		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
 						     data->output, data->output_format)))
-- 
2.25.1
