Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF656E84F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 07:32:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  3 Sep 2021 13:02:46 +0530
Message-Id: <20210903073251.462352-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
References: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v2 1/6] tests/kms_color: Initialize lut_size
 before running the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

If we try to run the lut_size tests alone, we may get improper
result, b'coz lut_size is not initialized. But in the CI,
igt_runner will run gamma/degamma test first which will cache
the lut_size then run the size tests.

This patch will fix the logic to initialized lut_size before
running any test.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 9105076ab..716bd899c 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -865,6 +865,39 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 }
 
+static void run_size_tests(data_t *data)
+{
+	igt_pipe_t *pipe = &data->display.pipes[0];
+
+	igt_fixture {
+		if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+			data->degamma_lut_size =
+				igt_pipe_obj_get_prop(pipe,
+						      IGT_CRTC_DEGAMMA_LUT_SIZE);
+			igt_assert_lt(0, data->degamma_lut_size);
+		}
+
+		if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT_SIZE)) {
+			data->gamma_lut_size =
+				igt_pipe_obj_get_prop(pipe,
+						      IGT_CRTC_GAMMA_LUT_SIZE);
+			igt_assert_lt(0, data->gamma_lut_size);
+		}
+	}
+
+	igt_describe("Negative check for invalid gamma lut sizes");
+	igt_subtest_f("pipe-invalid-gamma-lut-sizes")
+		invalid_gamma_lut_sizes(data);
+
+	igt_describe("Negative check for invalid degamma lut sizes");
+	igt_subtest_f("pipe-invalid-degamma-lut-sizes")
+		invalid_degamma_lut_sizes(data);
+
+	igt_describe("Negative check for color tranformation matrix sizes");
+	igt_subtest_f("pipe-invalid-ctm-matrix-sizes")
+		invalid_ctm_matrix_sizes(data);
+}
+
 igt_main
 {
 	data_t data = {};
@@ -883,17 +916,8 @@ igt_main
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 
-	igt_describe("Negative check for invalid gamma lut sizes");
-	igt_subtest_f("pipe-invalid-gamma-lut-sizes")
-		invalid_gamma_lut_sizes(&data);
-
-	igt_describe("Negative check for invalid degamma lut sizes");
-	igt_subtest_f("pipe-invalid-degamma-lut-sizes")
-		invalid_degamma_lut_sizes(&data);
-
-	igt_describe("Negative check for color tranformation matrix sizes");
-	igt_subtest_f("pipe-invalid-ctm-matrix-sizes")
-		invalid_ctm_matrix_sizes(&data);
+	igt_subtest_group
+		run_size_tests(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.32.0
