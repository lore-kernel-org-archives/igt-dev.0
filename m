Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6D76E1B8
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Sep 2021 12:26:35 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 24 Sep 2021 15:26:31 +0300
Message-Id: <20210924122631.17746-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210304155018.12745-1-ville.syrjala@linux.intel.com>
References: <20210304155018.12745-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_async_flips: Add CRC test to
 make sure the correct fb is being scanned out
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use CRC to confirm that the old fb is no longer being scanned
out after the async flip completes. We do this by immediately
rendering garbage into the old fb after receiving the flip
event. Should fail if someone is improperly using mailbox style
flips while claiming to do async flips.

v2: Only fill a single column of pixels instead of the whole
    fb to allow the test to do more async flips per frame for
    a more stressful experience

Reviewed-by: Karthik B S <karthik.b.s@intel.com> #v1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 145 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index ecc62680f2c0..064e5022601b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -52,6 +52,11 @@ typedef struct {
 	drmModeConnectorPtr connector;
 	unsigned long flip_timestamp_us;
 	double flip_interval;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc;
+	int flip_count;
+	int frame_count;
+	bool flip_pending;
 } data_t;
 
 static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
@@ -379,6 +384,142 @@ static void test_init(data_t *data)
 	drmModeFreeResources(res);
 }
 
+static void queue_vblank(data_t *data)
+{
+	drmVBlank wait_vbl = {
+		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
+			kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
+		.request.sequence = 1,
+		.request.signal = (long)data,
+	};
+
+	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl) == 0);
+}
+
+static void vblank_handler_crc(int fd_, unsigned int sequence, unsigned int tv_sec,
+			       unsigned int tv_usec, void *_data)
+{
+	data_t *data = _data;
+	igt_crc_t crc;
+
+	data->frame_count++;
+
+	igt_pipe_crc_get_single(data->pipe_crc, &crc);
+	igt_assert_crc_equal(&data->ref_crc, &crc);
+
+	/* check again next vblank */
+	queue_vblank(data);
+}
+
+static void flip_handler_crc(int fd_, unsigned int sequence, unsigned int tv_sec,
+			     unsigned int tv_usec, void *_data)
+{
+	data_t *data = _data;
+
+	data->flip_pending = false;
+	data->flip_count++;
+}
+
+static void wait_events_crc(data_t *data)
+{
+	drmEventContext evctx = {
+		.version = 2,
+		.vblank_handler = vblank_handler_crc,
+		.page_flip_handler = flip_handler_crc,
+	};
+
+	while (data->flip_pending) {
+		struct pollfd pfd = {
+			.fd = data->drm_fd,
+			.events = POLLIN,
+		};
+		int ret;
+
+		ret = poll(&pfd, 1, 2000);
+
+		switch (ret) {
+		case 0:
+			igt_assert_f(0, "Flip Timeout\n");
+			break;
+		case 1:
+			ret = drmHandleEvent(data->drm_fd, &evctx);
+			igt_assert(ret == 0);
+			break;
+		default:
+			/* unexpected */
+			igt_assert(0);
+		}
+	}
+}
+
+static unsigned int clock_ms(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
+}
+
+static void paint_fb(int fd, struct igt_fb *fb, uint32_t color)
+{
+	igt_draw_rect_fb(fd, NULL, 0, fb,
+			 gem_has_mappable_ggtt(fd) ?
+			 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
+			 0, 0, 1, fb->height, color);
+}
+
+static void test_crc(data_t *data)
+{
+	unsigned int frame = 0;
+	unsigned int start;
+	int ret;
+
+	data->flip_count = 0;
+	data->frame_count = 0;
+	data->flip_pending = false;
+
+	igt_draw_fill_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
+	igt_draw_fill_fb(data->drm_fd, &data->bufs[!frame], 0xff0000ff);
+
+	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
+			     &data->connector->connector_id, 1, &data->connector->modes[0]);
+	igt_assert_eq(ret, 0);
+
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
+					  kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
+					  INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	igt_pipe_crc_start(data->pipe_crc);
+	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
+
+	queue_vblank(data);
+
+	start = clock_ms();
+
+	while (clock_ms() - start < 2000) {
+		/* fill the next fb with the expected color */
+		paint_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
+
+		data->flip_pending = true;
+		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
+				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+		igt_assert_eq(ret, 0);
+
+		wait_events_crc(data);
+
+		/* clobber the previous fb which should no longer be scanned out */
+		frame = !frame;
+		paint_fb(data->drm_fd, &data->bufs[frame], rand());
+	}
+
+	igt_pipe_crc_stop(data->pipe_crc);
+	igt_pipe_crc_free(data->pipe_crc);
+
+	/* make sure we got at a reasonable number of async flips done */
+	igt_assert_lt(data->frame_count * 2, data->flip_count);
+}
+
 igt_main
 {
 	static data_t data;
@@ -419,6 +560,10 @@ igt_main
 		igt_subtest("invalid-async-flip")
 			test_invalid(&data);
 
+		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
+		igt_subtest("crc")
+			test_crc(&data);
+
 		igt_fixture {
 			for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
 				igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.32.0
