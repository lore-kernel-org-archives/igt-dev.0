Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9046D10E12E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 06:03:56 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Sep 2023 11:38:44 +0530
Message-Id: <20230920060844.1002510-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_setmode: Add info as comment for valid
 scenario
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

Describe the valid scenario for 'basic-clone-single-crtc' and
'basic-clone-single-crtc' tests, as these tests are skipped if
a valid scenario is not found, which can cause confusion during
bug analysis.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_setmode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 32a6fb690..752951b85 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -979,6 +979,11 @@ const char *help_str =
 	"  -t <test id>\tRun only the test with this id\n"
 	"  -e \t\tExtend to run on all pipes. (By default tests will run on two pipes only)\n";
 
+/* basic-clone-single-crtc allows using a single CRTC for two connectors, such
+ * as VGA and HDMI. Similarly, invalid-clone-exclusive-crtc deals with invalid
+ * configurations where each connector uses its own incompatible CRTC.
+ */
+
 igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
-- 
2.25.1
