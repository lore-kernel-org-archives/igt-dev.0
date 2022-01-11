Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4E610E6DA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jan 2022 10:55:38 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Tue, 11 Jan 2022 16:24:31 +0530
Message-Id: <20220111105431.9459-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_draw_crc : check tiling
 support
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
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

We can check tiling support before executing test to avoid
failure and smoothly skipping expected failure.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/intel_bufops.c        | 2 +-
 tests/i915/kms_draw_crc.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index f13063fa..4ba4271a 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1176,7 +1176,7 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
 	.gen_start          = __gen_start, \
 	.gen_end            = __gen_end, \
-	.supported_hw_tiles = TILE_X | TILE_Y, \
+	.supported_hw_tiles = TILE_NONE | TILE_X | TILE_Y, \
 	.linear_to          = copy_linear_to_wc, \
 	.linear_to_x        = copy_linear_to_gtt, \
 	.linear_to_y        = copy_linear_to_gtt, \
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 82c368e1..ff1520d1 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -182,6 +182,7 @@ static void draw_method_subtest(enum igt_draw_method method,
 	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm_fd));
 
+	igt_require(buf_ops_has_hw_fence(bops, modifier));
 	igt_require(format_is_supported(formats[format_index], modifier));
 
 	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
-- 
2.17.1
