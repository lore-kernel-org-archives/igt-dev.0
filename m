Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643F10E544
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 17:54:19 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bbad32bc79so1099231fa.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 10:54:19 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 20:54:06 +0300
Message-Id: <20230817175406.48757-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: take x-tile out from blitter
 path
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

take x-tile out from blitter path, x-tile came to blitter path on older
intel gens by mistake.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 60b0e2669..140711075 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2555,7 +2555,6 @@ static bool use_blitter(const struct igt_fb *fb)
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
-	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
-- 
2.34.1
