Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013296E8AA
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 12:45:42 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Mon,  3 May 2021 18:16:43 +0530
Message-Id: <20210503124643.17827-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: copy engines
 for the context
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
To: igt-dev <igt-dev@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For the subtest pi of gem_exec_capture, we are copying the engines for
the context.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
---
 tests/i915/gem_exec_capture.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 3da78d6324ef..76fce4a8c4a4 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -536,13 +536,14 @@ static void prioinv(int fd, int dir, unsigned ring, const char *name)
 
 	igt_assert(pipe(link) == 0);
 	igt_fork(child, 1) {
-		fd = gem_reopen_driver(fd);
+		int i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
 		igt_debug("Submitting large capture [%ld x %dMiB objects]\n",
 			  count, (int)(size >> 20));
-		free(__captureN(fd, dir, ring, size, count, ASYNC));
-		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
-		igt_force_gpu_reset(fd);
-		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
+		free(__captureN(i915, dir, ring, size, count, ASYNC));
+		write(link[1], &i915, sizeof(i915)); /* wake the parent up */
+		igt_force_gpu_reset(i915);
+		write(link[1], &i915, sizeof(i915)); /* wake the parent up */
 	}
 	read(link[0], &dummy, sizeof(dummy));
 	igt_require_f(poll(&(struct pollfd){link[0], POLLIN}, 1, 500) == 0,
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
