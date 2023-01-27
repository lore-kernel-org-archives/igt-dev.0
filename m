Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 Jan 2023 10:07:42 +0000
Message-Id: <20230127100742.341942-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ppgtt: Terminate batch for
 evict-vs-shrink*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Terminate the first upload batch (with MI_BB_END) as otherwise we
trigger a sequence of $(nproc) GPU hangs, which take a long time to be
processed.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7961
Fixes: 4f22b49ee353 ("tests/i915/gem_ppgtt: verify GTT eviction with contended locks")
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_ppgtt.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index ca09f089..c3102857 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -257,12 +257,12 @@ static void flink_and_close(void)
 
 #define PAGE_SIZE 4096
 
-static uint32_t batch_create_size(int fd, uint64_t size)
+static uint32_t batch_create(int fd)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
 
-	handle = gem_create(fd, size);
+	handle = gem_create(fd, sizeof(bbe));
 	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
 
 	return handle;
@@ -307,8 +307,7 @@ static void shrink_vs_evict(unsigned int flags)
 	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 	const intel_ctx_t *ctx_arr[nproc];
 	igt_spin_t *spinner;
-	uint32_t handle1;
-	int i;
+	uint32_t shared;
 
 	/*
 	 * Try to simulate some nasty object lock contention during GTT
@@ -327,7 +326,7 @@ static void shrink_vs_evict(unsigned int flags)
 
 	igt_drop_caches_set(fd, DROP_ALL);
 
-	handle1 = gem_create(fd, PAGE_SIZE);
+	shared = batch_create(fd);
 
 	spinner = igt_spin_new(fd,
 			       .ahnd = ahnd,
@@ -340,44 +339,43 @@ static void shrink_vs_evict(unsigned int flags)
 	 * somehow result in -ENOSPC from execbuf, if we need to trigger GTT
 	 * eviction.
 	 */
-	for (i = 0; i < nproc; i++) {
+	for (int i = 0; i < nproc; i++) {
 		ctx_arr[i] = intel_ctx_create(fd, NULL);
 
-		upload(fd, handle1, spinner->execbuf.rsvd2 >> 32,
+		upload(fd, shared, spinner->execbuf.rsvd2 >> 32,
 		       ctx_arr[i]->id, flags);
 	}
 
 	igt_fork(child, 1)
 		igt_drop_caches_set(fd, DROP_ALL);
 
-	sleep(2); /* Give the shrinker time to find handle1 */
+	sleep(2); /* Give the shrinker time to find shared */
 
 	igt_fork(child, nproc) {
-		uint32_t handle2;
+		uint32_t isolated;
 
 		/*
 		 * One of these forks will be stuck on the vm mutex, since the
 		 * shrinker is holding it (along with the object lock) while
 		 * trying to unbind the chosen vma, but is blocked by the
 		 * spinner. The rest should only block waiting to grab the
-		 * object lock for handle1, before then trying to GTT evict it
+		 * object lock for shared, before then trying to GTT evict it
 		 * from their respective vm. In either case the contention of
 		 * the vm->mutex or object lock should never result in -ENOSPC
 		 * or some other error.
 		 */
-		handle2 = batch_create_size(fd, PAGE_SIZE);
-
-		upload(fd, handle2, 0, ctx_arr[child]->id, flags);
-		gem_close(fd, handle2);
+		isolated = batch_create(fd);
+		upload(fd, isolated, 0, ctx_arr[child]->id, flags);
+		gem_close(fd, isolated);
 	}
 
 	igt_waitchildren();
 	igt_spin_free(fd, spinner);
 
-	for (i = 0; i < nproc; i++)
+	for (int i = 0; i < nproc; i++)
 		intel_ctx_destroy(fd, ctx_arr[i]);
 
-	gem_close(fd, handle1);
+	gem_close(fd, shared);
 }
 
 static bool has_contexts(void)
-- 
2.39.1
