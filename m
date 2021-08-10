Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C2E6E048
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:53:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:52:45 +0200
Message-Id: <20210810105323.31375-17-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 16/54] tests/gem_eio: Adopt to use
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
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_eio.c | 60 +++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 76a15274e..d9ff1981a 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -174,10 +174,11 @@ static int __gem_wait(int fd, uint32_t handle, int64_t timeout)
 	return err;
 }
 
-static igt_spin_t * __spin_poll(int fd, const intel_ctx_t *ctx,
-				unsigned long flags)
+static igt_spin_t *__spin_poll(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			       unsigned long flags)
 {
 	struct igt_spin_factory opts = {
+		.ahnd = ahnd,
 		.ctx = ctx,
 		.engine = flags,
 		.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT,
@@ -206,10 +207,10 @@ static void __spin_wait(int fd, igt_spin_t *spin)
 	}
 }
 
-static igt_spin_t * spin_sync(int fd, const intel_ctx_t *ctx,
-			      unsigned long flags)
+static igt_spin_t *spin_sync(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			     unsigned long flags)
 {
-	igt_spin_t *spin = __spin_poll(fd, ctx, flags);
+	igt_spin_t *spin = __spin_poll(fd, ahnd, ctx, flags);
 
 	__spin_wait(fd, spin);
 
@@ -346,6 +347,7 @@ static void __test_banned(int fd)
 
 	igt_until_timeout(5) {
 		igt_spin_t *hang;
+		uint64_t ahnd;
 
 		if (__gem_execbuf(fd, &execbuf) == -EIO) {
 			uint32_t ctx = 0;
@@ -366,9 +368,11 @@ static void __test_banned(int fd)
 		}
 
 		/* Trigger a reset, making sure we are detected as guilty */
-		hang = spin_sync(fd, intel_ctx_0(fd), 0);
+		ahnd = get_reloc_ahnd(fd, 0);
+		hang = spin_sync(fd, ahnd, intel_ctx_0(fd), 0);
 		trigger_reset(fd);
 		igt_spin_free(fd, hang);
+		put_ahnd(ahnd);
 
 		count++;
 	}
@@ -428,6 +432,7 @@ static void test_banned(int fd)
 static void test_wait(int fd, unsigned int flags, unsigned int wait)
 {
 	igt_spin_t *hang;
+	uint64_t ahnd;
 
 	fd = reopen_device(fd);
 
@@ -441,12 +446,14 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 	else
 		igt_require(i915_reset_control(fd, true));
 
-	hang = spin_sync(fd, intel_ctx_0(fd), I915_EXEC_DEFAULT);
+	ahnd = get_reloc_ahnd(fd, 0);
+	hang = spin_sync(fd, ahnd, intel_ctx_0(fd), I915_EXEC_DEFAULT);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
 	check_wait(fd, hang->handle, wait, NULL);
 
 	igt_spin_free(fd, hang);
+	put_ahnd(ahnd);
 
 	igt_require(i915_reset_control(fd, true));
 
@@ -490,8 +497,10 @@ static void test_inflight(int fd, unsigned int wait)
 		struct drm_i915_gem_exec_object2 obj[2];
 		struct drm_i915_gem_execbuffer2 execbuf;
 		igt_spin_t *hang;
+		uint64_t ahnd;
 
 		fd = reopen_device(parent_fd);
+		ahnd = get_reloc_ahnd(fd, 0);
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].flags = EXEC_OBJECT_WRITE;
@@ -502,7 +511,7 @@ static void test_inflight(int fd, unsigned int wait)
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
 		igt_require(i915_reset_control(fd, false));
 
-		hang = spin_sync(fd, intel_ctx_0(fd), eb_ring(e));
+		hang = spin_sync(fd, ahnd, intel_ctx_0(fd), eb_ring(e));
 		obj[0].handle = hang->handle;
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -524,6 +533,7 @@ static void test_inflight(int fd, unsigned int wait)
 			close(fence[n]);
 		}
 		igt_spin_free(fd, hang);
+		put_ahnd(ahnd);
 
 		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
@@ -541,6 +551,7 @@ static void test_inflight_suspend(int fd)
 	int fence[64]; /* mostly conservative estimate of ring size */
 	igt_spin_t *hang;
 	int max;
+	uint64_t ahnd;
 
 	/* Do a suspend first so that we don't skip inside the test */
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_DEVICES);
@@ -553,13 +564,14 @@ static void test_inflight_suspend(int fd)
 	fd = reopen_device(fd);
 	igt_require(gem_has_exec_fence(fd));
 	igt_require(i915_reset_control(fd, false));
+	ahnd = get_reloc_ahnd(fd, 0);
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_WRITE;
 	obj[1].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 
