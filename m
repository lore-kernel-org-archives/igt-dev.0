Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  6 Apr 2020 10:20:24 +0100
Message-Id: <20200406092024.1640627-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/suspend: Suspend once before taking
 forcewake to confirm suspend
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

If we take the user-forcewake and then exit, we find outselves in a
deadlock as the atexit handlers wait for our own forcewake to be
released. We could either not use the automatically attached exit
handler (__drm_open_driver), more carefully unwind the exit handler, or
simply avoid doing late requirement checks. This patch does the later by
testing for working suspend prior to taking the user-forcewake.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1637
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_suspend.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 47e134b12..83a4fa546 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -186,17 +186,16 @@ test_shrink(int fd, unsigned int mode)
 static void
 test_forcewake(int fd, bool hibernate)
 {
+	int suspend = hibernate ? SUSPEND_STATE_DISK : SUSPEND_STATE_MEM;
 	int fw_fd;
 
+	/* Once before to verify we can suspend */
+	igt_system_suspend_autoresume(suspend, SUSPEND_TEST_NONE);
+
 	fw_fd = igt_open_forcewake_handle(fd);
 	igt_assert_lte(0, fw_fd);
 
-	if (hibernate)
-		igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
-					      SUSPEND_TEST_NONE);
-	else
-		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-					      SUSPEND_TEST_NONE);
+	igt_system_suspend_autoresume(suspend, SUSPEND_TEST_NONE);
 
 	close (fw_fd);
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
