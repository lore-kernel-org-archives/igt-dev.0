Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701486EDE5
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:43 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:25 -0800
Message-Id: <20191213215429.24498-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 3/7] tests/i915/svm: Add basic SVM RT
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

Add basic tests for Shared Virtual Memory (SVM) runtime (RT) allocator
functionality. Explicitly bind the buffer objects in device page table
using a shared virtual address and have GPU copy the data from a source
buffer object to destination buffer object. Softpin the batch buffer.
Test for different buffer sizes, allocation method and with multiple
contexts.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/Makefile.sources      |   3 +
 tests/i915/i915_svm_basic.c | 447 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 3 files changed, 451 insertions(+)
 create mode 100644 tests/i915/i915_svm_basic.c

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index 806eb02d..40f05605 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -478,6 +478,9 @@ gem_workarounds_SOURCES = i915/gem_workarounds.c
 TESTS_progs += gem_write_read_ring_switch
 gem_write_read_ring_switch_SOURCES = i915/gem_write_read_ring_switch.c
 
+TESTS_progs += i915_svm_basic
+i915_svm_basic_SOURCES = i915/i915_svm_basic.c
+
 TESTS_progs += gen3_mixed_blits
 gen3_mixed_blits_SOURCES = i915/gen3_mixed_blits.c
 
