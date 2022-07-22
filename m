Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0395BF2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jul 2022 14:05:26 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Jul 2022 19:36:02 +0530
Message-Id: <20220722140602.4615-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: Modify dsc check
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

Modifying the existing test condition to skip tests where we force
DSC on modes not supporting DSC. While comparing HDISPLAY with 5K;
we won't be able to validate 4K@120 on DP; which
do support DSC. So, instead of checking HDISPLAY; we will check
DOTCLOCK. So, if any mode is having DOTCLOCK < 594MHz; no need to
apply force dsc enable on such mode and SKIP.

As per CTA-861, mode 3840x2160@60 has dotclock of 594MHz.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index be15238e3..1f507cc92 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -47,6 +47,7 @@
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define HDISPLAY_5K	5120
+#define MAX_DOTCLOCK	594000
 #define DSC_MIN_BPP	8
 
 enum dsc_test_type {
@@ -166,15 +167,15 @@ static bool check_dsc_on_connector(data_t *data)
 }
 
 /* Force dsc enable supports resolutions above 5K in DP */
-static bool check_5k_dp_test_constraint(data_t *data)
+static bool check_max_dotclock_constraint(data_t *data)
 {
 	igt_output_t *output = data->output;
 	drmModeConnector *connector = output->config.connector;
 	drmModeModeInfo *mode = get_highres_mode(output);
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-	    mode->hdisplay < HDISPLAY_5K) {
-		igt_debug("Force dsc enable does not support res. < 5K in %s\n",
+	    mode->clock < MAX_DOTCLOCK) {
+		igt_debug("Force dsc enable does not support resolution having dotclock < 594MHz in %s\n",
 			   output->name);
 		return false;
 	}
@@ -318,7 +319,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsign
 		if (!check_dsc_on_connector(data))
 			continue;
 
-		if (!check_5k_dp_test_constraint(data))
+		if (!check_max_dotclock_constraint(data))
 			continue;
 
 		if (!check_big_joiner_test_constraint(data, test_type))
-- 
2.25.1
