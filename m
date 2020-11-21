Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5B86E9CA
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2020 14:32:45 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 21 Nov 2020 14:32:33 +0000
Message-Id: <20201121143233.3511576-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Assert potential malloc failures in
 intel_batchbuffer
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Hunting:

	Received signal SIGSEGV.
	Stack trace:
	 #0 [fatal_sig_handler+0xd6]
	 #1 [killpg+0x40]
	 #2 [intel_bb_add_object+0x105]
	 #3 [__real_main666+0xe83]
	 #4 [main+0x27]
	 #5 [__libc_start_main+0xe7]
	 #6 [_start+0x2a]

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/intel_batchbuffer.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 8dd8a5027..2f4e36a2f 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1190,19 +1190,18 @@ static bool intel_bb_debug_tree = false;
  */
 static void __reallocate_objects(struct intel_bb *ibb)
 {
-	uint32_t num;
+	const uint32_t inc = 4096 / sizeof(*ibb->objects);
 
 	if (ibb->num_objects == ibb->allocated_objects) {
-		num = 4096 / sizeof(*ibb->objects);
 		ibb->objects = realloc(ibb->objects,
 				       sizeof(*ibb->objects) *
-				       (num + ibb->allocated_objects));
+				       (inc + ibb->allocated_objects));
 
 		igt_assert(ibb->objects);
-		ibb->allocated_objects += num;
+		ibb->allocated_objects += inc;
 
 		memset(&ibb->objects[ibb->num_objects],	0,
-		       num * sizeof(*ibb->objects));
+		       inc * sizeof(*ibb->objects));
 	}
 }
 
@@ -1592,6 +1591,8 @@ __add_to_cache(struct intel_bb *ibb, uint32_t handle)
 	struct drm_i915_gem_exec_object2 **found, *object;
 
 	object = malloc(sizeof(*object));
+	igt_assert(obj);
+
 	object->handle = handle;
 	found = tsearch((void *) object, &ibb->root, __compare_objects);
 
@@ -1615,16 +1616,18 @@ static int __compare_handles(const void *p1, const void *p2)
 static void __add_to_objects(struct intel_bb *ibb,
 			     struct drm_i915_gem_exec_object2 *object)
 {
-	uint32_t i, **found, *handle;
+	uint32_t **found, *handle;
 
 	handle = malloc(sizeof(*handle));
+	igt_assert(handle);
+
 	*handle = object->handle;
 	found = tsearch((void *) handle, &ibb->current, __compare_handles);
 
 	if (*found == handle) {
 		__reallocate_objects(ibb);
-		i = ibb->num_objects++;
-		ibb->objects[i] = object;
+		igt_assert(ibb->num_objects < ibb->allocated_objects);
+		ibb->objects[ibb->num_objects++] = object;
 	} else {
 		free(handle);
 	}
@@ -2118,7 +2121,7 @@ static int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	objects = create_objects_array(ibb);
-	execbuf.buffers_ptr = (uintptr_t) objects;
+	execbuf.buffers_ptr = to_user_pointer(objects);
 	execbuf.buffer_count = ibb->num_objects;
 	execbuf.batch_len = end_offset;
 	execbuf.rsvd1 = ibb->ctx;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
