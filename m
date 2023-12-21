Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0344A10E669
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 09:49:16 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cc99fc1858so5227701fa.2
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 01:49:16 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/i915/kms_big_fb: take out blitter fallback
 path as it is replaced with Cairo
Date: Thu, 21 Dec 2023 11:49:03 +0200
Message-Id: <20231221094903.3782509-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231221094903.3782509-1-juhapekka.heikkila@gmail.com>
References: <20231221094903.3782509-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 tests/intel/kms_big_fb.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 768dac0d2..1a4929fc7 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -258,20 +258,9 @@ static void copy_pattern(data_t *data,
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
@@ -1123,10 +1112,10 @@ igt_main
 
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
