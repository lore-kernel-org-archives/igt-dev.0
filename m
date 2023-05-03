Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86C810E0DA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 May 2023 19:00:23 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Date: Wed,  3 May 2023 15:59:46 -0300
Message-Id: <20230503185946.107012-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Check if is Intel device
 before doing all the setup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The tests bo-too-big and bo-too-big-interruptible should only run on
Intel devices. Instead of checking this condition after doing all the
setup, check this condition in the beginning of the test.

Checking if is an Intel device in the beginning of the test will also
avoid the following error, which occurs in non-Intel devices when
running the test bo-too-big:

(kms_flip:1641) igt_kms-CRITICAL: Test assertion failure function kmstest_set_connector_dpms, file ../lib/igt_kms.c:1960:
(kms_flip:1641) igt_kms-CRITICAL: Failed assertion: found_it
(kms_flip:1641) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
(kms_flip:1641) igt_kms-CRITICAL: DPMS property not found on 36
Stack trace:
    #0 ../lib/igt_core.c:1963 __igt_fail_assert()
    #1 ../lib/igt_kms.c:1960 kmstest_set_connector_dpms()
    #2 ../lib/igt_core.c:2831 igt_atexit_handler()
    #3 /usr/src/debug/glibc-2.36-9.fc37.x86_64/stdlib/exit.c:114 __run_exit_handlers()
    #4 /usr/src/debug/glibc-2.36-9.fc37.x86_64/stdlib/fmtmsg.c:292 internal_addseverity()
    #5 ../lib/igt_core.c:2297 igt_exit()
    #6 [main+0x32]
    #7 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
    #8 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
    #9 [_start+0x25]

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_flip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index e4c98b8e..ed5615e8 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1354,7 +1354,6 @@ restart:
 	/* 256 MB is usually the maximum mappable aperture,
 	 * (make it 4x times that to ensure failure) */
 	if (o->flags & TEST_BO_TOOBIG) {
-		igt_skip_on(!is_intel_device(drm_fd));
 		bo_size = 4*gem_mappable_aperture_size(drm_fd);
 
 		if (is_i915_device(drm_fd))
@@ -1571,6 +1570,9 @@ static void run_test(int duration, int flags)
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
 		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
+	if (flags & TEST_BO_TOOBIG)
+		igt_require(is_intel_device(drm_fd));
+
 	resources = drmModeGetResources(drm_fd);
 	igt_require(resources);
 
-- 
2.40.1
