Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FE310E051
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 16:35:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50309daf971so2019347e87.3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 09:35:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Sep 2023 19:35:30 +0300
Message-Id: <20230921163530.285456-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/xe: on xe driver use blitter for x-tile
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

on xe driver need to use blitter for x-tile

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 4b592825d..c8a7b31a8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2557,7 +2557,8 @@ static bool use_blitter(const struct igt_fb *fb)
 	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
+	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
+	       is_xe_device(fb->fd);
 }
 
 static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
-- 
2.25.1
