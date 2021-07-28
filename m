Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E6B6E027
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jul 2021 05:03:58 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed, 28 Jul 2021 10:25:44 +0530
Message-Id: <20210728045544.1046657-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align width to 256B
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

some display resolutions like 1366x768 6bpc which does not
have 64B aligned width are creating crc mismatch in
kms_plane_alpha_blend test on Intel platforms.

Also having different alignment requirement by different drivers,
256B aligned width should work for all drm drivers.

amdgpu and radeon, amdgpu_align_pitch: 256B
armada, armada_pitch: 128B
exynos_drm_gem_dumb_create: No alignment required
drm_gem_shmem_dumb_create: 8B
drm_gem_vram_fill_create_dumb: 8B

Thus 256B covers everything we see in the kernel drm drivers.
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_plane_alpha_blend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d649a09f..864e83f9 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -168,6 +168,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 	w = mode->hdisplay;
 	h = mode->vdisplay;
 
+	w = ALIGN(w, 256);
 	/* recreate all fbs if incompatible */
 	if (data->xrgb_fb.width != w || data->xrgb_fb.height != h) {
 		cairo_t *cr;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
