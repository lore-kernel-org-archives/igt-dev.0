Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF526E85F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:54:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  8 Oct 2021 08:54:32 +0200
Message-Id: <20211008065432.15482-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] benchmarks/gem_exec_fault: Add softpin
 mode to support gens with ppgtt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Alignment trick doesn't work properly for ppgtt gens - kernel is able
to keep previous offset and doesn't call unbind/bind. With softpin
on ppgtt we're able to enforce rebind and benchmark should behave
correctly on such gens.

To avoid inaccurate results kernel CONFIG_PROVE_LOCKING should be set
to N, otherwise kernel can call unbind/bind for same offset more than
one (backoff is not visible from userspace).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/gem_exec_fault.c | 47 +++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/benchmarks/gem_exec_fault.c b/benchmarks/gem_exec_fault.c
index fe940b44c..40f11f4f1 100644
--- a/benchmarks/gem_exec_fault.c
+++ b/benchmarks/gem_exec_fault.c
@@ -43,7 +43,9 @@
 #include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
+#include "i915/gem_submission.h"
 #include "igt_stats.h"
+#include "intel_allocator.h"
 #include "intel_io.h"
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
@@ -74,11 +76,28 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 	unsigned nengine;
 	double *shared;
 	int fd;
+	bool has_ppgtt;
 
 	shared = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 
 	fd = drm_open_driver(DRIVER_INTEL);
 
+	/*
+	 * For older gens .alignment = 1ull << 63 lead do bind/unbind,
+	 * what doesn't work for newer gens with ppgtt.
+	 * For ppgtt case we use reloc allocator which would just assigns
+	 * new offset for each batch. This way we enforce bind/unbind vma
+	 * for each execbuf.
+	 */
+	has_ppgtt = gem_uses_full_ppgtt(fd);
+	if (has_ppgtt) {
+		igt_info("Using softpin mode\n");
+		intel_allocator_multiprocess_start();
+	} else {
+		igt_assert(gem_allows_passing_alignment(fd));
+		igt_info("Using alignment mode\n");
+	}
+
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = batch(fd, 4096);
 
@@ -92,6 +111,7 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 		if (__gem_execbuf(fd, &execbuf))
 			return 77;
 	}
+
 	/* let the small object leak; ideally blocking the low address */
 
 	nengine = 0;
@@ -106,7 +126,7 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 		engines[nengine++] = ring;
 
 	if (size > 1ul << 31)
-		obj.flags |= 1 << 3;
+		obj.flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	while (reps--) {
 		memset(shared, 0, 4096);
@@ -114,10 +134,14 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 		igt_fork(child, ncpus) {
 			struct timespec start, end;
 			unsigned count = 0;
+			uint64_t ahnd = 0;
 
 			obj.handle = batch(fd, size);
 			obj.offset = -1;
 
+			if (has_ppgtt)
+				ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
 			clock_gettime(CLOCK_MONOTONIC, &start);
 			do {
 				for (int inner = 0; inner < 1024; inner++) {
@@ -127,9 +151,14 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 					obj.alignment = 0;
 					gem_execbuf(fd, &execbuf);
 
-					/* fault out */
-					obj.alignment = 1ull << 63;
-					__gem_execbuf(fd, &execbuf);
+					if (ahnd) {
+						obj.offset = get_offset(ahnd, obj.handle, size, 0);
+						obj.flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+					} else {
+						/* fault out */
+						obj.alignment = 1ull << 63;
+						__gem_execbuf(fd, &execbuf);
+					}
 
 					clock_gettime(CLOCK_MONOTONIC, &end);
 					if (elapsed(&start, &end) >= timeout) {
@@ -144,6 +173,8 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 			shared[child] = 1e6*elapsed(&start, &end) / count / 2;
 
 			gem_close(fd, obj.handle);
+			if (ahnd)
+				intel_allocator_close(ahnd);
 		}
 		igt_waitchildren();
 
@@ -151,9 +182,17 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
 			shared[ncpus] += shared[child];
 		printf("%7.3f\n", shared[ncpus] / ncpus);
 	}
+
+	if (has_ppgtt)
+		intel_allocator_multiprocess_stop();
+
 	return 0;
 }
 
+/*
+ * NOTE: Ensure prove locking in the kernel is off, otherwise results
+ * would be inaccurate.
+ */
 int main(int argc, char **argv)
 {
 	unsigned ring = I915_EXEC_RENDER;
-- 
2.26.0
