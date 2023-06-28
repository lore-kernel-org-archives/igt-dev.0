Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53FA10E0A8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 14:07:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so4942645e87.2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 07:07:26 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 17:07:15 +0300
Message-Id: <20230628140715.11196-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230628140715.11196-1-juhapekka.heikkila@gmail.com>
References: <20230628140715.11196-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/kms_big_fb: take out
 blitter fallback path as it is replaced with Cairo
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

After adding cairo fallback path blitter path will never be used anymore

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_big_fb.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 862a29c3e..70f350623 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -133,20 +133,9 @@ static void copy_pattern(data_t *data,
 	/*
 	 * We expect the kernel to limit the max fb
 	 * size/stride to something that can still
-	 * rendered with the blitter/render engine.
+	 * rendered with the render engine.
 	 */
-	if (data->render_copy) {
-		data->render_copy(data->ibb, src, sx, sy, w, h, dst, dx, dy);
-	} else {
-		w = min(w, src_fb->width - sx);
-		w = min(w, dst_fb->width - dx);
-
-		h = min(h, src_fb->height - sy);
-		h = min(h, dst_fb->height - dy);
-
-		intel_bb_blt_copy(data->ibb, src, sx, sy, src->surface[0].stride,
-				  dst, dx, dy, dst->surface[0].stride, w, h, dst->bpp);
-	}
+	data->render_copy(data->ibb, src, sx, sy, w, h, dst, dx, dy);
 
 	fini_buf(dst);
 	fini_buf(src);
@@ -998,10 +987,10 @@ igt_main
 
 		/*
 		 * Gen3 render engine is limited to 2kx2k, whereas
-		 * the display engine can do 4kx4k. Use the blitter
+		 * the display engine can do 4kx4k. Use fallback cairo path
 		 * on gen3 to avoid exceeding the render engine limits.
 		 * On gen2 we could use either, but let's go for the
-		 * blitter there as well.
+		 * cairo there as well.
 		 */
 		if (intel_display_ver(data.devid) >= 4)
 			data.render_copy = igt_get_render_copyfunc(data.devid);
-- 
2.25.1
