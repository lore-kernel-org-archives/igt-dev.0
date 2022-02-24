Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045510F2F7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 07:54:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 08:54:14 +0100
Message-Id: <20220224075415.18663-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220224075415.18663-1-zbigniew.kempczynski@intel.com>
References: <20220224075415.18663-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_allocator: Add safe alignment
 as a default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For DG2 and beyond regions alignment may vary so many tests would need
to be rewritten to handle this constraint. As Ashutosh noticed most of
tests can use safe alignment as a default.

Adopt intel-allocator to use safe or user defined power-of-two alignment.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_allocator.c              | 64 +++++++++++++++++++++---------
 lib/intel_allocator.h              | 13 ++++--
 lib/intel_allocator_msgchannel.h   |  1 +
 lib/intel_batchbuffer.c            |  5 ++-
 tests/i915/api_intel_allocator.c   |  5 ++-
 tests/i915/gem_softpin.c           |  4 +-
 tests/i915/gem_tiled_fence_blits.c |  2 +-
 7 files changed, 64 insertions(+), 30 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index eabff1f9a..340b88828 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -283,7 +283,8 @@ static bool __allocator_put(struct allocator *al)
 static struct intel_allocator *intel_allocator_create(int fd,
 						      uint64_t start, uint64_t end,
 						      uint8_t allocator_type,
-						      uint8_t allocator_strategy)
+						      uint8_t allocator_strategy,
+						      uint64_t default_alignment)
 {
 	struct intel_allocator *ial = NULL;
 
@@ -321,6 +322,7 @@ static struct intel_allocator *intel_allocator_create(int fd,
 
 	ial->type = allocator_type;
 	ial->strategy = allocator_strategy;
+	ial->default_alignment = default_alignment;
 	pthread_mutex_init(&ial->mutex, NULL);
 
 	return ial;
@@ -337,6 +339,7 @@ static struct allocator *allocator_open(int fd, uint32_t ctx, uint32_t vm,
 					uint64_t start, uint64_t end,
 					uint8_t allocator_type,
 					uint8_t allocator_strategy,
+					uint64_t default_alignment,
 					uint64_t *ahndp)
 {
 	struct intel_allocator *ial;
@@ -347,11 +350,14 @@ static struct allocator *allocator_open(int fd, uint32_t ctx, uint32_t vm,
 
 	al = __allocator_find(fd, ctx, vm);
 	if (!al) {
-		alloc_info("Allocator fd: %d, ctx: %u, vm: %u, <0x%llx : 0x%llx> "
-			    "not found, creating one\n",
-			    fd, ctx, vm, (long long) start, (long long) end);
+		alloc_info("Allocator fd: %d, ctx: %u, vm: %u, <0x%llx : 0x%llx>, "
+			   "default alignment: 0x%llx "
+			   "not found, creating one\n",
+			   fd, ctx, vm, (long long) start, (long long) end,
+			   (long long) alignment);
 		ial = intel_allocator_create(fd, start, end, allocator_type,
-					     allocator_strategy);
+					     allocator_strategy,
+					     default_alignment);
 		al = __allocator_create(fd, ctx, vm, ial);
 	}
 
@@ -363,6 +369,9 @@ static struct allocator *allocator_open(int fd, uint32_t ctx, uint32_t vm,
 	igt_assert_f(ial->strategy == allocator_strategy,
 		     "Allocator strategy must be same or fd/%s\n", idstr);
 
+	igt_assert_f(ial->default_alignment == default_alignment,
+		     "Allocator default alignment must be same or fd/%s\n", idstr);
+
 	__allocator_get(al);
 	*ahndp = __handle_create(al);
 
@@ -484,6 +493,7 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 					    req->open.start, req->open.end,
 					    req->open.allocator_type,
 					    req->open.allocator_strategy,
+					    req->open.default_alignment,
 					    &ahnd);
 			refcnt = atomic_load(&al->refcount);
 			ret = atomic_load(&al->ial->refcount);
@@ -494,11 +504,13 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 
 			alloc_info("<open> [tid: %ld] fd: %d, ahnd: %" PRIx64
 				   ", ctx: %u, vm: %u"
-				   ", alloc_type: %u, al->refcnt: %ld->%ld"
+				   ", alloc_type: %u, defalign: %llx"
+				   ", al->refcnt: %ld->%ld"
 				   ", refcnt: %d->%d\n",
 				   (long) req->tid, req->open.fd, ahnd,
-				   req->open.ctx,
-				   req->open.vm, req->open.allocator_type,
+				   req->open.ctx, req->open.vm,
+				   req->open.allocator_type,
+				   (long long) req->open.default_alignment,
 				   refcnt - 1, refcnt, ret - 1, ret);
 			break;
 
@@ -588,6 +600,9 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 			break;
 
 		case REQ_ALLOC:
+			if (!req->alloc.alignment)
+				req->alloc.alignment = ial->default_alignment;
+
 			resp->response_type = RESP_ALLOC;
 			resp->alloc.offset = ial->alloc(ial,
 							req->alloc.handle,
@@ -879,7 +894,8 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 					    uint32_t vm,
 					    uint64_t start, uint64_t end,
 					    uint8_t allocator_type,
-					    enum allocator_strategy strategy)
+					    enum allocator_strategy strategy,
+					    uint64_t default_alignment)
 {
 	struct alloc_req req = { .request_type = REQ_OPEN,
 				 .open.fd = fd,
@@ -888,7 +904,8 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 				 .open.start = start,
 				 .open.end = end,
 				 .open.allocator_type = allocator_type,
-				 .open.allocator_strategy = strategy };
+				 .open.allocator_strategy = strategy,
+				 .open.default_alignment = default_alignment };
 	struct alloc_resp resp;
 	uint64_t gtt_size;
 
@@ -903,6 +920,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 		req.open.end = gtt_size;
 	}
 
+	if (!default_alignment)
+		req.open.default_alignment = gem_detect_safe_alignment(fd);
+
 	/* Get child_tid only once at open() */
 	if (child_tid == -1)
 		child_tid = gettid();
@@ -922,7 +942,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
  * @end: address of the end
  * @allocator_type: one of INTEL_ALLOCATOR_* define
  * @strategy: passed to the allocator to define the strategy (like order
- * of allocation, see notes below).
+ * of allocation, see notes below)
+ * @default_alignment: default objects alignment - power-of-two requested
+ * alignment, if 0 then safe alignment will be chosen
  *
  * Function opens an allocator instance within <@start, @end) vm for given
  * @fd and @ctx and returns its handle. If the allocator for such pair
