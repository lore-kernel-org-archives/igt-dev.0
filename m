Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFA86EDE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:44 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:28 -0800
Message-Id: <20191213215429.24498-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 6/7] tests/i915/svm: Add multiple process tests
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

Test with multiple processes as each has its own address space.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 tests/i915/i915_svm_basic.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/tests/i915/i915_svm_basic.c b/tests/i915/i915_svm_basic.c
index 22461ba9..568ee321 100644
--- a/tests/i915/i915_svm_basic.c
+++ b/tests/i915/i915_svm_basic.c
@@ -44,8 +44,10 @@
 #define I915_SVM_ALLOC_MMAP     1
 #define I915_SVM_NUM_ALLOC      2
 
-#define svm_info    igt_info
-#define svm_debug   igt_debug
+#define NUM_PROCS   2
+
+#define svm_info(f, ...)   igt_info("PID-%d: "f, getpid(), __VA_ARGS__)
+#define svm_debug(f, ...)  igt_debug("PID-%d: "f, getpid(), __VA_ARGS__)
 
 static const char *
 alloc_type_str[I915_SVM_NUM_ALLOC] = { "align", "mmap" };
@@ -279,8 +281,8 @@ static void gem_copy(int fd, uint32_t src_obj, uint32_t dst_obj,
 	}
 }
 
-static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
-		   bool bind, bool unbind, int32_t num_ctxts, bool mmap)
+static void do_run_rt(int fd, uint32_t size, bool migrate, bool copy,
+		      bool bind, bool unbind, int32_t num_ctxts, bool mmap)
 {
 	uint32_t i, npages = size / PAGE_SIZE;
 	uint32_t shared_vm_id, vm_id[MAX_CTXTS];
@@ -437,8 +439,25 @@ static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
 		gem_vm_destroy(fd, shared_vm_id);
 }
 
-static void run_sys(int fd, uint32_t size, bool migrate, bool copy,
-		    int alloc_type, bool unbind, int32_t num_ctxts)
+static void run_rt(int fd, uint32_t size, bool migrate, bool copy,
+		   bool bind, bool unbind, int32_t num_ctxts,
+		   bool mmap, uint32_t num_child)
+{
+	if (!num_child) {
+		do_run_rt(fd, size, migrate, copy, bind, unbind,
+			  num_ctxts, mmap);
+		return;
+	}
+
+	igt_fork(child, num_child) {
+		do_run_rt(fd, size, migrate, copy, bind, unbind,
+			  num_ctxts, mmap);
+	}
+	igt_waitchildren();
+}
+
+static void do_run_sys(int fd, uint32_t size, bool migrate, bool copy,
+		       int alloc_type, bool unbind, int32_t num_ctxts)
 {
 	uint32_t region = INTEL_MEMORY_REGION_ID(I915_DEVICE_MEMORY);
 	uint32_t i, npages = size / PAGE_SIZE;
@@ -564,6 +583,23 @@ static void run_sys(int fd, uint32_t size, bool migrate, bool copy,
 		gem_vm_destroy(fd, shared_vm_id);
 }
 
+static void run_sys(int fd, uint32_t size, bool migrate, bool copy,
+		    int alloc_type, bool unbind, int32_t num_ctxts,
+		    uint32_t num_child)
+{
+	if (!num_child) {
+		do_run_sys(fd, size, migrate, copy, alloc_type,
+			   unbind, num_ctxts);
+		return;
+	}
+
+	igt_fork(child, num_child) {
+		do_run_sys(fd, size, migrate, copy, alloc_type,
+			   unbind, num_ctxts);
+	}
+	igt_waitchildren();
+}
+
 igt_main
 {
 	struct {
@@ -656,7 +692,16 @@ igt_main
 
 		igt_subtest_f("%s",s->name)
 			run_sys(fd, size, migrate, s->copy, s->alloc_type,
-				s->unbind, s->num_ctxts);
+				s->unbind, s->num_ctxts, 0);
+	}
+
+	for (idx = 0, s = sys_tests; idx < ARRAY_SIZE(sys_tests); idx++, s++) {
+		bool migrate = has_lmem ? s->migrate : false;
+		uint32_t size = s->size ? : def_size;
+
+		igt_subtest_f("%s_mprocs",s->name)
+			run_sys(fd, size, migrate, s->copy, s->alloc_type,
+				s->unbind, s->num_ctxts, NUM_PROCS);
 	}
 
 	/* Below are runtime (rt) allocator tests */
@@ -666,7 +711,16 @@ igt_main
 
 		igt_subtest_f("%s",r->name)
 			run_rt(fd, size, migrate, r->copy, r->bind, r->unbind,
-			       r->num_ctxts, r->mmap);
+			       r->num_ctxts, r->mmap, 0);
+	}
+
+	for (idx = 0, r = rt_tests; idx < ARRAY_SIZE(rt_tests); idx++, r++) {
+		bool migrate = has_lmem ? r->migrate : false;
+		uint32_t size = r->size ? : def_size;
+
+		igt_subtest_f("%s_mprocs",r->name)
+			run_rt(fd, size, migrate, r->copy, r->bind, r->unbind,
+			       r->num_ctxts, r->mmap, NUM_PROCS);
 	}
 
 	igt_fixture {
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
