Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C3B6E8B4
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:28:00 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  3 Sep 2021 19:27:40 +0300
Message-Id: <20210903162743.29851-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/7] tests/kms_color: Pass pipe to
 invalid LUT size tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Each pipe can have a different LUT sizes, so run the invalid LUT
size tests once for each pipe.

This also makes sure data->(de)gamma_lut_size are properly initialized
prior to running these subtests.

Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c        | 73 +++++++++++++++++++++++++---------------
 tests/kms_color_helper.c | 17 +++++-----
 tests/kms_color_helper.h |  7 ++--
 3 files changed, 58 insertions(+), 39 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 9105076aba4f..dabc6963e9e0 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -638,6 +638,26 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static void
+prep_pipe(data_t *data, enum pipe p)
+{
+	igt_require_pipe(&data->display, p);
+
+	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+		data->degamma_lut_size =
+			igt_pipe_obj_get_prop(&data->display.pipes[p],
+					      IGT_CRTC_DEGAMMA_LUT_SIZE);
+		igt_assert_lt(0, data->degamma_lut_size);
+	}
+
+	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_GAMMA_LUT_SIZE)) {
+		data->gamma_lut_size =
+			igt_pipe_obj_get_prop(&data->display.pipes[p],
+					      IGT_CRTC_GAMMA_LUT_SIZE);
+		igt_assert_lt(0, data->gamma_lut_size);
+	}
+}
+
 static void
 run_tests_for_pipe(data_t *data, enum pipe p)
 {
@@ -652,10 +672,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	};
 
 	igt_fixture {
+		prep_pipe(data, p);
+
 		igt_require_pipe_crc(data->drm_fd);
 
-		igt_require_pipe(&data->display, p);
-
 		pipe = &data->display.pipes[p];
 		igt_require(pipe->n_planes >= 0);
 
@@ -665,20 +685,6 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 						  primary->pipe->pipe,
 						  INTEL_PIPE_CRC_SOURCE_AUTO);
 
-		if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_DEGAMMA_LUT_SIZE)) {
-			data->degamma_lut_size =
-				igt_pipe_obj_get_prop(&data->display.pipes[p],
-						      IGT_CRTC_DEGAMMA_LUT_SIZE);
-			igt_assert_lt(0, data->degamma_lut_size);
-		}
-
-		if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_GAMMA_LUT_SIZE)) {
-			data->gamma_lut_size =
-				igt_pipe_obj_get_prop(&data->display.pipes[p],
-						      IGT_CRTC_GAMMA_LUT_SIZE);
-			igt_assert_lt(0, data->gamma_lut_size);
-		}
-
 		igt_display_require_output_on_pipe(&data->display, p);
 	}
 
@@ -865,6 +871,25 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 }
 
+static void
+run_invalid_tests_for_pipe(data_t *data, enum pipe p)
+{
+	igt_fixture
+		prep_pipe(data, p);
+
+	igt_describe("Negative check for invalid gamma lut sizes");
+	igt_subtest_f("pipe-%s-invalid-gamma-lut-sizes", kmstest_pipe_name(p))
+		invalid_gamma_lut_sizes(data, p);
+
+	igt_describe("Negative check for invalid degamma lut sizes");
+	igt_subtest_f("pipe-%s-invalid-degamma-lut-sizes", kmstest_pipe_name(p))
+		invalid_degamma_lut_sizes(data, p);
+
+	igt_describe("Negative check for color tranformation matrix sizes");
+	igt_subtest_f("pipe-%s-invalid-ctm-matrix-sizes", kmstest_pipe_name(p))
+		invalid_ctm_matrix_sizes(data, p);
+}
+
 igt_main
 {
 	data_t data = {};
@@ -879,21 +904,13 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(pipe) {
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
+		igt_subtest_group
+			run_invalid_tests_for_pipe(&data, pipe);
+	}
 
 	igt_fixture {
 		igt_display_fini(&data.display);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 8b08cdaeea5f..d71e7bb2e6f9 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -287,10 +287,11 @@ pipe_set_property_blob(igt_pipe_t *pipe,
 }
 
 static void
-invalid_lut_sizes(data_t *data, enum igt_atomic_crtc_properties prop, int size)
+invalid_lut_sizes(data_t *data, enum pipe p,
+		  enum igt_atomic_crtc_properties prop, int size)
 {
 	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe = &display->pipes[0];
+	igt_pipe_t *pipe = &display->pipes[p];
 	struct drm_color_lut *lut;
 	size_t lut_size = size * sizeof(lut[0]);
 
@@ -319,21 +320,21 @@ invalid_lut_sizes(data_t *data, enum igt_atomic_crtc_properties prop, int size)
 }
 
 void
-invalid_gamma_lut_sizes(data_t *data)
+invalid_gamma_lut_sizes(data_t *data, enum pipe p)
 {
-	invalid_lut_sizes(data, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
+	invalid_lut_sizes(data, p, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
 }
 
 void
-invalid_degamma_lut_sizes(data_t *data)
+invalid_degamma_lut_sizes(data_t *data, enum pipe p)
 {
-	invalid_lut_sizes(data, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
+	invalid_lut_sizes(data, p, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
 }
 
-void invalid_ctm_matrix_sizes(data_t *data)
+void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe = &display->pipes[0];
+	igt_pipe_t *pipe = &display->pipes[p];
 	void *ptr;
 
 	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 3f49e7cae4c0..bb6f0054f388 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -103,8 +103,9 @@ int pipe_set_property_blob_id(igt_pipe_t *pipe,
 int pipe_set_property_blob(igt_pipe_t *pipe,
 			   enum igt_atomic_crtc_properties prop,
 			   void *ptr, size_t length);
-void invalid_gamma_lut_sizes(data_t *data);
-void invalid_degamma_lut_sizes(data_t *data);
-void invalid_ctm_matrix_sizes(data_t *data);
+void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
+void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
+void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
+
 #endif
 
-- 
2.31.1
