Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC43810E7E9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 16:40:38 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 11:39:54 -0500
Message-ID: <20231108164006.106967-6-harry.wentland@amd.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
References: <20231108164006.106967-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH v3 05/12] tests/kms_properties: Add colorop
 properties test
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

We've introduced the concept of a new DRM core object, the
drm_colorop, to represent a color operation as part of a
color pipeline.

Add new tests to kms_properties to test the properties of
a drm_colorop object.

v3:
 - Update test to work without new libdrm definitions for
   colorop objects
 - Test colorop properties with both atomic and legacy
   code paths

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 3284366228c0..9914524d5484 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -46,6 +46,7 @@
  * @crtc:            CRTC
  * @plane:           Plane
  * @invalid:         Invalid (connector/crtc/plane)
+ * @colorop:         Colorop
  *
  * arg[2]:
  *
@@ -208,6 +209,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 	}
 }
 
+static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+{
+	struct igt_fb fb;
+	igt_plane_t *plane;
+	igt_colorop_t *colorop;
+	int i;
+	int colorop_id = 0;
+
+	prepare_pipe(display, pipe, output, &fb);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
+			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+
+		/* iterate over all color pipelines on plane */
+		for (i = 0; i < plane->num_color_pipelines; ++i) {
+			/* iterate over all colorops in pipeline*/
+			colorop = plane->color_pipelines[i];
+			while (colorop) {
+				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
+					kmstest_pipe_name(pipe), plane->index, colorop->id, kmstest_plane_type_name(plane->type), output->name);
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic);
+
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+				colorop = igt_find_colorop(display, colorop_id);
+			}
+		}
+	}
+
+	cleanup_pipe(display, pipe, output, &fb);
+}
+
 static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
@@ -253,6 +287,35 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 		cleanup_pipe(display, pipe, output, &fb);
 }
 
+static void colorop_properties(igt_display_t *display, bool atomic)
+{
+	bool found_any = false, found;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* colorops are only available with atomic */
+	igt_skip_on(!display->is_atomic);
+
+	for_each_pipe(display, pipe) {
+		found = false;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(display))
+				continue;
+
+			found_any = found = true;
+
+			run_colorop_property_tests(display, pipe, output, atomic);
+			break;
+		}
+	}
+
+	igt_skip_on(!found_any);
+}
+
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	bool found_any = false, found;
@@ -800,6 +863,14 @@ igt_main
 	igt_subtest("plane-properties-atomic")
 		plane_properties(&display, true);
 
+	igt_describe("Tests colorop properties with atomic commit");
+	igt_subtest("colorop-properties-atomic")
+		colorop_properties(&display, true);
+
+	igt_describe("Tests colorop properties with legacy commit");
+	igt_subtest("colorop-properties-legacy")
+		colorop_properties(&display, false);
+
 	igt_describe("Tests crtc properties with legacy commit");
 	igt_subtest("crtc-properties-legacy")
 		crtc_properties(&display, false);
-- 
2.42.0
