Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA7410EAFD
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 07:52:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  6 Apr 2023 13:18:11 +0530
Message-Id: <20230406074815.463965-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
References: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 2/6] lib/igt_fb: Add support for allocating
 buffers for XE
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

Add support to create a buffer object to the XE driver.

V2: - Use vram_if_possible() (Zbigniew)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_fb.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ba89e1f60ee..7379b99aa8a 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -49,6 +49,8 @@
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "intel_bufops.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:igt_fb
@@ -434,7 +436,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 
 	switch (modifier) {
 	case DRM_FORMAT_MOD_LINEAR :
-		if (is_i915_device(fd))
+		if (is_intel_device(fd))
 			*width_ret = 64;
 		else
 			*width_ret = 1;
@@ -924,6 +926,9 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 		size += calc_plane_size(fb, plane);
 	}
 
+	if (is_xe_device(fb->fd))
+		size = ALIGN(size, xe_get_default_alignment(fb->fd));
+
 	return size;
 }
 
@@ -1143,8 +1148,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 	 * them, so we need to make sure to use a device BO then.
 	 */
 	if (fb->modifier || fb->size || fb->strides[0] ||
-	    (is_i915_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
-	    (is_i915_device(fd) && igt_format_is_fp16(fb->drm_format)) ||
+	    (is_intel_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
+	    (is_intel_device(fd) && igt_format_is_fp16(fb->drm_format)) ||
 	    (is_amdgpu_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
 	    is_nouveau_device(fd))
 		device_bo = true;
@@ -1168,6 +1173,9 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 					       fb->strides[0]);
 			/* If we can't use fences, we won't use ggtt detiling later. */
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
+		} else if (is_xe_device(fd)) {
+			fb->gem_handle = xe_bo_create_flags(fd, 0, fb->size,
+							vram_if_possible(fd, 0));
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
 
-- 
2.40.0
