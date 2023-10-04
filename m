Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C671C10E0FE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 13:47:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50336768615so2580323e87.0
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Oct 2023 06:47:31 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 16:47:22 +0300
Message-Id: <20231004134722.319334-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: on Xe driver take into account
 adlp with no extended block copy
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

With Xe add check to not use extended block copy if it is not available.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f0c0681ab..54a66eb6a 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2920,17 +2920,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
 			blt_set_copy_object(&blt.src, src);
 			blt_set_copy_object(&blt.dst, dst);
 
-			blt_set_object_ext(&ext.src,
-					   blt_compression_format(&blt, src_fb),
-					   src_fb->width, src_fb->height,
-					   SURFACE_TYPE_2D);
+			if (blt_uses_extended_block_copy(src_fb->fd)) {
+				blt_set_object_ext(&ext.src,
+						blt_compression_format(&blt, src_fb),
+						src_fb->width, src_fb->height,
+						SURFACE_TYPE_2D);
 
-			blt_set_object_ext(&ext.dst,
-					   blt_compression_format(&blt, dst_fb),
-					   dst_fb->width, dst_fb->height,
-					   SURFACE_TYPE_2D);
+				blt_set_object_ext(&ext.dst,
+						blt_compression_format(&blt, dst_fb),
+						dst_fb->width, dst_fb->height,
+						SURFACE_TYPE_2D);
 
-			pext = &ext;
+				pext = &ext;
+			}
 
 			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
 
-- 
2.34.1
