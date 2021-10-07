Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BEC6E858
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 17:20:17 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id q125so6658085qkd.12
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Oct 2021 10:20:17 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
Date: Thu,  7 Oct 2021 14:20:11 -0300
Message-Id: <20211007172011.16871-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] tests/kms_writeback.c: fix the `fill_fb`
 function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>

Currently, the `fill_fb` function, instead of filling the framebuffer
with the whole pixel, is only filling it with the rightmost byte.

This is happening because, even though the memset accepts an int as
a parameter, it's casting the value to unsigned char and will fill
the memory with this 8 bits value.

If we setup the pixel to 0xff0000|f0|, the buffer will filled with:

| addr     | = 0f
| addr + 1 | = 0f
| addr + 2 | = 0f
| addr + 3 | = 0f
    ...
| addr + N | = 0f

This patch address this issue by manually copying the entire integer.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 tests/kms_writeback.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 60dbda2a..a033b44f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -227,14 +227,17 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 {
-	void *ptr;
+	uint32_t *ptr;
+	int64_t pixel_count, i;
 
 	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
 
-	memset(ptr, pixel, fb->strides[0] * fb->height);
+	pixel_count = fb->strides[0] * fb->height / sizeof(uint32_t);
+	for (i = 0; i < pixel_count; i++)
+		ptr[i] = pixel;
 
 	igt_fb_unmap_buffer(fb, ptr);
 }
-- 
2.30.2
