Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007DE6E054
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2020 13:59:09 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id q22so5326157pgk.2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2020 06:59:09 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 22 Jun 2020 16:59:00 +0300
Message-Id: <20200622135900.3227-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_tiling: remove cut'n'paste
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
List-ID: <igt-dev@lists.freedesktop.org>

convert all tests to be created in nested for-loops which will create tests
for all flip changes.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_flip_tiling.c | 186 +++++++---------------------------------
 1 file changed, 33 insertions(+), 153 deletions(-)

diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index fb79de15..329e0bda 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -153,6 +153,16 @@ igt_output_t *output;
 
 igt_main
 {
+	const struct {
+		uint64_t tiling_format;
+		const char*    name;
+	} tiling_formats[] = {
+		{ LOCAL_DRM_FORMAT_MOD_NONE, "linear"},
+		{ LOCAL_I915_FORMAT_MOD_X_TILED, "x-tiled"},
+		{ LOCAL_I915_FORMAT_MOD_Y_TILED, "y-tiled"},
+		{ LOCAL_I915_FORMAT_MOD_Yf_TILED, "yf-tiled"},
+	};
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.gen = intel_gen(intel_get_drm_devid(data.drm_fd));
@@ -165,160 +175,30 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	/*
-	 * Test that a page flip from a tiled buffer to a linear one works
-	 * correctly. First, it sets the crtc with the linear buffer and
-	 * generates a reference crc for the pipe. Then, the crtc is set with
-	 * the tiled one and page flip to the linear one issued. A new crc is
-	 * generated and compared to the reference one.
-	 */
-
-	igt_subtest_f("flip-changes-tiling") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
-				       LOCAL_DRM_FORMAT_MOD_NONE };
-		enum pipe pipe;
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	igt_subtest_f("flip-changes-tiling-Y") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
-				       LOCAL_DRM_FORMAT_MOD_NONE };
-		enum pipe pipe;
-
-		igt_require_fb_modifiers(data.drm_fd);
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		igt_require(data.gen >= 9);
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	igt_subtest_f("flip-changes-tiling-Yf") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
-				       LOCAL_DRM_FORMAT_MOD_NONE };
-		enum pipe pipe;
-
-		igt_require_fb_modifiers(data.drm_fd);
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		igt_require(data.gen >= 9);
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	/*
-	 * Test that a page flip from a tiled buffer to another tiled one works
-	 * correctly. First, it sets the crtc with the tiled buffer and
-	 * generates a reference crc for the pipe. Then a page flip to second
-	 * tiled buffer is issued. A new crc is generated and compared to the
-	 * reference one.
-	 */
-
-	igt_subtest_f("flip-X-tiled") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
-				       LOCAL_I915_FORMAT_MOD_X_TILED };
-		enum pipe pipe;
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	igt_subtest_f("flip-Y-tiled") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
-				       LOCAL_I915_FORMAT_MOD_Y_TILED };
-		enum pipe pipe;
-
-		igt_require_fb_modifiers(data.drm_fd);
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		igt_require(data.gen >= 9);
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	igt_subtest_f("flip-Yf-tiled") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
-				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
-		enum pipe pipe;
-
-		igt_require_fb_modifiers(data.drm_fd);
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		igt_require(data.gen >= 9);
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	/*
-	 * Test that a page flip from a linear buffer to a tiled one works
-	 * correctly. First, it sets the crtc with the linear buffer and
-	 * generates a reference crc for the pipe. Then a page flip to a tiled
-	 * buffer is issued. A new crc is generated and compared to the
-	 * reference one.
-	 */
-
-	igt_subtest_f("flip-to-X-tiled") {
-		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
-				       LOCAL_I915_FORMAT_MOD_X_TILED };
-		enum pipe pipe;
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	igt_subtest_f("flip-to-Y-tiled") {
-		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
-				       LOCAL_I915_FORMAT_MOD_Y_TILED };
-		enum pipe pipe;
-
-		igt_require_fb_modifiers(data.drm_fd);
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		igt_require(data.gen >= 9);
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
-	}
-
-	igt_subtest_f("flip-to-Yf-tiled") {
-		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
-				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
-		enum pipe pipe;
-
-		igt_require_fb_modifiers(data.drm_fd);
-
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
-
-		igt_require(data.gen >= 9);
+	for (int i = 0; i < ARRAY_SIZE(tiling_formats); i++) {
+		for (int j = 0; j < ARRAY_SIZE(tiling_formats); j++) {
+
+			igt_describe_f("Check using crcs flipping from %s fb to %s fb works correctly.\n",
+				     tiling_formats[i].name, tiling_formats[j].name);
+			igt_subtest_f("flip-%s-to-%s", tiling_formats[i].name, tiling_formats[j].name) {
+				uint64_t tiling[2] = { tiling_formats[i].tiling_format,
+						       tiling_formats[j].tiling_format };
+				enum pipe pipe;
+
+				for (int c = 0; c < ARRAY_SIZE(tiling); c++) {
+					if (tiling[c] != LOCAL_DRM_FORMAT_MOD_NONE &&
+					    tiling[c] != LOCAL_I915_FORMAT_MOD_X_TILED) {
+						igt_require(data.gen >= 9);
+						igt_require_fb_modifiers(data.drm_fd);
+					}
+					igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[c]));
+				}
+
+				for_each_pipe_with_valid_output(&data.display, pipe, output)
+					test_flip_tiling(&data, pipe, output, tiling);
+			}
+		}
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
-			test_flip_tiling(&data, pipe, output, tiling);
 	}
 
 	igt_fixture {
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
