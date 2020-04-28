Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA14D6E36F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 13:31:34 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Tue, 28 Apr 2020 19:01:41 +0530
Message-Id: <20200428133141.22275-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]Macros fixes: Removed unused &
 redundant macros
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: ranjeet kumar <ranjeet1.kumar@intel.com>

Local macros has been declared in several files.
Removed local and unused macros from several files.
used macros defined in drm header.

Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>
Cc: Tahvanainen Jari <jari.tahvanainen@intel.com>
Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
---
 benchmarks/gem_blt.c              | 11 ++++------
 benchmarks/gem_busy.c             | 12 +++--------
 benchmarks/gem_create.c           |  7 ++----
 benchmarks/gem_exec_ctx.c         |  7 ++----
 benchmarks/gem_exec_fault.c       | 12 +++--------
 benchmarks/gem_exec_nop.c         | 14 ++++--------
 benchmarks/gem_exec_reloc.c       |  7 ++----
 benchmarks/gem_syslatency.c       | 12 +++--------
 lib/igt_dummyload.c               |  5 +----
 tests/i915/gem_ctx_switch.c       | 11 ++++------
 tests/i915/gem_exec_await.c       | 16 +++++---------
 tests/i915/gem_exec_create.c      | 12 +++--------
 tests/i915/gem_exec_latency.c     | 12 +++--------
 tests/i915/gem_exec_lut_handle.c  | 13 ++++-------
 tests/i915/gem_exec_nop.c         | 36 +++++++++++++------------------
 tests/i915/gem_exec_parallel.c    | 12 +++--------
 tests/i915/gem_exec_reloc.c       | 10 ++-------
 tests/i915/gem_exec_store.c       |  5 +----
 tests/i915/gem_exec_suspend.c     |  5 +----
 tests/i915/gem_exec_whisper.c     | 12 +++--------
 tests/i915/gem_streaming_writes.c | 16 ++++++--------
 tests/i915/gem_sync.c             | 24 ++++++++-------------
 tests/i915/i915_module_load.c     |  6 +-----
 23 files changed, 85 insertions(+), 192 deletions(-)

diff --git a/benchmarks/gem_blt.c b/benchmarks/gem_blt.c
index 6fb72394..5c6d28d3 100644
--- a/benchmarks/gem_blt.c
+++ b/benchmarks/gem_blt.c
@@ -42,9 +42,6 @@
 
 #include "drm.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 #define COPY_BLT_CMD		(2<<29|0x53<<22|0x6)
 #define BLT_WRITE_ALPHA		(1<<21)
 #define BLT_WRITE_RGB		(1<<20)
