Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502656E290
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 02:31:31 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 11 Feb 2020 04:31:01 +0200
Message-Id: <20200211023108.25369-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 1/8] lib/igt_draw: Refactor get_tiling calls
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
Cc: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Simplify the number of places from which gem_get_tiling method is called
and call it only if the device has support in hardware for tiling.

For consistency also fix up the gem_mmap__cpu() prot argument in
draw_rect_mmap_cpu(). Atm, gem_mmap__cpu() ignores this, however the
implementation of it may change, so make sure we pass the correct
protection flags.

v2:
- Use gem_available_fences() to check for HW detiling.
v3: (Matt)
- Fix docbook for draw_rect_render()
- Remove unused swizzle params from the blt/render draw funcs.
- Describe the gem_mmap__cpu() prot argument fix in the commit log.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_draw.c                   | 57 ++++++++++++++++----------------
 lib/igt_draw.h                   |  5 +--
 tests/kms_frontbuffer_tracking.c |  8 +++--
 3 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 6950bc49..fa8ab562 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -333,20 +333,19 @@ static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
 }
 
 static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
-			       uint32_t color)
+			       uint32_t tiling, uint32_t swizzle, uint32_t color)
 {
 	uint32_t *ptr;
-	uint32_t tiling, swizzle;
 
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU,
 		       I915_GEM_DOMAIN_CPU);
-	igt_require(gem_get_tiling(fd, buf->handle, &tiling, &swizzle));
 
 	/* We didn't implement suport for the older tiling methods yet. */
 	if (tiling != I915_TILING_NONE)
 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 5);
 
-	ptr = gem_mmap__cpu(fd, buf->handle, 0, PAGE_ALIGN(buf->size), 0);
+	ptr = gem_mmap__cpu(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
+			    PROT_READ | PROT_WRITE);
 
 	switch (tiling) {
 	case I915_TILING_NONE:
@@ -384,14 +383,12 @@ static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
 }
 
 static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
-			      uint32_t color)
+			      uint32_t tiling, uint32_t swizzle, uint32_t color)
 {
 	uint32_t *ptr;
-	uint32_t tiling, swizzle;
 
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
 		       I915_GEM_DOMAIN_GTT);
-	igt_require(gem_get_tiling(fd, buf->handle, &tiling, &swizzle));
 
 	/* We didn't implement suport for the older tiling methods yet. */
 	if (tiling != I915_TILING_NONE)
@@ -495,12 +492,9 @@ static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
 }
 
 static void draw_rect_pwrite(int fd, struct buf_data *buf,
-			     struct rect *rect, uint32_t color)
+			     struct rect *rect, uint32_t tiling,
+			     uint32_t swizzle, uint32_t color)
 {
-	uint32_t tiling, swizzle;
-
-	igt_require(gem_get_tiling(fd, buf->handle, &tiling, &swizzle));
-
 	switch (tiling) {
 	case I915_TILING_NONE:
 		draw_rect_pwrite_untiled(fd, buf, rect, color);
@@ -517,18 +511,15 @@ static void draw_rect_pwrite(int fd, struct buf_data *buf,
 
 static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 			  struct buf_data *buf, struct rect *rect,
-			  uint32_t color)
+			  uint32_t tiling, uint32_t color)
 {
 	drm_intel_bo *dst;
 	struct intel_batchbuffer *batch;
 	int blt_cmd_len, blt_cmd_tiling, blt_cmd_depth;
 	uint32_t devid = intel_get_drm_devid(fd);
 	int gen = intel_gen(devid);
-	uint32_t tiling, swizzle;
 	int pitch;
 
-	igt_require(gem_get_tiling(fd, buf->handle, &tiling, &swizzle));
-
 	dst = gem_handle_to_libdrm_bo(cmd_data->bufmgr, fd, "", buf->handle);
 	igt_assert(dst);
 
@@ -574,28 +565,25 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 
 static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 			     struct buf_data *buf, struct rect *rect,
-			     uint32_t color)
+			     uint32_t tiling, uint32_t color)
 {
 	drm_intel_bo *src, *dst;
 	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
 	struct igt_buf src_buf = {}, dst_buf = {};
 	struct intel_batchbuffer *batch;
-	uint32_t tiling, swizzle;
 	struct buf_data tmp;
 	int pixel_size = buf->bpp / 8;
 
 	igt_skip_on(!rendercopy);
 
-	igt_require(gem_get_tiling(fd, buf->handle, &tiling, &swizzle));
-
 	/* We create a temporary buffer and copy from it using rendercopy. */
 	tmp.size = rect->w * rect->h * pixel_size;
 	tmp.handle = gem_create(fd, tmp.size);
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
 	draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
-			   color);
+			   I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
 
 	src = gem_handle_to_libdrm_bo(cmd_data->bufmgr, fd, "", tmp.handle);
 	igt_assert(src);
@@ -634,6 +622,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  * @buf_handle: the handle of the buffer where you're going to draw to
  * @buf_size: the size of the buffer
  * @buf_stride: the stride of the buffer
+ * @tiling: the tiling of the buffer
  * @method: method you're going to use to write to the buffer
  * @rect_x: horizontal position on the buffer where your rectangle starts
  * @rect_y: vertical position on the buffer where your rectangle starts
