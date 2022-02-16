Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2B089CA8
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 23:03:59 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Feb 2022 15:03:42 -0800
Message-ID: <1645052622-23764-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] Add an api to support the CTA range
 color square video test pattern as explained in section 3.2.5.3 of the DP
 CTS specification. This pattern is required for supporting the CTA range
 for RGB formats.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Maitreyee Rao <maitreye@codeaurora.org>, petri.latvala@intel.com,
 quic_khsieh@quicinc.com, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Maitreyee Rao <maitreye@codeaurora.org>

Also rename the existing api igt_fill_cts_framebuffer to
igt_fill_cts_color_ramp_framebuffer to higlight the
pattern type.

changes in v2:
	- removed redundant pointers
	- fixed overall formatting issues
	- Fixed author name

Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 lib/igt_fb.c                | 128 +++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_fb.h                |   5 +-
 tools/intel_dp_compliance.c |   5 +-
 tools/msm_dp_compliance.c   |  48 +++++++++++++----
 4 files changed, 171 insertions(+), 15 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 1530b96..94a93f1 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1461,7 +1461,131 @@ void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
 }
 
 /**
- * igt_fill_cts_framebuffer:
+ *
+ * igt_fill_cts_color_square_framebuffer:
+ * @pixmap: handle to mapped buffer
+ * @video_width: required width for pattern
+ * @video_height: required height for pattern
+ * @bitdepth: required bitdepth fot pattern
+ * @alpha: required alpha for the pattern
+ *
+ * This function draws a color square pattern for given width and height
+ * as per the specifications mentioned in section 3.2.5.3 of DP CTS spec.
+ */
+int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap,
+		uint32_t video_width, uint32_t video_height,
+		uint32_t bitdepth, int alpha)
+{
+	uint32_t pmax = 0;
+	uint32_t pmin = 0;
+	int tile_width = 64;
+	int tile_height = 64;
+	int reverse = 0;
+
+	switch (bitdepth) {
+	case 8:
+		pmax  = 235;
+		pmin  = 16;
+		break;
+	case 10:
+		pmax  = 940;
+		pmin  = 64;
+		break;
+	}
+
+	/*
+	 * According to the requirement stated in the 3.2.5.3  DP CTS spec
+	 * the required pattern for color square should look like below
+	 *
+	 *   white | yellow | cyan    | green | magenta | red    | blue  | black | white | ... | ..
+	 *   -------------------------------------------------------------------------------
+	 *   blue  | red    | magenta | green | cyan    | yellow | white | black | blue  | ... | ..
+	 *   -------------------------------------------------------------------------------
+	 *   white | yellow | cyan    | green | magenta | red    | blue  | black | white | ... | ..
+	 *   -------------------------------------------------------------------------------
+	 *   blue  | red    | magenta | green | cyan    | yellow | white | black | blue  | ... | ..
+	 *   --------------------------------------------------------------------------------
+	 *	  .    |   .      |	  .	|  .	|   .     |	.  |   .   |   .   |   .   |  .
+	 *
+	 *	  .    |   .      |	  .	|  .	|   .	  |	.  |   .   |   .   |   .   |  .
+	 *
+	 *
+	 */
+
+	uint32_t colors[8][3] = {
+		/* White Color */
+		{pmax, pmax, pmax},
+		/* Yellow Color */
+		{pmax, pmax, pmin},
+		/* Cyan Color */
+		{pmin, pmax, pmax},
+		/* Green Color */
+		{pmin, pmax, pmin},
+		/* Magenta Color */
+		{pmax, pmin, pmax},
+		/* Red Color */
+		{pmax, pmin, pmin},
+		/* Blue Color */
+		{pmin, pmin, pmax},
+		/* Black Color */
+		{pmin, pmin, pmin},
+	};
+
+	uint32_t reverse_colors[8][3] = {
+		/* Blue Color */
+		{pmin, pmin, pmax},
+		/* Red Color */
+		{pmax, pmin, pmin},
+		/* Magenta Color */
+		{pmax, pmin, pmax},
+		/* Green Color */
+		{pmin, pmax, pmin},
+		/* Cyan Color */
+		{pmin, pmax, pmax},
+		/* Yellow Color */
+		{pmax, pmax, pmin},
+		/* White Color */
+		{pmax, pmax, pmax},
+		/* Black Color */
+		{pmin, pmin, pmin},
+	};
+
+	for (uint32_t height = 0; height < video_height; height++) {
+		uint32_t color = 0;
+		uint8_t *temp = pixmap;
+		uint8_t **buf = &temp;
+		uint32_t (*clr_arr)[3];
+
+		temp += (4 * video_width * height);
+
+		for (uint32_t width = 0; width < video_width; width++) {
+
+			if (reverse == 0)
+				clr_arr = colors;
+			else
+				clr_arr = reverse_colors;
+
+			/* using BGRA8888 format */
+			*(*buf)++ = (((uint8_t)clr_arr[color][2]) & 0xFF);
+			*(*buf)++ = (((uint8_t)clr_arr[color][1]) & 0xFF);
+			*(*buf)++ = (((uint8_t)clr_arr[color][0]) & 0xFF);
+			*(*buf)++ = ((uint8_t)alpha & 0xFF);
+
+			if (((width + 1) % tile_width) == 0)
+				color = (color + 1) % 8;
+
+		}
+		if (((height + 1) % tile_height) == 0) {
+			if (reverse == 0)
+				reverse = 1;
+			else
+				reverse = 0;
+		}
+	}
+	return 0;
+}
+/**
+ * igt_fill_cts_color_ramp_framebuffer:
  * @pixmap: handle to the mapped buffer
  * @video_width: required width for the CTS pattern
  * @video_height: required height for the CTS pattern
@@ -1469,7 +1593,7 @@ void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
  * @alpha: required alpha for the CTS pattern
  * This functions draws the CTS test pattern for a given width, height.
  */
