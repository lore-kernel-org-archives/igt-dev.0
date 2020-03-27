Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376176EA32
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 14:08:49 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Fri, 27 Mar 2020 16:08:44 +0200
Message-Id: <20200327140844.11430-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Move bandwidth
 calculation to igt_fixture
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The commit 153b34b5353df8c18a87d ("tests/kms_concurrent:
Test maximum number of planes supported by the platform")
caused regression on pipe B testing such as.

IGT-Version: 1.25-gfd8248084 (x86_64) (Linux: 5.6.0-rc7-CI-CI_DRM_8194+ x86_64)
Starting subtest: pipe-B
Testing resolution with connector VGA-1 using pipe B with seed 1585245074
child 0 died with signal 11, Segmentation fault
Subtest pipe-B: FAIL (0.330s)

To fix this, we need move bandwidth calculation routines into part of
igt_fixture instead of calculating it just before actual testing. The patch
takes the minimum of those maximum number of planes for given output.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_concurrent.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1403e990..ce05f5fa 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -36,6 +36,7 @@ typedef struct {
 	igt_display_t display;
 	igt_plane_t **plane;
 	struct igt_fb *fb;
+	int max_planes;
 } data_t;
 
 /* Command line parameters. */
@@ -321,30 +322,28 @@ static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
 	igt_output_t *output;
-	int max_planes;
 
 	igt_fixture {
 		int valid_tests = 0;
+		int n_planes = data->display.pipes[pipe].n_planes;
 
 		igt_skip_on(pipe >= data->display.n_pipes);
-		igt_require(data->display.pipes[pipe].n_planes > 0);
+		igt_require(n_planes > 0);
 
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			test_init(data, pipe, n_planes, output);
+			data->max_planes = min(data->max_planes,
+						test_bandwidth(data, pipe, output));
+			test_fini(data, pipe, n_planes, output);
 			valid_tests++;
-
+		}
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
+		igt_display_reset(&data->display);
 	}
 
 	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe)) {
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			int n_planes = data->display.pipes[pipe].n_planes;
-
-			test_init(data, pipe, n_planes, output);
-			max_planes = test_bandwidth(data, pipe, output);
-			test_fini(data, pipe, n_planes, output);
-
-			igt_display_reset(&data->display);
-			run_test(data, pipe, max_planes, output);
+			run_test(data, pipe, data->max_planes, output);
 		}
 	}
 }
@@ -392,6 +391,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
+		data.max_planes = data.display.pipes[0].n_planes;
 	}
 
 	for_each_pipe_static(pipe) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
