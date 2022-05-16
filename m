Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77270112A80
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 08:56:28 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 13:54:26 +0530
Message-Id: <20220516082426.9852-2-karthik.b.s@intel.com>
In-Reply-To: <20220516082426.9852-1-karthik.b.s@intel.com>
References: <20220516082426.9852-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/2] tests/kms_async_flips: Test Cleanup
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

-Convert tests to dynamic
-Replace drm function call with existing library functions
-igt_display_reset() before all subtests

v2: -Move conversion to dynamic subtest to a separate patch (Bhanu)
    -Use igt_output_get_mode to get default mode (Bhanu)
    -Add 'is_atomic' check before igt_display_commit2 (Bhanu)

v3: -Move test_init after the checks to skip subtest (Bhanu)
    -Update the logic to call make_fb() in test_init()

v4: -Move patch after patch to convert tests to dynamic to avoid code
     duplicaton. (Bhanu)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 116 ++++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 57 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index e307f0d9..02d021e1 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -50,7 +50,6 @@ typedef struct {
 	uint32_t refresh_rate;
 	struct igt_fb bufs[4];
 	igt_display_t display;
-	drmModeConnectorPtr connector;
 	igt_output_t *output;
 	unsigned long flip_timestamp_us;
 	double flip_interval;
@@ -63,22 +62,6 @@ typedef struct {
 	enum pipe pipe;
 } data_t;
 
-static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
-{
-	igt_output_t *output;
-	drmModeConnectorPtr ret = NULL;
-
-	for_each_connected_output(&data->display, output) {
-		if (output->config.connector->count_modes > 0) {
-			ret = output->config.connector;
-			break;
-		}
-	}
-
-	igt_assert_f(ret, "Connector NOT found\n");
-	return ret;
-}
-
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -132,14 +115,10 @@ static void wait_flip_event(data_t *data)
 }
 
 static void make_fb(data_t *data, struct igt_fb *fb,
-		    drmModeConnectorPtr connector, int index)
+		    uint32_t width, uint32_t height, int index)
 {
-	uint32_t width, height;
 	int rec_width;
 
-	width = connector->modes[0].hdisplay;
-	height = connector->modes[0].vdisplay;
-
 	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
 
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -157,6 +136,45 @@ static void require_monotonic_timestamp(int fd)
 		      "Monotonic timestamps not supported\n");
 }
 
+static void test_init(data_t *data)
+{
+	int i;
+	uint32_t width, height;
+	igt_plane_t *plane;
+	static uint32_t prev_output_id;
+	drmModeModeInfo *mode;
+
+	igt_display_reset(&data->display);
+	igt_display_commit(&data->display);
+
+	mode = igt_output_get_mode(data->output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	data->crtc_id = data->display.pipes[data->pipe].crtc_id;
+	data->refresh_rate = mode->vrefresh;
+
+	igt_output_set_pipe(data->output, data->pipe);
+	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+
+	if (prev_output_id != data->output->id) {
+		prev_output_id = data->output->id;
+
+		if (data->bufs[0].fb_id) {
+			for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
+				igt_remove_fb(data->drm_fd, &data->bufs[i]);
+	}
+
+		for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
+			make_fb(data, &data->bufs[i], width, height, i);
+	}
+
+	igt_plane_set_fb(plane, &data->bufs[0]);
+	igt_plane_set_size(plane, width, height);
+
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
 static void test_async_flip(data_t *data, bool alternate_sync_async)
 {
 	int ret, frame;
@@ -164,6 +182,7 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
 	struct timeval start, end, diff;
 
 	require_monotonic_timestamp(data->drm_fd);
+	test_init(data);
 
 	gettimeofday(&start, NULL);
 	frame = 1;
@@ -257,6 +276,7 @@ static void test_timestamp(data_t *data)
 	int ret;
 
 	require_monotonic_timestamp(data->drm_fd);
+	test_init(data);
 
 	/*
 	 * In older platforms(<= gen10), async address update bit is double buffered.
@@ -315,6 +335,8 @@ static void test_cursor(data_t *data)
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
+	test_init(data);
+
 	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
 
@@ -349,13 +371,17 @@ static void test_invalid(data_t *data)
 	int ret;
 	uint32_t width, height;
 	struct igt_fb fb;
+	drmModeModeInfo *mode;
 
-	width = data->connector->modes[0].hdisplay;
-	height = data->connector->modes[0].vdisplay;
+	mode = igt_output_get_mode(data->output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
 
 	igt_require(igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
 					       I915_FORMAT_MOD_Y_TILED));
 
+	test_init(data);
+
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 		      I915_FORMAT_MOD_Y_TILED, &fb);
 
@@ -370,33 +396,6 @@ static void test_invalid(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
-static void test_init(data_t *data)
-{
-	drmModeResPtr res;
-	int i, ret;
-
-	res = drmModeGetResources(data->drm_fd);
-	igt_assert(res);
-
-	kmstest_unset_all_crtcs(data->drm_fd, res);
-
-	data->connector = find_connector_for_modeset(data);
-	data->crtc_id = kmstest_find_crtc_for_connector(data->drm_fd,
-							res, data->connector, 0);
-
-	data->refresh_rate = data->connector->modes[0].vrefresh;
-
-	for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
-		make_fb(data, &data->bufs[i], data->connector, i);
-
-	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[0].fb_id, 0, 0,
-			     &data->connector->connector_id, 1, &data->connector->modes[0]);
-
-	igt_assert(ret == 0);
-
-	drmModeFreeResources(res);
-}
-
 static void queue_vblank(data_t *data)
 {
 	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
@@ -493,11 +492,14 @@ static void test_crc(data_t *data)
 	data->frame_count = 0;
 	data->flip_pending = false;
 
+	test_init(data);
+
 	igt_draw_fill_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
 	igt_draw_fill_fb(data->drm_fd, &data->bufs[!frame], 0xff0000ff);
 
 	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
-			     &data->connector->connector_id, 1, &data->connector->modes[0]);
+			     &data->output->config.connector->connector_id, 1,
+			     &data->output->config.connector->modes[0]);
 	igt_assert_eq(ret, 0);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
@@ -548,7 +550,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 }
 
 static const char help_str[] =
-"  --e \t\tRun the extended tests\n";
+	"  --e \t\tRun the extended tests\n";
 
 static data_t data;
 
@@ -570,9 +572,6 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
 	igt_subtest_group {
-		igt_fixture
-			test_init(&data);
-
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
 			for_each_pipe(&data.display, pipe) {
@@ -675,6 +674,9 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_fixture
+	igt_fixture {
+		igt_display_reset(&data.display);
+		igt_display_commit(&data.display);
 		igt_display_fini(&data.display);
+	}
 }
-- 
2.22.0
