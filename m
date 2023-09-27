Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255910E4AE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 08:46:20 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Sep 2023 14:21:44 +0530
Message-Id: <20230927085144.1548543-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_setmode: Update test description
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

Update test description for 'basic-clone-single-crtc' and
'basic-clone-single-crtc' tests, as these tests are skipped if
a valid scenario is not found, which can cause confusion during
bug analysis.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_setmode.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 32a6fb690..3caf90447 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -46,8 +46,8 @@
  * Test category: functionality test
  *
  * SUBTEST: basic-clone-single-crtc
- * Description: Tests the mode by cloning the single crtc by iterating through all
- *              valid crtc/connector combinations
+ * Description: This test allows the use of a single CRTC for two connectors, such as VGA/HDMI,
+ *		VGA/DP, and HDMI/HDMI, which are the possible combinations.
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
@@ -62,8 +62,8 @@
  * Test category: functionality test
  *
  * SUBTEST: invalid-clone-exclusive-crtc
- * Description: Tests the mode by cloning the exclusive crtc by iterating through
- *              all invalid crtc/connector combinations
+ * Description: This test is allowed when a connector uses a CRTC that is not compatible with the
+ *		connector, for instance, DP/HDMI can be used on certain pipes on old platforms.
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
@@ -979,6 +979,7 @@ const char *help_str =
 	"  -t <test id>\tRun only the test with this id\n"
 	"  -e \t\tExtend to run on all pipes. (By default tests will run on two pipes only)\n";
 
+
 igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
-- 
2.25.1
