Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 11 May 2020 11:14:49 +0100
Message-Id: <20200511101449.125750-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200511082141.65494-1-chris@chris-wilson.co.uk>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v3] i915/gem_ringfill: Do a basic pass
 over all engines simultaneously
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Change the basic pre-mergetest to do a single pass over all engines
simultaneously. This should take no longer than checking a single
engine, while providing just the right amount of stress regardless of
machine size.

v2: Move around the quiescence and requires to avoid calling them from
the children.
v3: Lift the v3.10 [LUT_HANDLE, NORELOC] requirement checking to the
opening fixture.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_ringfill.c             | 81 ++++++++++++++++++++-------
 tests/intel-ci/fast-feedback.testlist |  2 +-
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index a2157bd6f..de2778b3b 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -93,16 +93,15 @@ static void fill_ring(int fd,
 	}
 }
 
-static int setup_execbuf(int fd,
-			 struct drm_i915_gem_execbuffer2 *execbuf,
-			 struct drm_i915_gem_exec_object2 *obj,
-			 struct drm_i915_gem_relocation_entry *reloc,
-			 unsigned int ring)
+static void setup_execbuf(int fd,
+			  struct drm_i915_gem_execbuffer2 *execbuf,
+			  struct drm_i915_gem_exec_object2 *obj,
+			  struct drm_i915_gem_relocation_entry *reloc,
+			  unsigned int ring)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *batch, *b;
-	int ret;
 	int i;
 
 	memset(execbuf, 0, sizeof(*execbuf));
@@ -118,9 +117,7 @@ static int setup_execbuf(int fd,
 	obj[0].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[0].handle, 0, &bbe, sizeof(bbe));
 	execbuf->buffer_count = 1;
-	ret = __gem_execbuf(fd, execbuf);
-	if (ret)
-		return ret;
+	gem_execbuf(fd, execbuf);
 
 	obj[0].flags |= EXEC_OBJECT_WRITE;
 	obj[1].handle = gem_create(fd, 1024*16 + 4096);
@@ -168,7 +165,6 @@ static int setup_execbuf(int fd,
 	gem_execbuf(fd, execbuf);
 
 	check_bo(fd, obj[0].handle);
-	return 0;
 }
 
 static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
@@ -178,14 +174,12 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	igt_hang_t hang;
 
-	gem_require_ring(fd, ring);
-	igt_require(gem_can_store_dword(fd, ring));
-
-	if (flags & (SUSPEND | HIBERNATE))
+	if (flags & (SUSPEND | HIBERNATE)) {
 		run_test(fd, ring, 0, 0);
+		gem_quiescent_gpu(fd);
+	}
 
-	gem_quiescent_gpu(fd);
-	igt_require(setup_execbuf(fd, &execbuf, obj, reloc, ring) == 0);
+	setup_execbuf(fd, &execbuf, obj, reloc, ring);
 
 	memset(&hang, 0, sizeof(hang));
 	if (flags & HANG)
@@ -233,10 +227,38 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 	gem_close(fd, obj[1].handle);
 	gem_close(fd, obj[0].handle);
 
-	gem_quiescent_gpu(fd);
-
-	if (flags & (SUSPEND | HIBERNATE))
+	if (flags & (SUSPEND | HIBERNATE)) {
+		gem_quiescent_gpu(fd);
 		run_test(fd, ring, 0, 0);
+	}
+}
+
+static uint32_t batch_create(int i915)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t handle = gem_create(i915, 4096);
+
+	gem_write(i915, handle, 0, &bbe, sizeof(bbe));
+	return handle;
+}
+
+static bool has_lut_handle(int i915)
+{
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = batch_create(i915),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffer_count = 1,
+		.buffers_ptr = to_user_pointer(&obj),
+		.flags = (1 << 11) | (1 << 12),
+	};
+	bool result;
+
+	/* Check for v3.10 with LUT_HANDLE AND NORELOC */
+	result = __gem_execbuf(i915, &execbuf) == 0;
+	gem_close(i915, obj.handle);
+
+	return result;
 }
 
 igt_main
@@ -265,8 +287,10 @@ igt_main
 		int gen;
 
 		fd = drm_open_driver(DRIVER_INTEL);
+
 		igt_require_gem(fd);
-		igt_require(gem_can_store_dword(fd, 0));
+		igt_require(has_lut_handle(fd));
+
 		gen = intel_gen(intel_get_drm_devid(fd));
 		if (gen > 3 && gen < 6) { /* ctg and ilk need secure batches */
 			igt_device_set_master(fd);
@@ -287,11 +311,28 @@ igt_main
 				      e->name,
 				      m->suffix) {
 				igt_skip_on(m->flags & NEWFD && master);
+				gem_require_ring(fd, eb_ring(e));
+				igt_require(gem_can_store_dword(fd, eb_ring(e)));
 				run_test(fd, eb_ring(e), m->flags, m->timeout);
+				gem_quiescent_gpu(fd);
 			}
 		}
 	}
 
+	igt_subtest("basic-all") {
+		const struct intel_execution_engine2 *e;
+
+		__for_each_physical_engine(fd, e) {
+			if (!gem_class_can_store_dword(fd, e->class))
+				continue;
+
+			igt_fork(child, 1)
+				run_test(fd, e->flags, 0, 1);
+		}
+
+		igt_waitchildren();
+	}
+
 	igt_fixture
 		close(fd);
 }
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2ccad4386..e2ed0a1d6 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -35,7 +35,7 @@ igt@gem_mmap@basic
 igt@gem_mmap_gtt@basic
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
-igt@gem_ringfill@basic-default-forked
+igt@gem_ringfill@basic-all
 igt@gem_sync@basic-all
 igt@gem_sync@basic-each
 igt@gem_tiled_blits@basic
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
