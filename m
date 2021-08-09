Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DAB899BC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:04:37 +0200
Message-Id: <20210809130533.27759-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 09/65] tests/gem_busy: Adopt to use
 allocator
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

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_busy.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index f0fca0e8a..b107734c1 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -108,6 +108,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
 	uint32_t handle[3];
 	uint32_t read, write;
 	uint32_t active;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	unsigned i;
 
 	handle[TEST] = gem_create(fd, 4096);
@@ -117,6 +118,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
 	/* Create a long running batch which we can use to hog the GPU */
 	handle[BUSY] = gem_create(fd, 4096);
 	spin = igt_spin_new(fd,
+			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
 			    .dependency = handle[BUSY]);
@@ -149,6 +151,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
 	/* Check that our long batch was long enough */
 	igt_assert(still_busy(fd, handle[BUSY]));
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 
 	/* And make sure it becomes idle again */
 	gem_sync(fd, handle[TEST]);
@@ -171,8 +174,10 @@ static void one(int fd, const intel_ctx_t *ctx,
 	struct timespec tv;
 	igt_spin_t *spin;
 	int timeout;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	spin = igt_spin_new(fd,
+			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
 			    .dependency = scratch,
@@ -225,6 +230,7 @@ static void one(int fd, const intel_ctx_t *ctx,
 
 	igt_spin_free(fd, spin);
 	gem_close(fd, scratch);
+	put_ahnd(ahnd);
 }
 
 static void xchg_u32(void *array, unsigned i, unsigned j)
@@ -298,11 +304,13 @@ static void close_race(int fd, const intel_ctx_t *ctx)
 		struct sched_param rt = {.sched_priority = 99 };
 		igt_spin_t *spin[nhandles];
 		unsigned long count = 0;
+		uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 		igt_assert(sched_setscheduler(getpid(), SCHED_RR, &rt) == 0);
 
 		for (i = 0; i < nhandles; i++) {
 			spin[i] = __igt_spin_new(fd,
+						 .ahnd = ahnd,
 						 .ctx = ctx,
 						 .engine = engines[rand() % nengine]);
 			handles[i] = spin[i]->handle;
@@ -312,6 +320,7 @@ static void close_race(int fd, const intel_ctx_t *ctx)
 			for (i = 0; i < nhandles; i++) {
 				igt_spin_free(fd, spin[i]);
 				spin[i] = __igt_spin_new(fd,
+							 .ahnd = ahnd,
 							 .ctx = ctx,
 							 .engine = engines[rand() % nengine]);
 				handles[i] = spin[i]->handle;
@@ -324,6 +333,7 @@ static void close_race(int fd, const intel_ctx_t *ctx)
 
 		for (i = 0; i < nhandles; i++)
 			igt_spin_free(fd, spin[i]);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren();
 
@@ -355,11 +365,13 @@ static bool has_semaphores(int fd)
 
 static bool has_extended_busy_ioctl(int fd)
 {
-	igt_spin_t *spin = igt_spin_new(fd, .engine = I915_EXEC_DEFAULT);
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd, .engine = I915_EXEC_DEFAULT);
 	uint32_t read, write;
 
 	__gem_busy(fd, spin->handle, &read, &write);
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 
 	return read != 0;
 }
@@ -367,8 +379,10 @@ static bool has_extended_busy_ioctl(int fd)
 static void basic(int fd, const intel_ctx_t *ctx,
 		  const struct intel_execution_engine2 *e, unsigned flags)
 {
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	igt_spin_t *spin =
 		igt_spin_new(fd,
+			     .ahnd = ahnd,
 			     .ctx = ctx,
 			     .engine = e->flags,
 			     .flags = flags & HANG ?
@@ -394,6 +408,7 @@ static void basic(int fd, const intel_ctx_t *ctx,
 	}
 
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 }
 
 static void all(int i915, const intel_ctx_t *ctx)
@@ -428,6 +443,7 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
+			intel_allocator_multiprocess_start();
 			igt_fork_hang_detector(fd);
 		}
 
@@ -445,6 +461,21 @@ igt_main
 			}
 		}
 
+		igt_subtest("close-race")
+			close_race(fd, ctx);
+
+		igt_fixture {
+			igt_stop_hang_detector();
+			intel_allocator_multiprocess_stop();
+		}
+	}
+
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_fork_hang_detector(fd);
+		}
+
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_extended_busy_ioctl(fd));
@@ -477,9 +508,6 @@ igt_main
 			}
 		}
 
-		igt_subtest("close-race")
-			close_race(fd, ctx);
-
 		igt_fixture {
 			igt_stop_hang_detector();
 		}
-- 
2.26.0
