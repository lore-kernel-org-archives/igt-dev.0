Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CF96E0F4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jul 2021 10:01:28 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 27 Jul 2021 15:23:14 +0530
Message-Id: <20210727095314.1043574-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] lib/igt_fb: Align width to 256B
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
 lib/igt_fb.c                  | 2 +-
 tests/kms_plane_alpha_blend.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 75ab217b..4a08b774 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -683,7 +683,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 
 	memset(fb, 0, sizeof(*fb));
 
-	fb->width = width;
+	fb->width = ALIGN(width, 256);
 	fb->height = height;
 	fb->modifier = modifier;
 	fb->drm_format = drm_format;
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d649a09f..817d738f 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -186,6 +186,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_create_fb(data->gfx_fd, w, h,
 			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->xrgb_fb);
+		w = data->xrgb_fb.width;
 		draw_gradient(&data->xrgb_fb, w, h, 1.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
