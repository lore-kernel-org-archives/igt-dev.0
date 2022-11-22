Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Nov 2022 17:47:58 +0000
Message-Id: <20221122174758.74187-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: verify GTT eviction
 with contended locks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We should still be able to GTT evict objects during execbuf (old
bindings can linger around), even if there is object lock contention. In
the worst case the execbuf should just wait on the contented locks.
Returning -ENOSPC smells like a regression from past behaviour, and
seems to break userspace.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7570
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_shrink.c | 107 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 380d2c84..f1630081 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -402,6 +402,109 @@ static void reclaim(unsigned engine, int timeout)
 	close(fd);
 }
 
+#define PAGE_SIZE 4096
+
+static uint32_t batch_create_size(int fd, uint64_t size)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t handle;
+
+	handle = gem_create(fd, size);
+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+
+	return handle;
+}
+
+static void upload(int fd, uint32_t handle, uint32_t in_fence, uint32_t ctx_id)
+{
+	struct drm_i915_gem_exec_object2 exec[2] = {};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&exec),
+		.buffer_count = 1,
+		.rsvd1 = ctx_id,
+	};
+
+	if (in_fence) {
+		execbuf.rsvd2 = in_fence;
+		execbuf.flags = I915_EXEC_FENCE_IN;
+	}
+
+	exec[0].handle = handle;
+	exec[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+		EXEC_OBJECT_PAD_TO_SIZE;
+	exec[0].pad_to_size = gem_aperture_size(fd) - PAGE_SIZE;
+
+	gem_execbuf(fd, &execbuf);
+}
+
+static void shrink_vs_evict(void)
+{
+	const unsigned int nproc = sysconf(_SC_NPROCESSORS_ONLN) + 1;
+	int fd = drm_open_driver(DRIVER_INTEL);
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	const intel_ctx_t *ctx_arr[nproc];
+	igt_spin_t *spinner;
+	uint32_t handle1;
+	int i;
+
+	igt_require(gem_uses_full_ppgtt(fd));
+
+	igt_drop_caches_set(fd, DROP_ALL);
+
+	handle1 = gem_create(fd, 1u << 21);
+
+	spinner = igt_spin_new(fd,
+			       .ahnd = ahnd,
+			       .flags = IGT_SPIN_FENCE_OUT);
+	/*
+	 * Create several VMs to ensure we don't block on the same vm lock. The
+	 * goal of the test is to ensure that object lock contention doesn't
+	 * somehow result in -ENOSPC from execbuf, if we need to trigger GTT
+	 * eviction.
+	 */
+	for (i = 0; i < nproc; i++) {
+		ctx_arr[i] = intel_ctx_create_all_physical(fd);
+		upload(fd, handle1, spinner->execbuf.rsvd2 >> 32,
+		       ctx_arr[i]->id);
+	}
+
+	igt_fork(child, 1)
+		igt_drop_caches_set(fd, DROP_ALL);
+
+	sleep(2); /* Give the shrinker time to find handle1 */
+
+	igt_fork(child, nproc) {
+		uint32_t handle2 = gem_create(fd, PAGE_SIZE);
+
+		/*
+		 * This object should take up the entire address space, as per
+		 * pad_to_size. The kernel should have no choice but to GTT
+		 * evict handle1 during the execbuf (from the chosen vm that
+		 * is), which is currently still busy spinning.
+		 *
+		 * One of these forks will be stuck on the vm mutex, since the
+		 * shrinker is holding it (along with the object lock) while
+		 * trying to unbind the chosen vma, but is blocked by the
+		 * spinner. The rest should only block waiting to grab the
+		 * object lock for handle1, before then trying to GTT evict it
+		 * from their respective vm. In either case the contention of
+		 * the vm->mutex or object lock should never result in -ENOSPC
+		 * or some other error.
+		 */
+		handle2 = batch_create_size(fd, PAGE_SIZE);
+		upload(fd, handle2, 0, ctx_arr[child]->id);
+		gem_close(fd, handle2);
+	}
+
+	igt_waitchildren();
+
+	for (i = 0; i < nproc; i++)
+		intel_ctx_destroy(fd, ctx_arr[i]);
+
+	igt_spin_free(fd, spinner);
+	gem_close(fd, handle1);
+}
+
 igt_main
 {
 	const struct test {
@@ -462,6 +565,10 @@ igt_main
 	igt_subtest("reclaim")
 		reclaim(I915_EXEC_DEFAULT, 2);
 
+	igt_describe("Verify GTT eviction can't randomly fail due to object lock contention\n");
+	igt_subtest("shrink-vs-evict")
+		shrink_vs_evict();
+
 	for(const struct test *t = tests; t->name; t++) {
 		for(const struct mode *m = modes; m->suffix; m++) {
 			igt_subtest_f("%s%s", t->name, m->suffix) {
-- 
2.38.1
