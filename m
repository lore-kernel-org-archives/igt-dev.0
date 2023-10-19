Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F027C10E567
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 21:23:28 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 19 Oct 2023 17:22:58 -0400
Message-ID: <20231019212301.245282-6-harry.wentland@amd.com>
In-Reply-To: <20231019212301.245282-1-harry.wentland@amd.com>
References: <20231019212301.245282-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH v2 5/8] tests/kms_properties: Add colorop
 properties test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria
 Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Christopher
 Braga <quic_cbraga@quicinc.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Aleix Pol <aleixpol@kde.org>,
 Alexander Goins <agoins@nvidia.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Sima <daniel@ffwll.ch>, Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 tests/kms_properties.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 3284366228c0..45744c64a54f 100644
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
 
+static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+{
+	struct igt_fb fb;
+	igt_plane_t *plane;
+	int i;
+
+	prepare_pipe(display, pipe, output, &fb);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
+			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+
+		for (i = 0; i < display->n_colorops; i++) {
+			igt_colorop_t *global_colorop = &display->colorops[i];
+			drmModeColorop *drm_colorop = global_colorop->drm_colorop;
+
+			igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
+				kmstest_pipe_name(pipe), plane->index, drm_colorop->colorop_id, kmstest_plane_type_name(plane->type), output->name);
+
+			if (drm_colorop->plane_id != plane->drm_plane->plane_id) {
+				printf("bla: colorop %d is on plane %d, not on plane %d\n",
+					drm_colorop->colorop_id,
+					drm_colorop->plane_id,
+					plane->drm_plane->plane_id);
+				continue;
+			}
+			test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, drm_colorop->colorop_id, true);
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
 
+static void colorop_properties(igt_display_t *display)
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
+			run_colorop_property_tests(display, pipe, output);
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
@@ -800,6 +863,10 @@ igt_main
 	igt_subtest("plane-properties-atomic")
 		plane_properties(&display, true);
 
+	igt_describe("Tests colorop properties with atomic commit");
+	igt_subtest("colorop-properties-atomic")
+		colorop_properties(&display);
+
 	igt_describe("Tests crtc properties with legacy commit");
 	igt_subtest("crtc-properties-legacy")
 		crtc_properties(&display, false);
-- 
2.42.0