-int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
+int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
 		uint32_t video_height, uint32_t bitdepth, int alpha)
 {
 	uint32_t tile_height, tile_width;
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index c61d9e7..623a8ca 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -216,8 +216,11 @@ bool igt_format_is_fp16(uint32_t drm_format);
 int igt_format_plane_bpp(uint32_t drm_format, int plane);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
-int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
+int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
 		uint32_t video_height, uint32_t bitdepth, int alpha);
+int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap,
+		uint32_t video_width, uint32_t video_height,
+		uint32_t bitdepth, int alpha);
 
 int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
 const char *igt_fb_modifier_name(uint64_t modifier);
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 39218c3..2e20d7f 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -452,6 +452,7 @@ static int set_test_mode(struct connector *dp_conn)
 	bool found_std = false, found_fs = false;
 	uint32_t alpha;
 	drmModeConnector *c = dp_conn->connector;
+	uint32_t *pixmap;
 
 	/* Ignore any disconnected devices */
 	if (c->connection != DRM_MODE_CONNECTED) {
@@ -532,7 +533,9 @@ static int set_test_mode(struct connector *dp_conn)
 			return ret;
 		}
 
-		ret = igt_fill_cts_framebuffer(dp_conn->test_pattern.pixmap,
+		pixmap = dp_conn->test_pattern.pixmap;
+
+		ret = igt_fill_cts_color_ramp_framebuffer(pixmap,
 				dp_conn->test_pattern.hdisplay,
 				dp_conn->test_pattern.vdisplay,
 				dp_conn->test_pattern.bitdepth,
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 5e491c8..6941d38 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -143,6 +143,10 @@
 /* DRM definitions - must be kept in sync with the DRM header */
 #define DP_TEST_LINK_VIDEO_PATTERN	(1 << 1)
 
+
+/* DP CTS PATTERN TYPE */
+#define PATTERN_COLOR_RAMP 1
+#define PATTERN_COLOR_SQUARE 3
 /* Global file pointers for the sysfs files */
 FILE *test_active_fp, *test_data_fp, *test_type_fp;
 
@@ -153,6 +157,7 @@ uint16_t hdisplay;
 uint16_t vdisplay;
 uint8_t bitdepth;
 
+uint16_t pattern;
 drmModeRes *resources;
 int drm_fd, modes, gen;
 uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
@@ -172,6 +177,7 @@ struct test_video_pattern {
 	uint16_t hdisplay;
 	uint16_t vdisplay;
 	uint8_t bitdepth;
+	uint16_t pattern;
 	uint32_t fb;
 	uint32_t size;
 	struct igt_fb fb_pattern;
@@ -244,15 +250,15 @@ static unsigned long get_test_type(void)
 static void get_test_videopattern_data(void)
 {
 	int count = 0;
-	uint16_t video_pattern_value[3];
-	char video_pattern_attribute[15];
+	uint16_t video_pattern_value[5];
+	char video_pattern_attribute[20];
 	int ret;
 
 	if (!test_data_fp)
 		fprintf(stderr, "Invalid test_data file\n");
 
 	rewind(test_data_fp);
-	while (!feof(test_data_fp) && count < 3) {
+	while (!feof(test_data_fp) && count < 4) {
 		ret = fscanf(test_data_fp, "%s %u\n", video_pattern_attribute,
 		       (unsigned int *)&video_pattern_value[count++]);
 		if (ret < 2) {
@@ -264,10 +270,11 @@ static void get_test_videopattern_data(void)
 	hdisplay = video_pattern_value[0];
 	vdisplay = video_pattern_value[1];
 	bitdepth = video_pattern_value[2];
+	pattern = video_pattern_value[3];
 	igt_info("Hdisplay = %d\n", hdisplay);
 	igt_info("Vdisplay = %d\n", vdisplay);
 	igt_info("BitDepth = %u\n", bitdepth);
-
+	igt_info("pattern = %d\n", pattern);
 }
 
 static int process_test_request(int test_type)
@@ -325,6 +332,7 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 
 	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
 	memset(dp_conn->test_pattern.pixmap, 0, dp_conn->test_pattern.size);
+	igt_info("size: %d\n", dp_conn->test_pattern.size);
 	return 0;
 
 }
@@ -334,6 +342,7 @@ static int set_test_mode(struct connector *dp_conn)
 	int ret = 0;
 	int i;
 	drmModeConnector *c = dp_conn->connector;
+	uint32_t *pixmap;
 
 	/* Ignore any disconnected devices */
 	if (c->connection != DRM_MODE_CONNECTED) {
@@ -374,6 +383,8 @@ static int set_test_mode(struct connector *dp_conn)
 		dp_conn->test_pattern.hdisplay = hdisplay;
 		dp_conn->test_pattern.vdisplay = vdisplay;
 		dp_conn->test_pattern.bitdepth = bitdepth;
+		dp_conn->test_pattern.pattern = pattern;
+		igt_info("Pattern :%d\n", dp_conn->test_pattern.pattern);
 
 		ret = setup_video_pattern_framebuffer(dp_conn);
 		if (ret) {
@@ -382,15 +393,30 @@ static int set_test_mode(struct connector *dp_conn)
 			return ret;
 		}
 
-		ret = igt_fill_cts_framebuffer(dp_conn->test_pattern.pixmap,
+		pixmap = dp_conn->test_pattern.pixmap;
+
+		if (dp_conn->test_pattern.pattern == PATTERN_COLOR_RAMP) {
+			ret = igt_fill_cts_color_ramp_framebuffer(pixmap,
 				dp_conn->test_pattern.hdisplay,
 				dp_conn->test_pattern.vdisplay,
-				dp_conn->test_pattern.bitdepth,
-				0);
-		if (ret) {
-			igt_warn("Filling framebuffer for connector %u failed (%d)\n",
-				 c->connector_id, ret);
-			return ret;
+				dp_conn->test_pattern.bitdepth, 0);
+			if (ret) {
+				igt_warn("Filling framebuffer for connector %u failed (%d)\n",
+					c->connector_id, ret);
+				return ret;
+			}
+		}
+
+		if (dp_conn->test_pattern.pattern == PATTERN_COLOR_SQUARE) {
+			ret = igt_fill_cts_color_square_framebuffer(pixmap,
+					dp_conn->test_pattern.hdisplay,
+					dp_conn->test_pattern.vdisplay,
+					dp_conn->test_pattern.bitdepth, 0);
+			if (ret) {
+				igt_warn("Filling framebuffer for connector %u failed (%d)\n",
+					c->connector_id, ret);
+				return ret;
+			}
 		}
 		/* unmapping the buffer previously mapped during setup */
 		munmap(dp_conn->test_pattern.pixmap,
-- 
2.7.4
