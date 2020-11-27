Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 27 Nov 2020 21:29:22 +0000
Message-Id: <20201127212922.865538-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201127212605.860635-1-chris@chris-wilson.co.uk>
References: <20201127212605.860635-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_capture: Trim the blocking
 workload
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

While we want the capture to last long enough to delay the concurrent
client, we don't want to wait forever for the capture to complete to
proceed with the testing.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2559
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_capture.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index cb0d3151b..3da78d632 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -21,6 +21,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <sys/poll.h>
 #include <zlib.h>
 
 #include "i915/gem.h"
@@ -524,6 +525,7 @@ static void prioinv(int fd, int dir, unsigned ring, const char *name)
 		  gtt, ram);
 
 	count = min(gtt, ram) / 4;
+	count = min(count, 256); /* Keep the duration within reason */
 	igt_require(count > 1);
 
 	intel_require_memory(count, size, CHECK_RAM);
@@ -535,18 +537,26 @@ static void prioinv(int fd, int dir, unsigned ring, const char *name)
 	igt_assert(pipe(link) == 0);
 	igt_fork(child, 1) {
 		fd = gem_reopen_driver(fd);
-		igt_debug("Submitting large hang + capture\n");
+		igt_debug("Submitting large capture [%ld x %dMiB objects]\n",
+			  count, (int)(size >> 20));
 		free(__captureN(fd, dir, ring, size, count, ASYNC));
 		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
 		igt_force_gpu_reset(fd);
+		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
 	}
 	read(link[0], &dummy, sizeof(dummy));
+	igt_require_f(poll(&(struct pollfd){link[0], POLLIN}, 1, 500) == 0,
+		      "Capture completed too quickly! Will not block\n");
 
 	igt_debug("Submitting nop\n");
 	gem_execbuf(fd, &execbuf);
 	igt_assert_eq(gem_wait(fd, obj.handle, &timeout), 0);
 	gem_close(fd, obj.handle);
 
+	igt_assert_f(poll(&(struct pollfd){link[0], POLLIN}, 1, 0) == 0,
+		     "Capture completed before nop!\n");
+
+	igt_debug("Waiting for capture/reset to complete\n");
 	igt_waitchildren();
 	close(link[0]);
 	close(link[1]);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
