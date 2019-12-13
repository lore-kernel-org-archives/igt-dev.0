Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD756EDE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:43 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:26 -0800
Message-Id: <20191213215429.24498-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 4/7] tests/i915/svm: Add mmap support for SVM
 RT allocator
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

mmap and directly access the runtime (RT) allocator buffer objects.
This further tests the implicit migration of buffer objects.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 tests/i915/i915_svm_basic.c | 53 ++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/tests/i915/i915_svm_basic.c b/tests/i915/i915_svm_basic.c
index 66949039..90159443 100644
--- a/tests/i915/i915_svm_basic.c
+++ b/tests/i915/i915_svm_basic.c
@@ -244,11 +244,12 @@ static void gem_copy(int fd, uint32_t src_obj, uint32_t dst_obj,
 }
 
 static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
-		   bool bind, bool unbind, int32_t num_ctxts)
+		   bool bind, bool unbind, int32_t num_ctxts, bool mmap)
 {
 	uint32_t i, npages = size / PAGE_SIZE;
 	uint32_t shared_vm_id, vm_id[MAX_CTXTS];
 	uint32_t ctx_id[MAX_CTXTS];
+	void *src_addr, *dst_addr;
 	uint64_t src_va, dst_va;
 	uint32_t src, dst;
 	bool share_vm;
@@ -285,18 +286,32 @@ static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
 	src = gem_create(fd, size);
 	dst = gem_create(fd, size);
 
-	/* Static assignment */
-	src_va = 0xa000000;
-	dst_va = 0xb000000;
+	if (mmap) {
+		src_addr = gem_mmap__wc(fd, src, 0, size, PROT_WRITE);
+		dst_addr = gem_mmap__wc(fd, dst, 0, size, PROT_WRITE);
+	}
+
+	if (mmap) {
+		 src_va = (uint64_t)src_addr;
+		 dst_va = (uint64_t)dst_addr;
+	} else {
+		/* Static assignment */
+		src_va = 0xa000000;
+		dst_va = 0xb000000;
+	}
 
 	/* Allocate buffer and fill pattern */
 	buf = malloc(size);
 	for (i = 0; i < npages; i++)
 		memset(buf + i * PAGE_SIZE, i + 1, PAGE_SIZE);
 	gem_write(fd, src, 0, buf, size);
-	print_buffer(buf, size, "src_obj", false);
 	free(buf);
 
+	if (mmap)
+		print_buffer(src_addr, size, "src_obj_mmap", false);
+	else
+		print_object(fd, src, size, "src_obj", false);
+
 	if (migrate) {
 		svm_info("Migrating obj 0x%x to smem region\n", src);
 		gem_migrate_to_smem(fd, src);
@@ -353,7 +368,11 @@ static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
 		gem_migrate_to_lmem(fd, dst);
 	}
 
-	print_object(fd, dst, size, "dst_obj", false);
+	/* Accessing the buffer will migrate the pages from device to host */
+	if (mmap)
+		print_buffer(dst_addr, size, "dst_obj_mmap", false);
+	else
+		print_object(fd, dst, size, "dst_obj", false);
 
 	/* Validate */
 	if (copy)
@@ -392,30 +411,34 @@ igt_main
 		bool bind;
 		bool unbind;
 		int32_t num_ctxts;
+		bool mmap;
 	} *r, rt_tests[] = {
 		/* Basic runtime allocator test */
-		{"rt_basic", 0, false, true, true, true, 1},
+		{"rt_basic", 0, false, true, true, true, 1, false},
+
+		/* Basic runtime allocator test with mmap reads */
+		{"rt_basic_mmap", 0, false, true, true, true, 1, true},
 
 		/* Skip GPU copy */
-		{"rt_no_gpu_copy", 0, false, false, true, true, 1},
+		{"rt_no_gpu_copy", 0, false, false, true, true, 1, false},
 
 		/* Skip unbinding */
-		{"rt_no_unbind",  0, false, true, true, false, 1},
+		{"rt_no_unbind",  0, false, true, true, false, 1, false},
 
 		/* Skip explicit binding and bind in the execbuf path  */
-		{"rt_no_bind",  0, false, true, false, true, 1},
+		{"rt_no_bind",  0, false, true, false, true, 1, false},
 
 		/* Use multiple contexts */
-		{"rt_multi_ctxts", 0, false, true, true, true, 2},
+		{"rt_multi_ctxts", 0, false, true, true, true, 2, false},
 
 		/* Use multiple contexts and share vm (-ve num_ctxts) */
-		{"rt_multi_ctxts_share_vm", 0, false, true, true, true, -2},
+		{"rt_multi_ctxts_share_vm", 0, false, true, true, true, -2, false},
 
 		/* Use 64K buffers */
-		{"rt_64K", (16 * PAGE_SIZE), false, true, true, true, 1},
+		{"rt_64K", (16 * PAGE_SIZE), false, true, true, true, 1, false},
 
 		/* Use 2M buffers */
-		{"rt_2M", (512 * PAGE_SIZE), false, true, true, true, 1},
+		{"rt_2M", (512 * PAGE_SIZE), false, true, true, true, 1, false},
 	};
 	int fd, idx;
 	uint32_t def_size;
@@ -436,7 +459,7 @@ igt_main
 
 		igt_subtest_f("%s",r->name)
 			run_rt(fd, size, migrate, r->copy, r->bind, r->unbind,
-			       r->num_ctxts);
+			       r->num_ctxts, r->mmap);
 	}
 
 	igt_fixture {
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
