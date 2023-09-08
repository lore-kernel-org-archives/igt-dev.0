Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81F110E8EF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 15:04:07 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 11:03:12 -0400
Message-ID: <20230908150315.75977-5-harry.wentland@amd.com>
In-Reply-To: <20230908150315.75977-1-harry.wentland@amd.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 4/7] tests/kms_properties: Add colorop
 properties test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>, Victoria
 Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 tests/kms_properties.c | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2fe8dfa66bcf..60883b2503ca 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -183,6 +183,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
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
@@ -228,6 +261,35 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
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
@@ -761,6 +823,10 @@ igt_main
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
