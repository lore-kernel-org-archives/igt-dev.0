Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA3E10E347
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:16:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 13:47:51 +0530
Message-Id: <20220928081751.24967-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vblank: Convert test to dynamic
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

Convert existing subtests to dynamic subtests at pipe/output level.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_vblank.c | 61 +++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e65e8522..dddcd40c 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -21,11 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-/** @file kms_vblank.c
- *
- * This is a test of performance of drmWaitVblank.
- */
-
 #include "igt.h"
 #include <stdlib.h>
 #include <stdio.h>
@@ -41,7 +36,7 @@
 
 #include <drm.h>
 
-IGT_TEST_DESCRIPTION("Test speed of WaitVblank.");
+IGT_TEST_DESCRIPTION("This is a test of performance of drmWaitVblank.");
 
 typedef struct {
 	igt_display_t display;
@@ -125,7 +120,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (data->flags & RPM)
 		igt_require(igt_setup_runtime_pm(fd));
 
-	igt_info("Beginning %s on pipe %s, connector %s\n",
+	igt_debug("Beginning %s on pipe %s, connector %s\n",
 		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
 		 igt_output_name(output));
 
@@ -166,7 +161,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (!(data->flags & NOHANG))
 		igt_post_hang_ring(fd, hang);
 
-	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
+	igt_debug("\n%s on pipe %s, connector %s: PASSED\n\n",
 		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
 
 	put_ahnd(ahnd);
@@ -403,8 +398,10 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 			estimated_vblanks, seq2, seq1 + estimated_vblanks);
 }
 
-static void run_subtests_for_pipe(data_t *data)
+static void run_subtests(data_t *data)
 {
+	enum pipe p;
+
 	const struct {
 		const char *name;
 		void (*func)(data_t *, int, int);
@@ -438,20 +435,21 @@ static void run_subtests_for_pipe(data_t *data)
 	}, *m;
 
 	igt_fixture
-		igt_display_require_output_on_pipe(&data->display, data->pipe);
+		igt_display_require_output_on_pipe(&data->display, p);
 
 	for (f = funcs; f->name; f++) {
 		for (m = modes; m->name; m++) {
 			if (m->flags & ~(f->valid | NOHANG))
 				continue;
 
-			igt_describe("Check if test run while hanging by introducing NOHANG flag");
-			igt_subtest_f("pipe-%s-%s-%s",
-				      kmstest_pipe_name(data->pipe),
-				      f->name, m->name) {
-				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
-					data->flags = m->flags | NOHANG;
-					run_test(data, f->func);
+			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
+			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
+				for_each_pipe_with_valid_output(&data->display, p, data->output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
+						data->pipe = p;
+						data->flags = m->flags | NOHANG;
+						run_test(data, f->func);
+					}
 				}
 			}
 
@@ -459,16 +457,16 @@ static void run_subtests_for_pipe(data_t *data)
 			if (f->valid & NOHANG || m->flags & NOHANG)
 				continue;
 
-			igt_describe("check if injected hang is working properly");
-			igt_subtest_f("pipe-%s-%s-%s-hang",
-				      kmstest_pipe_name(data->pipe),
-				      f->name, m->name) {
+			igt_describe("Check if injected hang is working properly.");
+			igt_subtest_with_dynamic_f("%s-%s-hang", f->name, m->name) {
 				igt_hang_t hang;
-
 				hang = igt_allow_hang(data->display.drm_fd, 0, 0);
-				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
-					data->flags = m->flags;
-					run_test(data, f->func);
+				for_each_pipe_with_valid_output(&data->display, p, data->output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
+						data->pipe = p;
+						data->flags = m->flags;
+						run_test(data, f->func);
+					}
 				}
 				igt_disallow_hang(data->display.drm_fd, hang);
 			}
@@ -539,15 +537,18 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
-	igt_describe("Negative test for vblank request");
+	igt_describe("Negative test for vblank request.");
 	igt_subtest("invalid")
 		invalid_subtest(&data, fd);
 
-	igt_describe("check the Vblank and flip events works with given crtc id");
+	igt_describe("Test to check vblank and flip events work with given crtc id.");
 	igt_subtest("crtc-id")
 		crtc_id_subtest(&data, fd);
 
-	for_each_pipe_static(data.pipe)
-		igt_subtest_group
-			run_subtests_for_pipe(&data);
+	run_subtests(&data);
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		close(fd);
+	}
 }
-- 
2.25.1
