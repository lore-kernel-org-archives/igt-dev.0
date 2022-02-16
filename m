Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2510E7E1
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 18:30:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Feb 2022 20:30:36 +0200
Message-Id: <20220216183036.9281-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Make the crc test
 faster
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use a smaler mode for the crc test so we don't have to draw
so many pixels. Gives me 50% more flips on a tgl with 4k screen.

Hopefully this help out those poor shard-skls a bit.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 0c3821339680..2b36eb354cce 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -471,19 +471,28 @@ static unsigned int clock_ms(void)
 	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
 }
 
-static void paint_fb(int fd, struct igt_fb *fb, uint32_t color)
+static void paint_fb(int fd, struct igt_fb *fb, uint32_t color, int height)
 {
 	igt_draw_rect_fb(fd, NULL, 0, fb,
 			 gem_has_mappable_ggtt(fd) ?
 			 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
-			 0, 0, 1, fb->height, color);
+			 0, 0, 1, height, color);
 }
 
 static void test_crc(data_t *data)
 {
 	unsigned int frame = 0;
 	unsigned int start;
-	int ret;
+	int ret, height;
+	drmModeModeInfoPtr mode;
+
+	/* make things faster by using a smallish mode */
+	mode = &data->connector->modes[0];
+	if (mode->hdisplay > 1024 && mode->vdisplay > 786)
+		mode = igt_std_1024_mode_get(data->refresh_rate);
+	else
+		mode = igt_memdup(mode, sizeof(*mode));
+	height = mode->vdisplay;
 
 	data->flip_count = 0;
 	data->frame_count = 0;
@@ -493,7 +502,8 @@ static void test_crc(data_t *data)
 	igt_draw_fill_fb(data->drm_fd, &data->bufs[!frame], 0xff0000ff);
 
 	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
-			     &data->connector->connector_id, 1, &data->connector->modes[0]);
+			     &data->connector->connector_id, 1, mode);
+	free(mode);
 	igt_assert_eq(ret, 0);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
@@ -509,7 +519,7 @@ static void test_crc(data_t *data)
 
 	while (clock_ms() - start < 2000) {
 		/* fill the next fb with the expected color */
-		paint_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
+		paint_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff, height);
 
 		data->flip_pending = true;
 		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
@@ -520,7 +530,7 @@ static void test_crc(data_t *data)
 
 		/* clobber the previous fb which should no longer be scanned out */
 		frame = !frame;
-		paint_fb(data->drm_fd, &data->bufs[frame], rand());
+		paint_fb(data->drm_fd, &data->bufs[frame], rand(), height);
 	}
 
 	igt_pipe_crc_stop(data->pipe_crc);
-- 
2.34.1