@@ -647,9 +636,12 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
  */
 void igt_draw_rect(int fd, drm_intel_bufmgr *bufmgr, drm_intel_context *context,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
-		   enum igt_draw_method method, int rect_x, int rect_y,
-		   int rect_w, int rect_h, uint32_t color, int bpp)
+		   uint32_t tiling, enum igt_draw_method method,
+		   int rect_x, int rect_y, int rect_w, int rect_h,
+		   uint32_t color, int bpp)
 {
+	uint32_t buf_tiling, swizzle;
+
 	struct cmd_data cmd_data = {
 		.bufmgr = bufmgr,
 		.context = context,
@@ -667,24 +659,30 @@ void igt_draw_rect(int fd, drm_intel_bufmgr *bufmgr, drm_intel_context *context,
 		.h = rect_h,
 	};
 
+	swizzle = I915_BIT_6_SWIZZLE_NONE;
+	if (tiling != I915_TILING_NONE && gem_available_fences(fd)) {
+		gem_get_tiling(fd, buf_handle, &buf_tiling, &swizzle);
+		igt_assert(tiling == buf_tiling);
+	}
+
 	switch (method) {
 	case IGT_DRAW_MMAP_CPU:
-		draw_rect_mmap_cpu(fd, &buf, &rect, color);
+		draw_rect_mmap_cpu(fd, &buf, &rect, tiling, swizzle, color);
 		break;
 	case IGT_DRAW_MMAP_GTT:
 		draw_rect_mmap_gtt(fd, &buf, &rect, color);
 		break;
 	case IGT_DRAW_MMAP_WC:
-		draw_rect_mmap_wc(fd, &buf, &rect, color);
+		draw_rect_mmap_wc(fd, &buf, &rect, tiling, swizzle, color);
 		break;
 	case IGT_DRAW_PWRITE:
-		draw_rect_pwrite(fd, &buf, &rect, color);
+		draw_rect_pwrite(fd, &buf, &rect, tiling, swizzle, color);
 		break;
 	case IGT_DRAW_BLT:
-		draw_rect_blt(fd, &cmd_data, &buf, &rect, color);
+		draw_rect_blt(fd, &cmd_data, &buf, &rect, tiling, color);
 		break;
 	case IGT_DRAW_RENDER:
-		draw_rect_render(fd, &cmd_data, &buf, &rect, color);
+		draw_rect_render(fd, &cmd_data, &buf, &rect, tiling, color);
 		break;
 	default:
 		igt_assert(false);
@@ -715,7 +713,8 @@ void igt_draw_rect_fb(int fd, drm_intel_bufmgr *bufmgr,
 		      int rect_w, int rect_h, uint32_t color)
 {
 	igt_draw_rect(fd, bufmgr, context, fb->gem_handle, fb->size, fb->strides[0],
-		      method, rect_x, rect_y, rect_w, rect_h, color,
+		      igt_fb_mod_to_tiling(fb->modifier), method,
+		      rect_x, rect_y, rect_w, rect_h, color,
 		      igt_drm_format_to_bpp(fb->drm_format));
 }
 
diff --git a/lib/igt_draw.h b/lib/igt_draw.h
index b030131e..ec146754 100644
--- a/lib/igt_draw.h
+++ b/lib/igt_draw.h
@@ -52,8 +52,9 @@ const char *igt_draw_get_method_name(enum igt_draw_method method);
 
 void igt_draw_rect(int fd, drm_intel_bufmgr *bufmgr, drm_intel_context *context,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
-		   enum igt_draw_method method, int rect_x, int rect_y,
-		   int rect_w, int rect_h, uint32_t color, int bpp);
+		   uint32_t tiling, enum igt_draw_method method,
+		   int rect_x, int rect_y, int rect_w, int rect_h,
+		   uint32_t color, int bpp);
 
 void igt_draw_rect_fb(int fd, drm_intel_bufmgr *bufmgr,
 		      drm_intel_context *context, struct igt_fb *fb,
diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 2c765c34..9c2c3a5d 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -291,6 +291,7 @@ struct {
 	int height;
 	uint32_t color;
 	int bpp;
+	uint32_t tiling;
 } busy_thread = {
 	.stop = true,
 };
@@ -1126,9 +1127,9 @@ static void *busy_thread_func(void *data)
 	while (!busy_thread.stop)
 		igt_draw_rect(drm.fd, drm.bufmgr, NULL, busy_thread.handle,
 			      busy_thread.size, busy_thread.stride,
-			      IGT_DRAW_BLT, 0, 0, busy_thread.width,
-			      busy_thread.height, busy_thread.color,
-			      busy_thread.bpp);
+			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
+			      busy_thread.width, busy_thread.height,
+			      busy_thread.color, busy_thread.bpp);
 
 	pthread_exit(0);
 }
@@ -1146,6 +1147,7 @@ static void start_busy_thread(struct igt_fb *fb)
 	busy_thread.height = fb->height;
 	busy_thread.color = pick_color(fb, COLOR_PRIM_BG);
 	busy_thread.bpp = igt_drm_format_to_bpp(fb->drm_format);
+	busy_thread.tiling = igt_fb_mod_to_tiling(fb->modifier);
 
 	rc = pthread_create(&busy_thread.thread, NULL, busy_thread_func, NULL);
 	igt_assert_eq(rc, 0);
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