diff --git a/tests/i915/i915_svm_basic.c b/tests/i915/i915_svm_basic.c
new file mode 100644
index 00000000..66949039
--- /dev/null
+++ b/tests/i915/i915_svm_basic.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ */
+
+/** @file i915_svm_basic.c
+ *
+ * This is the basic test for Shared Virtual Memory (SVM) functionality.
+ *
+ * The goal is to simply ensure that basics work.
+ * This test in part is derived from gem_exec_blt.c
+ */
+
+#include "igt.h"
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include "drm.h"
+#include "i915/gem_vm.h"
+
+#define PAGE_SIZE   4096
+#define PAGE_SHIFT  12
+
+#define COPY_BLT_CMD		(2<<29|0x53<<22|0x6)
+#define BLT_WRITE_ALPHA		(1<<21)
+#define BLT_WRITE_RGB		(1<<20)
+
+#define LOCAL_I915_EXEC_NO_RELOC   (1<<11)
+#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
+
+#define DEFAULT_BUFF_SIZE  (4 * PAGE_SIZE)
+#define BATCH_VA_STRIDE    PAGE_SIZE
+
+#define MAX_CTXTS   4
+
+#define svm_info    igt_info
+#define svm_debug   igt_debug
+
+/* gen8_canonical_addr
+ * Used to convert any address into canonical form, i.e. [63:48] == [47].
+ * Based on kernel's sign_extend64 implementation.
+ * @address - a virtual address
+ */
+#define GEN8_HIGH_ADDRESS_BIT 47
+static uint64_t gen8_canonical_addr(uint64_t address)
+{
+	__u8 shift = 63 - GEN8_HIGH_ADDRESS_BIT;
+	return (__s64)(address << shift) >> shift;
+}
+
+static inline uint32_t lower_32_bits(uint64_t x)
+{
+	return x & 0xffffffff;
+}
+
+static inline uint32_t upper_32_bits(uint64_t x)
+{
+	return x >> 32;
+}
+
+static void print_buffer(void *buf, uint32_t size,
+			 const char *str, bool full)
+{
+	uint32_t i = 0;
+
+	svm_debug("Printing %s 0x%lx size 0x%x\n", str, (uint64_t)buf, size);
+	while (i < size) {
+		uint32_t *b = buf + i;
+
+		svm_debug("\t%s[0x%04x]: 0x%08x 0x%08x 0x%08x 0x%08x %s\n",
+			  str, i, b[0], b[1], b[2], b[3], full ? "" : "...");
+		i += full ? 16 : PAGE_SIZE;
+	}
+}
+
+static void print_object(int fd, uint32_t handle, uint32_t size,
+			 const char *str, bool full)
+{
+	void *buf;
+
+	buf = malloc(size);
+	gem_read(fd, handle, 0, buf, size);
+	print_buffer(buf, size, str, full);
+	free(buf);
+}
+
+static int objcmp(int fd, uint32_t src, uint32_t dst, uint32_t size)
+{
+	void *buf_src, *buf_dst;
+	int ret;
+
+	buf_src = malloc(size);
+	buf_dst = malloc(size);
+	gem_read(fd, src, 0, buf_src, size);
+	gem_read(fd, dst, 0, buf_dst, size);
+	ret = memcmp(buf_src, buf_dst, size);
+	free(buf_src);
+	free(buf_dst);
+	return ret;
+}
+
+static int gem_linear_blt(int devid, uint32_t *batch, void *src,
+			  void *dst, uint32_t length)
+{
+	uint32_t *b = batch;
+	int height = length / (16 * 1024);
+	uint64_t src_va = (uint64_t)src;
+	uint64_t dst_va = (uint64_t)dst;
+
+	igt_assert_lte(height, 1 << 16);
+
+	if (height) {
+		int i = 0;
+		b[i++] = COPY_BLT_CMD | BLT_WRITE_ALPHA | BLT_WRITE_RGB;
+		if (intel_gen(devid) >= 8)
+			b[i-1]+=2;
+		b[i++] = 0xcc << 16 | 1 << 25 | 1 << 24 | (16*1024);
+		b[i++] = 0;
+		b[i++] = height << 16 | (4*1024);
+		b[i++] = lower_32_bits(dst_va);
+		if (intel_gen(devid) >= 8)
+			b[i++] = upper_32_bits(dst_va);
+
+		b[i++] = 0;
+		b[i++] = 16*1024;
+		b[i++] = lower_32_bits(src_va);
+		if (intel_gen(devid) >= 8)
+			b[i++] = upper_32_bits(src_va);
+
+		b += i;
+		length -= height * 16*1024;
+	}
+
+	if (length) {
+		int i = 0;
+		b[i++] = COPY_BLT_CMD | BLT_WRITE_ALPHA | BLT_WRITE_RGB;
+		if (intel_gen(devid) >= 8)
+			b[i-1]+=2;
+		b[i++] = 0xcc << 16 | 1 << 25 | 1 << 24 | (16*1024);
+		b[i++] = height << 16;
+		b[i++] = (1+height) << 16 | (length / 4);
+		b[i++] = lower_32_bits(dst_va);
+		if (intel_gen(devid) >= 8)
+			b[i++] = upper_32_bits(dst_va);
+
+		b[i++] = height << 16;
+		b[i++] = 16*1024;
+		b[i++] = lower_32_bits(src_va);
+		if (intel_gen(devid) >= 8)
+			b[i++] = upper_32_bits(src_va);
+
+		b += i;
+	}
+
+	b[0] = MI_BATCH_BUFFER_END;
+	b[1] = 0;
+
+	return (b + 2 - batch) * sizeof(uint32_t);
+}
+
+/* Softpin batch buffer in non-conflicting higher address space */
+static uint64_t get_batch_va(int fd)
+{
+	struct drm_i915_gem_context_param arg = { 0 };
+
+	arg.param = I915_CONTEXT_PARAM_GTT_SIZE;
+	gem_context_get_param(fd, &arg);
+	return gen8_canonical_addr(arg.value >> 1);
+}
+
+static void __gem_copy(int fd, uint32_t src_obj, uint32_t dst_obj,
+		       void *src, void *dst, uint32_t offset, uint32_t size,
+		       uint32_t ctx_id, uint32_t handle, uint64_t batch_va)
+{
+	struct drm_i915_gem_exec_object2 exec[3] = { 0 };
+	struct drm_i915_gem_execbuffer2 execbuf;
+	uint32_t buf[20], len, i = 0, ring = 0;
+	int devid = intel_get_drm_devid(fd);
+
+	len = gem_linear_blt(devid, buf, src + offset, dst + offset, size);
+
+	gem_write(fd, handle, 0, buf, len);
+	print_buffer(buf, len, "batch", true);
+	if (src_obj) {
+		exec[i].handle = src_obj;
+		exec[i].offset = (uint64_t)src;
+		exec[i++].flags = EXEC_OBJECT_PINNED |
+				  EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+	if (dst_obj) {
+		exec[i].handle = dst_obj;
+		exec[i].offset = (uint64_t)dst;
+		exec[i++].flags = EXEC_OBJECT_PINNED |
+				  EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+	exec[i].handle = handle;
+	exec[i].offset = batch_va;
+	exec[i++].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	if (HAS_BLT_RING(devid))
+		ring = I915_EXEC_BLT;
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&exec);
+	execbuf.buffer_count = i;
+	execbuf.batch_len = len;
+	execbuf.flags = ring;
+	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
+	i915_execbuffer2_set_context_id(execbuf, ctx_id);
+	gem_execbuf(fd, &execbuf);
+}
+
+static void gem_copy(int fd, uint32_t src_obj, uint32_t dst_obj,
+		     void *src, void *dst, uint32_t size,
+		     uint32_t *ctx_id, int num_ctxts)
+{
+	uint32_t i, handle[MAX_CTXTS], rem = size;
+	uint32_t delta, npages = size / PAGE_SIZE;
+	uint64_t batch_va = get_batch_va(fd);
+
+	delta = (npages / num_ctxts) * PAGE_SIZE;
+	delta += (npages % num_ctxts) ? PAGE_SIZE : 0;
+	for (i = 0; i < num_ctxts; i++) {
+		handle[i] = gem_create(fd, PAGE_SIZE);
+		svm_info("Issuing gem copy on ctx 0x%x\n", ctx_id[i]);
+		__gem_copy(fd, src_obj, dst_obj, src, dst, (i * delta),
+			   min(rem, delta), ctx_id[i], handle[i], batch_va);
+		rem -= delta;
+		batch_va += BATCH_VA_STRIDE;
+	}
+
+	for (i = 0; i < num_ctxts; i++) {
+		gem_sync(fd, handle[i]);
+		svm_info("gem copy completed on ctx 0x%x\n", ctx_id[i]);
+		gem_close(fd, handle[i]);
+	}
+}
+
+static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
+		   bool bind, bool unbind, int32_t num_ctxts)
+{
+	uint32_t i, npages = size / PAGE_SIZE;
+	uint32_t shared_vm_id, vm_id[MAX_CTXTS];
+	uint32_t ctx_id[MAX_CTXTS];
+	uint64_t src_va, dst_va;
+	uint32_t src, dst;
+	bool share_vm;
+	void *buf;
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
+	/* Create objects */
+	src = gem_create(fd, size);
+	dst = gem_create(fd, size);
+
+	/* Static assignment */
+	src_va = 0xa000000;
+	dst_va = 0xb000000;
+
+	/* Allocate buffer and fill pattern */
+	buf = malloc(size);
+	for (i = 0; i < npages; i++)
+		memset(buf + i * PAGE_SIZE, i + 1, PAGE_SIZE);
+	gem_write(fd, src, 0, buf, size);
+	print_buffer(buf, size, "src_obj", false);
+	free(buf);
+
+	if (migrate) {
+		svm_info("Migrating obj 0x%x to smem region\n", src);
+		gem_migrate_to_smem(fd, src);
+
+		svm_info("Migrating obj 0x%x to smem region\n", dst);
+		gem_migrate_to_smem(fd, dst);
+	}
+
+	/* Bind the buffers to device page table */
+	/* XXX: Test READ_ONLY bindings */
+	for (i = 0; bind && (i < num_ctxts); i++) {
+		svm_info("Binding obj 0x%x at 0x%lx size 0x%x vm 0x%x\n",
+			 src, src_va, size, vm_id[i]);
+		gem_svm_bind(fd, src_va, src, vm_id[i], false);
+
+		svm_info("Binding obj 0x%x at 0x%lx size 0x%x vm 0x%x\n",
+			 dst, dst_va, size, vm_id[i]);
+		gem_svm_bind(fd, dst_va, dst, vm_id[i], false);
+
+		if (share_vm)
+			break;
+	}
+
+	/* Have GPU do the copy */
+	if (copy) {
+		if (bind)
+			gem_copy(fd, 0, 0, (void *)src_va, (void *)dst_va,
+				 size, ctx_id, num_ctxts);
+		else
+			gem_copy(fd, src, dst, (void *)src_va, (void *)dst_va,
+				 size, ctx_id, num_ctxts);
+	}
+
+	/*
+	 * Unbind buffers from device page table.
+	 * If not, it should get unbound while freeing the buffer.
+	 */
+	for (i = 0; unbind && (i < num_ctxts); i++) {
+		svm_info("Unbinding obj 0x%x vm 0x%x\n", src, vm_id[i]);
+		gem_svm_unbind(fd, src, vm_id[i]);
+
+		svm_info("Unbinding obj 0x%x vm 0x%x\n", dst, vm_id[i]);
+		gem_svm_unbind(fd, dst, vm_id[i]);
+
+		if (share_vm)
+			break;
+	}
+
+	if (migrate) {
+		svm_info("Migrating obj 0x%x to lmem region\n", src);
+		gem_migrate_to_lmem(fd, src);
+
+		svm_info("Migrating obj 0x%x to lmem region\n", dst);
+		gem_migrate_to_lmem(fd, dst);
+	}
+
+	print_object(fd, dst, size, "dst_obj", false);
+
+	/* Validate */
+	if (copy)
+		 igt_assert(objcmp(fd, src, dst, size) == 0);
+
+	/* Free the objects */
+	svm_debug("Closing object 0x%x\n", src);
+	gem_close(fd, src);
+	svm_debug("Closing object 0x%x\n", dst);
+	gem_close(fd, dst);
+
+	sleep(2); /* Wait for handles to get freed */
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
+igt_main
+{
+	struct {
+		const char *name;
+		uint32_t size;
+		bool migrate;
+		bool copy;
+		bool bind;
+		bool unbind;
+		int32_t num_ctxts;
+	} *r, rt_tests[] = {
+		/* Basic runtime allocator test */
+		{"rt_basic", 0, false, true, true, true, 1},
+
+		/* Skip GPU copy */
+		{"rt_no_gpu_copy", 0, false, false, true, true, 1},
+
+		/* Skip unbinding */
+		{"rt_no_unbind",  0, false, true, true, false, 1},
+
+		/* Skip explicit binding and bind in the execbuf path  */
+		{"rt_no_bind",  0, false, true, false, true, 1},
+
+		/* Use multiple contexts */
+		{"rt_multi_ctxts", 0, false, true, true, true, 2},
+
+		/* Use multiple contexts and share vm (-ve num_ctxts) */
+		{"rt_multi_ctxts_share_vm", 0, false, true, true, true, -2},
+
+		/* Use 64K buffers */
+		{"rt_64K", (16 * PAGE_SIZE), false, true, true, true, 1},
+
+		/* Use 2M buffers */
+		{"rt_2M", (512 * PAGE_SIZE), false, true, true, true, 1},
+	};
+	int fd, idx;
+	uint32_t def_size;
+	bool has_lmem;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(fd);
+		igt_require_svm(fd);
+		has_lmem = gem_has_lmem(fd);
+		def_size = DEFAULT_BUFF_SIZE;
+	}
+
+	/* Below are runtime (rt) allocator tests */
+	for (idx = 0, r = rt_tests; idx < ARRAY_SIZE(rt_tests); idx++, r++) {
+		bool migrate = has_lmem ? r->migrate : false;
+		uint32_t size = r->size ? : def_size;
+
+		igt_subtest_f("%s",r->name)
+			run_rt(fd, size, migrate, r->copy, r->bind, r->unbind,
+			       r->num_ctxts);
+	}
+
+	igt_fixture {
+		close(fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 570de545..87021902 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -226,6 +226,7 @@ i915_progs = [
 	'gem_wait',
 	'gem_workarounds',
 	'gem_write_read_ring_switch',
+	'i915_svm_basic',
 	'i915_fb_tiling',
 	'i915_getparams_basic',
 	'i915_hangman',
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
