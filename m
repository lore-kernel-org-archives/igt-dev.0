Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B31C6E053
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 12:44:41 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id w14so2070651pfi.2
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Feb 2021 04:44:41 -0800 (PST)
Date: Thu, 4 Feb 2021 18:14:36 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Message-ID: <9f27d3cbd7baede98a665474325b3765fdc1174e.1612441942.git.sylphrenadin@gmail.com>
References: <cover.1612441942.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1612441942.git.sylphrenadin@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Decouple ioctl call logic
 for vblank wait
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
Cc: daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Extract the ioctl call logic in igt_wait_for_vblank_count() into
a helper function, __igt_vblank_wait(). Adjust igt_assert() test
in igt_wait_for_vblank_count() and igt_wait_for_vblank() accordingly.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 lib/igt_kms.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0dc2fda4..08d429a8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4190,6 +4190,20 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
 					  (ptrdiff_t)&output->writeback_out_fence_fd);
 }
 
+static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
+{
+	drmVBlank wait_vbl;
+	uint32_t pipe_id_flag;
+
+	memset(&wait_vbl, 0, sizeof(wait_vbl));
+	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
+
+	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
+	wait_vbl.request.sequence = count;
+
+	return drmWaitVBlank(drm_fd, &wait_vbl);
+}
+
 /**
  * igt_wait_for_vblank_count:
  * @drm_fd: A drm file descriptor
@@ -4209,17 +4223,7 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
  */
 void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
 {
-	drmVBlank wait_vbl;
-	uint32_t pipe_id_flag;
-
-	memset(&wait_vbl, 0, sizeof(wait_vbl));
-	pipe_id_flag = kmstest_get_vbl_flag(crtc_offset);
-
-	wait_vbl.request.type = DRM_VBLANK_RELATIVE;
-	wait_vbl.request.type |= pipe_id_flag;
-	wait_vbl.request.sequence = count;
-
-	igt_assert(drmWaitVBlank(drm_fd, &wait_vbl) == 0);
+	igt_assert(__igt_vblank_wait(drm_fd, crtc_offset, count) == 0);
 }
 
 /**
@@ -4233,7 +4237,7 @@ void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
  */
 void igt_wait_for_vblank(int drm_fd, int crtc_offset)
 {
-	igt_wait_for_vblank_count(drm_fd, crtc_offset, 1);
+	igt_assert(__igt_vblank_wait(drm_fd, crtc_offset, 1) == 0);
 }
 
 /**
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
