Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1624C6E211
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 04:54:31 +0000 (UTC)
From: sai gowtham <sai.gowtham.ch@intel.com>
Date: Wed,  6 May 2020 10:23:54 +0530
Message-Id: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t][V2] tests/i915/gem_ringfill:Adjusted test
 to utilize all available engines.
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
To: sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replaced the legacy for_each_engine* defines with the ones implemented
in the gem_engine_topology library.

Added legacy engine coverage and changed subtest name in fast-feedback.testlist
from basic-default-forked -->legacy-basic-default-forked.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: satyavat <satyavathi.k@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_ringfill.c             | 72 ++++++++++++++++-----------
 tests/intel-ci/fast-feedback.testlist |  2 +-
 2 files changed, 44 insertions(+), 30 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 4c73f4d9..4cc74e44 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -96,7 +96,7 @@ static int setup_execbuf(int fd,
 			 struct drm_i915_gem_execbuffer2 *execbuf,
 			 struct drm_i915_gem_exec_object2 *obj,
 			 struct drm_i915_gem_relocation_entry *reloc,
-			 unsigned int ring)
+			 const struct intel_execution_engine2 *e)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -109,7 +109,7 @@ static int setup_execbuf(int fd,
 	memset(reloc, 0, 1024*sizeof(*reloc));
 
 	execbuf->buffers_ptr = to_user_pointer(obj);
-	execbuf->flags = ring | (1 << 11) | (1 << 12);
+	execbuf->flags = e->flags | (1 << 11) | (1 << 12);
 
 	if (gen > 3 && gen < 6)
 		execbuf->flags |= I915_EXEC_SECURE;
@@ -170,25 +170,25 @@ static int setup_execbuf(int fd,
 	return 0;
 }
 
-static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
+static void run_test(int fd, const struct intel_execution_engine2 *e, unsigned flags, unsigned timeout)
 {
+	int i915;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc[1024];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	igt_hang_t hang;
 
-	gem_require_ring(fd, ring);
-	igt_require(gem_can_store_dword(fd, ring));
+	igt_require(gem_class_can_store_dword(fd, e->class));
 
 	if (flags & (SUSPEND | HIBERNATE))
-		run_test(fd, ring, 0, 0);
+		run_test(fd, e, 0, 0);
 
 	gem_quiescent_gpu(fd);
-	igt_require(setup_execbuf(fd, &execbuf, obj, reloc, ring) == 0);
+	igt_require(setup_execbuf(fd, &execbuf, obj, reloc, e) == 0);
 
 	memset(&hang, 0, sizeof(hang));
 	if (flags & HANG)
-		hang = igt_hang_ring(fd, ring & ~(3<<13));
+		hang = igt_hang_ring(fd, e->flags & ~(3<<13));
 
 	if (flags & (CHILD | FORKED | BOMB)) {
 		int nchild;
@@ -203,8 +203,9 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 		igt_debug("Forking %d children\n", nchild);
 		igt_fork(child, nchild) {
 			if (flags & NEWFD) {
-				fd = drm_open_driver(DRIVER_INTEL);
-				setup_execbuf(fd, &execbuf, obj, reloc, ring);
+				i915 = drm_open_driver(DRIVER_INTEL);
+				gem_context_copy_engines(fd, 0, i915, 0);
+				setup_execbuf(i915, &execbuf, obj, reloc, e);
 			}
 			fill_ring(fd, &execbuf, flags, timeout);
 		}
@@ -235,26 +236,28 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 	gem_quiescent_gpu(fd);
 
 	if (flags & (SUSPEND | HIBERNATE))
-		run_test(fd, ring, 0, 0);
+		run_test(fd, e, 0, 0);
 }
 
 igt_main
 {
+	const struct intel_execution_engine2 *e2;
+	const struct intel_execution_engine *e;
 	const struct {
 		const char *suffix;
 		unsigned flags;
 		unsigned timeout;
 		bool basic;
 	} modes[] = {
-		{ "", 0, 0, true},
-		{ "-interruptible", INTERRUPTIBLE, 1, true },
-		{ "-hang", HANG, 10, true },
-		{ "-child", CHILD, 0 },
-		{ "-forked", FORKED, 0, true },
-		{ "-fd", FORKED | NEWFD, 0, true },
-		{ "-bomb", BOMB | NEWFD | INTERRUPTIBLE, 150 },
-		{ "-S3", BOMB | SUSPEND, 30 },
-		{ "-S4", BOMB | HIBERNATE, 30 },
+		{ "default", 0, 0, true},
+		{ "interruptible", INTERRUPTIBLE, 1, true },
+		{ "hang", HANG, 10, true },
+		{ "child", CHILD, 0 },
+		{ "forked", FORKED, 0, true },
+		{ "fd", FORKED | NEWFD, 0, true },
+		{ "bomb", BOMB | NEWFD | INTERRUPTIBLE, 150 },
+		{ "S3", BOMB | SUSPEND, 30 },
+		{ "S4", BOMB | HIBERNATE, 30 },
 		{ NULL }
 	}, *m;
 	bool master = false;
@@ -276,17 +279,28 @@ igt_main
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size);
 	}
-
 	for (m = modes; m->suffix; m++) {
-		const struct intel_execution_engine *e;
-
-		for (e = intel_execution_engines; e->name; e++) {
-			igt_subtest_f("%s%s%s",
-				      m->basic && !e->exec_id ? "basic-" : "",
-				      e->name,
-				      m->suffix) {
+		/* Legacy testing must be first. */
+		igt_subtest_with_dynamic_f("legacy-%s", m->suffix) {
+			for (e = intel_execution_engines; e->name; e++) {
+				struct intel_execution_engine2 e2__;
+				e2__ = gem_eb_flags_to_engine(eb_ring(e));
+				if (e2__.flags == -1)
+					continue;
+				e2 = &e2__;
 				igt_skip_on(m->flags & NEWFD && master);
-				run_test(fd, eb_ring(e), m->flags, m->timeout);
+				igt_dynamic_f("%s%s",
+						m->basic && !e2->instance ? "basic-" : "",
+					e2->name)
+					run_test(fd, e2, m->flags, m->timeout);
+			}
+		}
+		igt_skip_on(m->flags & NEWFD && master);
+		igt_subtest_with_dynamic_f("%s%s", m->basic  ? "basic-" : "",  m->suffix) {
+			__for_each_physical_engine(fd, e2) {
+				igt_dynamic_f("%s", e2->name) {
+					run_test(fd, e2, m->flags, m->timeout);
+				}
 			}
 		}
 	}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2ccad438..8a50e6c3 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -35,7 +35,7 @@ igt@gem_mmap@basic
 igt@gem_mmap_gtt@basic
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
-igt@gem_ringfill@basic-default-forked
+igt@gem_ringfill@legacy-forked@default
 igt@gem_sync@basic-all
 igt@gem_sync@basic-each
 igt@gem_tiled_blits@basic
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
