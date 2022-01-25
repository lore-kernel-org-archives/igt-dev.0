Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D8F10EC52
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 06:52:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 25 Jan 2022 07:52:31 +0100
Message-Id: <20220125065231.16986-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
References: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/api_intel_bb: Add check-xmajor
 and check-ymajor tests
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

I've observed on discrete fast-copy blit doesn't produce valid xmajor
surface during blit. Lets check then those tilings on render and blitter
engines to leave blissful ignorance fast copy works fine.

In many scenarios we have linear -> tile -> linear form blits or
renders but we don't check tiled surface. As tile is reversible with
same algorithm we think it works whereas we can work with same tiling.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/api_intel_bb.c | 90 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index b46908e8c..c7a7f9ae0 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1392,6 +1392,90 @@ static void render_ccs(struct buf_ops *bops)
 	igt_assert_f(fails == 0, "render-ccs fails: %d\n", fails);
 }
 
+static void check_xy(struct buf_ops *bops, int tiling)
+{
+	struct intel_bb *ibb;
+	const int width = 512;
+	const int height = 512;
+	struct intel_buf src, rcs, bcs, soft;
+	int i915 = buf_ops_get_fd(bops);
+	uint32_t devid = intel_get_drm_devid(i915);
+	igt_render_copyfunc_t render_copy = NULL;
+	uint32_t ctx = gem_context_create(i915);
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx); //fake ctx id for fast_copy
+	int result_rcs, result_bcs;
+
+	igt_assert(tiling == I915_TILING_X || tiling == I915_TILING_Y);
+	ibb = intel_bb_create(i915, PAGE_SIZE);
+	if (debug_bb)
+		intel_bb_set_debug(ibb, true);
+
+	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
+			 I915_COMPRESSION_NONE);
+	scratch_buf_init(bops, &rcs, width, height, tiling,
+			 I915_COMPRESSION_NONE);
+	scratch_buf_init(bops, &bcs, width, height, tiling,
+			 I915_COMPRESSION_NONE);
+	scratch_buf_init(bops, &soft, width, height, tiling,
+			 I915_COMPRESSION_NONE);
+
+	render_copy = igt_get_render_copyfunc(devid);
+	igt_assert(render_copy);
+
+	scratch_buf_draw_pattern(bops, &src,
+				 0, 0, width, height,
+				 0, 0, width, height, 0);
+
+	render_copy(ibb, &src, 0, 0, width, height, &rcs, 0, 0);
+	gem_sync(i915, rcs.handle);
+
+	igt_blitter_fast_copy__raw(i915, ahnd, ctx,
+				   src.handle, 0, src.surface[0].stride, src.tiling,
+				   0, 0, intel_buf_size(&src),
+				   width, height,
+				   32,
+				   bcs.handle, 0, bcs.surface[0].stride, bcs.tiling,
+				   0, 0, intel_buf_size(&bcs));
+	gem_sync(i915, bcs.handle);
+
+	buf_ops_set_software_tiling(bops, tiling, true);
+	intel_buf_device_map(&src, false);
+	linear_to_intel_buf(bops, &soft, src.ptr);
+	intel_buf_unmap(&src);
+
+	if (write_png) {
+		intel_buf_write_to_png(&src, "check-xy-src.png", true);
+		if (tiling == I915_TILING_X) {
+			intel_buf_write_to_png(&rcs, "check-xy-x-rcs.png", true);
+			intel_buf_write_to_png(&bcs, "check-xy-x-bcs.png", true);
+			intel_buf_write_to_png(&soft, "check-xy-x-soft.png", true);
+		} else if (tiling == I915_TILING_Y) {
+			intel_buf_write_to_png(&rcs, "check-xy-y-rcs.png", true);
+			intel_buf_write_to_png(&bcs, "check-xy-y-bcs.png", true);
+			intel_buf_write_to_png(&soft, "check-xy-y-soft.png", true);
+		}
+	}
+	intel_buf_device_map(&rcs, false);
+	intel_buf_device_map(&bcs, false);
+	intel_buf_device_map(&soft, false);
+	result_rcs = memcmp(rcs.ptr, soft.ptr, intel_buf_size(&rcs));
+	result_bcs = memcmp(bcs.ptr, soft.ptr, intel_buf_size(&bcs));
+	intel_buf_unmap(&rcs);
+	intel_buf_unmap(&bcs);
+	intel_buf_unmap(&soft);
+
+	intel_buf_close(bops, &src);
+	intel_buf_close(bops, &rcs);
+	intel_buf_close(bops, &bcs);
+	intel_bb_destroy(ibb);
+	put_ahnd(ahnd);
+
+	igt_assert_f(result_rcs == 0, "Render surface is not expected %s-tile!\n",
+		     tiling == I915_TILING_X ? "x" : "y");
+	igt_assert_f(result_bcs == 0, "Blitter surface is not expected %s-tile!\n",
+		     tiling == I915_TILING_X ? "x" : "y");
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1549,6 +1633,12 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	igt_subtest("render-ccs")
 		render_ccs(bops);
 
+	igt_subtest("check-xmajor")
+		check_xy(bops, I915_TILING_X);
+
+	igt_subtest("check-ymajor")
+		check_xy(bops, I915_TILING_Y);
+
 	igt_fixture {
 		buf_ops_destroy(bops);
 		close(i915);
-- 
2.32.0
