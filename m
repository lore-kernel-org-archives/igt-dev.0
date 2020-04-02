Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBC96EA53
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2020 11:07:33 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu,  2 Apr 2020 14:07:29 +0300
Message-Id: <20200402110729.18305-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Wait for an extra
 vblank
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
List-ID: <igt-dev@lists.freedesktop.org>

kms_cursor_legacy IGT subtest 2x-nonblocking-modeset-vs-cursor-atomic
is failing due to busyness while trying to do atomic commit. In case,
we are busy, let's just wait one extra vblank before continuing the
test.

References: https://gitlab.freedesktop.org/drm/intel/issues/1062

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index d5f95b8d..13aadcce 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -894,7 +894,6 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 
 	arg2[1].x = arg2[1].y = 192;
 
-
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_fork(child, 2) {
@@ -927,6 +926,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 
 		if (ret == -EBUSY) {
 			/* Force completion on both pipes, and generate event. */
+			igt_wait_for_vblank(display->drm_fd, pipe);
 			igt_display_commit_atomic(display, flags, NULL);
 
 			while (nloops--) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
