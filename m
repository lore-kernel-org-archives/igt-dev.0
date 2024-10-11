Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A25CFD316
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 10:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D367310E079;
	Fri, 11 Oct 2024 10:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgPvfiOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68C610E079
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728643438; x=1760179438;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J9MC+fqv9tOQLe3xi+f6UDoi2G2IuyILlXhRUlCzVdc=;
 b=EgPvfiOm/k9mjEqPIR+XQ1wyAN1iTq6Lr9BGLzBUDomWdR2d54shEbz7
 ZaUF+ZecloI3QwSltJgq72eK2etNMEcmJEPJnyCPUnbVFu+NgpgE9hr20
 msCN3wj4C4R0SkP1yZXBkdGkZahqnAvrVc7ppBg3KMqU3DijzeJbZTgOO
 pIxV43qFGvuupth+tbTKMswxCoGSekovC8F81ZHbWtZX2oaGJ7TZLU5YL
 ixUf61btPg0c142RKDaivYEGSCsMPndpwB4OQYKxJHWzNZ8XsVINmbIpG
 KJB4FD6t6rE4fTj0p86NZvmecwDniwShBMzUUor3SeYHMTNDQ8Y3Vw2/w g==;
X-CSE-ConnectionGUID: zroS1PWNTga3srkY80KaVA==
X-CSE-MsgGUID: IsP6kiqVT92oPtg5x/dAkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27909433"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27909433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:43:57 -0700
X-CSE-ConnectionGUID: 7CHA5ezZQGihyQsK9liS6Q==
X-CSE-MsgGUID: OBfTfalmTNmnYf/+3IznOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76983350"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 11 Oct 2024 03:43:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Oct 2024 13:43:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 14/14] tests/gem_draw: Test igt_draw without kms
Date: Fri, 11 Oct 2024 13:43:54 +0300
Message-ID: <20241011104354.26924-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-15-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-15-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

kms_draw_crc is our only way to confirm that igt_draw
linear<->tiled conversion routines are correct. That may
not cover every case as we could be hitting display
specific limitations that prevent testing everything.

Introduce a new gem_draw test case that compares igt_draw
mmap/pwrite methods against GTT mmaps. This will verify that
the software conversion routines match the hardware (de)tiling
peformed via the fenced region.

TODO: could verify against blt/rendercopy
      when gtt mmaps are not available...

v2: Drop the "driver requirement: i915" to make it past
    the documentation build scripts

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/gem_draw.c | 233 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 tests/intel/gem_draw.c

