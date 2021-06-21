Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A06389BF1
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 15:41:59 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id j184so31602388qkd.6
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 08:41:59 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 21 Jun 2021 11:41:48 -0400
Message-Id: <20210621154148.3111000-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2] lib/igt_fb: Support Tile Size for AMD non
 linear modifiers.
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
Cc: seanpaul@chromium.org, petri.latvala@intel.com, bas@basnieuwenhuizen.nl
List-ID: <igt-dev@lists.freedesktop.org>

Calculate the width and height of the tile on amdgpu when the modifier
is not linear.

v1:
Change width_ret to bytes not pixels.

Cc: bas@basnieuwenhuizen.nl
Cc: daniel.vetter@ffwll.ch
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_fb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 71b89855..6b926e2e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -396,6 +396,19 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		vc4_modifier_param = fourcc_mod_broadcom_param(modifier);
 		modifier = fourcc_mod_broadcom_mod(modifier);
 	}
+	// For all non-linear modifiers, AMD uses 64 KiB tiles
+	else if (IS_AMD_FMT_MOD(modifier)) {
+		igt_require_amdgpu(fd);
+		const int bytes_per_pixel = fb_bpp / 8;
+		const int format_log2 = log2(bytes_per_pixel);
+		const int pixel_log2 = log2(64 * 1024) - format_log2;
+		const int width_log2 = (pixel_log2  1) / 2;
+		const int height_log2 = pixel_log2 - width_log2;
+
+		*width_ret = bytes_per_pixel << width_log2;
+		*height_ret = 1 << height_log2;
+		return;
+	}
 
 	switch (modifier) {
 	case LOCAL_DRM_FORMAT_MOD_NONE:
-- 
2.32.0.288.g62a8d224e6-goog
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