@@ -229,7 +226,7 @@ static int run(int object, int batch, int time, int reps, int ncpus, unsigned fl
 	execbuf.buffer_count = 3;
 	execbuf.batch_len = len;
 	execbuf.flags = ring;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 
 	if (__gem_execbuf(fd, &execbuf)) {
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
@@ -241,7 +238,7 @@ static int run(int object, int batch, int time, int reps, int ncpus, unsigned fl
 	gem_sync(fd, handle);
 
 	if (batch > 1) {
-		if (execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT) {
+		if (execbuf.flags & I915_EXEC_HANDLE_LUT) {
 			src = 0;
 			dst = 1;
 		}
@@ -258,8 +255,8 @@ static int run(int object, int batch, int time, int reps, int ncpus, unsigned fl
 		gem_execbuf(fd, &execbuf);
 		gem_sync(fd, handle);
 	}
-	if (execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT)
-		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	if (execbuf.flags & I915_EXEC_HANDLE_LUT)
+		execbuf.flags |= I915_EXEC_NO_RELOC;
 
 	/* Guess how many loops we need for 0.1s */
 	count = baseline((uint64_t)object * batch, 100) / ncpus;
diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 405cc9b0..41e86d2b 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -47,13 +47,7 @@
 #include "igt_stats.h"
 #include "i915/gem_mman.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define WRITE 0x1
 #define IDLE 0x2
@@ -193,8 +187,8 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		if (__gem_execbuf(fd, &execbuf))
diff --git a/benchmarks/gem_create.c b/benchmarks/gem_create.c
index bb3e7b64..5dd996c9 100644
--- a/benchmarks/gem_create.c
+++ b/benchmarks/gem_create.c
@@ -47,9 +47,6 @@
 
 #define OBJECT_SIZE (1<<23)
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 static double elapsed(const struct timespec *start,
                         const struct timespec *end)
 {
@@ -70,8 +67,8 @@ static void make_busy(int fd, uint32_t handle)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = (uintptr_t)&gem_exec;
 	execbuf.buffer_count = 1;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
diff --git a/benchmarks/gem_exec_ctx.c b/benchmarks/gem_exec_ctx.c
index e55275f3..a2e8d93e 100644
--- a/benchmarks/gem_exec_ctx.c
+++ b/benchmarks/gem_exec_ctx.c
@@ -48,9 +48,6 @@
 enum mode { NOP, CREATE, SWITCH, DEFAULT };
 #define SYNC 0x1
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 static double elapsed(const struct timespec *start,
 		      const struct timespec *end)
 {
@@ -99,8 +96,8 @@ static int loop(unsigned ring,
 	execbuf.buffers_ptr = (uintptr_t)&obj;
 	execbuf.buffer_count = 1;
 	execbuf.flags = ring;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (mode != DEFAULT) {
 		execbuf.rsvd1 = __gem_context_create_local(fd);
 		if (execbuf.rsvd1 == 0)
diff --git a/benchmarks/gem_exec_fault.c b/benchmarks/gem_exec_fault.c
index 3f58c77d..4bd05372 100644
--- a/benchmarks/gem_exec_fault.c
+++ b/benchmarks/gem_exec_fault.c
@@ -47,13 +47,7 @@
 #include "intel_reg.h"
 #include "igt_stats.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start,
 		      const struct timespec *end)
@@ -88,8 +82,8 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus, unsigned flag
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = (uintptr_t)&obj;
 	execbuf.buffer_count = 1;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		if (__gem_execbuf(fd, &execbuf))
diff --git a/benchmarks/gem_exec_nop.c b/benchmarks/gem_exec_nop.c
index b327e2e8..0f17d232 100644
--- a/benchmarks/gem_exec_nop.c
+++ b/benchmarks/gem_exec_nop.c
@@ -45,13 +45,7 @@
 #include "intel_reg.h"
 #include "igt_stats.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define SYNC 0x1
 #define WRITE 0x2
@@ -95,15 +89,15 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = (uintptr_t)obj;
 	execbuf.buffer_count = 2;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		if (__gem_execbuf(fd, &execbuf))
 			return 77;
 	}
 
-	if (flags & WRITE && !(execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT))
+	if (flags & WRITE && !(execbuf.flags & I915_EXEC_HANDLE_LUT))
 		return 77;
 
 	all_nengine = 0;
diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
index 0a2454cb..a0736b51 100644
--- a/benchmarks/gem_exec_reloc.c
+++ b/benchmarks/gem_exec_reloc.c
@@ -42,9 +42,6 @@
 #include "drmtest.h"
 #include "i915/gem_mman.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 #define SKIP_RELOC 0x1
 #define NO_RELOC 0x2
 #define CYCLE_BATCH 0x4
@@ -131,9 +128,9 @@ static int run(unsigned batch_size,
 	execbuf.buffers_ptr = (uintptr_t)objects;
 	execbuf.buffer_count = num_objects + 1;
 	if (flags & LUT)
-		execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+		execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	if (flags & NO_RELOC)
-		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
 
 	for (n = 0; n < num_relocs; n++) {
 		target[n] = hars_petruska_f54_1_random() % num_objects;
diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 40230630..456b1f4b 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -71,13 +71,7 @@ static void force_low_latency(void)
 			strerror(errno));
 }
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static void *gem_busyspin(void *arg)
 {
@@ -111,8 +105,8 @@ static void *gem_busyspin(void *arg)
 		execbuf.buffers_ptr = (uintptr_t)&obj[1];
 		execbuf.buffer_count = 1;
 	}
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index ae0fb937..da15db96 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -57,10 +57,7 @@
  * consume exactly a specific amount of time.
  */
 
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define MI_ARB_CHK (0x5 << 23)
 
diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
index 5f94dac8..54da9b96 100644
--- a/tests/i915/gem_ctx_switch.c
+++ b/tests/i915/gem_ctx_switch.c
@@ -41,9 +41,6 @@
 #include <time.h>
 #include "drm.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 #define INTERRUPTIBLE 0x1
 #define QUEUE 0x2
 
@@ -152,8 +149,8 @@ static void single(int fd, uint32_t handle,
 	execbuf.buffer_count = 1;
 	execbuf.rsvd1 = contexts[0];
 	execbuf.flags = e2->flags;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e2->flags;
@@ -244,8 +241,8 @@ static void all(int fd, uint32_t handle, unsigned flags, int timeout)
 	execbuf.buffers_ptr = to_user_pointer(obj + 1);
 	execbuf.buffer_count = 1;
 	execbuf.rsvd1 = contexts[0];
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 	gem_sync(fd, handle);
 
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index 7817b483..af70a136 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -31,13 +31,7 @@
 #include <sys/ioctl.h>
 #include <sys/signal.h>
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
 {
@@ -107,8 +101,8 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 		exec[e].execbuf.buffers_ptr = to_user_pointer(exec[e].exec);
 		exec[e].execbuf.buffer_count = 1;
 		exec[e].execbuf.flags = (engines[e] |
-					 LOCAL_I915_EXEC_NO_RELOC |
-					 LOCAL_I915_EXEC_HANDLE_LUT);
+					 I915_EXEC_NO_RELOC |
+					 I915_EXEC_HANDLE_LUT);
 
 		if (flags & CONTEXTS) {
 			exec[e].execbuf.rsvd1 = gem_context_create(fd);
@@ -195,8 +189,8 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		for (unsigned e = 0; e < nengine; e++) {
 			execbuf.flags = (engines[e] |
-					 LOCAL_I915_EXEC_NO_RELOC |
-					 LOCAL_I915_EXEC_HANDLE_LUT);
+					 I915_EXEC_NO_RELOC |
+					 I915_EXEC_HANDLE_LUT);
 			gem_execbuf(fd, &execbuf);
 		}
 		clock_gettime(CLOCK_MONOTONIC, &now);
diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index e3ceb3f5..8e11c9ed 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -40,13 +40,7 @@
 #include <time.h>
 #include "drm.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
 {
@@ -75,8 +69,8 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index d2159f31..c123b0f7 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -47,13 +47,7 @@
 
 #include "i915/gem_ring.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define LIVE 0x1
 #define CORK 0x2
@@ -136,7 +130,7 @@ static void latency_on_ring(int fd,
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 2;
 	execbuf.flags = ring;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC | LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
 
 	memset(obj, 0, sizeof(obj));
 	obj[1].handle = gem_create(fd, 4096);
@@ -288,7 +282,7 @@ static void latency_from_ring(int fd,
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 2;
 	execbuf.flags = ring;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC | LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
 	execbuf.rsvd1 = ctx[1];
 
 	memset(obj, 0, sizeof(obj));
diff --git a/tests/i915/gem_exec_lut_handle.c b/tests/i915/gem_exec_lut_handle.c
index 6f227628..f64285db 100644
--- a/tests/i915/gem_exec_lut_handle.c
+++ b/tests/i915/gem_exec_lut_handle.c
@@ -41,11 +41,6 @@
 IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using the handle LUT"
 		     " interface.");
 
-#define BATCH_SIZE		(1024*1024)
-
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 #define MAX_NUM_EXEC 2048
 #define MAX_NUM_RELOC 4096
 
@@ -74,7 +69,7 @@ static int has_exec_lut(int fd)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer((gem_exec + MAX_NUM_EXEC));
 	execbuf.buffer_count = 1;
-	execbuf.flags = LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags = I915_EXEC_HANDLE_LUT;
 
 	return __gem_execbuf(fd, &execbuf) == 0;
 }
@@ -150,9 +145,9 @@ igt_simple_main
 				memset(&execbuf, 0, sizeof(execbuf));
 				execbuf.buffers_ptr = to_user_pointer(objects);
 				execbuf.buffer_count = n + 1;
-				execbuf.flags = LOCAL_I915_EXEC_HANDLE_LUT;
+				execbuf.flags = I915_EXEC_HANDLE_LUT;
 				if (p->flags & NO_RELOC)
-					execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+					execbuf.flags |= I915_EXEC_NO_RELOC;
 
 				for (j = 0; j < m; j++) {
 					target[j] = hars_petruska_f54_1_random() % n;
@@ -181,7 +176,7 @@ igt_simple_main
 				gem_exec[MAX_NUM_EXEC].handle = cycle[c];
 				elapsed[i][1] = ELAPSED(&start, &end);
 
-				execbuf.flags &= ~LOCAL_I915_EXEC_HANDLE_LUT;
+				execbuf.flags &= ~I915_EXEC_HANDLE_LUT;
 				for (j = 0; j < m; j++)
 					reloc[j].target_handle = objects[target[j]].handle;
 
diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 64ddb3db..6b255b55 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -45,13 +45,7 @@
 #include <time.h>
 #include "drm.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define MAX_PRIO LOCAL_I915_CONTEXT_MAX_USER_PRIORITY
 #define MIN_PRIO LOCAL_I915_CONTEXT_MIN_USER_PRIORITY
@@ -83,8 +77,8 @@ static double nop_on_ring(int fd, uint32_t handle,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
@@ -462,8 +456,8 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -524,8 +518,8 @@ static void independent(int fd, uint32_t handle, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -579,8 +573,8 @@ static void multiple(int fd,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
@@ -651,8 +645,8 @@ static void series(int fd, uint32_t handle, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -747,8 +741,8 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 
 	if (flags & CONTEXT) {
@@ -939,8 +933,8 @@ static void preempt(int fd, uint32_t handle,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 66fe1853..94d35f85 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -32,13 +32,7 @@
 #include "igt.h"
 #include "igt_gt.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define VERIFY 0
 
@@ -121,8 +115,8 @@ static void *thread(void *data)
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.flags = t->engine;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (t->gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
 	if (t->flags & CONTEXTS) {
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 4112e145..a9cd5cfd 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -29,13 +29,7 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl relocations.");
 
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static uint32_t find_last_set(uint64_t x)
 {
@@ -407,7 +401,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	if (flags & NORELOC)
-		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
 
 	for (reloc_offset = 4096 - 8; reloc_offset <= 4096 + 8; reloc_offset += 4) {
 		igt_spin_t *spin = NULL;
diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index 677db6f6..a98e9126 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -32,10 +32,7 @@
 #include "igt_gt.h"
 #include <strings.h>
 
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static void store_dword(int fd, const struct intel_execution_engine2 *e)
 {
diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index f0c53daf..d2bc1c8f 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -43,10 +43,7 @@
 #define HIBERNATE 5
 #define mode(x) ((x) & 0xff)
 
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define UNCACHED (0<<8)
 #define CACHED (1<<8)
diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 153854d1..e6ca47f2 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -34,13 +34,7 @@
 #include "igt_rand.h"
 #include "igt_sysfs.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 #define VERIFY 0
 
@@ -273,8 +267,8 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 			memset(&execbuf, 0, sizeof(execbuf));
 			execbuf.buffers_ptr = to_user_pointer(tmp);
 			execbuf.buffer_count = 2;
-			execbuf.flags = LOCAL_I915_EXEC_HANDLE_LUT;
-			execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+			execbuf.flags = I915_EXEC_HANDLE_LUT;
+			execbuf.flags |= I915_EXEC_NO_RELOC;
 			if (gen < 6)
 				execbuf.flags |= I915_EXEC_SECURE;
 			igt_require(__gem_execbuf(fd, &execbuf) == 0);
diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
index e83d69de..2d6bf3a8 100644
--- a/tests/i915/gem_streaming_writes.c
+++ b/tests/i915/gem_streaming_writes.c
@@ -46,8 +46,6 @@
 #define BLT_WRITE_RGB		(1<<20)
 #define BLT_WRITE_ARGB (BLT_WRITE_ALPHA | BLT_WRITE_RGB)
 
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 IGT_TEST_DESCRIPTION("Test of streaming writes into active GPU sources");
 
 #define SRC 0
@@ -102,7 +100,7 @@ static void test_streaming(int fd, int mode, int sync)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(exec);
 	execbuf.buffer_count = 2;
-	execbuf.flags = LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags = I915_EXEC_HANDLE_LUT;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		igt_require(__gem_execbuf(fd, &execbuf) == 0);
@@ -115,7 +113,7 @@ static void test_streaming(int fd, int mode, int sync)
 	for (i = 0; i < 64; i++) {
 		reloc[2*i+0].offset = 64*i + 4 * sizeof(uint32_t);
 		reloc[2*i+0].delta = 0;
-		reloc[2*i+0].target_handle = execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT ? DST : dst;
+		reloc[2*i+0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
 		reloc[2*i+0].presumed_offset = dst_offset;
 		reloc[2*i+0].read_domains = I915_GEM_DOMAIN_RENDER;
 		reloc[2*i+0].write_domain = I915_GEM_DOMAIN_RENDER;
@@ -124,7 +122,7 @@ static void test_streaming(int fd, int mode, int sync)
 		if (has_64bit_reloc)
 			reloc[2*i+1].offset +=  sizeof(uint32_t);
 		reloc[2*i+1].delta = 0;
-		reloc[2*i+1].target_handle = execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT ? SRC : src;
+		reloc[2*i+1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
 		reloc[2*i+1].presumed_offset = src_offset;
 		reloc[2*i+1].read_domains = I915_GEM_DOMAIN_RENDER;
 		reloc[2*i+1].write_domain = 0;
@@ -256,7 +254,7 @@ static void test_batch(int fd, int mode, int reverse)
 	memset(reloc, 0, sizeof(reloc));
 	reloc[0].offset =  4 * sizeof(uint32_t);
 	reloc[0].delta = 0;
-	reloc[0].target_handle = execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT ? DST : dst;
+	reloc[0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
 	reloc[0].presumed_offset = dst_offset;
 	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
@@ -265,7 +263,7 @@ static void test_batch(int fd, int mode, int reverse)
 	if (has_64bit_reloc)
 		reloc[1].offset +=  sizeof(uint32_t);
 	reloc[1].delta = 0;
-	reloc[1].target_handle = execbuf.flags & LOCAL_I915_EXEC_HANDLE_LUT ? SRC : src;
+	reloc[1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
 	reloc[1].presumed_offset = src_offset;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[1].write_domain = 0;
@@ -296,11 +294,11 @@ static void test_batch(int fd, int mode, int reverse)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(exec);
 	execbuf.buffer_count = 3;
-	execbuf.flags = LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags = I915_EXEC_HANDLE_LUT;
 	if (gem_has_blt(fd))
 		execbuf.flags |= I915_EXEC_BLT;
 	if (__gem_execbuf(fd, &execbuf)) {
-		execbuf.flags &= ~LOCAL_I915_EXEC_HANDLE_LUT;
+		execbuf.flags &= ~I915_EXEC_HANDLE_LUT;
 		gem_execbuf(fd, &execbuf);
 	}
 	execbuf.flags |= I915_EXEC_NO_RELOC;
diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index b50ad4f2..feca7447 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -30,16 +30,10 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 
-#define LOCAL_I915_EXEC_NO_RELOC (1<<11)
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
 #define MAX_PRIO LOCAL_I915_CONTEXT_MAX_USER_PRIORITY
 #define MIN_PRIO LOCAL_I915_CONTEXT_MIN_USER_PRIORITY
 
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 IGT_TEST_DESCRIPTION("Basic check of ring<->ring write synchronisation.");
 
@@ -516,8 +510,8 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(object);
 		execbuf.flags = ied_flags(&ied, child);
-		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
-		execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+		execbuf.flags |= I915_EXEC_HANDLE_LUT;
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
 
@@ -620,8 +614,8 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			memset(&c->execbuf, 0, sizeof(c->execbuf));
 			c->execbuf.buffers_ptr = to_user_pointer(c->object);
 			c->execbuf.flags = ied_flags(&ied, child);
-			c->execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
-			c->execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+			c->execbuf.flags |= I915_EXEC_NO_RELOC;
+			c->execbuf.flags |= I915_EXEC_HANDLE_LUT;
 			if (gen < 6)
 				c->execbuf.flags |= I915_EXEC_SECURE;
 			c->execbuf.rsvd1 = gem_context_create(fd);
@@ -784,8 +778,8 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(object);
 	execbuf.flags = ring;
-	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
-	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
 
@@ -994,8 +988,8 @@ store_all(int fd, int num_children, int timeout)
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(object);
-		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
-		execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+		execbuf.flags |= I915_EXEC_HANDLE_LUT;
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
 
diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 7d9a5cfd..77aaac5c 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -36,11 +36,7 @@
 #include <sys/ioctl.h>
 #include <fcntl.h>
 
-
-#define LOCAL_I915_EXEC_BSD_SHIFT      (13)
-#define LOCAL_I915_EXEC_BSD_MASK       (3 << LOCAL_I915_EXEC_BSD_SHIFT)
-
-#define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static void store_dword(int fd, unsigned ring)
 {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
