Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0EA6EB9A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2020 11:33:12 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 30 Apr 2020 17:03:16 +0530
Message-Id: <20200430113316.9217-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t] tests/i915/gem_eio:Replace legacy
 engines with new API
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
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Legacy engines for_each_engine* has been replaced with the ones
implemented in the gem_engine_topology library.

Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_eio.c | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 1ec60941..28caa883 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -394,7 +394,6 @@ static void test_banned(int fd)
 static void test_wait(int fd, unsigned int flags, unsigned int wait)
 {
 	igt_spin_t *hang;
-
 	fd = gem_reopen_driver(fd);
 	igt_require_gem(fd);
 
@@ -427,13 +426,13 @@ static void test_suspend(int fd, int state)
 	igt_require_gem(fd);
 
 	/* Do a suspend first so that we don't skip inside the test */
-	igt_system_suspend_autoresume(state, SUSPEND_TEST_DEVICES);
+	igt_system_suspend_autoresume(fd, state, SUSPEND_TEST_DEVICES);
 
 	/* Check we can suspend when the driver is already wedged */
 	igt_require(i915_reset_control(false));
 	manual_hang(fd);
 
-	igt_system_suspend_autoresume(state, SUSPEND_TEST_DEVICES);
+	igt_system_suspend_autoresume(fd, state, SUSPEND_TEST_DEVICES);
 
 	igt_require(i915_reset_control(true));
 	trigger_reset(fd);
@@ -443,23 +442,20 @@ static void test_suspend(int fd, int state)
 static void test_inflight(int fd, unsigned int wait)
 {
 	int parent_fd = fd;
+	const struct intel_execution_engine2 *e;
 	int fence[64]; /* mostly conservative estimate of ring size */
 	int max;
-
 	igt_require_gem(fd);
 	igt_require(gem_has_exec_fence(fd));
-
 	max = gem_measure_ring_inflight(fd, -1, 0);
 	igt_require(max > 1);
 	max = min(max - 1, ARRAY_SIZE(fence));
 	igt_debug("Using %d inflight batches\n", max);
-
-	for_each_engine(e, parent_fd) {
+	__for_each_physical_engine(parent_fd, e) {
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 obj[2];
 		struct drm_i915_gem_execbuffer2 execbuf;
 		igt_spin_t *hang;
-
 		fd = gem_reopen_driver(parent_fd);
 		igt_require_gem(fd);
 
@@ -472,13 +468,13 @@ static void test_inflight(int fd, unsigned int wait)
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
 		igt_require(i915_reset_control(false));
 
-		hang = spin_sync(fd, 0, eb_ring(e));
+		hang = spin_sync(fd, 0, e->flags);
 		obj[0].handle = hang->handle;
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(obj);
 		execbuf.buffer_count = 2;
-		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_OUT;
+		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 
 		for (unsigned int n = 0; n < max; n++) {
 			gem_execbuf_wr(fd, &execbuf);
@@ -542,7 +538,7 @@ static void test_inflight_suspend(int fd)
 	}
 
 	igt_set_autoresume_delay(30);
-	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	igt_system_suspend_autoresume(fd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
 	check_wait(fd, obj[1].handle, 10, NULL);
@@ -578,12 +574,11 @@ static uint32_t context_create_safe(int i915)
 static void test_inflight_contexts(int fd, unsigned int wait)
 {
 	int parent_fd = fd;
-
+	const struct intel_execution_engine2 *e;
 	igt_require_gem(fd);
 	igt_require(gem_has_exec_fence(fd));
 	gem_require_contexts(fd);
-
-	for_each_engine(e, parent_fd) {
+	__for_each_physical_engine(parent_fd, e) {
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 obj[2];
 		struct drm_i915_gem_execbuffer2 execbuf;
@@ -608,13 +603,13 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		obj[1].handle = gem_create(fd, 4096);
 		gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 
-		hang = spin_sync(fd, 0, eb_ring(e));
+		hang = spin_sync(fd, 0, e->flags);
 		obj[0].handle = hang->handle;
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(obj);
 		execbuf.buffer_count = 2;
-		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_OUT;
+		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 
 		count = 0;
 		for (unsigned int n = 0; n < ARRAY_SIZE(fence); n++) {
@@ -702,13 +697,13 @@ static void test_inflight_external(int fd)
 
 static void test_inflight_internal(int fd, unsigned int wait)
 {
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	unsigned nfence = 0;
 	int fences[16];
 	igt_spin_t *hang;
-
 	igt_require(gem_has_exec_fence(fd));
 
 	fd = gem_reopen_driver(fd);
@@ -726,8 +721,8 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	for_each_engine(e, fd) {
-		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_OUT;
+	__for_each_physical_engine(fd, e) {
+		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 
 		gem_execbuf_wr(fd, &execbuf);
 
@@ -754,6 +749,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 			 const char *name, unsigned int engine,
 			 unsigned int flags)
 {
+	const struct intel_execution_engine2 *e;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(fd, 4096)
@@ -788,7 +784,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 		 * Start executing a spin batch with some queued batches
 		 * against a different context after it.
 		 */
-		hang = spin_sync(fd, ctx0, engine);
+		hang = spin_sync(fd, ctx0, e->flags);
 
 		execbuf.rsvd1 = ctx;
 		for (i = 0; i < max; i++)
@@ -835,10 +831,10 @@ static void reset_stress(int fd, uint32_t ctx0,
  */
 static void test_reset_stress(int fd, unsigned int flags)
 {
+	const struct intel_execution_engine2 *e;
 	uint32_t ctx0 = context_create_safe(fd);
-
-	for_each_engine(e, fd)
-		reset_stress(fd, ctx0, e->name, eb_ring(e), flags);
+	__for_each_physical_engine(fd, e)
+		reset_stress(fd, ctx0, e->name, e->flags, flags);
 
 	gem_context_destroy(fd, ctx0);
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
