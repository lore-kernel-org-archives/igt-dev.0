Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE9E6E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:00 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id v7so2502564pgl.2
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:17 -0500
Message-Id: <20210707144643.181001-6-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 55/81] lib/i915/submission: Rework
 gem_test_all_engines to use intel_ctx_t (v2)
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

This function used to be called gem_test_engine but it's only ever used
to test all the engines in the GPU so we rename it for the one thing
it's used for.  We also convert to intel_ctx_t.  It now creates a new
context with all physical engines and iterates over all the engines in
it.

v2 (Ashutosh Dixit):
 - Delete the now non-existent @engine param from the docs

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_submission.c | 20 ++++++++------------
 lib/i915/gem_submission.h |  2 +-
 tests/i915/gem_eio.c      |  2 +-
 tests/i915/i915_pm_rpm.c  |  2 +-
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 7c305d6d6..9c6cc8146 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -177,20 +177,22 @@ static bool is_wedged(int i915)
 }
 
 /**
- * gem_test_engine:
+ * gem_test_all_engines:
  * @i915: open i915 drm file descriptor
- * @engine: the engine (I915_EXEC_RING id) to exercise
  *
  * Execute a nop batch on the engine specified, or ALL_ENGINES for all,
  * and check it executes.
  */
-void gem_test_engine(int i915, unsigned int engine)
+void gem_test_all_engines(int i915)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
+	const struct intel_execution_engine2 *e2;
 	struct drm_i915_gem_exec_object2 obj = { };
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
+		.rsvd1 = ctx->id,
 	};
 
 	i915 = gem_reopen_driver(i915);
@@ -199,21 +201,15 @@ void gem_test_engine(int i915, unsigned int engine)
 	obj.handle = gem_create(i915, 4096);
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
-	if (engine == ALL_ENGINES) {
-		const struct intel_execution_engine2 *e2;
-
-		__for_each_physical_engine(i915, e2) {
-			execbuf.flags = e2->flags;
-			gem_execbuf(i915, &execbuf);
-		}
-	} else {
-		execbuf.flags = engine;
+	for_each_ctx_engine(i915, ctx, e2) {
+		execbuf.flags = e2->flags;
 		gem_execbuf(i915, &execbuf);
 	}
 	gem_sync(i915, obj.handle);
 	gem_close(i915, obj.handle);
 
 	igt_assert(!is_wedged(i915));
+	intel_ctx_destroy(i915, ctx);
 	close(i915);
 }
 
diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
index a5497a5e2..44e6e3118 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -51,7 +51,7 @@ void gem_require_blitter(int i915);
 unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 				    unsigned int engine);
 
-void gem_test_engine(int fd, unsigned int engine);
+void gem_test_all_engines(int fd);
 bool gem_has_relocations(int fd);
 
 #endif /* GEM_SUBMISSION_H */
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 5cb242a32..50d250f38 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -77,7 +77,7 @@ static void trigger_reset(int fd)
 
 	/* And just check the gpu is indeed running again */
 	igt_kmsg(KMSG_DEBUG "Checking that the GPU recovered\n");
-	gem_test_engine(fd, ALL_ENGINES);
+	gem_test_all_engines(fd);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
 	igt_drop_caches_set(fd, DROP_ACTIVE);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index da498ad68..fb7a70aa0 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1408,7 +1408,7 @@ static void gem_idle_subtest(void)
 
 	sleep(5);
 
-	gem_test_engine(drm_fd, -1);
+	gem_test_all_engines(drm_fd);
 }
 
 static void gem_evict_pwrite_subtest(void)
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
