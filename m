Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6A110E6EF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 02:20:56 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 07:50:41 +0530
Message-Id: <20231026022041.1851831-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com, daniels@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In crosvm, the kernel reports 16 for count_crtcs, which exceeds
IGT_MAX_PIPES set to 8. The function igt_display_require allocates
memory for IGT_MAX_PIPES members of igt_pipe_t structures, but then
writes into it based on the count_crtcs reported by the kernel,
resulting in memory corruption.

 # malloc(): corrupted top size
 # Received signal SIGABRT.
 # Stack trace:
 #  #0 [fatal_sig_handler+0x17b]
 #  #1 [__sigaction+0x40]
 #  #2 [pthread_key_delete+0x14c]
 #  #3 [gsignal+0x12]
 #  #4 [abort+0xd3]
 #  #5 [__fsetlocking+0x290]
 #  #6 [timer_settime+0x37a]
 #  #7 [__default_morecore+0x1f1b]
 #  #8 [__libc_calloc+0x161]
 #  #9 [drmModeGetPlaneResources+0x44]
 #  #10 [igt_display_require+0x194]
 #  #11 [__igt_unique____real_main1356+0x93c]
 #  #12 [main+0x3f]
 #  #13 [__libc_init_first+0x8a]
 #  #14 [__libc_start_main+0x85]
 #  #15 [_start+0x21]

Limit the loop which initializes igt_pipe_t structure to
a maximum of IGT_MAX_PIPES iterations, ensuring it does not
exceed the allocated pipe count. This prevents igt_display_require
overwriting the heap and avoids memory corruption. This fix is
required for drm-ci to run igt tests on virtio-gpu.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 453103f90..f3484a942 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2774,7 +2774,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
 
-	for (i = 0; i < resources->count_crtcs; i++) {
+	for (i = 0; i < min(resources->count_crtcs, IGT_MAX_PIPES); i++) {
 		igt_pipe_t *pipe;
 		int pipe_enum = (is_intel_dev)?
 			__intel_get_pipe_from_crtc_id(drm_fd,
-- 
2.40.1
