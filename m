Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AFC10E137
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 09:01:05 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [v2] tests/intel/kms_dsc: add new constraint
Date: Fri,  5 Jan 2024 14:32:43 +0530
Message-Id: <20240105090243.58192-1-swati2.sharma@intel.com>
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

v2: -club all checks together (Ankit)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1066
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 3433e0907..b5c0fa6ab 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -63,6 +63,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define LEN		20
 #define DEFAULT_BPC	0
+#define MIN_DSC_BPC	8
 
 #define TEST_DSC_BASIC		(0<<0)
 #define TEST_DSC_BPC		(1<<0)
@@ -279,8 +280,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		data->output = output;
 		data->pipe = pipe;
 
-		if (!(is_dsc_supported_by_sink(data->drm_fd, data->output) &&
-		      check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe)))
+		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
+		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
+		     igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
 			continue;
 
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
-- 
2.25.1
