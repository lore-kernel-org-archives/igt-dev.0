Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818D610E149
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 08:14:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Jul 2023 13:48:41 +0530
Message-Id: <20230731081841.1139659-3-kunal1.joshi@intel.com>
In-Reply-To: <20230731081841.1139659-1-kunal1.joshi@intel.com>
References: <20230731081841.1139659-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: on xe driver switch from
 rendercopy to blitcopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

on xe driver use blitcopy for everything where otherwise would
use rendercopy.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7d1337303..b33c639ab 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2529,7 +2529,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if (!is_xe_device(fb->fd) && blitter_ok(fb))
+	if (blitter_ok(fb))
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
@@ -3038,9 +3038,7 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 		igt_nouveau_delete_bo(&linear->fb);
 	} else if (is_xe_device(fd)) {
 		gem_munmap(linear->map, linear->fb.size);
-		copy_with_engine(blit, fb, &linear->fb);
-
-		syncobj_wait(fd, &blit->ibb->engine_syncobj, 1, INT64_MAX, 0, NULL);
+		blitcopy(fb, &linear->fb);
 		gem_close(fd, linear->fb.gem_handle);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
@@ -3120,7 +3118,7 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
 		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
 	} else if (is_xe_device(fd)) {
-		copy_with_engine(blit, &linear->fb, fb);
+		blitcopy(&linear->fb, fb);
 
 		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
 					     linear->fb.size, PROT_READ | PROT_WRITE);
-- 
2.25.1
