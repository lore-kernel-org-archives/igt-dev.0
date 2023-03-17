Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7B10E3BF
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 12:37:30 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Mar 2023 13:37:11 +0100
Message-Id: <2e64a8843de0db86e44f346265bcb9419b46a300.1679055766.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1679055766.git.karolina.stolarek@intel.com>
References: <cover.1679055766.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 9/9] tests/gem_blits: Use intel_cmds_info
 library
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

Update the test to use blt_tiling_type values. Make it skip
if a copy command doesn't support a specific tiling format.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/i915_blt.c    |  6 ++++
 tests/i915/gem_blits.c | 62 ++++++++++++++++++++++++++----------------
 2 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 13105820..ef67fe26 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -16,6 +16,12 @@
 #define BITRANGE(start, end) (end - start + 1)
 #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
 
+/* Blitter tiling definitions sanity checks */
+static_assert(T_LINEAR == I915_TILING_NONE, "Linear definitions have to match");
+static_assert(T_XMAJOR == I915_TILING_X, "TileX definitions have to match");
+static_assert(T_YMAJOR == I915_TILING_Y, "TileY definitions have to match");
+static_assert(T_YFMAJOR == I915_TILING_Yf, "TileYf definitions have to match");
+
 enum blt_special_mode {
 	SM_NONE,
 	SM_FULL_RESOLVE,
diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index 0d4655f8..a90ad4c9 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -70,7 +70,7 @@ get_tiling_stride(const struct device *device,
 	if (tiling) {
 		if (device->gen < 3)
 			stride = ALIGN(stride, 128);
-		else if (device->gen < 4 || tiling == I915_TILING_X)
+		else if (device->gen < 4 || tiling == T_XMAJOR)
 			stride = ALIGN(stride, 512);
 		else
 			stride = ALIGN(stride, 128);
@@ -94,7 +94,7 @@ get_tiling_height(const struct device *device,
 
 	if (device->gen < 3)
 		return ALIGN(height, 16);
-	else if (device->gen < 4 || tiling == I915_TILING_X)
+	else if (device->gen < 4 || tiling == T_XMAJOR)
 		return ALIGN(height, 8);
 	else
 		return ALIGN(height, 32);
@@ -115,8 +115,8 @@ static struct buffer *buffer_create(const struct device *device,
 	buffer->width = width;
 	buffer->height = height;
 
-	buffer->tiling = I915_TILING_NONE;
-	buffer->stride = get_tiling_stride(device, width, I915_TILING_NONE);
+	buffer->tiling = T_LINEAR;
+	buffer->stride = get_tiling_stride(device, width, T_LINEAR);
 	buffer->size = ALIGN(buffer->stride * height, 4096);
 	buffer->handle = gem_create(device->fd, buffer->size);
 	buffer->caching = device->llc;
@@ -194,16 +194,16 @@ static void buffer_set_tiling(const struct device *device,
 
 	i = 0;
 
-	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
+	if ((tiling | buffer->tiling) >= T_YMAJOR) {
 		unsigned int mask;
 
 		batch[i++] = MI_LOAD_REGISTER_IMM(1);
 		batch[i++] = BCS_SWCTRL;
 
 		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
-		if (buffer->tiling == I915_TILING_Y)
+		if (buffer->tiling == T_YMAJOR)
 			mask |= BCS_SRC_Y;
-		if (tiling == I915_TILING_Y)
+		if (tiling == T_YMAJOR)
 			mask |= BCS_DST_Y;
 		batch[i++] = mask;
 	}
@@ -255,7 +255,7 @@ static void buffer_set_tiling(const struct device *device,
 	if (has_64b_reloc)
 		batch[i++] = obj[1].offset >> 32;
 
-	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
+	if ((tiling | buffer->tiling) >= T_YMAJOR) {
 		igt_assert(device->gen >= 6);
 		batch[i++] = MI_FLUSH_DW_CMD | 2;
 		batch[i++] = 0;
@@ -350,14 +350,14 @@ static bool blit_to_linear(const struct device *device,
 
 	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
 
-	if (buffer->tiling >= I915_TILING_Y) {
+	if (buffer->tiling >= T_YMAJOR) {
 		unsigned int mask;
 
 		batch[i++] = MI_LOAD_REGISTER_IMM(1);
 		batch[i++] = BCS_SWCTRL;
 
 		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
-		if (buffer->tiling == I915_TILING_Y)
+		if (buffer->tiling == T_YMAJOR)
 			mask |= BCS_SRC_Y;
 		batch[i++] = mask;
 	}
@@ -371,8 +371,8 @@ static bool blit_to_linear(const struct device *device,
 		batch[i++] |= 6 + 2 * has_64b_reloc;
 		batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
 	} else if (blt_has_fast_copy(device->fd)) {
-		batch[i++] = fast_copy_dword0(buffer->tiling, I915_TILING_NONE);
-		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE,
+		batch[i++] = fast_copy_dword0(buffer->tiling, T_LINEAR);
+		dword1 = fast_copy_dword1(buffer->tiling, T_LINEAR,
 					  32, device->fd);
 		batch[i++] = dword1 | buffer->stride;
 	} else {
@@ -403,7 +403,7 @@ static bool blit_to_linear(const struct device *device,
 	if (has_64b_reloc)
 		batch[i++] = obj[1].offset >> 32;
 
-	if (buffer->tiling >= I915_TILING_Y) {
+	if (buffer->tiling >= T_YMAJOR) {
 		igt_assert(device->gen >= 6);
 		batch[i++] = MI_FLUSH_DW_CMD | 2;
 		batch[i++] = 0;
@@ -691,16 +691,16 @@ blit(const struct device *device,
 	}
 	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
 
-	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
+	if ((src->tiling | dst->tiling) >= T_YMAJOR) {
 		unsigned int mask;
 
 		batch[i++] = MI_LOAD_REGISTER_IMM(1);
 		batch[i++] = BCS_SWCTRL;
 
 		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
-		if (src->tiling == I915_TILING_Y)
+		if (src->tiling == T_YMAJOR)
 			mask |= BCS_SRC_Y;
-		if (dst->tiling == I915_TILING_Y)
+		if (dst->tiling == T_YMAJOR)
 			mask |= BCS_DST_Y;
 		batch[i++] = mask;
 	}
@@ -752,7 +752,7 @@ blit(const struct device *device,
 	if (has_64b_reloc)
 		batch[i++] = obj[1].offset >> 32;
 
-	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
+	if ((src->tiling | dst->tiling) >= T_YMAJOR) {
 		igt_assert(device->gen >= 6);
 		batch[i++] = MI_FLUSH_DW_CMD | 2;
 		batch[i++] = 0;
@@ -800,6 +800,17 @@ static int start_at(int x, enum start s)
 	}
 }
 
+static bool blit_supports_tiling(int fd, enum blt_tiling_type tiling)
+{
+	if (blt_has_xy_src_copy(fd)) {
+		return blt_xy_src_copy_supports_tiling(fd, tiling);
+	} else if (blt_has_fast_copy(fd)) {
+		return blt_fast_copy_supports_tiling(fd, tiling);
+	} else {
+		igt_assert_f(0, "No supported blit command found\n");
+	}
+}
+
 igt_main
 {
 	struct device device;
@@ -830,15 +841,20 @@ igt_main
 								    width * 16, height * 4);
 
 						y = start_at(height, y0);
-						for (unsigned int src_tiling = I915_TILING_NONE;
-						     src_tiling <= (device.gen >= 6 ? I915_TILING_Y : I915_TILING_X);
-						     src_tiling++) {
+
+						for (unsigned int src_tiling = T_LINEAR;
+						     src_tiling <= T_YMAJOR; src_tiling++) {
+							if (!blit_supports_tiling(device.fd, src_tiling))
+								continue;
+
 							buffer_set_tiling(&device, src, src_tiling);
 
 							x = start_at(width, x0);
-							for (unsigned int dst_tiling = I915_TILING_NONE;
-							     dst_tiling <= (device.gen >= 6 ? I915_TILING_Y : I915_TILING_X);
-							     dst_tiling++) {
+							for (unsigned int dst_tiling = T_LINEAR;
+							     dst_tiling <= T_YMAJOR; dst_tiling++) {
+								if (!blit_supports_tiling(device.fd, dst_tiling))
+									continue;
+
 								buffer_set_tiling(&device, dst, dst_tiling);
 
 								for (enum mode down = CPU; down <= WC; down++) {
-- 
2.25.1
