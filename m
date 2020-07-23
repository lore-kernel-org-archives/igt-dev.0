Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FFC6E16D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 11:16:28 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 23 Jul 2020 14:16:14 +0300
Message-ID: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_atomic_transition: Add
 explicit curly brackets
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

To clean up a bit and get rid of compilation warnings.

Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 tests/kms_atomic_transition.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index f54591e6..a71bbe10 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -788,8 +788,9 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 
 			if (fencing)
 				igt_pipe_request_out_fence(&display->pipes[i]);
-		} else
+		} else {
 			igt_plane_set_fb(plane, NULL);
+		}
 	}
 
 	iter_max = 1 << j;
@@ -859,9 +860,10 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 	set_combinations(display, 0, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	if (is_i915_device(display->drm_fd))
+	if (is_i915_device(display->drm_fd)) {
 		for_each_pipe(display, i)
 			igt_pipe_crc_free(pipe_crcs[i]);
+	}
 
 	igt_remove_fb(display->drm_fd, &fbs[1]);
 	igt_remove_fb(display->drm_fd, &fbs[0]);
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
