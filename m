Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE010E149
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 12:04:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af316b4515so44166371fa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 05:04:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 15:04:40 +0300
Message-Id: <20230530120440.5259-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/veboxcopy: Add packed 64bpp 16b per
 channel yuv support
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

Enable Vebox engine to copy packed 64bpp yuv surfaces.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/veboxcopy_gen12.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 4ab6ced3..44c914e7 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -30,6 +30,7 @@
 #define PLANAR_420_8	4
 #define PACKED_444A_8	5
 #define R8G8B8A8_UNORM	8
+#define PACKED_444_16	9
 #define PLANAR_420_16	12
 
 struct vebox_surface_state {
@@ -342,6 +343,10 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 		format = src->format_is_yuv ? PACKED_444A_8 :
 					      R8G8B8A8_UNORM;
 		break;
+	case 64:
+		igt_assert(!src->format_is_yuv_semiplanar && src->format_is_yuv);
+		format = PACKED_444_16;
+		break;
 	default:
 		igt_assert_f(0, "Unsupported bpp: %u\n", src->bpp);
 	}
-- 
2.25.1
