Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D9710E4D0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Oct 2022 19:39:36 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 01:03:19 +0530
Message-Id: <20221006193319.230261-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220928133703.55196-1-mohammed.thasleem@intel.com>
References: <20220928133703.55196-1-mohammed.thasleem@intel.com>
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

v2: Fixed compilation issue.
v3: Removed redundant code.
v4: Moved get_prop_sanity calls to igt_subtest_group.
v5: Replace for loop with for_each_disconnected_output.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_properties.c | 176 ++++++++++++++++++-----------------------
 1 file changed, 77 insertions(+), 99 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2958efac..76ef64ab 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -43,6 +43,7 @@ static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
 	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
 
+	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
 
 	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
@@ -230,77 +231,52 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 static void plane_properties(igt_display_t *display, bool atomic)
 {
-	bool found_any = false, found;
 	igt_output_t *output;
 	enum pipe pipe;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
-	for_each_pipe(display, pipe) {
-		found = false;
-
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			found_any = found = true;
-
+	for_each_pipe_with_single_output(display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output)) {
 			run_plane_property_tests(display, pipe, output, atomic);
-			break;
 		}
 	}
-
-	igt_skip_on(!found_any);
 }
 
 static void crtc_properties(igt_display_t *display, bool atomic)
 {
-	bool found_any_valid_pipe = false, found;
 	enum pipe pipe;
 	igt_output_t *output;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
-	for_each_pipe(display, pipe) {
-		found = false;
-
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			found_any_valid_pipe = found = true;
-
+	for_each_pipe_with_single_output(display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output)) {
 			run_crtc_property_tests(display, pipe, output, atomic);
-			break;
 		}
 	}
-
-	igt_skip_on(!found_any_valid_pipe);
 }
 
 static void connector_properties(igt_display_t *display, bool atomic)
 {
-	int i;
 	enum pipe pipe;
 	igt_output_t *output;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
 	for_each_connected_output(display, output) {
-		bool found = false;
 
 		for_each_pipe(display, pipe) {
 			if (!igt_pipe_connector_valid(pipe, output))
 				continue;
 
-			found = true;
-			run_connector_property_tests(display, pipe, output, atomic);
-			break;
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				      igt_output_name(output)) {
+				run_connector_property_tests(display, pipe, output, atomic);
+			}
 		}
+		break;
 
-		igt_assert_f(found, "Connected output should have at least 1 valid crtc\n");
 	}
 
