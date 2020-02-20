Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4433A6E897
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 01:34:22 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t13so1778995qto.3
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 17:34:22 -0800 (PST)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Date: Wed, 19 Feb 2020 22:33:36 -0300
Message-Id: <20200220013336.1979-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] lib/igt_fb: Elimine repetitive verification
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
To: gabrielabittencourt00@gmail.com, rodrigosiqueiramelo@gmail.com, Rodrigo.Siqueira@amd.com, manasi.d.navare@intel.com, lkcamp@listslibreplanetbr.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Clean return function by elimine repetitive verification on return
functions. The function is_ccs_modifier returns true either if fb->modifier
is equals I915_FORMAT_MOD_Y_TILED or I915_FORMAT_MOD_Yf_TILED. What makes
possible to eliminate this verification on the return of the function:
use_enginecopy. The function blitter_ok returns false whenever
is_ccs_modifier returns true, so it's possible to eliminate the
fb->modifier verifications on use_blitter also.

Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
---
 lib/igt_fb.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0c4fdc5d..34a91320 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2026,21 +2026,14 @@ static bool blitter_ok(const struct igt_fb *fb)
 
 static bool use_enginecopy(const struct igt_fb *fb)
 {
-	if (blitter_ok(fb))
-		return false;
-
-	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       is_ccs_modifier(fb->modifier) ||
-	       !gem_has_mappable_ggtt(fb->fd);
+	return !blitter_ok(fb) &&
+	       (is_ccs_modifier(fb->modifier) ||
+		!gem_has_mappable_ggtt(fb->fd));
 }
 
 static bool use_blitter(const struct igt_fb *fb)
 {
-	if (!blitter_ok(fb))
-		return false;
-
-	return fb->modifier == I915_FORMAT_MOD_Y_TILED ||
-	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
+	return blitter_ok(fb) &&
 	       !gem_has_mappable_ggtt(fb->fd);
 }
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
