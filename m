Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C3E6E187
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2020 16:06:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D66010051A4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2020 16:06:27 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 26 Aug 2020 12:06:21 -0400
Message-Id: <20200826160621.92623-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_plane: Generate reference CRCs
 for partial coverage too
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

From: Lyude Paul <lyude@redhat.com>

There's been a TODO sitting in the kms_plane test suite for a while now
as a placeholder for actually generating a reference CRC for
plane-position-hole tests. This means we have never actually been
verifying whether or not partially covering our hole with a hardware
plane works displays properly, and have just simply been checking that
the frame CRC doesn't change when we're not changing the display output.
On nouveau at least, this has been causing us to pass these tests
even when we don't correctly program our hardware plane's framebuffer.

So, get rid of that TODO and implement this by converting
convert_fb_for_mode__position() to a generic convert_fb_for_mode()
function that allows us to create a colored FB, either with or without a
series of 64x64 rectangles, and use that in test_grab_crc() to generate
reference CRCs for the plane-position-hole tests. Additionally, we move
around all of the test flags into a single enumerator, and make sure
none of them have overlapping bits so we can correctly tell from
test_grab_crc() whether or not our reference CRC should include
rectangles (otherwise, we'll accidentally add rectangles in our
reference frame for the plane panning tests).

Then, we finally flip the TEST_POSITION_FULLY_COVERED enum to
TEST_POSITION_PARTIALLY_COVERED, so tests which don't explicitly specify
partial positioning don't get it in their reference fbs.

v2:
* Rebase
v3:
* Just use igt_create_color_fb() in test_grab_crc() when we have no
  rectangles to draw

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_plane.c | 169 ++++++++++++++++++++++++++--------------------
 1 file changed, 96 insertions(+), 73 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 430210d8..e42c71cd 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -44,6 +44,11 @@ typedef struct {
 	float blue;
 } color_t;
 
+typedef struct {
+	int x, y;
+	color_t color;
+} rectangle_t;
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -71,9 +76,52 @@ static void test_fini(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 }
 
+enum {
+	TEST_POSITION_PARTIALLY_COVERED = 1 << 0,
+	TEST_DPMS                       = 1 << 1,
+	TEST_PANNING_TOP_LEFT           = 1 << 2,
+	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
+	TEST_SUSPEND_RESUME             = 1 << 4,
+};
+
+/*
+ * create a colored fb, possibly with a series of 64x64 colored rectangles (used
+ * for position tests)
+ */
+static void
+create_fb_for_mode(data_t *data, drmModeModeInfo *mode,
+		   color_t *fb_color,
+		   const rectangle_t *rects, int rect_cnt,
+		   struct igt_fb *fb /* out */)
+{
+	unsigned int fb_id;
+	cairo_t *cr;
+
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      fb);
+	igt_assert_fd(fb_id);
+
+	cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
+			fb_color->red, fb_color->green, fb_color->blue);
+	for (int i = 0; i < rect_cnt; i++) {
+		const rectangle_t *rect = &rects[i];
+		igt_paint_color(cr,
+				rect->x, rect->y, 64, 64,
+				rect->color.red,
+				rect->color.green,
+				rect->color.blue);
+	}
+
+	igt_put_cairo_ctx(cr);
+}
+
 static void
 test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
-	      color_t *fb_color, igt_crc_t *crc /* out */)
+	      color_t *fb_color, unsigned int flags, igt_crc_t *crc /* out */)
 {
 	struct igt_fb fb;
 	drmModeModeInfo *mode;
@@ -86,13 +134,24 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	primary = igt_output_get_plane(output, 0);
 
 	mode = igt_output_get_mode(output);
-	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
-			    fb_color->red, fb_color->green, fb_color->blue,
-			    &fb);
-	igt_plane_set_fb(primary, &fb);
+	if (flags & TEST_POSITION_PARTIALLY_COVERED) {
+		static const rectangle_t rects[] = {
+			{ .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }},
+			{ .x = 132, .y = 132, .color = { 0.0, 1.0, 0.0 }},
+		};
+
+		create_fb_for_mode(data, mode, fb_color,
+				   rects, ARRAY_SIZE(rects), &fb);
+	} else {
+		igt_assert_fd(igt_create_color_fb(data->drm_fd,
+						  mode->hdisplay, mode->vdisplay,
+						  DRM_FORMAT_XRGB8888,
+						  LOCAL_DRM_FORMAT_MOD_NONE,
+						  fb_color->red, fb_color->green, fb_color->blue,
+						  &fb));
+	}
 
+	igt_plane_set_fb(primary, &fb);
 	ret = igt_display_try_commit2(&data->display, COMMIT_LEGACY);
 	igt_skip_on(ret != 0);
 
@@ -104,19 +163,24 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, &fb);
 
 	crc_str = igt_crc_to_string(crc);
-	igt_debug("CRC for a (%.02f,%.02f,%.02f) fb: %s\n", fb_color->red,
-		  fb_color->green, fb_color->blue, crc_str);
+	igt_debug("CRC for a %s covered (%.02f,%.02f,%.02f) fb: %s\n",
+		  flags & TEST_POSITION_PARTIALLY_COVERED ? "partially" : "fully",
+		  fb_color->red, fb_color->green, fb_color->blue,
+		  crc_str);
 	free(crc_str);
 }
 
 /*
  * Plane position test.
- *   - We start by grabbing a reference CRC of a full green fb being scanned
- *     out on the primary plane
+ *   - For testing positions that fully cover our hole, we start by grabbing a
+ *     reference CRC of a full green fb being scanned out on the primary plane.
+ *     For testing positions that only partially cover our hole, we instead use
+ *     a full green fb with a partially covered black rectangle.
  *   - Then we scannout 2 planes:
  *      - the primary plane uses a green fb with a black rectangle
  *      - a plane, on top of the primary plane, with a green fb that is set-up
- *        to cover the black rectangle of the primary plane fb
+ *        to fully or partially cover the black rectangle of the primary plane
+ *        fb
  *     The resulting CRC should be identical to the reference CRC
  */
 