diff --git a/tests/intel/gem_draw.c b/tests/intel/gem_draw.c
new file mode 100644
index 000000000000..86df7c33ff2d
--- /dev/null
+++ b/tests/intel/gem_draw.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: gem draw
+ * Category: GEM
+ * Description: Tests whether the igt_draw library actually works.
+ * Functionality: tiling
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: draw-method-%s
+ * Description: Verify that igt draw library works for the %arg[1] method with
+ *              different tilings and color depths.
+ *
+ * arg[1]:
+ *
+ * @mmap-cpu:     MMAP-CPU
+ * @mmap-wc:      MMAP-WC
+ * @pwrite:       PWRITE
+ */
+
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "igt.h"
+#include "igt_halffloat.h"
+#include "igt_primes.h"
+
+int drm_fd;
+struct buf_ops *bops;
+
+static const enum igt_draw_method draw_methods[] = {
+	IGT_DRAW_MMAP_CPU,
+	IGT_DRAW_MMAP_WC,
+	IGT_DRAW_PWRITE,
+};
+
+static const uint32_t tilings[] = {
+	I915_TILING_NONE,
+	I915_TILING_X,
+	I915_TILING_Y,
+};
+
+static uint64_t read_pixel(const void *ptr, int stride, int x, int y, int bpp)
+{
+	ptr += y * stride + x * bpp / 8;
+
+	switch (bpp) {
+	case 8:
+		return *(const uint8_t*)ptr;
+	case 16:
+		return *(const uint16_t*)ptr;
+	case 32:
+		return *(const uint32_t*)ptr;
+	case 64:
+		return *(const uint64_t*)ptr;
+	default:
+		return 0;
+	}
+}
+
+static void check_rect(const void *ptr, int stride,
+		       int x0, int y0, int w, int h,
+		       uint64_t color, int bpp)
+{
+	int x1 = x0 + w - 1;
+	int y1 = y0 + h - 1;
+
+	if (bpp < 64)
+		color &= (1ull << bpp) - 1;
+
+	/* only check the corners to speed this up a bit */
+	igt_assert_eq(read_pixel(ptr, stride, x0, y0, bpp), color);
+	igt_assert_eq(read_pixel(ptr, stride, x0, y1, bpp), color);
+	igt_assert_eq(read_pixel(ptr, stride, x1, y0, bpp), color);
+	igt_assert_eq(read_pixel(ptr, stride, x1, y1, bpp), color);
+}
+
+static void draw(enum igt_draw_method method,
+		 int width, int height,
+		 uint32_t stride, int bpp, uint32_t tiling)
+{
+	uint64_t size = stride * height;
+	uint64_t color;
+	uint32_t handle;
+	void *ptr;
+
+	igt_require(buf_ops_has_tiling_support(bops, tiling));
+
+	handle = gem_create(drm_fd, size);
+	gem_set_tiling(drm_fd, handle, tiling, stride);
+
+	color = 0x0123456789abcdef;
+	for (int y = 0 ; y < height;) {
+		int y_next = min(height, (int)igt_next_prime_number(y));
+		int h = y_next - y;
+
+		for (int x = 0; x < width; ) {
+			int x_next = min(width, (int)igt_next_prime_number(x));
+			int w = x_next - x;
+
+			igt_draw_rect(drm_fd, bops, 0, handle, size, stride,
+				      width, height, tiling, method,
+				      x, y, w, h, color, bpp);
+
+			color = igt_ror(color, 1, 64);
+
+			x = x_next;
+		}
+
+		y = y_next;
+	}
+
+	gem_set_domain(drm_fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+	ptr = gem_mmap__gtt(drm_fd, handle, size, PROT_READ);
+
+	color = 0x0123456789abcdef;
+	for (int y = 0 ; y < height;) {
+		int y_next = min(height, (int)igt_next_prime_number(y));
+		int h = y_next - y;
+
+		for (int x = 0; x < width; ) {
+			int x_next = min(width, (int)igt_next_prime_number(x));
+			int w = x_next - x;
+
+			check_rect(ptr, stride, x, y, w, h, color, bpp);
+
+			color = igt_ror(color, 1, 64);
+
+			x = x_next;
+		}
+
+		y = y_next;
+	}
+
+	munmap(ptr, size);
+
+	gem_close(drm_fd, handle);
+}
+
+static void draw_method_subtest(enum igt_draw_method method,
+				int bpp, uint32_t tiling)
+{
+	const struct intel_device_info *info =
+		intel_get_device_info(intel_get_drm_devid(drm_fd));
+	int width, height, stride;
+	int tile_w, tile_h;
+
+	if (info->graphics_ver == 2) {
+		tile_w = 128;
+		tile_h = 16;
+	} else if (tiling == I915_TILING_X ||
+		   info->is_grantsdale || info->is_alviso) {
+		tile_w = 512;
+		tile_h = 8;
+	} else {
+		tile_w = 128;
+		tile_h = 32;
+	}
+
+	stride = 4 * tile_w;
+	width = stride * 8 / bpp;
+	height = 4 * tile_h;
+
+	draw(method, width, height, stride, bpp, tiling);
+}
+
+static void setup_environment(void)
+{
+	drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+	igt_require(drm_fd >= 0);
+	bops = buf_ops_create(drm_fd);
+
+	/* need hardware to untile for verification */
+	gem_require_mappable_ggtt(drm_fd);
+}
+
+static void teardown_environment(void)
+{
+	buf_ops_destroy(bops);
+	drm_close_driver(drm_fd);
+}
+
+static const char *tiling_str(uint32_t tiling)
+{
+	switch (tiling) {
+	case I915_TILING_NONE :
+		return "untiled";
+	case I915_TILING_X :
+		return "xtiled";
+	case I915_TILING_Y :
+		return "ytiled";
+	default:
+		igt_assert(false);
+	}
+}
+
+igt_main
+{
+	int method_idx, tiling_idx;
+
+	igt_fixture
+		setup_environment();
+
+	for (method_idx = 0; method_idx < ARRAY_SIZE(draw_methods); method_idx++) {
+		enum igt_draw_method method = draw_methods[method_idx];
+
+		igt_describe_f("Verify that igt draw library works for the draw "
+			       "method (%s) with different tilings and color depths.",
+			       igt_draw_get_method_name(method));
+
+		igt_subtest_with_dynamic_f("draw-method-%s", igt_draw_get_method_name(method)) {
+			if (!igt_draw_supports_method(drm_fd, method))
+				continue;
+
+			for (tiling_idx = 0; tiling_idx < ARRAY_SIZE(tilings); tiling_idx++) {
+				uint32_t tiling = tilings[tiling_idx];
+
+				for (int bpp = 8; bpp <= 64; bpp *= 2) {
+					igt_dynamic_f("%dbpp-%s", bpp, tiling_str(tiling))
+						draw_method_subtest(method, bpp, tiling);
+				}
+			}
+		}
+	}
+
+	igt_fixture
+		teardown_environment();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2d8cb87d5dfd..853f1e17ad79 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -118,6 +118,7 @@ intel_i915_progs = [
 	'gem_ctx_shared',
 	'gem_ctx_sseu',
 	'gem_ctx_switch',
+	'gem_draw',
 	'gem_eio',
 	'gem_evict_alignment',
 	'gem_evict_everything',
-- 
2.45.2

