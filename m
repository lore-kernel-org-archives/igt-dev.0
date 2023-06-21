Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EFD10E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:11 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:26 +0800
Message-ID: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/8] tests/amdgpu/amd_freesync_video_mode:
 Adjust indents and spacing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adjust some code indents and spacing.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 539 ++++++++++++-------------
 1 file changed, 266 insertions(+), 273 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 579d24436..fdcf1375f 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -25,11 +25,11 @@
 #include <fcntl.h>
 #include <signal.h>
 
-#define NSECS_PER_SEC		(1000000000ull)
-#define TEST_DURATION_NS	(10 * NSECS_PER_SEC)
+#define NSECS_PER_SEC (1000000000ull)
+#define TEST_DURATION_NS (10 * NSECS_PER_SEC)
 
-#define BYTES_PER_PIXEL         4
-#define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
+#define BYTES_PER_PIXEL 4
+#define MK_COLOR(r, g, b) ((0 << 24) | (r << 16) | (g << 8) | b)
 
 /*
  * The Display Core of amdgpu will add a set of modes derived from the
@@ -46,43 +46,44 @@
 IGT_TEST_DESCRIPTION("This tests transition between normal and FreeSync-Video"
 		     "modes and measures the FPS to ensure vblank events are"
 		     "happening at the expected rate.");
+
 typedef struct range {
 	unsigned int min;
 	unsigned int max;
 } range_t;
 
 typedef struct data {
-	int		drm_fd;
-	igt_display_t	display;
+	int drm_fd;
+	igt_display_t display;
 	igt_plane_t	*primary;
-	igt_fb_t	fbs[2];
-	uint32_t	*fb_mem[2];
-	int		front;
-	bool		fb_initialized;
-	range_t		range;
+	igt_fb_t fbs[2];
+	uint32_t *fb_mem[2];
+	int front;
+	bool fb_initialized;
+	range_t range;
 
 	drmModeConnector *connector;
 	drmModeModeInfo *modes;
-	int		count_modes;
+	int count_modes;
 
-	uint32_t	preferred_mode_index;
-        uint32_t	base_mode_index;
-	uint32_t	hdisplay;
-	uint32_t	vdisplay;
+	uint32_t preferred_mode_index;
+	uint32_t base_mode_index;
+	uint32_t hdisplay;
+	uint32_t vdisplay;
 } data_t;
 
 struct fsv_sprite {
-        uint32_t        w;
-	uint32_t	h;
-        uint32_t        *data;
+	uint32_t w;
+	uint32_t h;
+	uint32_t *data;
 };
 static struct fsv_sprite cicle_sprite;
 
 enum {
-        FSV_PREFERRED_MODE,
-        FSV_BASE_MODE,
-        FSV_FREESYNC_VIDEO_MODE,
-        FSV_NON_FREESYNC_VIDEO_MODE,
+	FSV_PREFERRED_MODE,
+	FSV_BASE_MODE,
+	FSV_FREESYNC_VIDEO_MODE,
+	FSV_NON_FREESYNC_VIDEO_MODE,
 };
 
 enum {
@@ -93,10 +94,10 @@ enum {
 };
 
 enum {
-	SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE ,
-	SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE ,
-	SCENE_NON_FSV_MODE_TO_FSV_MODE ,
-	SCENE_BASE_MODE_TO_CUSTUM_MODE ,
+	SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE,
+	SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE,
+	SCENE_NON_FSV_MODE_TO_FSV_MODE,
+	SCENE_BASE_MODE_TO_CUSTUM_MODE,
 	SCENE_NON_FSV_MODE_TO_NON_FSV_MODE,
 
 	SCENE_COUNT,
@@ -157,74 +158,70 @@ static void fbmem_draw_rect(
 		uint32_t h,
 		uint32_t color)
 {
-        uint32_t offset = y * stride + x;
-
-        for (uint32_t j = 0; j < h; j++) {
-                for (uint32_t i = 0; i < w; i++) {
-                        fbmem[offset + i] = color;
-                }
-                offset += stride;
-        }
+	uint32_t offset = y * stride + x;
+
+	for (uint32_t j = 0; j < h; j++) {
+		for (uint32_t i = 0; i < w; i++) {
+			fbmem[offset + i] = color;
+		}
+		offset += stride;
+	}
 }
 
 static void fbmem_draw_smpte_pattern(uint32_t *fbmem, int width, int height)
 {
 	uint32_t x, y;
-        uint32_t colors_top[] = {
-                MK_COLOR(192, 192, 192), /* grey */
-                MK_COLOR(192, 192, 0),   /* yellow */
-                MK_COLOR(0, 192, 192),   /* cyan */
-                MK_COLOR(0, 192, 0),     /* green */
-                MK_COLOR(192, 0, 192),   /* magenta */
-                MK_COLOR(192, 0, 0),     /* red */
-                MK_COLOR(0, 0, 192),     /* blue */
-        };
-        uint32_t colors_middle[] = {
-                MK_COLOR(0, 0, 192),     /* blue */
-                MK_COLOR(19, 19, 19),    /* black */
-                MK_COLOR(192, 0, 192),   /* magenta */
-                MK_COLOR(19, 19, 19),    /* black */
-                MK_COLOR(0, 192, 192),   /* cyan */
-                MK_COLOR(19, 19, 19),    /* black */
-                MK_COLOR(192, 192, 192), /* grey */
-        };
-        uint32_t colors_bottom[] = {
-                MK_COLOR(0, 33, 76),     /* in-phase */
-                MK_COLOR(255, 255, 255), /* super white */
-                MK_COLOR(50, 0, 106),    /* quadrature */
-                MK_COLOR(19, 19, 19),    /* black */
-                MK_COLOR(9, 9, 9),       /* 3.5% */
-                MK_COLOR(19, 19, 19),    /* 7.5% */
-                MK_COLOR(29, 29, 29),    /* 11.5% */
-                MK_COLOR(19, 19, 19),    /* black */
-        };
-
-        for (y = 0; y < height * 6 / 9; ++y) {
-                for (x = 0; x < width; ++x)
-                        fbmem[x] =
-                                colors_top[x * 7 / width];
-                fbmem += width;
-        }
-
-        for (; y < height * 7 / 9; ++y) {
-                for (x = 0; x < width; ++x)
-                        fbmem[x] =
-                                colors_middle[x * 7 / width];
-                fbmem += width;
-        }
-
-        for (; y < height; ++y) {
-                for (x = 0; x < width * 5 / 7; ++x)
-                        fbmem[x] =
-                                colors_bottom[x * 4 / (width * 5 / 7)];
-                for (; x < width * 6 / 7; ++x)
-                        fbmem[x] =
-                                colors_bottom[(x - width * 5 / 7) * 3
-                                              / (width / 7) + 4];
-                for (; x < width; ++x)
-                        fbmem[x] = colors_bottom[7];
-                fbmem += width;
-        }
+	uint32_t colors_top[] = {
+		MK_COLOR(192, 192, 192), /* grey */
+		MK_COLOR(192, 192, 0),   /* yellow */
+		MK_COLOR(0, 192, 192),   /* cyan */
+		MK_COLOR(0, 192, 0),     /* green */
+		MK_COLOR(192, 0, 192),   /* magenta */
+		MK_COLOR(192, 0, 0),     /* red */
+		MK_COLOR(0, 0, 192),     /* blue */
+	};
+	uint32_t colors_middle[] = {
+		MK_COLOR(0, 0, 192),     /* blue */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(192, 0, 192),   /* magenta */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(0, 192, 192),   /* cyan */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(192, 192, 192), /* grey */
+	};
+	uint32_t colors_bottom[] = {
+		MK_COLOR(0, 33, 76),     /* in-phase */
+		MK_COLOR(255, 255, 255), /* super white */
+		MK_COLOR(50, 0, 106),    /* quadrature */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(9, 9, 9),       /* 3.5% */
+		MK_COLOR(19, 19, 19),    /* 7.5% */
+		MK_COLOR(29, 29, 29),    /* 11.5% */
+		MK_COLOR(19, 19, 19),    /* black */
+	};
+
+	for (y = 0; y < height * 6 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			fbmem[x] = colors_top[x * 7 / width];
+		fbmem += width;
+	}
+
+	for (; y < height * 7 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			fbmem[x] = colors_middle[x * 7 / width];
+		fbmem += width;
+	}
+
+	for (; y < height; ++y) {
+		for (x = 0; x < width * 5 / 7; ++x)
+			fbmem[x] = colors_bottom[x * 4 / (width * 5 / 7)];
+		for (; x < width * 6 / 7; ++x)
+			fbmem[x] = colors_bottom[(x - width * 5 / 7) * 3
+						/ (width / 7) + 4];
+		for (; x < width; ++x)
+			fbmem[x] = colors_bottom[7];
+		fbmem += width;
+	}
 }
 
 static void sprite_init(
@@ -232,13 +229,13 @@ static void sprite_init(
 		uint32_t w,
 		uint32_t h)
 {
-        igt_assert(sprite);
+	igt_assert(sprite);
 
-        sprite->data = (uint32_t *)malloc(w * h * BYTES_PER_PIXEL);
-        igt_assert(sprite->data);
+	sprite->data = (uint32_t *) malloc(w * h * BYTES_PER_PIXEL);
+	igt_assert(sprite->data);
 
-        sprite->w = w;
-        sprite->h = h;
+	sprite->w = w;
+	sprite->h = h;
 }
 
 static void sprite_paste(
@@ -248,14 +245,14 @@ static void sprite_paste(
 		uint32_t x,
 		uint32_t y)
 {
-        uint32_t fb_offset = y * fb_stride + x;
-        uint32_t sprite_offset = 0;
-
-        for (int j = 0; j < sprite->h; j++) {
-                memcpy(fbmem + fb_offset, sprite->data + sprite_offset, sprite->w * 4);
-                sprite_offset += sprite->w;
-                fb_offset += fb_stride;
-        }
+	uint32_t fb_offset = y * fb_stride + x;
+	uint32_t sprite_offset = 0;
+
+	for (int j = 0; j < sprite->h; j++) {
+		memcpy(fbmem + fb_offset, sprite->data + sprite_offset, sprite->w * 4);
+		sprite_offset += sprite->w;
+		fb_offset += fb_stride;
+	}
 }
 
 static void sprite_draw_rect(
@@ -266,16 +263,15 @@ static void sprite_draw_rect(
 		uint32_t h,
 		uint32_t color)
 {
-        uint32_t offset = y * sprite->w + x;
-        uint32_t *addr = (uint32_t *)sprite->data;
-
-        for (uint32_t j = 0; j < h; j++) {
-                addr = (uint32_t *)(sprite->data + offset);
-                for (uint32_t i = 0; i < w; i++) {
-                        addr[i] = color;
-                }
-                offset += sprite->w;
-        }
+	uint32_t offset = y * sprite->w + x;
+	uint32_t *addr = (uint32_t *)sprite->data;
+
+	for (uint32_t j = 0; j < h; j++) {
+		addr = (uint32_t *) (sprite->data + offset);
+		for (uint32_t i = 0; i < w; i++)
+			addr[i] = color;
+		offset += sprite->w;
+	}
 }
 
 /* drawing horizontal line in the sprite */
@@ -287,9 +283,9 @@ static void sprite_draw_hline(
 		uint32_t color)
 {
 	uint32_t offset = y1 * sprite->w;
-        for (int x = x1 ; x < x2; x++) {
-                sprite->data[offset + x] = color;
-        }
+	for (int x = x1 ; x < x2; x++) {
+		sprite->data[offset + x] = color;
+	}
 }
 
 /* drawing filled circle with Bresenham's algorithm */
@@ -300,71 +296,70 @@ static void sprite_draw_circle(
 		uint32_t radius,
 		uint32_t color)
 {
-        int offsetx = 0, offsety = radius, d = radius -1;
-
-        while (offsety >= offsetx) {
-                sprite_draw_hline(sprite, x - offsety, y + offsetx,
-                                x + offsety, color);
-                sprite_draw_hline(sprite, x - offsetx, y + offsety,
-                                x + offsetx, color);
-                sprite_draw_hline(sprite, x - offsetx, y - offsety,
-                                x + offsetx, color);
-                sprite_draw_hline(sprite, x - offsety, y - offsetx,
-                                x + offsety, color);
-
-                if (d >= 2 * offsetx) {
-                        d -= 2 * offsetx + 1;
-                        offsetx += 1;
-                } else if (d < 2 * (radius - offsety)) {
-                        d += 2 * offsety - 1;
-                        offsety -= 1;
-                } else {
-                        d += 2 * (offsety - offsetx - 1);
-                        offsety -= 1;
-                        offsetx += 1;
-                }
-        }
+	int offsetx = 0, offsety = radius, d = radius -1;
+
+	while (offsety >= offsetx) {
+		sprite_draw_hline(sprite, x - offsety, y + offsetx,
+						x + offsety, color);
+		sprite_draw_hline(sprite, x - offsetx, y + offsety,
+						x + offsetx, color);
+		sprite_draw_hline(sprite, x - offsetx, y - offsety,
+						x + offsetx, color);
+		sprite_draw_hline(sprite, x - offsety, y - offsetx,
+						x + offsety, color);
+
+		if (d >= 2 * offsetx) {
+			d -= 2 * offsetx + 1;
+			offsetx += 1;
+		} else if (d < 2 * (radius - offsety)) {
+			d += 2 * offsety - 1;
+			offsety -= 1;
+		} else {
+			d += 2 * (offsety - offsetx - 1);
+			offsety -= 1;
+			offsetx += 1;
+		}
+	}
 }
 
 static void sprite_anim_init(void)
 {
-        memset(&cicle_sprite, 0, sizeof(cicle_sprite));
-        sprite_init(&cicle_sprite, 100, 100);
-
-        sprite_draw_rect(&cicle_sprite, 0, 0, 100, 100, MK_COLOR(128, 128, 128));
+	memset(&cicle_sprite, 0, sizeof(cicle_sprite));
+	sprite_init(&cicle_sprite, 100, 100);
+	sprite_draw_rect(&cicle_sprite, 0, 0, 100, 100, MK_COLOR(128, 128, 128));
 	/* draw filled circle with center (50, 50), radius 50. */
-        sprite_draw_circle(&cicle_sprite, 50, 50, 50, MK_COLOR(0, 0, 255));
+	sprite_draw_circle(&cicle_sprite, 50, 50, 50, MK_COLOR(0, 0, 255));
 }
 
 static void sprite_anim(data_t *data, uint32_t *addr)
 {
-        struct timeval tv1, tv2, tv_delta;
-        uint64_t frame_ns = get_time_ns();
-        double now = frame_ns / (double)NSECS_PER_SEC;
+	struct timeval tv1, tv2, tv_delta;
+	uint64_t frame_ns = get_time_ns();
+	double now = frame_ns / (double)NSECS_PER_SEC;
 
-        gettimeofday(&tv1, NULL);
+	gettimeofday(&tv1, NULL);
 
-        fbmem_draw_rect(addr, data->hdisplay, 0, 0,
-			data->hdisplay, data->vdisplay, MK_COLOR(128, 128, 128));
+	fbmem_draw_rect(addr, data->hdisplay, 0, 0,
+		data->hdisplay, data->vdisplay, MK_COLOR(128, 128, 128));
 	/* red rectangle for checking tearing effect*/
-        if (data->front) {
-                fbmem_draw_rect(addr, data->hdisplay, 0, 0,
+	if (data->front) {
+		fbmem_draw_rect(addr, data->hdisplay, 0, 0,
 			30, data->vdisplay, MK_COLOR(191, 0, 0));
-        }
+	}
 
 	/* draw 16 filled circles */
-        for (int i = 0; i < 16; ++i) {
-                double tv = now + i * 0.25;
-                float x, y;
-                x = data->hdisplay - 10.0f - 118.0f * i - 100.0f;
-                y = data->vdisplay * 0.5f + cos(tv) * data->vdisplay * 0.35;
-                sprite_paste(addr, data->hdisplay, &cicle_sprite, (uint32_t)x, (uint32_t)y);
-        }
-
-        gettimeofday(&tv2, NULL);
-        timersub(&tv2, &tv1, &tv_delta);
-
-        igt_debug("time of drawing: %ld ms\n", tv_delta.tv_usec / 1000);
+	for (int i = 0; i < 16; ++i) {
+		double tv = now + i * 0.25;
+		float x, y;
+		x = data->hdisplay - 10.0f - 118.0f * i - 100.0f;
+		y = data->vdisplay * 0.5f + cos(tv) * (double) data->vdisplay * 0.35f;
+		sprite_paste(addr, data->hdisplay, &cicle_sprite, (uint32_t)x, (uint32_t)y);
+	}
+
+	gettimeofday(&tv2, NULL);
+	timersub(&tv2, &tv1, &tv_delta);
+
+	igt_debug("time of drawing: %ld ms\n", tv_delta.tv_usec / 1000);
 }
 
 /*----------------------------------------------------------------------------*/
@@ -376,79 +371,79 @@ static void sprite_anim(data_t *data, uint32_t *addr)
 */
 static bool is_freesync_video_mode(data_t *data, drmModeModeInfo *mode)
 {
-        drmModeModeInfo *base_mode = &data->modes[data->base_mode_index];
-        uint32_t bm_clock = base_mode->clock;
+	drmModeModeInfo *base_mode = &data->modes[data->base_mode_index];
+	uint32_t bm_clock = base_mode->clock;
 
-        if (    mode->hdisplay == data->hdisplay &&
-                mode->vdisplay == data->vdisplay &&
-                mode->clock == bm_clock &&
+	if (mode->hdisplay == data->hdisplay &&
+		mode->vdisplay == data->vdisplay &&
+		mode->clock == bm_clock &&
 		mode->type & DRM_MODE_TYPE_DRIVER) {
-                return true;
-        }
+			return true;
+	}
 
-        return false;
+	return false;
 }
 
 static drmModeModeInfo* select_mode(
-        data_t *data,
-        uint32_t mode_type,
-        int refresh_rate)
+		data_t *data,
+		uint32_t mode_type,
+		int refresh_rate)
 {
 	int i;
-        int index;
-        drmModeModeInfo *mode = NULL;
+	int index;
+	drmModeModeInfo *mode = NULL;
 	igt_debug("select_mode: type=%d, refresh_rate=%d\n", mode_type, refresh_rate);
 
-        switch (mode_type) {
-        case FSV_BASE_MODE:
-                index = data->base_mode_index;
-                mode = &data->modes[index];
-                break;
-
-        case FSV_PREFERRED_MODE:
-                index = data->preferred_mode_index;
-                mode = &data->modes[index];
-                break;
-
-        case FSV_FREESYNC_VIDEO_MODE:
-                for (i = 0; i < data->count_modes; i++) {
-                        mode = &data->modes[i];
-                        if (    mode->vrefresh == refresh_rate &&
-                                is_freesync_video_mode(data, mode)) {
-                                break;
-                        }
-                }
+	switch (mode_type) {
+	case FSV_BASE_MODE:
+		index = data->base_mode_index;
+		mode = &data->modes[index];
+		break;
+
+	case FSV_PREFERRED_MODE:
+		index = data->preferred_mode_index;
+		mode = &data->modes[index];
+		break;
+
+	case FSV_FREESYNC_VIDEO_MODE:
+		for (i = 0; i < data->count_modes; i++) {
+			mode = &data->modes[i];
+			if (mode->vrefresh == refresh_rate &&
+				is_freesync_video_mode(data, mode)) {
+				break;
+				}
+			}
 		if (i == data->count_modes)
 			mode = NULL;
-                break;
-
-        case FSV_NON_FREESYNC_VIDEO_MODE:
-                for (i = 0; i < data->count_modes; i++) {
-                        mode = &data->modes[i];
-                        if (    mode->vrefresh == refresh_rate &&
-                                !is_freesync_video_mode(data, mode)) {
-                                break;
-                        }
-                }
+		break;
+
+	case FSV_NON_FREESYNC_VIDEO_MODE:
+		for (i = 0; i < data->count_modes; i++) {
+			mode = &data->modes[i];
+			if (mode->vrefresh == refresh_rate &&
+				!is_freesync_video_mode(data, mode)) {
+				break;
+			}
+		}
 		if (i == data->count_modes)
 			mode = NULL;
-                break;
+		break;
 
-        default:
-                igt_assert("Cannot find mode with specified rate and type.");
-                break;
-        }
+	default:
+		igt_assert("Cannot find mode with specified rate and type.");
+		break;
+	}
 
 	if (mode) {
 		igt_info("selected mode:\n");
 		kmstest_dump_mode(mode);
 	}
 
-        return mode;
+	return mode;
 }
 
 static int prepare_custom_mode(
-        data_t *data,
+	data_t *data,
 	drmModeModeInfo *custom_mode,
 	uint32_t refresh_rate)
 {
@@ -473,14 +468,13 @@ static int prepare_custom_mode(
 		return -1;
 	}
 
-	num = (unsigned long long)base_mode->clock * 1000 * 1000;
-	den = refresh_rate * 1000 * (unsigned long long)base_mode->htotal;
+	num = (unsigned long long) base_mode->clock * 1000 * 1000;
+	den = refresh_rate * 1000 * (unsigned long long) base_mode->htotal;
 	target_vtotal = num / den;
 	target_vtotal_diff = target_vtotal - base_mode->vtotal;
 	igt_debug("num=%lu, den=%lu, " \
-                  "target_vtotal=%lu, target_vtotal_diff=%lu, base_mode->vtotal=%d\n",
-		  num, den, target_vtotal, target_vtotal_diff, base_mode->vtotal
-		);
+				"target_vtotal=%lu, target_vtotal_diff=%lu, base_mode->vtotal=%d\n",
+				num, den, target_vtotal, target_vtotal_diff, base_mode->vtotal);
 
 	/* Check for illegal modes */
 	if (base_mode->vsync_start + target_vtotal_diff < base_mode->vdisplay ||
@@ -489,9 +483,9 @@ static int prepare_custom_mode(
 		return -1;
 
 	*custom_mode = *base_mode;
-	custom_mode->vtotal += (uint16_t)target_vtotal_diff;
-	custom_mode->vsync_start += (uint16_t)target_vtotal_diff;
-	custom_mode->vsync_end += (uint16_t)target_vtotal_diff;
+	custom_mode->vtotal += (uint16_t) target_vtotal_diff;
+	custom_mode->vsync_start += (uint16_t) target_vtotal_diff;
+	custom_mode->vsync_end += (uint16_t) target_vtotal_diff;
 	custom_mode->type &= ~DRM_MODE_TYPE_PREFERRED;
 	custom_mode->type |= DRM_MODE_TYPE_DRIVER;
 	custom_mode->vrefresh = refresh_rate;
@@ -688,7 +682,7 @@ static void init_data(data_t *data, igt_output_t *output) {
 
 	connector = data->connector = output->config.connector;
 	data->count_modes = connector->count_modes;
-	data->modes = (drmModeModeInfo *)malloc(sizeof(drmModeModeInfo) * data->count_modes);
+	data->modes = (drmModeModeInfo *) malloc(sizeof(drmModeModeInfo) * data->count_modes);
 
 	for (i = 0; i < data->count_modes; i++) {
 		data->modes[i] = connector->modes[i];
@@ -699,36 +693,35 @@ static void init_data(data_t *data, igt_output_t *output) {
 	}
 
 	/* searching the preferred mode */
-        for (i = 0; i < connector->count_modes; i++) {
-                drmModeModeInfo *mode = &connector->modes[i];
-
-                if (mode->type & DRM_MODE_TYPE_PREFERRED) {
-                        data->preferred_mode_index = i;
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+			data->preferred_mode_index = i;
 			data->hdisplay = mode->hdisplay;
 			data->vdisplay = mode->vdisplay;
 			pm_hdisplay = preferred_mode->hdisplay;
 			pm_vdisplay = preferred_mode->vdisplay;
 			break;
-                }
-        }
-
-        /* searching the base mode; */
-        for (i = 0; i < connector->count_modes; i++) {
-                drmModeModeInfo *mode = &connector->modes[i];
-                if (mode->hdisplay == pm_hdisplay && mode->vdisplay == pm_vdisplay) {
-                        if (mode->clock > max_clk) {
-                                max_clk = mode->clock;
-                                data->base_mode_index = i;
-                        }
-                }
-        }
-        igt_info("preferred=%d, base=%d\n", data->preferred_mode_index, data->base_mode_index);
-
-        for (i = 0; i < connector->count_modes; i++) {
-                drmModeModeInfo *mode = &connector->modes[i];
-                if (is_freesync_video_mode(data, mode))
-                        igt_debug("mode[%d] is freesync video mode.\n", i);
-        }
+		}
+	}
+
+	/* searching the base mode */
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+		if (mode->hdisplay == pm_hdisplay && mode->vdisplay == pm_vdisplay) {
+			if (mode->clock > max_clk) {
+				max_clk = mode->clock;
+				data->base_mode_index = i;
+			}
+		}
+	}
+		igt_info("preferred=%d, base=%d\n", data->preferred_mode_index, data->base_mode_index);
+
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+		if (is_freesync_video_mode(data, mode))
+			igt_debug("mode[%d] is freesync video mode.\n", i);
+	}
 
 	data->range = get_vrr_range(data, output);
 }
@@ -759,19 +752,19 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 
 	igt_info("stage-1:\n");
 	switch(scene) {
-        case SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE:
+	case SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE:
 		mode_start = select_mode(data, FSV_BASE_MODE, 0);
-                mode_playback  = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
+		mode_playback  = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
 		break;
-        case SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE:
+	case SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE:
 		mode_start = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
-                mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 120);
+		mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 120);
 		break;
-        case SCENE_NON_FSV_MODE_TO_FSV_MODE:
+	case SCENE_NON_FSV_MODE_TO_FSV_MODE:
 		mode_start = select_mode(data, FSV_NON_FREESYNC_VIDEO_MODE, 60);
-                mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
+		mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
 		break;
-        case SCENE_BASE_MODE_TO_CUSTUM_MODE:
+	case SCENE_BASE_MODE_TO_CUSTUM_MODE:
 		mode_start = select_mode(data, FSV_BASE_MODE, 0);
 		prepare_custom_mode(data, &mode_custom, 72);
 		mode_playback = &mode_custom;
@@ -841,30 +834,30 @@ igt_main
 	}
 
 	/* Expectation: Modeset happens instantaneously without blanking */
