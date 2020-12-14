Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6196E13C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 10:57:37 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Mon, 14 Dec 2020 16:36:21 +0530
Message-Id: <20201214110621.16022-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8] kms_atomic_transition:Convert
 nx-modeset-transitions subtest to dynamic
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

In kms_atomic_transition subtest,it will test all the
pipes defined in IGT, i.e. IGT_MAX_PIPES whether
the output is available or not.Later it has to be
analysed and discarded as valid skip.To save this
time, updated the test to first check the available
outputs and then execute the test.

V7: -Modified commit message. (Karthik)
    -Replaced for_each_single_pipe_with_single__output with
     for_each_connected_output to execute the test only on
     connected display. (Karthik)

v8: -Modified the description subject line. (Petri)
    -Modified subtests names to remove redundancy. (Petri)
    -Added extra line before for loop. (Karthik)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_atomic_transition.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..7d752011 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -918,7 +918,7 @@ igt_main
 	igt_display_t display;
 	igt_output_t *output;
 	enum pipe pipe;
-	int i;
+	int i, count = 0;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1024,18 +1024,23 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output)
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 
-	for (i = 1; i <= IGT_MAX_PIPES; i++) {
-		igt_subtest_f("%ix-modeset-transitions", i)
-			run_modeset_transition(&display, i, false, false);
+	igt_subtest_with_dynamic("modeset-transitions") {
+		for_each_connected_output(&display, output)
+			count++;
+
+		for (i = 1; i <= count; i++) {
+			igt_dynamic_f("%ix-outputs", i)
+				run_modeset_transition(&display, i, false, false);
 
-		igt_subtest_f("%ix-modeset-transitions-nonblocking", i)
-			run_modeset_transition(&display, i, true, false);
+			igt_dynamic_f("%ix-outputs-nonblocking", i)
+				run_modeset_transition(&display, i, true, false);
 
-		igt_subtest_f("%ix-modeset-transitions-fencing", i)
-			run_modeset_transition(&display, i, false, true);
+			igt_dynamic_f("%ix-outputs-fencing", i)
+				run_modeset_transition(&display, i, false, true);
 
-		igt_subtest_f("%ix-modeset-transitions-nonblocking-fencing", i)
-			run_modeset_transition(&display, i, true, true);
+			igt_dynamic_f("%ix-outputs-nonblocking-fencing", i)
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
