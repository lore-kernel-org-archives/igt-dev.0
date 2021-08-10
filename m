Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954656E029
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:54:08 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:53:01 +0200
Message-Id: <20210810105323.31375-33-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 32/54] tests/gem_ringfill: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

v2: Add missing ahnd release (Ashutosh)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ringfill.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index d32d47994..ecfa0bead 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -94,6 +94,7 @@ static void fill_ring(int fd,
 	}
 }
 
+#define NUMSTORES 1024
 static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 			  struct drm_i915_gem_execbuffer2 *execbuf,
 			  struct drm_i915_gem_exec_object2 *obj,
@@ -104,10 +105,11 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *batch, *b;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	memset(execbuf, 0, sizeof(*execbuf));
 	memset(obj, 0, 2*sizeof(*obj));
-	memset(reloc, 0, 1024*sizeof(*reloc));
+	memset(reloc, 0, NUMSTORES * sizeof(*reloc));
 
 	execbuf->buffers_ptr = to_user_pointer(obj);
 	execbuf->flags = ring | (1 << 11) | (1 << 12);
@@ -118,23 +120,33 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 	execbuf->rsvd1 = ctx->id;
 
 	obj[0].handle = gem_create(fd, 4096);
+	if (ahnd) {
+		obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+	}
+
 	gem_write(fd, obj[0].handle, 0, &bbe, sizeof(bbe));
 	execbuf->buffer_count = 1;
 	gem_execbuf(fd, execbuf);
 
 	obj[0].flags |= EXEC_OBJECT_WRITE;
-	obj[1].handle = gem_create(fd, 1024*16 + 4096);
-
+	obj[1].handle = gem_create(fd, NUMSTORES * 16 + 4096);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
-	obj[1].relocation_count = 1024;
+	obj[1].relocation_count = !ahnd ? NUMSTORES : 0;
+
+	if (ahnd) {
+		obj[1].offset = get_offset(ahnd, obj[1].handle,
+				NUMSTORES * 16 + 4096, 0);
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+	}
 
-	batch = gem_mmap__cpu(fd, obj[1].handle, 0, 16*1024 + 4096,
+	batch = gem_mmap__cpu(fd, obj[1].handle, 0, NUMSTORES * 16 + 4096,
 			      PROT_WRITE | PROT_READ);
 	gem_set_domain(fd, obj[1].handle,
 		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 
 	b = batch;
-	for (i = 0; i < 1024; i++) {
+	for (i = 0; i < NUMSTORES; i++) {
 		uint64_t offset;
 
 		reloc[i].presumed_offset = obj[0].offset;
@@ -162,10 +174,11 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 		*b++ = i;
 	}
 	*b++ = MI_BATCH_BUFFER_END;
-	munmap(batch, 16*1024+4096);
+	munmap(batch, NUMSTORES * 16 + 4096);
 
 	execbuf->buffer_count = 2;
 	gem_execbuf(fd, execbuf);
+	put_ahnd(ahnd);
 
 	check_bo(fd, obj[0].handle);
 }
@@ -177,6 +190,7 @@ static void run_test(int fd, const intel_ctx_t *ctx, unsigned ring,
 	struct drm_i915_gem_relocation_entry reloc[1024];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	igt_hang_t hang;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	if (flags & (SUSPEND | HIBERNATE)) {
 		run_test(fd, ctx, ring, 0, 0);
@@ -187,7 +201,7 @@ static void run_test(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 	memset(&hang, 0, sizeof(hang));
 	if (flags & HANG)
-		hang = igt_hang_ctx(fd, ctx->id, ring & ~(3<<13), 0);
+		hang = igt_hang_ring_with_ahnd(fd, ring & ~(3<<13), ahnd);
 
 	if (flags & (CHILD | FORKED | BOMB)) {
 		int nchild;
@@ -240,6 +254,7 @@ static void run_test(int fd, const intel_ctx_t *ctx, unsigned ring,
 		gem_quiescent_gpu(fd);
 		run_test(fd, ctx, ring, 0, 0);
 	}
+	put_ahnd(ahnd);
 }
 
 static uint32_t batch_create(int i915)
@@ -321,11 +336,13 @@ igt_main
 			for_each_ring(e, fd) {
 				igt_dynamic_f("%s", e->name) {
 					igt_require(gem_can_store_dword(fd, eb_ring(e)));
+					intel_allocator_multiprocess_start();
 					run_test(fd, intel_ctx_0(fd),
 						 eb_ring(e),
 						 m->flags,
 						 m->timeout);
 					gem_quiescent_gpu(fd);
+					intel_allocator_multiprocess_stop();
 				}
 			}
 		}
@@ -342,11 +359,13 @@ igt_main
 					continue;
 
 				igt_dynamic_f("%s", e->name) {
+					intel_allocator_multiprocess_start();
 					run_test(fd, ctx,
 						 e->flags,
 						 m->flags,
 						 m->timeout);
 					gem_quiescent_gpu(fd);
+					intel_allocator_multiprocess_stop();
 				}
 			}
 		}
@@ -354,6 +373,7 @@ igt_main
 
 	igt_subtest("basic-all") {
 		const struct intel_execution_engine2 *e;
+		intel_allocator_multiprocess_start();
 
 		for_each_ctx_engine(fd, ctx, e) {
 			if (!gem_class_can_store_dword(fd, e->class))
@@ -364,6 +384,7 @@ igt_main
 		}
 
 		igt_waitchildren();
+		intel_allocator_multiprocess_stop();
 	}
 
 	igt_fixture {
-- 
2.26.0
