Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBB86EDE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:44 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:27 -0800
Message-Id: <20191213215429.24498-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 5/7] tests/i915/svm: Add basic SVM SYS
 allocator test support
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com, jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com, jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com, jgg@mellanox.com
List-ID: <igt-dev@lists.freedesktop.org>

Add basic tests for Shared Virtual Memory (SVM) system (SYS) allocator
functionality. Have GPU copy the data from a source buffer to
destination buffer by explicitly binding buffers in device page
table using shared virtual addresses.
Explicitly migrate buffers from host to device memory and expect it to
be migrated back to host memory upon CPU access.
Test for different buffer sizes, allocation method and with multiple
contexts.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_svm_basic.c | 207 ++++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/tests/i915/i915_svm_basic.c b/tests/i915/i915_svm_basic.c
index 90159443..22461ba9 100644
--- a/tests/i915/i915_svm_basic.c
+++ b/tests/i915/i915_svm_basic.c
@@ -40,9 +40,16 @@
 
 #define MAX_CTXTS   4
 
+#define I915_SVM_ALLOC_ALIGN    0
+#define I915_SVM_ALLOC_MMAP     1
+#define I915_SVM_NUM_ALLOC      2
+
 #define svm_info    igt_info
 #define svm_debug   igt_debug
 
+static const char *
+alloc_type_str[I915_SVM_NUM_ALLOC] = { "align", "mmap" };
+
 /* gen8_canonical_addr
  * Used to convert any address into canonical form, i.e. [63:48] == [47].
  * Based on kernel's sign_extend64 implementation.
@@ -65,6 +72,35 @@ static inline uint32_t upper_32_bits(uint64_t x)
 	return x >> 32;
 }
 
+static void *svm_alloc(int size, int alloc_type, void *addr)
+{
+	void *ptr;
+
+	if (alloc_type == I915_SVM_ALLOC_MMAP) {
+		int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+
+		flags |= addr ? MAP_FIXED : 0;
+		ptr = mmap(addr, size, PROT_READ | PROT_WRITE, flags, -1, 0);
+		igt_assert(ptr != MAP_FAILED);
+	} else {
+		igt_assert(posix_memalign(&ptr, 512 * PAGE_SIZE, size) == 0);
+	}
+
+	svm_debug("Allocated %sed buf 0x%lx\n",
+		  alloc_type_str[alloc_type], (uint64_t)ptr);
+	return ptr;
+}
+
+static void svm_free(void *ptr, int size, int alloc_type)
+{
+	svm_debug("Freeing %s buf 0x%lx\n",
+		  alloc_type_str[alloc_type], (uint64_t)ptr);
+	if (alloc_type == I915_SVM_ALLOC_MMAP)
+		munmap(ptr, size);
+	else
+		free(ptr);
+}
+
 static void print_buffer(void *buf, uint32_t size,
 			 const char *str, bool full)
 {
@@ -401,8 +437,169 @@ static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
 		gem_vm_destroy(fd, shared_vm_id);
 }
 
+static void run_sys(int fd, uint32_t size, bool migrate, bool copy,
+		    int alloc_type, bool unbind, int32_t num_ctxts)
+{
+	uint32_t region = INTEL_MEMORY_REGION_ID(I915_DEVICE_MEMORY);
+	uint32_t i, npages = size / PAGE_SIZE;
+	uint32_t shared_vm_id, vm_id[MAX_CTXTS];
+	uint32_t ctx_id[MAX_CTXTS];
+	void *src, *dst;
+	bool share_vm;
+
+	/* Fix parmeters; -ve num_ctxts means all contexts share the vm */
+	num_ctxts = num_ctxts ? : 1;
+	share_vm = num_ctxts < 0;
+	if (num_ctxts < 0)
+		num_ctxts = -num_ctxts;
+
+	/* For shared VM, we need to bind,unbind,en/disable SVM only once */
+	if (share_vm)
+		shared_vm_id = gem_vm_create(fd);
+
+	/* Create contexts and enable svm */
+	num_ctxts = min(MAX_CTXTS, num_ctxts);
+	for (i = 0; i < num_ctxts; i++) {
+		ctx_id[i] = gem_context_create(fd);
+		if (share_vm) {
+			vm_id[i] = shared_vm_id;
+			gem_ctx_set_vm(fd, ctx_id[i], vm_id[i]);
+		} else {
+			vm_id[i] = gem_ctx_get_vm(fd, ctx_id[i]);
+		}
+	}
+	for (i = 0; i < num_ctxts; i++) {
+		gem_vm_enable_svm(fd, vm_id[i]);
+		if (share_vm)
+			break;
+	}
+
+	/* Allocate buffers */
+	src = svm_alloc(size, alloc_type, NULL);
+	dst = svm_alloc(size, alloc_type, NULL);
+
+	/* Fill patterns */
+	memset(dst, 0, size);
+	for (i = 0; i < npages; i++)
+		memset(src + i * PAGE_SIZE, i + 1, PAGE_SIZE);
+
+	print_buffer(src, size, "src", false);
+	print_buffer(dst, size, "dst", false);
+
+	/*
+	 * Explicitly migrate buffers to device memory, if specified.
+	 * Otherwise, buffers remain in host memory.
+	 */
+	if (migrate) {
+		svm_info("Migrating 0x%lx size 0x%x to mem region 0x%x\n",
+			 (uint64_t)src, size, region);
+		svm_prefetch(fd, src, size, region);
+
+		svm_info("Migrating 0x%lx size 0x%x to mem region 0x%x\n",
+			 (uint64_t)dst, size, region);
+		svm_prefetch(fd, dst, size, region);
+	}
+
+	/* Bind the buffers to device page table */
+	/* XXX: Test READ_ONLY bindings */
+	for (i = 0; i < num_ctxts; i++) {
+		svm_info("Binding 0x%lx size 0x%x vm 0x%x\n",
+			 (uint64_t)src, size, vm_id[i]);
+		svm_bind(fd, src, size, vm_id[i], false);
+
+		svm_info("Binding 0x%lx size 0x%x vm 0x%x\n",
+			 (uint64_t)dst, size, vm_id[i]);
+		svm_bind(fd, dst, size, vm_id[i], false);
+
+		if (share_vm)
+			break;
+	}
+
+	/* Have GPU do the copy */
+	if (copy)
+		gem_copy(fd, 0, 0, src, dst, size, ctx_id, num_ctxts);
+
+	/*
+	 * Unbind buffers from device page table.
+	 * If not, it should get unbound while freeing the buffer.
+	 */
+	if (unbind) {
+		for (i = 0; i < num_ctxts; i++) {
+			svm_info("Unbinding 0x%lx size 0x%x vm 0x%x\n",
+				 (uint64_t)src, size, vm_id[i]);
+			svm_unbind(fd, src, size, vm_id[i]);
+
+			svm_info("Unbinding 0x%lx size 0x%x vm 0x%x\n",
+				 (uint64_t)dst, size, vm_id[i]);
+			svm_unbind(fd, dst, size, vm_id[i]);
+
+			if (share_vm)
+				break;
+		}
+	}
+
+	/* Accessing the buffer will migrate the pages from device to host */
+	print_buffer(dst, size, "dst", false);
+
+	/* Validate */
+	if (copy)
+		igt_assert(memcmp(src, dst, size) == 0);
+
+	/* Free the buffers */
+	svm_free(dst, size, alloc_type);
+	svm_free(src, size, alloc_type);
+
+	/* Done with the contexts */
+	for (i = 0; i < num_ctxts; i++) {
+		gem_vm_disable_svm(fd, vm_id[i]);
+		if (share_vm)
+			break;
+	}
+	for (i = 0; i < num_ctxts; i++) {
+		svm_debug("Destroying context 0x%x\n", ctx_id[i]);
+		gem_context_destroy(fd, ctx_id[i]);
+	}
+
+	if (share_vm)
+		gem_vm_destroy(fd, shared_vm_id);
+}
+
 igt_main
 {
+	struct {
+		const char *name;
+		uint32_t size;
+		bool migrate;
+		bool copy;
+		int alloc_type;
+		bool unbind;
+		int32_t num_ctxts;
+	}*s, sys_tests[] = {
+		/* Basic test */
+		{"sys_basic", 0, true, true, I915_SVM_ALLOC_ALIGN, true, 1},
+
+		/* Skip GPU copy */
+		{"sys_no_gpu_copy", 0, true, false, I915_SVM_ALLOC_ALIGN, true, 1},
+
+		/* Skip unbinding; should get unbound while freeing */
+		{"sys_no_unbind", 0, true, true, I915_SVM_ALLOC_ALIGN, false, 1},
+
+		/* Use multiple contexts */
+		{"sys_multi_ctxts", 0, true, true, I915_SVM_ALLOC_ALIGN, true, 2},
+
+		/* Use multiple contexts and share vm (-ve num_ctxts) */
+		{"sys_multi_ctxts_share_vm", 0, true, true, I915_SVM_ALLOC_ALIGN, true, -2},
+
+		/* Use 64K buffers */
+		{"sys_64K", (16 * PAGE_SIZE), true, true, I915_SVM_ALLOC_ALIGN, true, 1},
+
+		/* Use 2M buffers */
+		{"sys_2M", (512 * PAGE_SIZE), true, true, I915_SVM_ALLOC_ALIGN, true, 1},
+
+		/* Allocate using mmap */
+		{"sys_mmap", 0, true, true, I915_SVM_ALLOC_MMAP, true, 1},
+	};
+
 	struct {
 		const char *name;
 		uint32_t size;
@@ -452,6 +649,16 @@ igt_main
 		def_size = DEFAULT_BUFF_SIZE;
 	}
 
+	/* Below are System (sys) allocator tests */
+	for (idx = 0, s = sys_tests; idx < ARRAY_SIZE(sys_tests); idx++, s++) {
+		bool migrate = has_lmem ? s->migrate : false;
+		uint32_t size = s->size ? : def_size;
+
+		igt_subtest_f("%s",s->name)
+			run_sys(fd, size, migrate, s->copy, s->alloc_type,
+				s->unbind, s->num_ctxts);
+	}
+
 	/* Below are runtime (rt) allocator tests */
 	for (idx = 0, r = rt_tests; idx < ARRAY_SIZE(rt_tests); idx++, r++) {
 		bool migrate = has_lmem ? r->migrate : false;
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
