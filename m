Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206589BF3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 18:17:47 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon,  6 Sep 2021 21:17:36 +0300
Message-Id: <20210906181736.3914421-7-imre.deak@intel.com>
In-Reply-To: <20210906181736.3914421-1-imre.deak@intel.com>
References: <20210906181736.3914421-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 6/6] for-ci: Check for ccs remap support
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
List-ID: <igt-dev@lists.freedesktop.org>

Remove the 2 MB surface offset and the power-of-two stride size
restriction only if the kernel support for this is in place.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ea4d83ab7..883fc1fe1 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -715,6 +715,55 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 	}
 }
 
+static bool adlp_ccs_remap_supported(int drm_fd)
+{
+	uint64_t modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
+	uint64_t size;
+	uint32_t width = 48 * 32;	/* Min stride with remapping to 48->64 tiles */
+	uint32_t height = 32 * 32;	/* 4 tile aligned height */
+	uint32_t format = DRM_FORMAT_XRGB8888;
+	uint32_t strides[4] = {};
+	uint32_t offsets[4] = {};
+	uint32_t bo;
+	uint32_t fb_id;
+	static int supported = -1;
+
+	if (supported != -1)
+		return supported;
+
+	strides[0] = width * 4;
+	strides[1] = roundup_power_of_two(strides[0] / 512) * 64;
+
+	offsets[0] = 0;
+	/* Ensure CCS plane 1 is misaligned. */
+	offsets[1] = ALIGN(offsets[0] + strides[0] * height, 2 * 1024 * 1024) + 4096;
+
+	size = offsets[1] + strides[1] * height / 32;
+
+	bo = gem_buffer_create_fb_obj(drm_fd, size);
+	igt_assert(bo);
+
+	if (__kms_addfb(drm_fd, bo,
+			width, height,
+			format, modifier,
+			strides, offsets,
+			2,
+			DRM_MODE_FB_MODIFIERS, &fb_id) != 0) {
+		supported = 0;
+		igt_debug("CCS framebuffer remapping not supported.\n");
+
+		return false;
+	}
+
+	igt_ioctl(drm_fd, DRM_IOCTL_MODE_RMFB, &fb_id);
+	gem_close(drm_fd, bo);
+
+	supported = 1;
+	igt_debug("CCS framebuffer remapping supported\n");
+
+	return true;
+}
+
 static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 {
 	uint32_t min_stride = fb->plane_width[plane] *
@@ -789,7 +838,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 				     &tile_width, &tile_height);
 
 		if (is_gen12_ccs_modifier(fb->modifier)) {
-			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
+			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd))) {
 				/*
 				 * The main surface stride must be aligned to the CCS AUX
 				 * page table block size (covered by one AUX PTE). This
@@ -799,8 +848,13 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 				 * tile rows.
 				 */
 				tile_align = (min_stride <= 8 * tile_width) ? 8 : 16;
-			else
+				if (!adlp_ccs_remap_supported(fb->fd)) {
+					tile_align = roundup_power_of_two(min_stride) / 128;
+					tile_align = max(tile_align, 8);
+				}
+			} else {
 				tile_align = 4;
+			}
 		}
 
 		return ALIGN(min_stride, tile_width * tile_align);
@@ -847,6 +901,10 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		size = (uint64_t)fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], 64);
 
+		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
+		    !adlp_ccs_remap_supported(fb->fd))
+			size = ALIGN(size, 2 * 1024 * 1024);
+
 		return size;
 	} else {
 		unsigned int tile_width, tile_height;
@@ -862,6 +920,11 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		size = (uint64_t)fb->strides[plane] *
 			ALIGN(fb->plane_height[plane], tile_height);
 
+		if (is_ccs_modifier(fb->modifier) &&
+		    IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
+		    !adlp_ccs_remap_supported(fb->fd))
+			size = ALIGN(size, 2 * 1024 * 1024);
+
 		return size;
 	}
 }
-- 
2.27.0
