Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B5410E4E5
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 15:00:28 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 15:59:59 +0100
Message-Id: <48aba36042608502cc91057a1687f2472db1d85d.1678197486.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678197486.git.karolina.stolarek@intel.com>
References: <cover.1678197486.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/gem_blits: Use intel_cmds_info
 library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update the test to use blt_tiling_type values. Make it skip
if a copy command doesn't support a specific tiling format.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_blits.c | 66 +++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index eb16b567..ccc86bcf 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -74,7 +74,7 @@ get_tiling_stride(const struct device *device,
 	if (tiling) {
 		if (device->gen < 3)
 			stride = ALIGN(stride, 128);
-		else if (device->gen < 4 || tiling == I915_TILING_X)
+		else if (device->gen < 4 || tiling == T_XMAJOR)
 			stride = ALIGN(stride, 512);
 		else
 			stride = ALIGN(stride, 128);
@@ -98,7 +98,7 @@ get_tiling_height(const struct device *device,
 
 	if (device->gen < 3)
 		return ALIGN(height, 16);
-	else if (device->gen < 4 || tiling == I915_TILING_X)
+	else if (device->gen < 4 || tiling == T_XMAJOR)
 		return ALIGN(height, 8);
 	else
 		return ALIGN(height, 32);
@@ -119,8 +119,8 @@ static struct buffer *buffer_create(const struct device *device,
 	buffer->width = width;
 	buffer->height = height;
 
-	buffer->tiling = I915_TILING_NONE;
-	buffer->stride = get_tiling_stride(device, width, I915_TILING_NONE);
+	buffer->tiling = T_LINEAR;
+	buffer->stride = get_tiling_stride(device, width, T_LINEAR);
 	buffer->size = ALIGN(buffer->stride * height, 4096);
 	buffer->handle = gem_create(device->fd, buffer->size);
 	buffer->caching = device->llc;
@@ -198,16 +198,16 @@ static void buffer_set_tiling(const struct device *device,
 
 	i = 0;
 
-	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
+	if ((tiling | buffer->tiling) >= T_YMAJOR) {
 		unsigned int mask;
 
 		batch[i++] = MI_LOAD_REGISTER_IMM;
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
@@ -220,9 +220,9 @@ static void buffer_set_tiling(const struct device *device,
 		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
 		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
 		dword1 = fast_copy_dword1(buffer->tiling ?
-					  I915_TILING_Yf : I915_TILING_NONE,
+					  T_YFMAJOR : T_LINEAR,
 					  tiling ?
-					  I915_TILING_Yf : I915_TILING_NONE,
+					  T_YFMAJOR : T_LINEAR,
 					  32);
 		batch[i++] = dword1 | pitch;
 	} else {
@@ -260,7 +260,7 @@ static void buffer_set_tiling(const struct device *device,
 	if (has_64b_reloc)
 		batch[i++] = obj[1].offset >> 32;
 
-	if ((tiling | buffer->tiling) >= I915_TILING_Y) {
+	if ((tiling | buffer->tiling) >= T_YMAJOR) {
 		igt_assert(device->gen >= 6);
 		batch[i++] = MI_FLUSH_DW | 2;
 		batch[i++] = 0;
@@ -355,14 +355,14 @@ static bool blit_to_linear(const struct device *device,
 
 	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
 
-	if (buffer->tiling >= I915_TILING_Y) {
+	if (buffer->tiling >= T_YMAJOR) {
 		unsigned int mask;
 
 		batch[i++] = MI_LOAD_REGISTER_IMM;
 		batch[i++] = BCS_SWCTRL;
 
 		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
-		if (buffer->tiling == I915_TILING_Y)
+		if (buffer->tiling == T_YMAJOR)
 			mask |= BCS_SRC_Y;
 		batch[i++] = mask;
 	}
@@ -371,7 +371,7 @@ static bool blit_to_linear(const struct device *device,
 		batch[i++] = fast_copy_dword0(buffer->tiling, 0);
 		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
 		dword1 = fast_copy_dword1(buffer->tiling ?
-					  I915_TILING_Yf : I915_TILING_NONE,
+					  T_YFMAJOR : T_LINEAR,
 					  0, 32);
 		batch[i++] = dword1 | buffer->stride;
 	} else {
@@ -407,7 +407,7 @@ static bool blit_to_linear(const struct device *device,
 	if (has_64b_reloc)
 		batch[i++] = obj[1].offset >> 32;
 
-	if (buffer->tiling >= I915_TILING_Y) {
+	if (buffer->tiling >= T_YMAJOR) {
 		igt_assert(device->gen >= 6);
 		batch[i++] = MI_FLUSH_DW | 2;
 		batch[i++] = 0;
@@ -695,16 +695,16 @@ blit(const struct device *device,
 	}
 	batch = gem_mmap__cpu(device->fd, obj[2].handle, 0, 4096, PROT_WRITE);
 
-	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
+	if ((src->tiling | dst->tiling) >= T_YMAJOR) {
 		unsigned int mask;
 
 		batch[i++] = MI_LOAD_REGISTER_IMM;
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
@@ -717,9 +717,9 @@ blit(const struct device *device,
 		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
 		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
 		dword1 = fast_copy_dword1(src->tiling ?
-					  I915_TILING_Yf : I915_TILING_NONE,
+					  T_YFMAJOR : T_LINEAR,
 					  dst->tiling ?
-					  I915_TILING_Yf : I915_TILING_NONE,
+					  T_YFMAJOR : T_LINEAR,
 					  32);
 		batch[i++] = dword1 | pitch;
 	} else {
@@ -757,7 +757,7 @@ blit(const struct device *device,
 	if (has_64b_reloc)
 		batch[i++] = obj[1].offset >> 32;
 
-	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
+	if ((src->tiling | dst->tiling) >= T_YMAJOR) {
 		igt_assert(device->gen >= 6);
 		batch[i++] = MI_FLUSH_DW | 2;
 		batch[i++] = 0;
@@ -805,6 +805,15 @@ static int start_at(int x, enum start s)
 	}
 }
 
+static bool blit_supports_tiling(int fd, enum blt_tiling_type tiling)
+{
+	if (blt_has_xy_src_copy(fd))
+		return blt_xy_src_copy_supports_tiling(fd, tiling);
+
+	/* Test is run on newer platform, so check fast-copy support instead */
+	return blt_fast_copy_supports_tiling(fd, tiling);
+}
+
 igt_main
 {
 	struct device device;
@@ -837,15 +846,20 @@ igt_main
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
