Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF2810E649
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 04:06:59 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: bhanuprakash.modem@intel.com, daniels@collabora.com,
 igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 09:36:47 +0530
Message-Id: <20231110040647.630223-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] lib/igt_kms: Fix memory corruption
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

virtio-gpu kernel driver, which provides KMS, reports 16 for count_crtcs
which exceeds IGT_MAX_PIPES set to 8. The function igt_display_require
allocates memory for IGT_MAX_PIPES members of igt_pipe_t structures,
but then writes into it based on the count_crtcs reported by the kernel,
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
IGT_MAX_PIPES with debug information. Additionally, update the test
documentation to cover up to 16 pipes, and blacklist tests from
pipe-i to pipe-p on both the XE blocklist and the intel-ci blacklist.

This fix is required for drm-ci to run igt tests on virtio-gpu.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Suggested-by: Daniel Stone <daniels@collabora.com>
Suggested-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 lib/igt_kms.c                   |  6 +++++-
 lib/igt_kms.h                   | 20 +++++++++++++++++++-
 tests/intel-ci/blacklist.txt    | 10 +++++++++-
 tests/intel-ci/xe.blocklist.txt |  6 +++---
 tests/intel/kms_ccs.c           | 24 ++++++++++++++++++++++++
 tests/kms_bw.c                  |  2 +-
 6 files changed, 61 insertions(+), 7 deletions(-)

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
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e13759d3e..e439e2af4 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -117,12 +117,20 @@ igt@gem_ctx_isolation@.*-s4
 ###############################################
 igt@i915_suspend@shrink
 ###############################################
-# pipe-e, pipe-f, pipe-g, pipe-h no current HW support
+# pipe-e, pipe-f, pipe-g, pipe-h, pipe-i, pipe-j, pipe-k, pipe-l, pipe-m, pipe-n, pipe-o, pipe-p no current HW support
 ###############################################
 igt@.*@.*pipe-e($|-.*)
 igt@.*@.*pipe-f($|-.*)
 igt@.*@.*pipe-g($|-.*)
 igt@.*@.*pipe-h($|-.*)
+igt@.*@.*pipe-i($|-.*)
+igt@.*@.*pipe-j($|-.*)
+igt@.*@.*pipe-k($|-.*)
+igt@.*@.*pipe-l($|-.*)
+igt@.*@.*pipe-m($|-.*)
+igt@.*@.*pipe-n($|-.*)
+igt@.*@.*pipe-o($|-.*)
+igt@.*@.*pipe-p($|-.*)
 
 ###############################################
 # Temporary workarounds for CI-impacting bugs
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 135ab18a3..bec6ee23b 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -44,11 +44,11 @@ igt@syncobj_.*
 igt@template
 igt@tools_test
 ##################################################################
-# KMS: Pipe E, F, G and H are not available on Intel hardware,
+# KMS: Pipe E, F, G, H, I, J, K, L, M, N, O and P are not available on Intel hardware,
 # hence can't use more than 4 displays.
 ##################################################################
-igt@.*@.*pipe-(e|f|g|h).*
-igt@kms_bw@.*-(5|6|7|8)-displays-.*
+igt@.*@.*pipe-(e|f|g|h|i|j|k|l|m|n|o|p).*
+igt@kms_bw@.*-(5|6|7|8|9|10|11|12|13|14|15|16)-displays-.*
 ##################################################################
 # KMS: Tests specific to i915 driver
 ##################################################################
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 93e837b84..6dc30ac24 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -53,6 +53,14 @@
  * @pipe-F:                    Pipe F
  * @pipe-G:                    Pipe G
  * @pipe-H:                    Pipe H
+ * @pipe-I:                    Pipe I
+ * @pipe-J:                    Pipe J
+ * @pipe-K:                    Pipe K
+ * @pipe-L:                    Pipe L
+ * @pipe-M:                    Pipe M
+ * @pipe-N:                    Pipe N
+ * @pipe-O:                    Pipe O
+ * @pipe-P:                    Pipe P
  *
  * arg[2]:
  *
@@ -90,6 +98,14 @@
  * @pipe-F:                      Pipe F
  * @pipe-G:                      Pipe G
  * @pipe-H:                      Pipe H
+ * @pipe-I:                      Pipe I
+ * @pipe-J:                      Pipe J
+ * @pipe-K:                      Pipe K
+ * @pipe-L:                      Pipe L
+ * @pipe-M:                      Pipe M
+ * @pipe-N:                      Pipe N
+ * @pipe-O:                      Pipe O
+ * @pipe-P:                      Pipe P
  *
  * arg[2]:
  *
@@ -131,6 +147,14 @@
  * @pipe-F:                      Pipe F
  * @pipe-G:                      Pipe G
  * @pipe-H:                      Pipe H
+ * @pipe-I:                      Pipe I
+ * @pipe-J:                      Pipe J
+ * @pipe-K:                      Pipe K
+ * @pipe-L:                      Pipe L
+ * @pipe-M:                      Pipe M
+ * @pipe-N:                      Pipe N
+ * @pipe-O:                      Pipe O
+ * @pipe-P:                      Pipe P
  *
  * arg[2]:
  *
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 5f9a020da..896114a3a 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -37,7 +37,7 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
  *
  * arg[2]:
  *
-- 
2.40.1
