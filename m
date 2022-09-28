Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C78210E7E9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 13:43:05 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 19:07:03 +0530
Message-Id: <20220928133703.55196-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220922141157.159926-1-mohammed.thasleem@intel.com>
References: <20220922141157.159926-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_properties.c | 172 ++++++++++++++++++-----------------------
 1 file changed, 75 insertions(+), 97 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index dd5a93aa..476769e0 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -230,48 +230,30 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
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
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
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
+		break;
 	}
-
-	igt_skip_on(!found_any_valid_pipe);
 }
 
 static void connector_properties(igt_display_t *display, bool atomic)
@@ -280,22 +262,12 @@ static void connector_properties(igt_display_t *display, bool atomic)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
-	for_each_connected_output(display, output) {
-		bool found = false;
-
-		for_each_pipe(display, pipe) {
-			if (!igt_pipe_connector_valid(pipe, output))
-				continue;
-
-			found = true;
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				igt_output_name(output)) {
 			run_connector_property_tests(display, pipe, output, atomic);
-			break;
 		}
-
-		igt_assert_f(found, "Connected output should have at least 1 valid crtc\n");
+		break;
 	}
 
 	for (i = 0; i < display->n_outputs; i++)
@@ -707,26 +679,58 @@ static void invalid_properties(igt_display_t *display, bool atomic)
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
 
+	static const struct {
+		const char *name;
+		void (*func)(igt_display_t *, bool);
+		const bool atomic;
+		const char *desc;
+	} funcs[] = {
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
+		{ }
+	}, *f;
+
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -735,62 +739,36 @@ igt_main
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
+	for (f = funcs; f->name; f++) {
+		igt_describe_f("%s\n", f->desc);
+		igt_subtest_with_dynamic_f("%s", f->name) {
+			if (f->atomic && !display.is_atomic)
+				continue;
 
-	igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
-	igt_subtest("get_properties-sanity-atomic") {
-		igt_skip_on(!display.is_atomic);
-		get_prop_sanity(&display, true);
+			f->func(&display, f->atomic);
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
+			get_prop_sanity(&display, false);
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
+			get_prop_sanity(&display, true);
 	}
 
 	igt_fixture {
 		igt_display_fini(&display);
+		close(display.drm_fd);
 	}
 }
-- 
2.25.1
