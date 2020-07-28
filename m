Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282866E293
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 12:14:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 28 Jul 2020 14:13:19 +0200
Message-Id: <20200728121320.6358-17-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200728121320.6358-1-zbigniew.kempczynski@intel.com>
References: <20200728121320.6358-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 16/17] api_intel_bb: temporary tests to
 check stride on gen3
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
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/i915/api_intel_bb.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 5d7d2326..f9cef922 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -723,11 +723,10 @@ static void full_batch(struct buf_ops *bops)
 	intel_bb_destroy(ibb);
 }
 
-static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc)
+static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
+		  uint32_t width, uint32_t height)
 {
 	struct intel_bb *ibb;
-	const int width = 1024;
-	const int height = 1024;
 	struct intel_buf src, dst, final;
 	int i915 = buf_ops_get_fd(bops);
 	uint32_t fails = 0;
@@ -735,6 +734,8 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc)
 	uint32_t devid = intel_get_drm_devid(i915);
 	igt_render_copyfunc_t render_copy = NULL;
 
+	igt_info("%s() gen: %d\n", __func__, intel_gen(devid));
+
 	/* Don't use relocations on gen12+ */
 	igt_require((do_reloc && intel_gen(devid) < 12) ||
 		    !do_reloc);
@@ -922,6 +923,7 @@ igt_main_args("dpi", NULL, help_str, opt_handler, NULL)
 {
 	int i915;
 	struct buf_ops *bops;
+	uint32_t width;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -966,23 +968,47 @@ igt_main_args("dpi", NULL, help_str, opt_handler, NULL)
 	igt_subtest("full-batch")
 		full_batch(bops);
 
+	/* Temporary off */
+#if 0
 	igt_subtest("render-none")
-		render(bops, I915_TILING_NONE, false);
+		render(bops, I915_TILING_NONE, false, 1024, 1024);
 
 	igt_subtest("render-x")
-		render(bops, I915_TILING_X, false);
+		render(bops, I915_TILING_X, false, 1024, 1024);
 
 	igt_subtest("render-y")
-		render(bops, I915_TILING_Y, false);
+		render(bops, I915_TILING_Y, false, 1024, 1024);
 
 	igt_subtest("render-none-reloc")
-		render(bops, I915_TILING_NONE, true);
+		render(bops, I915_TILING_NONE, true, 1024, 1024);
 
 	igt_subtest("render-x-reloc")
-		render(bops, I915_TILING_X, true);
+		render(bops, I915_TILING_X, true, 1024, 1024);
 
 	igt_subtest("render-y-reloc")
-		render(bops, I915_TILING_Y, true);
+		render(bops, I915_TILING_Y, true, 1024, 1024);
+#endif
+
+	for (width = 512; width <= 1024; width += 512) {
+		igt_subtest_f("render-none-%u", width) {
+			render(bops, I915_TILING_NONE, false, width, width);
+		}
+		igt_subtest_f("render-x-%u", width) {
+			render(bops, I915_TILING_X, false, width, width);
+		}
+		igt_subtest_f("render-y-%u", width) {
+			render(bops, I915_TILING_Y, false, width, width);
+		}
+		igt_subtest_f("render-none-reloc-%u", width) {
+			render(bops, I915_TILING_NONE, true, width, width);
+		}
+		igt_subtest_f("render-x-reloc-%u", width) {
+			render(bops, I915_TILING_X, true, width, width);
+		}
+		igt_subtest_f("render-y-reloc-%u", width) {
+			render(bops, I915_TILING_Y, true, width, width);
+		}
+	}
 
 	igt_subtest("render-ccs")
 		render_ccs(bops);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
