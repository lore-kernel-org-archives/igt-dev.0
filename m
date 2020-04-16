Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB036E2B6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 06:10:24 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 16 Apr 2020 09:10:14 +0300
Message-Id: <20200416061014.16130-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_legacy: Wait for an
 extra vblank
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

v2: Wait out for max 5 seconds for commit busyness (Juha-Pekka)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_cursor_legacy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index d5f95b8d..6467e646 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -927,7 +927,11 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 
 		if (ret == -EBUSY) {
 			/* Force completion on both pipes, and generate event. */
-			igt_display_commit_atomic(display, flags, NULL);
+			while (ret == -EBUSY) {
+				igt_set_timeout(5, "stuck with -EBUSY");
+				igt_wait_for_vblank(display->drm_fd, pipe);
+				ret = igt_display_try_commit_atomic(display, flags, NULL);
+			}
 
 			while (nloops--) {
 				shared[1] = nloops & 1;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