-	hang = spin_sync(fd, intel_ctx_0(fd), 0);
+	hang = spin_sync(fd, ahnd, intel_ctx_0(fd), 0);
 	obj[0].handle = hang->handle;
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -584,6 +596,7 @@ static void test_inflight_suspend(int fd)
 		close(fence[n]);
 	}
 	igt_spin_free(fd, hang);
+	put_ahnd(ahnd);
 
 	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
@@ -624,6 +637,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		igt_spin_t *hang;
 		const intel_ctx_t *ctx[64];
 		int fence[64];
+		uint64_t ahnd;
 
 		fd = reopen_device(parent_fd);
 
@@ -640,7 +654,8 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		obj[1].handle = gem_create(fd, 4096);
 		gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 
-		hang = spin_sync(fd, intel_ctx_0(fd), eb_ring(e));
+		ahnd = get_reloc_ahnd(fd, 0);
+		hang = spin_sync(fd, ahnd, intel_ctx_0(fd), eb_ring(e));
 		obj[0].handle = hang->handle;
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -667,6 +682,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		}
 		igt_spin_free(fd, hang);
 		gem_close(fd, obj[1].handle);
+		put_ahnd(ahnd);
 
 		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
@@ -685,6 +701,7 @@ static void test_inflight_external(int fd)
 	struct drm_i915_gem_exec_object2 obj;
 	igt_spin_t *hang;
 	uint32_t fence;
+	uint64_t ahnd;
 	IGT_CORK_FENCE(cork);
 
 	fd = reopen_device(fd);
@@ -694,7 +711,8 @@ static void test_inflight_external(int fd)
 	fence = igt_cork_plug(&cork, fd);
 
 	igt_require(i915_reset_control(fd, false));
-	hang = __spin_poll(fd, intel_ctx_0(fd), 0);
+	ahnd = get_reloc_ahnd(fd, 0);
+	hang = __spin_poll(fd, ahnd, intel_ctx_0(fd), 0);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -725,6 +743,7 @@ static void test_inflight_external(int fd)
 	close(fence);
 
 	igt_spin_free(fd, hang);
+	put_ahnd(ahnd);
 	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
@@ -738,11 +757,13 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	int fences[I915_EXEC_RING_MASK + 1];
 	unsigned nfence = 0;
 	igt_spin_t *hang;
+	uint64_t ahnd;
 
 	fd = reopen_device(fd);
 	igt_require(gem_has_exec_fence(fd));
 	igt_require(i915_reset_control(fd, false));
-	hang = spin_sync(fd, intel_ctx_0(fd), 0);
+	ahnd = get_reloc_ahnd(fd, 0);
+	hang = spin_sync(fd, ahnd, intel_ctx_0(fd), 0);
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = hang->handle;
@@ -771,13 +792,14 @@ static void test_inflight_internal(int fd, unsigned int wait)
 		close(fences[nfence]);
 	}
 	igt_spin_free(fd, hang);
+	put_ahnd(ahnd);
 
 	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
 
-static void reset_stress(int fd, const intel_ctx_t *ctx0,
+static void reset_stress(int fd, uint64_t ahnd, const intel_ctx_t *ctx0,
 			 const char *name, unsigned int engine,
 			 unsigned int flags)
 {
@@ -815,7 +837,7 @@ static void reset_stress(int fd, const intel_ctx_t *ctx0,
 		 * Start executing a spin batch with some queued batches
 		 * against a different context after it.
 		 */
-		hang = spin_sync(fd, ctx0, engine);
+		hang = spin_sync(fd, ahnd, ctx0, engine);
 
 		execbuf.rsvd1 = ctx->id;
 		for (i = 0; i < max; i++)
@@ -863,11 +885,13 @@ static void reset_stress(int fd, const intel_ctx_t *ctx0,
 static void test_reset_stress(int fd, unsigned int flags)
 {
 	const intel_ctx_t *ctx0 = context_create_safe(fd);
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx0->id);
 
 	for_each_ring(e, fd)
-		reset_stress(fd, ctx0, e->name, eb_ring(e), flags);
+		reset_stress(fd, ahnd, ctx0, e->name, eb_ring(e), flags);
 
 	intel_ctx_destroy(fd, ctx0);
+	put_ahnd(ahnd);
 }
 
 /*
@@ -928,13 +952,15 @@ static void test_kms(int i915, igt_display_t *dpy)
 	test_inflight(i915, 0);
 	if (gem_has_contexts(i915)) {
 		const intel_ctx_t *ctx = context_create_safe(i915);
+		uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
-		reset_stress(i915, ctx,
+		reset_stress(i915, ahnd, ctx,
 			     "default", I915_EXEC_DEFAULT, 0);
-		reset_stress(i915, ctx,
+		reset_stress(i915, ahnd, ctx,
 			     "default", I915_EXEC_DEFAULT, TEST_WEDGE);
 
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 	}
 
 	*shared = 1;
-- 
2.26.0