@@ -125,38 +189,6 @@ typedef struct {
 	igt_crc_t reference_crc;
 } test_position_t;
 
-/*
- * create a green fb with a black rectangle at (rect_x,rect_y) and of size
- * (rect_w,rect_h)
- */
-static void
-create_fb_for_mode__position(data_t *data, drmModeModeInfo *mode,
-			     double rect_x, double rect_y,
-			     double rect_w, double rect_h,
-			     struct igt_fb *fb /* out */)
-{
-	unsigned int fb_id;
-	cairo_t *cr;
-
-	fb_id = igt_create_fb(data->drm_fd,
-				  mode->hdisplay, mode->vdisplay,
-				  DRM_FORMAT_XRGB8888,
-				  LOCAL_DRM_FORMAT_MOD_NONE,
-				  fb);
-	igt_assert(fb_id);
-
-	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
-			    0.0, 1.0, 0.0);
-	igt_paint_color(cr, rect_x, rect_y, rect_w, rect_h, 0.0, 0.0, 0.0);
-	igt_put_cairo_ctx(cr);
-}
-
-enum {
-	TEST_POSITION_FULLY_COVERED = 1 << 0,
-	TEST_DPMS = 1 << 1,
-};
-
 static void
 test_plane_position_with_output(data_t *data,
 				enum pipe pipe,
@@ -165,6 +197,7 @@ test_plane_position_with_output(data_t *data,
 				igt_crc_t *reference_crc,
 				unsigned int flags)
 {
+	rectangle_t rect = { .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }};
 	igt_plane_t *primary, *sprite;
 	struct igt_fb primary_fb, sprite_fb;
 	drmModeModeInfo *mode;
@@ -179,26 +212,26 @@ test_plane_position_with_output(data_t *data,
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	sprite = igt_output_get_plane(output, plane);
 
-	create_fb_for_mode__position(data, mode, 100, 100, 64, 64,
-				     &primary_fb);
+	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
 
 	igt_create_color_fb(data->drm_fd,
-				64, 64, /* width, height */
-				DRM_FORMAT_XRGB8888,
-				LOCAL_DRM_FORMAT_MOD_NONE,
-				0.0, 1.0, 0.0,
-				&sprite_fb);
+			    64, 64, /* width, height */
+			    DRM_FORMAT_XRGB8888,
+			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    0.0, 1.0, 0.0,
+			    &sprite_fb);
 	igt_plane_set_fb(sprite, &sprite_fb);
 
-	if (flags & TEST_POSITION_FULLY_COVERED)
-		igt_plane_set_position(sprite, 100, 100);
-	else
+	if (flags & TEST_POSITION_PARTIALLY_COVERED)
 		igt_plane_set_position(sprite, 132, 132);
+	else
+		igt_plane_set_position(sprite, 100, 100);
 
 	igt_display_commit(&data->display);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+	igt_assert_crc_equal(reference_crc, &crc);
 
 	if (flags & TEST_DPMS) {
 		kmstest_set_connector_dpms(data->drm_fd,
@@ -211,12 +244,6 @@ test_plane_position_with_output(data_t *data,
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc2);
 
-	if (flags & TEST_POSITION_FULLY_COVERED)
-		igt_assert_crc_equal(reference_crc, &crc);
-	else {
-		;/* FIXME: missing reference CRCs */
-	}
-
 	igt_assert_crc_equal(&crc, &crc2);
 
 	igt_plane_set_fb(primary, NULL);
@@ -237,8 +264,7 @@ test_plane_position(data_t *data, enum pipe pipe, unsigned int flags)
 	igt_require(output);
 
 	test_init(data, pipe);
-
-	test_grab_crc(data, output, pipe, &green, &reference_crc);
+	test_grab_crc(data, output, pipe, &green, flags, &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
 		test_plane_position_with_output(data, pipe, plane,
@@ -287,12 +313,6 @@ create_fb_for_mode__panning(data_t *data, drmModeModeInfo *mode,
 	igt_put_cairo_ctx(cr);
 }
 
-enum {
-	TEST_PANNING_TOP_LEFT	  = 1 << 0,
-	TEST_PANNING_BOTTOM_RIGHT = 1 << 1,
-	TEST_SUSPEND_RESUME	  = 1 << 2,
-};
-
 static void
 test_plane_panning_with_output(data_t *data,
 			       enum pipe pipe,
@@ -355,8 +375,8 @@ test_plane_panning(data_t *data, enum pipe pipe, unsigned int flags)
 
 	test_init(data, pipe);
 
-	test_grab_crc(data, output, pipe, &red, &red_crc);
-	test_grab_crc(data, output, pipe, &blue, &blue_crc);
+	test_grab_crc(data, output, pipe, &red, flags, &red_crc);
+	test_grab_crc(data, output, pipe, &blue, flags, &blue_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
 		test_plane_panning_with_output(data, pipe, plane, output,
@@ -961,15 +981,18 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 	data->crop = 0;
 	igt_subtest_f("plane-position-covered-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, TEST_POSITION_FULLY_COVERED);
+		test_plane_position(data, pipe, 0);
 
 	igt_subtest_f("plane-position-hole-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, 0);
+		test_plane_position(data, pipe,
+				    TEST_POSITION_PARTIALLY_COVERED);
 
 	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, TEST_DPMS);
+		test_plane_position(data, pipe,
+				    TEST_POSITION_PARTIALLY_COVERED |
+				    TEST_DPMS);
 
 	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