-        igt_describe("Test switch from base freesync mode to " \
-                     "various freesync video modes");
-        igt_subtest("freesync-base-to-various")
-		run_test(&data, SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE);
+	igt_describe("Test switch from base freesync mode to " \
+					"various freesync video modes");
+	igt_subtest("freesync-base-to-various")
+	run_test(&data, SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE);
 
 	/* Expectation: Modeset happens instantaneously without blanking */
-        igt_describe("Test switching from lower refresh freesync mode to " \
-                     "another freesync mode with higher refresh rate");
-        igt_subtest("freesync-lower-to-higher")
-		run_test(&data, SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE);
+	igt_describe("Test switching from lower refresh freesync mode to " \
+					"another freesync mode with higher refresh rate");
+	igt_subtest("freesync-lower-to-higher")
+	run_test(&data, SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE);
 
 	/* Expectation: Full modeset is triggered. */
-        igt_describe("Test switching from non preferred video mode to " \
-                     "one of freesync video mode");
-        igt_subtest("freesync-non-preferred-to-freesync")
-		run_test(&data, SCENE_NON_FSV_MODE_TO_FSV_MODE);
+	igt_describe("Test switching from non preferred video mode to " \
+					"one of freesync video mode");
+	igt_subtest("freesync-non-preferred-to-freesync")
+	run_test(&data, SCENE_NON_FSV_MODE_TO_FSV_MODE);
 
 	/* Expectation: Modeset happens instantaneously without blanking */
-        igt_describe("Add custom mode through xrandr based on " \
-                     "base freesync mode and apply the new mode");
-        igt_subtest("freesync-custom-mode")
-		run_test(&data, SCENE_BASE_MODE_TO_CUSTUM_MODE);
+	igt_describe("Add custom mode through xrandr based on " \
+					"base freesync mode and apply the new mode");
+	igt_subtest("freesync-custom-mode")
+	run_test(&data, SCENE_BASE_MODE_TO_CUSTUM_MODE);
 
-        igt_info("end of test\n");
+	igt_info("end of test\n");
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.34.1