@@ -948,20 +970,24 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 uint64_t intel_allocator_open_full(int fd, uint32_t ctx,
 				   uint64_t start, uint64_t end,
 				   uint8_t allocator_type,
-				   enum allocator_strategy strategy)
+				   enum allocator_strategy strategy,
+				   uint64_t default_alignment)
 {
 	return __intel_allocator_open_full(fd, ctx, 0, start, end,
-					   allocator_type, strategy);
+					   allocator_type, strategy,
+					   default_alignment);
 }
 
 uint64_t intel_allocator_open_vm_full(int fd, uint32_t vm,
 				      uint64_t start, uint64_t end,
 				      uint8_t allocator_type,
-				      enum allocator_strategy strategy)
+				      enum allocator_strategy strategy,
+				      uint64_t default_alignment)
 {
 	igt_assert(vm != 0);
 	return __intel_allocator_open_full(fd, 0, vm, start, end,
-					   allocator_type, strategy);
+					   allocator_type, strategy,
+					   default_alignment);
 }
 
 /**
@@ -983,13 +1009,13 @@ uint64_t intel_allocator_open_vm_full(int fd, uint32_t vm,
 uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type)
 {
 	return intel_allocator_open_full(fd, ctx, 0, 0, allocator_type,
-					 ALLOC_STRATEGY_HIGH_TO_LOW);
+					 ALLOC_STRATEGY_HIGH_TO_LOW, 0);
 }
 
 uint64_t intel_allocator_open_vm(int fd, uint32_t vm, uint8_t allocator_type)
 {
 	return intel_allocator_open_vm_full(fd, vm, 0, 0, allocator_type,
-					    ALLOC_STRATEGY_HIGH_TO_LOW);
+					    ALLOC_STRATEGY_HIGH_TO_LOW, 0);
 }
 
 uint64_t intel_allocator_open_vm_as(uint64_t allocator_handle, uint32_t new_vm)
@@ -1084,11 +1110,11 @@ uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
 				 .allocator_handle = allocator_handle,
 				 .alloc.handle = handle,
 				 .alloc.size = size,
-				 .alloc.strategy = strategy };
+				 .alloc.strategy = strategy,
+				 .alloc.alignment = alignment };
 	struct alloc_resp resp;
 
 	igt_assert((alignment & (alignment-1)) == 0);
-	req.alloc.alignment = max_t(uint64_t, alignment, 1 << 12);
 
 	igt_assert(handle_request(&req, &resp) == 0);
 	igt_assert(resp.response_type == RESP_ALLOC);
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index e8d807f9a..c237e8e44 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -133,6 +133,7 @@ struct intel_allocator {
 	int fd;
 	uint8_t type;
 	enum allocator_strategy strategy;
+	uint64_t default_alignment;
 	_Atomic(int32_t) refcount;
 	pthread_mutex_t mutex;
 
@@ -171,12 +172,14 @@ uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type);
 uint64_t intel_allocator_open_full(int fd, uint32_t ctx,
 				   uint64_t start, uint64_t end,
 				   uint8_t allocator_type,
-				   enum allocator_strategy strategy);
+				   enum allocator_strategy strategy,
+				   uint64_t default_alignment);
 uint64_t intel_allocator_open_vm(int fd, uint32_t vm, uint8_t allocator_type);
 uint64_t intel_allocator_open_vm_full(int fd, uint32_t vm,
 				      uint64_t start, uint64_t end,
 				      uint8_t allocator_type,
-				      enum allocator_strategy strategy);
+				      enum allocator_strategy strategy,
+				      uint64_t default_alignment);
 
 uint64_t intel_allocator_open_vm_as(uint64_t allocator_handle, uint32_t new_vm);
 bool intel_allocator_close(uint64_t allocator_handle);
@@ -242,7 +245,8 @@ static inline uint64_t get_simple_l2h_ahnd(int fd, uint32_t ctx)
 
 	return do_relocs ? 0 : intel_allocator_open_full(fd, ctx, 0, 0,
 							 INTEL_ALLOCATOR_SIMPLE,
-							 ALLOC_STRATEGY_LOW_TO_HIGH);
+							 ALLOC_STRATEGY_LOW_TO_HIGH,
+							 0);
 }
 
 static inline uint64_t get_simple_h2l_ahnd(int fd, uint32_t ctx)
@@ -251,7 +255,8 @@ static inline uint64_t get_simple_h2l_ahnd(int fd, uint32_t ctx)
 
 	return do_relocs ? 0 : intel_allocator_open_full(fd, ctx, 0, 0,
 							 INTEL_ALLOCATOR_SIMPLE,
-							 ALLOC_STRATEGY_LOW_TO_HIGH);
+							 ALLOC_STRATEGY_HIGH_TO_LOW,
+							 0);
 }
 
 static inline uint64_t get_reloc_ahnd(int fd, uint32_t ctx)
diff --git a/lib/intel_allocator_msgchannel.h b/lib/intel_allocator_msgchannel.h
index c7a738a08..ef129c307 100644
--- a/lib/intel_allocator_msgchannel.h
+++ b/lib/intel_allocator_msgchannel.h
@@ -55,6 +55,7 @@ struct alloc_req {
 			uint64_t end;
 			uint8_t allocator_type;
 			uint8_t allocator_strategy;
+			uint64_t default_alignment;
 		} open;
 
 		struct {
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e5666cd4f..ddb8d8c1f 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1360,7 +1360,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 		ibb->allocator_handle = intel_allocator_open_full(i915, ctx,
 								  start, end,
 								  allocator_type,
-								  strategy);
+								  strategy, 0);
 	ibb->allocator_type = allocator_type;
 	ibb->allocator_strategy = strategy;
 	ibb->allocator_start = start;
@@ -3010,7 +3010,8 @@ static void __intel_bb_reinit_alloc(struct intel_bb *ibb)
 	ibb->allocator_handle = intel_allocator_open_full(ibb->i915, ibb->ctx,
 							  ibb->allocator_start, ibb->allocator_end,
 							  ibb->allocator_type,
-							  ibb->allocator_strategy);
+							  ibb->allocator_strategy,
+							  0);
 	intel_bb_reset(ibb, true);
 }
 
diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index bb1b3838b..7ae4a00b7 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -174,6 +174,7 @@ static void reuse(int fd, uint8_t type)
 {
 	struct test_obj obj[128], tmp;
 	uint64_t ahnd, prev_offset;
+	uint64_t align = 0x40;
 	int i;
 
 	ahnd = intel_allocator_open(fd, 0, type);
@@ -182,7 +183,7 @@ static void reuse(int fd, uint8_t type)
 		obj[i].handle = gem_handle_gen();
 		obj[i].size = OBJ_SIZE;
 		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
-						      obj[i].size, 0x40);
+						      obj[i].size, align);
 	}
 
 	/* check simple reuse */
