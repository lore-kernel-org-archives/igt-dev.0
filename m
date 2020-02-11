Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 11 Feb 2020 00:37:42 +0000
Message-Id: <20200211003742.863630-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_nop: Keep a copy of the names
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The engine names are now stored inside the iterator and not as static
strings. If we wish to use them later, we need to make a copy.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_exec_nop.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index ed9568e5a..fc7f11827 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -436,7 +436,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	unsigned engines[16];
-	const char *names[16];
+	char *names[16];
 	unsigned nengine;
 	unsigned long count;
 	double time, sum;
@@ -445,7 +445,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	nengine = 0;
 	__for_each_physical_engine(fd, e) {
 		engines[nengine] = e->flags;
-		names[nengine++] = e->name;
+		names[nengine++] = strdup(e->name);
 
 		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		sum += time;
@@ -485,10 +485,11 @@ static void parallel(int fd, uint32_t handle, int timeout)
 		time = elapsed(&start, &now) / count;
 		igt_info("%s: %ld cycles, %.3fus\n", names[child], count, 1e6*time);
 	}
+	while (nengine--)
+		free(names[nengine]);
 
 	igt_waitchildren();
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
-
 }
 
 static void series(int fd, uint32_t handle, int timeout)
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
