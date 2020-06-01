Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4EB6E216
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 09:31:28 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon,  1 Jun 2020 15:01:21 +0530
Message-Id: <20200601093121.27508-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t,
 v2] tests/i915/gem_eio: Replace legacy engines with new API
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

v2:
Added engine code onto the new updated code.
All the updated subtests test_inflight,test_inflight_context and
test_inflight_internal are executing with the added new API.

Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_eio.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index e0d8390f..9ae68d11 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -435,6 +435,7 @@ static void test_suspend(int fd, int state)
 static void test_inflight(int fd, unsigned int wait)
 {
 	int parent_fd = fd;
+	const struct intel_execution_engine2 *e;
 	int fence[64]; /* mostly conservative estimate of ring size */
 	int max;
 
@@ -445,8 +446,7 @@ static void test_inflight(int fd, unsigned int wait)
 	igt_require(max > 1);
 	max = min(max - 1, ARRAY_SIZE(fence));
 	igt_debug("Using %d inflight batches\n", max);
-
-	for_each_engine(e, parent_fd) {
+	__for_each_physical_engine(parent_fd, e) {
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 obj[2];
 		struct drm_i915_gem_execbuffer2 execbuf;
@@ -464,13 +464,13 @@ static void test_inflight(int fd, unsigned int wait)
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
 		igt_require(i915_reset_control(fd, false));
 
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
@@ -570,12 +570,11 @@ static uint32_t context_create_safe(int i915)
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
@@ -600,13 +599,13 @@ static void test_inflight_contexts(int fd, unsigned int wait)
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
@@ -694,6 +693,7 @@ static void test_inflight_external(int fd)
 
 static void test_inflight_internal(int fd, unsigned int wait)
 {
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -718,8 +718,8 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	for_each_engine(e, fd) {
-		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_OUT;
+	__for_each_physical_engine(fd, e) {
+		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 
 		gem_execbuf_wr(fd, &execbuf);
 
@@ -746,6 +746,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 			 const char *name, unsigned int engine,
 			 unsigned int flags)
 {
+	const struct intel_execution_engine2 *e;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(fd, 4096)
@@ -780,7 +781,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 		 * Start executing a spin batch with some queued batches
 		 * against a different context after it.
 		 */
-		hang = spin_sync(fd, ctx0, engine);
+		hang = spin_sync(fd, ctx0, e->flags);
 
 		execbuf.rsvd1 = ctx;
 		for (i = 0; i < max; i++)
@@ -827,10 +828,10 @@ static void reset_stress(int fd, uint32_t ctx0,
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
