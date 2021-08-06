Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44B56EBAA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:43:11 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:36 +0200
Message-Id: <20210806134145.24634-48-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 47/56] tests/i915_pm_rpm: Adopt to use
 no-reloc
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rpm.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 39e0064a1..62720d02b 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1178,7 +1178,8 @@ static void gem_pread_subtest(void)
 
 /* Paints a square of color $color, size $width x $height, at position $x x $y
  * of $dst_handle, which contains pitch $pitch. */
-static void submit_blt_cmd(uint32_t dst_handle, uint16_t x, uint16_t y,
+static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
+			   uint16_t x, uint16_t y,
 			   uint16_t width, uint16_t height, uint32_t pitch,
 			   uint32_t color, uint32_t *presumed_dst_offset)
 {
@@ -1190,6 +1191,12 @@ static void submit_blt_cmd(uint32_t dst_handle, uint16_t x, uint16_t y,
 	struct drm_i915_gem_exec_object2 objs[2] = {{}, {}};
 	struct drm_i915_gem_relocation_entry relocs[1] = {{}};
 	struct drm_i915_gem_wait gem_wait;
+	uint64_t ahnd = get_reloc_ahnd(drm_fd, 0), dst_offset;
+
+	if (ahnd)
+		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
+	else
+		dst_offset = *presumed_dst_offset;
 
 	i = 0;
 
@@ -1205,9 +1212,9 @@ static void submit_blt_cmd(uint32_t dst_handle, uint16_t x, uint16_t y,
 	batch_buf[i++] = (y << 16) | x;
 	batch_buf[i++] = ((y + height) << 16) | (x + width);
 	reloc_pos = i;
-	batch_buf[i++] = *presumed_dst_offset;
+	batch_buf[i++] = dst_offset;
 	if (intel_gen(ms_data.devid) >= 8)
-		batch_buf[i++] = 0;
+		batch_buf[i++] = dst_offset >> 32;
 	batch_buf[i++] = color;
 
 	batch_buf[i++] = MI_BATCH_BUFFER_END;
@@ -1230,9 +1237,16 @@ static void submit_blt_cmd(uint32_t dst_handle, uint16_t x, uint16_t y,
 	objs[0].alignment = 64;
 
 	objs[1].handle = batch_handle;
-	objs[1].relocation_count = 1;
+	objs[1].relocation_count = !ahnd ? 1 : 0;
 	objs[1].relocs_ptr = (uintptr_t)relocs;
 
+	if (ahnd) {
+		objs[0].offset = dst_offset;
+		objs[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		objs[1].offset = get_offset(ahnd, batch_handle, batch_size, 0);
+		objs[1].flags = EXEC_OBJECT_PINNED;
+	}
+
 	execbuf.buffers_ptr = (uintptr_t)objs;
 	execbuf.buffer_count = 2;
 	execbuf.batch_len = batch_size;
@@ -1253,6 +1267,7 @@ static void submit_blt_cmd(uint32_t dst_handle, uint16_t x, uint16_t y,
 	do_ioctl(drm_fd, DRM_IOCTL_I915_GEM_WAIT, &gem_wait);
 
 	gem_close(drm_fd, batch_handle);
+	put_ahnd(ahnd);
 }
 
 /* Make sure we can submit a batch buffer and verify its result. */
@@ -1285,7 +1300,7 @@ static void gem_execbuf_subtest(void)
 	disable_all_screens_and_wait(&ms_data);
 
 	color = 0x12345678;
-	submit_blt_cmd(handle, sq_x, sq_y, sq_w, sq_h, pitch, color,
+	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
 		       &presumed_offset);
 	igt_assert(wait_for_suspended());
 
@@ -1324,7 +1339,7 @@ static void gem_execbuf_subtest(void)
 	 * suspended. We use the same spot, but a different color. As a bonus,
 	 * we're testing the presumed_offset from the previous command. */
 	color = 0x87654321;
-	submit_blt_cmd(handle, sq_x, sq_y, sq_w, sq_h, pitch, color,
+	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
 		       &presumed_offset);
 
 	disable_all_screens_and_wait(&ms_data);
-- 
2.26.0
