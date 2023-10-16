Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA0B10E1D9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 13:49:00 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so3495428e87.2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 06:49:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 Oct 2023 16:48:52 +0300
Message-Id: <20231016134852.413678-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb/xe: use engine copy where
 available
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

On Xe driver there seems to be some problems with blitter while copying
framebuffers. Switch to use engine copy instead of blitter copy
where possible at least until blitter path is fixed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e82393909..0ff610dc2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2502,12 +2502,17 @@ static bool block_copy_ok(const struct igt_fb *fb)
 
 static bool blitter_ok(const struct igt_fb *fb)
 {
+	int devid;
+
 	if (!is_intel_device(fb->fd))
 		return false;
 
+	devid = intel_get_drm_devid(fb->fd);
+
 	if ((is_ccs_modifier(fb->modifier) &&
-	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
-	     is_gen12_mc_ccs_modifier(fb->modifier))
+	     !HAS_FLATCCS(devid)) ||
+	     is_gen12_mc_ccs_modifier(fb->modifier) ||
+	     (is_xe_device(fb->fd) && igt_get_render_copyfunc(devid)))
 		return false;
 
 	for (int i = 0; i < fb->num_planes; i++) {
@@ -2538,15 +2543,20 @@ static bool blitter_ok(const struct igt_fb *fb)
 
 static bool use_enginecopy(const struct igt_fb *fb)
 {
+	int devid;
+
 	if (!is_intel_device(fb->fd))
 		return false;
 
 	if (blitter_ok(fb))
 		return false;
 
+	devid = intel_get_drm_devid(fb->fd);
+
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
-	       is_gen12_mc_ccs_modifier(fb->modifier);
+	       (!HAS_FLATCCS(devid) && is_ccs_modifier(fb->modifier)) ||
+	       is_gen12_mc_ccs_modifier(fb->modifier) ||
+	       (is_xe_device(fb->fd) && igt_get_render_copyfunc(devid));
 }
 
 static bool use_blitter(const struct igt_fb *fb)
@@ -3052,7 +3062,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 		igt_nouveau_delete_bo(&linear->fb);
 	} else if (is_xe_device(fd)) {
 		gem_munmap(linear->map, linear->fb.size);
-		blitcopy(fb, &linear->fb);
+
+		if (blit->ibb)
+			copy_with_engine(blit, fb, &linear->fb);
+		else
+			blitcopy(fb, &linear->fb);
+
 		gem_close(fd, linear->fb.gem_handle);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
@@ -3132,7 +3147,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
 		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
 	} else if (is_xe_device(fd)) {
-		blitcopy(&linear->fb, fb);
+		if (blit->ibb)
+			copy_with_engine(blit, &linear->fb, fb);
+		else
+			blitcopy(&linear->fb, fb);
 
 		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
 					     linear->fb.size, PROT_READ | PROT_WRITE);
-- 
2.34.1
