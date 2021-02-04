Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5267E6E062
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 12:45:38 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j2so2035866pgl.0
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Feb 2021 04:45:38 -0800 (PST)
Date: Thu, 4 Feb 2021 18:15:33 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Message-ID: <a25a229fb5807e4634227664aa9fb0d59490d351.1612441942.git.sylphrenadin@gmail.com>
References: <cover.1612441942.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1612441942.git.sylphrenadin@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: Update documentation for
 __igt_vblank_wait()
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

Add documentation for the __igt_vblank_wait() helper function.
Update documentation for igt_wait_for_vblank_count() and
igt_wait_for_vblank() to reflect the refactor accordingly.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 lib/igt_kms.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 08d429a8..e6854472 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4190,6 +4190,23 @@ void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
 					  (ptrdiff_t)&output->writeback_out_fence_fd);
 }
 
+/**
+ * __igt_vblank_wait:
+ * @drm_fd: A drm file descriptor
+ * @crtc_offset: offset of the crtc in drmModeRes.crtcs
+ * @count: Number of vblanks to wait on
+ *
+ * Waits for a given number of vertical blank intervals
+ *
+ * In DRM, 'Pipe', as understood by DRM_IOCTL_WAIT_VBLANK,
+ * is actually an offset of crtc in drmModeRes.crtcs
+ * and it has nothing to do with a hardware concept of a pipe.
+ * They can match but don't have to in case of DRM lease or
+ * non-contiguous pipes.
+ *
+ * To make thing clear we are calling DRM_IOCTL_WAIT_VBLANK's 'pipe'
+ * a crtc_offset.
+ */
 static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
 {
 	drmVBlank wait_vbl;
@@ -4210,16 +4227,10 @@ static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
  * @crtc_offset: offset of the crtc in drmModeRes.crtcs
  * @count: Number of vblanks to wait on
  *
- * Waits for a given number of vertical blank intervals
- *
- * In DRM, 'Pipe', as understood by DRM_IOCTL_WAIT_VBLANK,
- * is actually an offset of crtc in drmModeRes.crtcs
- * and it has nothing to do with a hardware concept of a pipe.
- * They can match but don't have to in case of DRM lease or
- * non-contiguous pipes.
+ * See the #__igt_vblank_wait helper for more details
  *
- * To make thing clear we are calling DRM_IOCTL_WAIT_VBLANK's 'pipe'
- * a crtc_offset.
+ * Wrapper function for __igt_vblank_wait() to wait for a
+ * given number of vertical blank intervals.
  */
 void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
 {
@@ -4231,9 +4242,10 @@ void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
  * @drm_fd: A drm file descriptor
  * @crtc_offset: offset of a crtc in drmModeRes.crtcs
  *
- * See #igt_wait_for_vblank_count for more details
+ * See the #__igt_vblank_wait helper for more details
  *
- * Waits for 1 vertical blank intervals
+ * Wrapper function for __igt_vblank_wait() to wait for a
+ * single vertical blank interval.
  */
 void igt_wait_for_vblank(int drm_fd, int crtc_offset)
 {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