-	for (i = 0; i < display->n_outputs; i++)
-		if (!igt_output_is_connected(&display->outputs[i]))
-			run_connector_property_tests(display, PIPE_NONE, &display->outputs[i], atomic);
+	for_each_disconnected_output(display, output)
+		run_connector_property_tests(display, PIPE_NONE, output, atomic);
 }
 
 static void test_invalid_properties(int fd,
@@ -368,7 +344,6 @@ static void test_object_invalid_properties(igt_display_t *display,
 	igt_output_t *output;
 	igt_plane_t *plane;
 	enum pipe pipe;
-	int i;
 
 	for_each_pipe(display, pipe)
 		test_invalid_properties(display->drm_fd, id, type, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
@@ -377,7 +352,7 @@ static void test_object_invalid_properties(igt_display_t *display,
 		for_each_plane_on_pipe(display, pipe, plane)
 			test_invalid_properties(display->drm_fd, id, type, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
 
-	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
+	for_each_connected_output(display, output)
 		test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
@@ -669,9 +644,8 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
 	igt_assert_neq(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &properties), 0);
 }
 
-static void get_prop_sanity(igt_display_t *display, bool atomic)
+static void get_prop_sanity(int fd, bool atomic)
 {
-	int fd = display->drm_fd;
 	drmModePlaneResPtr plane_res;
 	drmModeResPtr res;
 
@@ -707,25 +681,56 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_plane_t *plane;
 	enum pipe pipe;
-	int i;
-
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
 
 	for_each_pipe(display, pipe)
-		test_object_invalid_properties(display, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			test_object_invalid_properties(display, display->pipes[pipe].crtc_id,
+						       DRM_MODE_OBJECT_CRTC, atomic);
 
 	for_each_pipe(display, pipe)
-		for_each_plane_on_pipe(display, pipe, plane)
-			test_object_invalid_properties(display, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
+		igt_dynamic_f("pipe-%s-plane", kmstest_pipe_name(pipe))
+			for_each_plane_on_pipe(display, pipe, plane)
+				test_object_invalid_properties(display, plane->drm_plane->plane_id,
+							       DRM_MODE_OBJECT_PLANE, atomic);
+
+	for_each_connected_output(display, output)
+		igt_dynamic_f("%s", igt_output_name(output))
+			test_object_invalid_properties(display, output->id,
+						       DRM_MODE_OBJECT_CONNECTOR, atomic);
 
-	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
-		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
 igt_main
 {
 	igt_display_t display;
+	int i;
+	static const struct {
+		const char *name;
+		void (*func)(igt_display_t *, bool);
+		const bool atomic;
+		const char *desc;
+	} tests[] = {
+		{ "plane-properties-legacy", plane_properties, false,
+		  "Tests plane properties with legacy commit" },
+		{ "plane-properties-atomic", plane_properties, true,
+		  "Tests plane properties with atomic commit" },
+		{ "crtc-properties-legacy", crtc_properties, false,
+		  "Tests crtc properties with legacy commit" },
+		{ "crtc-properties-atomic", crtc_properties, true,
+		  "Tests crtc properties with atomic commit" },
+		{ "connector-properties-legacy", connector_properties, false,
+		  "Tests connector properties with legacy commit" },
+		{ "connector-properties-atomic", connector_properties, true,
+		  "Tests connector properties with atomic commit" },
+		{ "invalid-properties-legacy", invalid_properties, false,
+		  "Checks each property of any type with combination of mode "
+		  "object with legacy commit and make sure only valid properties "
+		  "are set to mode object else return with relevant error" },
+		{ "invalid-properties-atomic", invalid_properties, true,
+		  "Checks each property of any type with combination of mode object "
+		  "with atomic commit and make sure only valid properties are set to "
+		  "mode object else return with relevant error" },
+	};
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -735,59 +740,32 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 	}
 
-	igt_describe("Tests plane properties with legacy commit");
-	igt_subtest("plane-properties-legacy")
-		plane_properties(&display, false);
-
-	igt_describe("Tests plane properties with atomic commit");
-	igt_subtest("plane-properties-atomic")
-		plane_properties(&display, true);
-
-	igt_describe("Tests crtc properties with legacy commit");
-	igt_subtest("crtc-properties-legacy")
-		crtc_properties(&display, false);
-
-	igt_describe("Tests crtc properties with atomic commit");
-	igt_subtest("crtc-properties-atomic")
-		crtc_properties(&display, true);
-
-	igt_describe("Tests connector properties with legacy commit");
-	igt_subtest("connector-properties-legacy")
-		connector_properties(&display, false);
-
-	igt_describe("Tests connector properties with atomic commit");
-	igt_subtest("connector-properties-atomic")
-		connector_properties(&display, true);
-
-	igt_describe("Checks each property of any type with combination of mode object with legacy "
-		     "commit and make sure only valid properties are set to mode object else "
-		     "return with relevant error");
-
-	igt_subtest("invalid-properties-legacy")
-		invalid_properties(&display, false);
-
-	igt_describe("Checks each property of any type with combination of mode object with atomic "
-		     "commit and make sure only valid properties are set to mode object else "
-		     "return with relevant error");
-
-	igt_subtest("invalid-properties-atomic")
-		invalid_properties(&display, true);
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("%s\n", tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			if (tests->atomic && !display.is_atomic)
+				continue;
 
-	igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
-	igt_subtest("get_properties-sanity-atomic") {
-		igt_skip_on(!display.is_atomic);
-		get_prop_sanity(&display, true);
+			tests[i].func(&display, tests->atomic);
+		}
 	}
 
-	igt_describe("Test validates the properties of all planes, crtc and connectors with legacy commit");
-	igt_subtest("get_properties-sanity-non-atomic") {
-		if (display.is_atomic)
-			igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
+	igt_subtest_group {
+		igt_describe("Test validates the properties of all planes, crtc and connectors with legacy commit");
+		igt_subtest("get_properties-sanity-non-atomic") {
+			if (display.is_atomic)
+				igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
+			get_prop_sanity(display.drm_fd, false);
+			if (display.is_atomic)
+				igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+		}
 
-		get_prop_sanity(&display, false);
+		igt_fixture
+			igt_require(display.is_atomic);
 
-		if (display.is_atomic)
-			igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+		igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
+		igt_subtest("get_properties-sanity-atomic")
+			get_prop_sanity(display.drm_fd, true);
 	}
 
 	igt_fixture {
-- 
2.25.1
