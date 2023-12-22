Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B5410E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 02/15] tests/kms_big_fb: Use igt_fb_create_intel_buf()
Date: Fri, 22 Dec 2023 16:31:46 +0200
Message-ID: <20231222143159.24662-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use igt_fb_create_intel_buf() instead of hand rolling something
similar but less capable (igt_fb_create_intel_buf() handles
planar and compressed formats, the hand rolled version does not).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 3eb43515a1fd..eef8148d2ba3 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -187,32 +187,7 @@ static struct intel_buf *init_buf(data_t *data,
 				  const struct igt_fb *fb,
 				  const char *buf_name)
 {
-	struct intel_buf *buf;
-	enum intel_driver driver = buf_ops_get_driver(data->bops);
-	uint32_t name, handle, tiling, stride, width, height, bpp, size;
-	uint64_t region = driver == INTEL_DRIVER_XE ?
-				vram_if_possible(data->drm_fd, 0) : -1;
-
-	igt_assert_eq(fb->offsets[0], 0);
-
-	tiling = igt_fb_mod_to_tiling(fb->modifier);
-	stride = fb->strides[0];
-	bpp = fb->plane_bpp[0];
-	size = fb->size;
-	width = stride / (bpp / 8);
-	height = size / stride;
-
-	name = gem_flink(data->drm_fd, fb->gem_handle);
-	handle = gem_open(data->drm_fd, name);
-	buf = intel_buf_create_full(data->bops, handle, width, height,
-				    bpp, 0, tiling, 0, size, 0,
-				    region,
-				    intel_get_pat_idx_uc(data->drm_fd));
-
-	intel_buf_set_name(buf, buf_name);
-	intel_buf_set_ownership(buf, true);
-
-	return buf;
+	return igt_fb_create_intel_buf(data->drm_fd, data->bops, fb, buf_name);
 }
 
 static void fini_buf(struct intel_buf *buf)
-- 
2.41.0
