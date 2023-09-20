Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132510E21B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 10:26:28 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Sep 2023 16:01:28 +0530
Message-Id: <20230920103128.1016220-1-jeevan.b@intel.com>
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
 tests/kms_setmode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 32a6fb690..14bc91198 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -979,6 +979,13 @@ const char *help_str =
 	"  -t <test id>\tRun only the test with this id\n"
 	"  -e \t\tExtend to run on all pipes. (By default tests will run on two pipes only)\n";
 
+/*
+ * basic-clone-single-crtc allows the use of a single CRTC for two connectors, for instance,
+ * in the case of a VGA and an HDMI connector. Similarly, for invalid-clone-exclusive-crtc
+ * when each connector uses its own CRTC, for instance, when a connector uses a CRTC that is
+ * not compatible with the connector.
+ */
+
 igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
-- 
2.25.1
