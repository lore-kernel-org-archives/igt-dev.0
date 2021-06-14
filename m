Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8B789F53
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 22:40:47 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Mon, 14 Jun 2021 18:40:41 -0400
Message-ID: <20210614224041.5271-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: Add checks for intel device
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
To: igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com, Rodrigo.Siqueira@amd.com, markyacoub@google.com
Cc: Anson Jacob <Anson.Jacob@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Certain tests (eg: kms_plane_multiple) are failing on amdgpu due to
an assert in intel_get_drm_devid which checks for an i915 device.

Add check for intel device before calling intel_get_drm_devid.

Fixes: 801309d0c245 ("lib/i915: Add ADL-P plane offset restriction for CCS framebuffers")

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
Cc: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab52ea9f7cf2..71b8985529a6 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -760,7 +760,8 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 			stride = ALIGN(min_stride, tile_width * 4);
 
 			/* TODO: add support to kernel to POT align CCS format strides */
-			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
+			if (is_i915_device(fb->fd) &&
+			    IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
 				stride = roundup_power_of_two(max(stride, tile_width * 8));
 		} else {
 			stride = ALIGN(min_stride, tile_width);
@@ -836,7 +837,8 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		 * On ADL_P CCS color planes must be 2MB aligned, until remapping
 		 * support is added for CCS FBs.
 		 */
-		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
+		if (is_i915_device(fb->fd) &&
+		    IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
 		    is_ccs_modifier(fb->modifier))
 			size = ALIGN(size, 2 * 1024 * 1024);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
