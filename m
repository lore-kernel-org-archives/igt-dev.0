Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842310E052
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 06:29:16 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: bhanuprakash.modem@intel.com, daniels@collabora.com,
 igt-dev@lists.freedesktop.org
Date: Wed,  8 Nov 2023 11:59:02 +0530
Message-Id: <20231108062902.390248-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com
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

Increase IGT_MAX_PIPES to 16 to fix this memory corruption issue.
igt_display_require initializes display and allocate resources as
a prerequisite for the tests. Fail the test if count_crtcs exceeds
IGT_MAX_PIPES with debug information.

This fix is required for drm-ci to run igt tests on virtio-gpu.

Suggested-by: Daniel Stone <daniels@collabora.com>
Suggested-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Rework the fix to increase IGT_MAX_PIPES to 16

v3:
  - Fail the test if count_crtcs exceeds IGT_MAX_PIPES with debug information 

---
 lib/igt_kms.c |  6 +++++-
 lib/igt_kms.h | 20 +++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 453103f90..6ad7cc127 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -906,7 +906,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *p
  */
 const char *kmstest_pipe_name(enum pipe pipe)
 {
-	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H";
+	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H\0I\0J\0K\0L\0M\0N\0O\0P";
 
 	_Static_assert(sizeof(str) == IGT_MAX_PIPES * 2,
 		       "Missing pipe name");
@@ -2770,6 +2770,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	}
 #endif
 
+	igt_assert_f(resources->count_crtcs <= IGT_MAX_PIPES,
+		     "count_crtcs exceeds IGT_MAX_PIPES, resources->count_crtcs=%d, IGT_MAX_PIPES=%d\n",
+		     resources->count_crtcs, IGT_MAX_PIPES);
+
 	display->n_pipes = IGT_MAX_PIPES;
 	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9028ab9be..5c705b585 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -57,6 +57,16 @@
  * @PIPE_D: Fourth crtc.
  * @PIPE_E: Fifth crtc.
  * @PIPE_F: Sixth crtc.
+ * @PIPE_G: Seventh crtc.
+ * @PIPE_H: Eighth crtc.
+ * @PIPE_I: Ninth crtc.
+ * @PIPE_J: Tenth crtc.
+ * @PIPE_K: Eleventh crtc.
+ * @PIPE_L: Twelfth crtc.
+ * @PIPE_M: Thirteenth crtc.
+ * @PIPE_N: Fourteenth crtc.
+ * @PIPE_O: Fifteenth crtc.
+ * @PIPE_P: Sixteenth crtc.
  * @IGT_MAX_PIPES: Max number of pipes allowed.
  */
 enum pipe {
@@ -70,7 +80,15 @@ enum pipe {
         PIPE_F,
 	PIPE_G,
 	PIPE_H,
-        IGT_MAX_PIPES
+	PIPE_I,
+	PIPE_J,
+	PIPE_K,
+	PIPE_L,
+	PIPE_M,
+	PIPE_N,
+	PIPE_O,
+	PIPE_P,
+	IGT_MAX_PIPES
 };
 const char *kmstest_pipe_name(enum pipe pipe);
 int kmstest_pipe_to_index(char pipe);
-- 
2.40.1
