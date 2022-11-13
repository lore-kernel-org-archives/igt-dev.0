Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1576410E0EF
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Nov 2022 07:53:17 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Nov 2022 23:53:05 -0800
Message-Id: <20221113075309.32023-10-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
References: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 09/13] tests/i915/vm_bind: Add userptr
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add userptr object type to vm_bind_basic test.

v2: Run all tests for userptr type
v3: Change info to debug messages, remove igt_collection usage

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_basic.c | 55 +++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_vm_bind_basic.c b/tests/i915/i915_vm_bind_basic.c
index 3b29301a0..971d65a74 100644
--- a/tests/i915/i915_vm_bind_basic.c
+++ b/tests/i915/i915_vm_bind_basic.c
@@ -234,16 +234,24 @@ static uint32_t create_obj(int fd, struct gem_memory_region *mr, uint32_t size,
 {
 	uint32_t handle;
 
-	handle = gem_create_in_memory_region_list(fd, size, 0, &mr->ci, 1);
-	*addr = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
+	if (!mr) {
+		igt_assert(posix_memalign(addr, SZ_2M * MAX_CTXTS, size) == 0);
+		gem_userptr(fd, *addr, size, 0, 0, &handle);
+	} else {
+		handle = gem_create_in_memory_region_list(fd, size, 0, &mr->ci, 1);
+		*addr = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
+	}
 
 	return handle;
 }
 
-static void destroy_obj(int fd, uint32_t handle, uint32_t size, void *addr)
+static void destroy_obj(int fd, uint32_t handle, uint32_t size, void *addr, bool is_userptr)
 {
 	igt_assert(gem_munmap(addr, size) == 0);
 	gem_close(fd, handle);
+
+	if (is_userptr)
+		free(addr);
 }
 
 static void create_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[],
@@ -254,6 +262,14 @@ static void create_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[]
 	if (!num_cmds)
 		return;
 
+	if (!mr) {
+		for (i = 0; i < num_cmds; i++) {
+			src[i] = create_obj(fd, NULL, size, &src_addr[i]);
+			igt_debug("Src (userptr) obj 0x%x created\n", src[i]);
+		}
+		return;
+	}
+
 	/* Create first src object always in memory region 'mr' */
 	src[i] = create_obj(fd, mr, size, &src_addr[i]);
 	igt_debug("Src (%s) obj 0x%x created\n", mr->name, src[i]);
@@ -292,7 +308,7 @@ static void destroy_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[
 
 	for (i = 0; i < num_cmds; i++) {
 		igt_debug("Closing src object 0x%x\n", src[i]);
-		destroy_obj(fd, src[i], size, src_addr[i]);
+		destroy_obj(fd, src[i], size, src_addr[i], !mr);
 	}
 }
 
@@ -300,7 +316,7 @@ static uint32_t create_dst_obj(int fd, struct gem_memory_region *mr, uint32_t si
 {
 	uint32_t dst = create_obj(fd, mr, size, dst_addr);
 
-	igt_debug("Dst (%s) obj 0x%x created\n", mr->name, dst);
+	igt_debug("Dst (%s) obj 0x%x created\n", mr ? mr->name : "userptr", dst);
 	return dst;
 }
 
@@ -308,7 +324,7 @@ static void destroy_dst_obj(int fd, struct gem_memory_region *mr, uint32_t dst,
 			    uint32_t size, void *dst_addr)
 {
 	igt_debug("Closing dst object 0x%x\n", dst);
-	destroy_obj(fd, dst, size, dst_addr);
+	destroy_obj(fd, dst, size, dst_addr, !mr);
 }
 
 static void pattern_fill_buf(void *src_addr[], uint32_t size, uint32_t num_cmds, uint32_t npages)
@@ -498,6 +514,25 @@ static void run_test(int fd, const intel_ctx_t *base_ctx, struct test_cfg *cfg,
 		gem_vm_destroy(fd, shared_vm_id);
 }
 
+static int has_userptr(int fd)
+{
+	uint32_t handle = 0;
+	void *ptr;
+	int ret;
+
+	assert(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE) == 0);
+	ret = __gem_userptr(fd, ptr, PAGE_SIZE, 0, 0, &handle);
+	if (ret != 0) {
+		free(ptr);
+		return 0;
+	}
+
+	gem_close(fd, handle);
+	free(ptr);
+
+	return handle != 0;
+}
+
 igt_main
 {
 	struct test_cfg *t, tests[] = {
@@ -548,6 +583,14 @@ igt_main
 				igt_dynamic_f("%s", r->name)
 					run_test(fd, ctx, &cfg, r, alignment, e);
 			}
+
+			if (has_userptr(fd)) {
+				struct test_cfg cfg = *t;
+
+				/* Use NULL memory region for userptr */
+				igt_dynamic("userptr")
+					run_test(fd, ctx, &cfg, NULL, PAGE_SIZE, e);
+			}
 		}
 	}
 
-- 
2.21.0.rc0.32.g243a4c7e27
