Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CD46F619
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:19 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:15:59 +0200
Message-Id: <20200129181601.15918-7-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/9] lib/igt_fb: Use render copy/blit on
 platforms w/o HW detiling
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

On platforms without HW detiling use render copy or blitting to convert
a framebuffer to a cairo surface.

Replaces [1] which used a slow device_coherent map, instead of the
faster engine copy in this version.

[1] https://patchwork.freedesktop.org/patch/349742/?series=72308&rev=1

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cb594634..30f3bfba 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1972,6 +1972,9 @@ static bool fast_blit_ok(const struct igt_fb *fb)
 
 static bool blitter_ok(const struct igt_fb *fb)
 {
+	if (is_ccs_modifier(fb->modifier))
+		return false;
+
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
 
@@ -2000,16 +2003,22 @@ static bool blitter_ok(const struct igt_fb *fb)
 
 static bool use_enginecopy(const struct igt_fb *fb)
 {
-	return is_ccs_modifier(fb->modifier) ||
-		(fb->modifier == I915_FORMAT_MOD_Yf_TILED &&
-		 !blitter_ok(fb));
+	if (blitter_ok(fb))
+		return false;
+
+	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
+	       is_ccs_modifier(fb->modifier) ||
+	       !gem_has_mappable_ggtt(fb->fd);
 }
 
 static bool use_blitter(const struct igt_fb *fb)
 {
-	return (fb->modifier == I915_FORMAT_MOD_Y_TILED ||
-		fb->modifier == I915_FORMAT_MOD_Yf_TILED) &&
-		blitter_ok(fb);
+	if (!blitter_ok(fb))
+		return false;
+
+	return fb->modifier == I915_FORMAT_MOD_Y_TILED ||
+	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
+	       !gem_has_mappable_ggtt(fb->fd);
 }
 
 static void init_buf_ccs(struct igt_buf *buf, int ccs_idx,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
