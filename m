Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F4C6E1E9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2020 05:35:10 +0000 (UTC)
From: nidhi1.gupta@intel.com
Date: Tue, 24 Nov 2020 11:13:13 +0530
Message-Id: <20201124054313.8293-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] Added dynamic Subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..646aafb3 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -918,7 +918,7 @@ igt_main
 	igt_display_t display;
 	igt_output_t *output;
 	enum pipe pipe;
-	int i;
+	int i, count=0;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1024,18 +1024,23 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output)
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 
-	for (i = 1; i <= IGT_MAX_PIPES; i++) {
-		igt_subtest_f("%ix-modeset-transitions", i)
-			run_modeset_transition(&display, i, false, false);
+	igt_subtest_with_dynamic("modeset-transitions") {
+		for_each_pipe_with_single_output(&display, pipe,output) {
+			count++;
+		}
+		for (i = 1; i <= count; i++) {
+			igt_subtest_f("%ix-modeset-transitions", i)
+				run_modeset_transition(&display, i, false, false);
 
-		igt_subtest_f("%ix-modeset-transitions-nonblocking", i)
-			run_modeset_transition(&display, i, true, false);
+			igt_subtest_f("%ix-modeset-transitions-nonblocking", i)
+				run_modeset_transition(&display, i, true, false);
 
-		igt_subtest_f("%ix-modeset-transitions-fencing", i)
-			run_modeset_transition(&display, i, false, true);
+			igt_subtest_f("%ix-modeset-transitions-fencing", i)
+				run_modeset_transition(&display, i, false, true);
 
-		igt_subtest_f("%ix-modeset-transitions-nonblocking-fencing", i)
-			run_modeset_transition(&display, i, true, true);
+			igt_subtest_f("%ix-modeset-transitions-nonblocking-fencing", i)
+				run_modeset_transition(&display, i, true, true);
+		}
 	}
 
 	igt_fixture {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
