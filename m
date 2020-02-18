Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E606E13A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 07:10:14 +0000 (UTC)
From: satyavat <satyavathi.k@intel.com>
Date: Tue, 18 Feb 2020 12:39:30 +0530
Message-Id: <20200218070930.18246-1-satyavathi.k@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V4] [PATCH i-g-t][V4]
 tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all
 available engines.
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
To: satyavathi.k@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replaced the legacy for_each_engine* defines with the ones implemented
in the gem_engine_topology library.

subtest that is modified: Ringfill

V2
Added "Test" name in dynamic subtest to avoid
"-" during subtest list.

corrected DRM open call .

V3
Removed "-" from mode array
removed Test name in dynamic subtest

V4
corrected fd handle in igt_fork

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: satyavat <satyavathi.k@intel.com>
---
 tests/i915/gem_ringfill.c | 60 +++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 4c73f4d9..a2ae21e0 100644
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
@@ -235,11 +236,12 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 	gem_quiescent_gpu(fd);
 
 	if (flags & (SUSPEND | HIBERNATE))
-		run_test(fd, ring, 0, 0);
+		run_test(fd, e, 0, 0);
 }
 
 igt_main
 {
+	const struct intel_execution_engine2 *e;
 	const struct {
 		const char *suffix;
 		unsigned flags;
@@ -247,14 +249,14 @@ igt_main
 		bool basic;
 	} modes[] = {
 		{ "", 0, 0, true},
-		{ "-interruptible", INTERRUPTIBLE, 1, true },
-		{ "-hang", HANG, 10, true },
-		{ "-child", CHILD, 0 },
-		{ "-forked", FORKED, 0, true },
-		{ "-fd", FORKED | NEWFD, 0, true },
-		{ "-bomb", BOMB | NEWFD | INTERRUPTIBLE, 150 },
-		{ "-S3", BOMB | SUSPEND, 30 },
-		{ "-S4", BOMB | HIBERNATE, 30 },
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
@@ -265,7 +267,7 @@ igt_main
 
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
-		igt_require(gem_can_store_dword(fd, 0));
+		igt_require(gem_class_can_store_dword(fd, 0));
 		gen = intel_gen(intel_get_drm_devid(fd));
 		if (gen > 3 && gen < 6) { /* ctg and ilk need secure batches */
 			igt_device_set_master(fd);
@@ -276,21 +278,17 @@ igt_main
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
-				igt_skip_on(m->flags & NEWFD && master);
-				run_test(fd, eb_ring(e), m->flags, m->timeout);
+
+		igt_skip_on(m->flags & NEWFD && master);
+		igt_subtest_with_dynamic_f("%s%s", m->basic  ? "basic-" : "",  m->suffix) {
+			__for_each_physical_engine(fd, e) {
+				igt_dynamic_f("%s", e->name) {
+					run_test(fd, e, m->flags, m->timeout);
+				}
 			}
 		}
 	}
-
 	igt_fixture
 		close(fd);
 }
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
