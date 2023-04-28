Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8610610EC73
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 06:13:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 11:38:14 +0530
Message-Id: <20230428060818.2446308-43-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428060818.2446308-1-bhanuprakash.modem@intel.com>
References: <20230428060818.2446308-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 42/46] tests/kms_prime: Use Rendercopy instead
 of Blit
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

Instead of using Blitter, use Rendercopy to export the color
frame buffer.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_prime.c | 71 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index dd5ab993e..0828bf6b5 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -150,35 +150,60 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 		    color_encoding, color_range);
 }
 
+static struct intel_buf * create_buf(int fd, struct buf_ops *bops, int width,
+				     int height, uint32_t gem_handle)
+{
+	struct intel_buf *buf;
+	uint32_t name, handle;
+
+	name = gem_flink(fd, gem_handle);
+	handle = gem_open(fd, name);
+
+	buf = intel_buf_create_using_handle(bops, handle,
+					    width, height, 32, 0,
+					    I915_TILING_NONE, 0);
+
+	/* Make sure we close handle on destroy path */
+	intel_buf_set_ownership(buf, true);
+	return buf;
+}
+
 static void import_fb(int importer_fd, struct igt_fb *fb,
 		      int dmabuf_fd, uint32_t pitch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
 
-	if (is_i915_device(importer_fd)) {
-		if (gem_has_lmem(importer_fd)) {
-			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
-			uint64_t fb_size = 0;
-
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle > 0);
-			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
-								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
-			igt_assert(fb->gem_handle > 0);
-
-			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
-					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
-					     fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier,
-					     0, 0, fb_size);
-
-			gem_sync(importer_fd, fb->gem_handle);
-			gem_close(importer_fd, temp_buf_handle);
-			put_ahnd(ahnd);
-		} else {
-			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-		}
+	if (is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) {
+		uint32_t devid = intel_get_drm_devid(importer_fd);
+		struct buf_ops *bops = buf_ops_create(importer_fd);
+		igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
+		struct intel_bb *ibb = intel_bb_create(importer_fd, 4096);
+		struct intel_buf *src, *dst;
+		uint32_t *ptr;
+		uint64_t fb_size = 0;
+
+		igt_info("Importer is dGPU\n");
+		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(temp_buf_handle > 0);
+		fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
+							       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
+		igt_assert(fb->gem_handle > 0);
+
+		ptr = gem_mmap__device_coherent(importer_fd, temp_buf_handle, 0,
+						ALIGN(fb_size, 4096),
+						PROT_READ | PROT_WRITE);
+
+		src = create_buf(importer_fd, bops, fb->width, fb->height, temp_buf_handle);
+		dst = create_buf(importer_fd, bops, fb->width, fb->height, fb->gem_handle);
+		rendercopy(ibb, src, 0, 0, fb->width, fb->height, dst, 0, 0);
+
+		igt_assert(gem_munmap(ptr, fb_size) == 0);
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(src);
+		intel_buf_destroy(dst);
+		buf_ops_destroy(bops);
+		gem_close(importer_fd, temp_buf_handle);
 	} else {
 		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
 	}
-- 
2.40.0
