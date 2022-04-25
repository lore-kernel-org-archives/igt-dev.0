Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5D10E2EA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 10:44:57 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Apr 2022 15:42:19 +0530
Message-Id: <20220425101220.24874-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] tests/kms_async_flips: Test Cleanup
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 221 +++++++++++++++++++++++++++-------------
 1 file changed, 151 insertions(+), 70 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5e11cd43..1b5af111 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -50,7 +50,7 @@ typedef struct {
 	uint32_t refresh_rate;
 	struct igt_fb bufs[4];
 	igt_display_t display;
-	drmModeConnectorPtr connector;
+	igt_output_t *output;
 	unsigned long flip_timestamp_us;
 	double flip_interval;
 	igt_pipe_crc_t *pipe_crc;
@@ -58,24 +58,9 @@ typedef struct {
 	int flip_count;
 	int frame_count;
 	bool flip_pending;
+	bool extended;
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
@@ -129,14 +114,10 @@ static void wait_flip_event(data_t *data)
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
@@ -154,6 +135,61 @@ static void require_monotonic_timestamp(int fd)
 		      "Monotonic timestamps not supported\n");
 }
 
+static enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if (igt_pipe_connector_valid(pipe, output))
+			return pipe;
+	}
+
+	igt_assert_f(false, "No pipe found for output %s\n",
+		     igt_output_name(output));
+}
+
+static void test_init(data_t *data)
+{
+	int i;
+	uint32_t width, height;
+	enum pipe pipe;
+	igt_plane_t *plane;
+	static uint32_t prev_output_id;
+	drmModeModeInfo *mode;
+
+	igt_display_reset(&data->display);
+	igt_display_commit(&data->display);
+
+	pipe = get_pipe_for_output(&data->display, data->output);
+
+	mode = igt_output_get_mode(data->output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	data->crtc_id = data->display.pipes[pipe].crtc_id;
+	data->refresh_rate = mode->vrefresh;
+
+	igt_output_set_pipe(data->output, pipe);
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
@@ -161,6 +197,7 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
 	struct timeval start, end, diff;
 
 	require_monotonic_timestamp(data->drm_fd);
+	test_init(data);
 
 	gettimeofday(&start, NULL);
 	frame = 1;
@@ -254,6 +291,7 @@ static void test_timestamp(data_t *data)
 	int ret;
 
 	require_monotonic_timestamp(data->drm_fd);
+	test_init(data);
 
 	/*
 	 * In older platforms(<= gen10), async address update bit is double buffered.
@@ -312,6 +350,8 @@ static void test_cursor(data_t *data)
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
+	test_init(data);
+
 	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
 
@@ -346,13 +386,17 @@ static void test_invalid(data_t *data)
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
 
@@ -367,33 +411,6 @@ static void test_invalid(data_t *data)
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
@@ -490,11 +507,14 @@ static void test_crc(data_t *data)
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
@@ -531,10 +551,28 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'e':
+		data->extended = true;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char help_str[] =
+	"  --e \t\tRun the extended tests\n";
+
+static data_t data;
+
+igt_main_args("e", NULL, help_str, opt_handler, &data)
 {
-	static data_t data;
 	int i;
+	igt_output_t *output;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -548,32 +586,72 @@ igt_main
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
 	igt_subtest_group {
-		igt_fixture
-			test_init(&data);
-
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
-		igt_subtest("async-flip-with-page-flip-events")
-			test_async_flip(&data, false);
+		igt_subtest("async-flip-with-page-flip-events") {
+			for_each_connected_output(&data.display, output) {
+				data.output = output;
+				test_async_flip(&data, false);
+
+				if (!data.extended)
+					break;
+			}
+		}
 
 		igt_describe("Alternate between sync and async flips");
-		igt_subtest("alternate-sync-async-flip")
-			test_async_flip(&data, true);
+		igt_subtest("alternate-sync-async-flip") {
+			for_each_connected_output(&data.display, output) {
+				data.output = output;
+				test_async_flip(&data, true);
+
+				if (!data.extended)
+					break;
+			}
+		}
+
 
 		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
-		igt_subtest("test-time-stamp")
-			test_timestamp(&data);
+		igt_subtest("test-time-stamp") {
+			for_each_connected_output(&data.display, output) {
+				data.output = output;
+				test_timestamp(&data);
+
+				if (!data.extended)
+					break;
+			}
+		}
 
 		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
-		igt_subtest("test-cursor")
-			test_cursor(&data);
+		igt_subtest("test-cursor") {
+			for_each_connected_output(&data.display, output) {
+				data.output = output;
+				test_cursor(&data);
+
+				if (!data.extended)
+					break;
+			}
+		}
 
 		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
-		igt_subtest("invalid-async-flip")
-			test_invalid(&data);
+		igt_subtest("invalid-async-flip") {
+			for_each_connected_output(&data.display, output) {
+				data.output = output;
+				test_invalid(&data);
+
+				if (!data.extended)
+					break;
+			}
+		}
 
 		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
-		igt_subtest("crc")
-			test_crc(&data);
+		igt_subtest("crc") {
+			for_each_connected_output(&data.display, output) {
+				data.output = output;
+				test_crc(&data);
+
+				if (!data.extended)
+					break;
+			}
+		}
 
 		igt_fixture {
 			for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
@@ -581,6 +659,9 @@ igt_main
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
