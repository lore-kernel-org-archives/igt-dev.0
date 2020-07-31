Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 31 Jul 2020 10:15:48 +0100
Message-Id: <20200731091548.815898-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_ringsize: Manually control
 timeout
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Manually setup the signal handler for SIGARLM so that we can dump some
debug information for test failures.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_ringsize.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_ctx_ringsize.c b/tests/i915/gem_ctx_ringsize.c
index c8e661472..4530b242f 100644
--- a/tests/i915/gem_ctx_ringsize.c
+++ b/tests/i915/gem_ctx_ringsize.c
@@ -25,6 +25,7 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <math.h>
+#include <signal.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
 #include <unistd.h>
@@ -214,6 +215,10 @@ static uint32_t batch_create(int i915)
 	return __batch_create(i915, 0);
 }
 
+static void sighandler(int sig)
+{
+}
+
 static unsigned int measure_inflight(int i915, unsigned int engine, int timeout)
 {
 	IGT_CORK_FENCE(cork);
@@ -230,15 +235,18 @@ static unsigned int measure_inflight(int i915, unsigned int engine, int timeout)
 	int err;
 
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
-	igt_set_timeout(timeout, "execbuf blocked!");
+	signal(SIGALRM, sighandler);
+	alarm(timeout);
 
 	gem_execbuf(i915, &execbuf);
 	for (count = 1; (err = __execbuf(i915, &execbuf)) == 0; count++)
 		;
+	igt_debugfs_dump(i915, "i915_engine_info");
 	igt_assert_eq(err, -EWOULDBLOCK);
 	close(execbuf.rsvd2);
 
-	igt_reset_timeout();
+	alarm(0);
+	signal(SIGALRM, SIG_DFL);
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
 
 	igt_cork_unplug(&cork);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
