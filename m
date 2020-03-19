Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BA86EA4C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 18:03:31 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z22so2405870lfd.8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 11:03:31 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 19 Mar 2020 20:03:22 +0200
Message-Id: <20200319180322.5451-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add max HW stride length
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Test maximum HW stride lenghts. On Intel HW from gen5 up to
Gen10 maximum HW stride lenght is 32K. On Gen11 when using
64bpp formats strides can reach up to 64k. These test try
exact maximum HW strides so gtt remapping will not come in
play.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_big_fb.c | 86 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index eb144da9..cf858a60 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -48,6 +48,9 @@ typedef struct {
 	igt_render_copyfunc_t render_copy;
 	drm_intel_bufmgr *bufmgr;
 	struct intel_batchbuffer *batch;
+	bool max_hw_stride_test;
+	int hw_stride;
+	int max_hw_fb_width;
 } data_t;
 
 static void init_buf(data_t *data,
@@ -163,9 +166,6 @@ static void max_fb_size(data_t *data, int *width, int *height,
 	uint64_t size;
 	int i = 0;
 
-	*width = data->max_fb_width;
-	*height = data->max_fb_height;
-
 	/* max fence stride is only 8k bytes on gen3 */
 	if (intel_gen(data->devid) < 4 &&
 	    format == DRM_FORMAT_XRGB8888)
@@ -419,6 +419,14 @@ static bool test_pipe(data_t *data)
 
 static void test_scanout(data_t *data)
 {
+	if (data->max_hw_stride_test) {
+		data->big_fb_width = data->max_hw_fb_width;
+		data->big_fb_height = data->max_hw_fb_width;
+	} else {
+		data->big_fb_width = data->max_fb_width;
+		data->big_fb_height = data->max_fb_height;
+	}
+
 	max_fb_size(data, &data->big_fb_width, &data->big_fb_height,
 		    data->format, data->modifier);
 
@@ -570,6 +578,28 @@ test_addfb(data_t *data)
 	gem_close(data->drm_fd, bo);
 }
 
+/*
+ * TODO: adapt i9xx_plane_max_stride(..) here from intel_display.c
+ * in kernel sources to support older gen for max hw stride length
+ * testing.
+ */
+static void
+set_max_hw_stride(data_t *data)
+{
+	if (intel_gen(data->devid) < 11) {
+		data->hw_stride = 32768;
+	} else {
+		switch (data->modifier) {
+		case DRM_FORMAT_MOD_LINEAR:
+			data->hw_stride = 65536-64;
+			break;
+		default:
+			data->hw_stride = 65536;
+			break;
+		}
+	}
+}
+
 static data_t data;
 
 static const struct {
@@ -649,6 +679,8 @@ igt_main
 
 		data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
 		data.batch = intel_batchbuffer_alloc(data.bufmgr, data.devid);
+
+		data.max_hw_stride_test = false;
 	}
 
 	/*
@@ -704,6 +736,54 @@ igt_main
 		}
 	}
 
+	data.max_hw_stride_test = true;
+	/*
+	 * Run max hw stride length tests on gen5 and later.
+	 */
+	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+		data.modifier = modifiers[i].modifier;
+
+		set_max_hw_stride(&data);
+
+		for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+			/*
+			 * try only those formats which can show full lenght. 8K is
+			 * the magic maximum pixels in Intel HW. Here 32K is used
+			 * to have CI test results consistent for all platforms,
+			 * 32K is smallest number possbily coming to hw_stride
+			 * from above if{}else{}..
+			 */
+			if (32768 / (formats[j].bpp >> 3) > 8192)
+				continue;
+
+			data.format = formats[j].format;
+
+			for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
+				data.rotation = rotations[k].rotation;
+				/*
+				 * Seems any format currently coming here will not support
+				 * 90/270 rotations so skip those rotations.
+				 */
+				if (data.rotation&(IGT_ROTATION_90|IGT_ROTATION_270))
+					continue;
+
+				igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d", modifiers[i].name,
+					      formats[j].bpp, rotations[k].angle) {
+					igt_require(intel_gen(intel_get_drm_devid(data.drm_fd)) >=5);
+					data.max_hw_fb_width = data.hw_stride / (formats[j].bpp >> 3);
+					igt_require(data.format == DRM_FORMAT_C8 ||
+						    igt_fb_supported_format(data.format));
+					igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
+					test_scanout(&data);
+				}
+			}
+
+			igt_fixture
+				cleanup_fb(&data);
+		}
+	}
+	data.max_hw_stride_test = false;
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
