Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32A210E12F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 21:17:44 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Sep 2022 02:42:03 +0530
Message-Id: <20220919211203.93461-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220918172906.1567759-1-mohammed.thasleem@intel.com>
References: <20220918172906.1567759-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_properties: Create dynamic
 subtests
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

Modified kms_properties to include dynamic test cases.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_properties.c | 77 ++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index dd5a93aa..46637f01 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -230,48 +230,36 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 static void plane_properties(igt_display_t *display, bool atomic)
 {
-	bool found_any = false, found;
 	igt_output_t *output;
 	enum pipe pipe;
 
 	if (atomic)
 		igt_skip_on(!display->is_atomic);
 
-	for_each_pipe(display, pipe) {
-		found = false;
-
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			found_any = found = true;
-
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output)) {
 			run_plane_property_tests(display, pipe, output, atomic);
-			break;
 		}
+		break;
 	}
-
-	igt_skip_on(!found_any);
 }
 
 static void crtc_properties(igt_display_t *display, bool atomic)
 {
-	bool found_any_valid_pipe = false, found;
 	enum pipe pipe;
 	igt_output_t *output;
 
 	if (atomic)
 		igt_skip_on(!display->is_atomic);
 
-	for_each_pipe(display, pipe) {
-		found = false;
-
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			found_any_valid_pipe = found = true;
-
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output)) {
 			run_crtc_property_tests(display, pipe, output, atomic);
-			break;
 		}
+	break;
 	}
-
-	igt_skip_on(!found_any_valid_pipe);
 }
 
 static void connector_properties(igt_display_t *display, bool atomic)
@@ -283,19 +271,12 @@ static void connector_properties(igt_display_t *display, bool atomic)
 	if (atomic)
 		igt_skip_on(!display->is_atomic);
 
-	for_each_connected_output(display, output) {
-		bool found = false;
-
-		for_each_pipe(display, pipe) {
-			if (!igt_pipe_connector_valid(pipe, output))
-				continue;
-
-			found = true;
-			run_connector_property_tests(display, pipe, output, atomic);
-			break;
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				igt_output_name(output)) {
+		run_connector_property_tests(display, pipe, output, atomic);
 		}
-
-		igt_assert_f(found, "Connected output should have at least 1 valid crtc\n");
+		break;
 	}
 
 	for (i = 0; i < display->n_outputs; i++)
@@ -713,14 +694,21 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 		igt_skip_on(!display->is_atomic);
 
 	for_each_pipe(display, pipe)
-		test_object_invalid_properties(display, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			test_object_invalid_properties(display, display->pipes[pipe].crtc_id,
+						       DRM_MODE_OBJECT_CRTC, atomic);
 
 	for_each_pipe(display, pipe)
-		for_each_plane_on_pipe(display, pipe, plane)
-			test_object_invalid_properties(display, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			for_each_plane_on_pipe(display, pipe, plane)
+				test_object_invalid_properties(display, plane->drm_plane->plane_id,
+							       DRM_MODE_OBJECT_PLANE, atomic);
 
 	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
-		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
+		igt_dynamic_f("%s", igt_output_name(output))
+			test_object_invalid_properties(display, output->id,
+						       DRM_MODE_OBJECT_CONNECTOR, atomic);
+
 }
 
 igt_main
@@ -736,41 +724,41 @@ igt_main
 	}
 
 	igt_describe("Tests plane properties with legacy commit");
-	igt_subtest("plane-properties-legacy")
+	igt_subtest_with_dynamic("plane-properties-legacy")
 		plane_properties(&display, false);
 
 	igt_describe("Tests plane properties with atomic commit");
-	igt_subtest("plane-properties-atomic")
+	igt_subtest_with_dynamic("plane-properties-atomic")
 		plane_properties(&display, true);
 
 	igt_describe("Tests crtc properties with legacy commit");
-	igt_subtest("crtc-properties-legacy")
+	igt_subtest_with_dynamic("crtc-properties-legacy")
 		crtc_properties(&display, false);
 
 	igt_describe("Tests crtc properties with atomic commit");
-	igt_subtest("crtc-properties-atomic")
+	igt_subtest_with_dynamic("crtc-properties-atomic")
 		crtc_properties(&display, true);
 
 	igt_describe("Tests connector properties with legacy commit");
-	igt_subtest("connector-properties-legacy")
+	igt_subtest_with_dynamic("connector-properties-legacy")
 		connector_properties(&display, false);
 
 	igt_describe("Tests connector properties with atomic commit");
-	igt_subtest("connector-properties-atomic")
+	igt_subtest_with_dynamic("connector-properties-atomic")
 		connector_properties(&display, true);
 
 	igt_describe("Checks each property of any type with combination of mode object with legacy "
 		     "commit and make sure only valid properties are set to mode object else "
 		     "return with relevant error");
 
-	igt_subtest("invalid-properties-legacy")
+	igt_subtest_with_dynamic("invalid-properties-legacy")
 		invalid_properties(&display, false);
 
 	igt_describe("Checks each property of any type with combination of mode object with atomic "
 		     "commit and make sure only valid properties are set to mode object else "
 		     "return with relevant error");
 
-	igt_subtest("invalid-properties-atomic")
+	igt_subtest_with_dynamic("invalid-properties-atomic")
 		invalid_properties(&display, true);
 
 	igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
@@ -792,5 +780,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&display);
+		close(display.drm_fd);
 	}
 }
-- 
2.25.1