@@ -198,7 +199,7 @@ static void reuse(int fd, uint8_t type)
 	intel_allocator_free(ahnd, obj[i].handle);
 	/* alloc different buffer to fill freed hole */
 	tmp.handle = gem_handle_gen();
-	tmp.offset = intel_allocator_alloc(ahnd, tmp.handle, OBJ_SIZE, 0);
+	tmp.offset = intel_allocator_alloc(ahnd, tmp.handle, OBJ_SIZE, align);
 	igt_assert(prev_offset == tmp.offset);
 
 	obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 2778a90b3..34fc9983f 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -991,7 +991,7 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 	intel_allocator_multiprocess_start();
 	ahnd = intel_allocator_open_full(fd, 0, 0, size / 16,
 					 INTEL_ALLOCATOR_RELOC,
-					 ALLOC_STRATEGY_NONE);
+					 ALLOC_STRATEGY_NONE, 0);
 
 	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -1038,7 +1038,7 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 		/* We need to open the allocator again in the new process */
 		ahnd = intel_allocator_open_full(fd, 0, 0, size / 16,
 						 INTEL_ALLOCATOR_RELOC,
-						 ALLOC_STRATEGY_NONE);
+						 ALLOC_STRATEGY_NONE, 0);
 
 		igt_until_timeout(timeout) {
 			submit(fd, gen, &execbuf, batches, count, ahnd);
diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 9ea61f110..dc0ffc1e1 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -155,7 +155,7 @@ static void run_test(int fd, int count, uint64_t end)
 	if (!gem_has_relocations(fd))
 		ahnd = intel_allocator_open_full(fd, 0, 0, end,
 						 INTEL_ALLOCATOR_RELOC,
-						 ALLOC_STRATEGY_LOW_TO_HIGH);
+						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 	memset(reloc, 0, sizeof(reloc));
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_NEEDS_FENCE;
-- 
2.32.0
