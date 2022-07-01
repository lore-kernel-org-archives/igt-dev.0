Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCB4112A91
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 23:06:12 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 16:05:46 -0700
Message-Id: <20220701230546.8348-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
References: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 5/5] tests/i915/vm_bind: Add userptr subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add userptr object type to vm_bind_basic test.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_basic.c | 63 ++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/tests/i915/i915_vm_bind_basic.c b/tests/i915/i915_vm_bind_basic.c
index 209fda77c6..6a3b15fa91 100644
--- a/tests/i915/i915_vm_bind_basic.c
+++ b/tests/i915/i915_vm_bind_basic.c
@@ -78,10 +78,12 @@ struct mapping {
 #define TEST_SMEM             BIT(0)
 #define TEST_SKIP_UNBIND      BIT(1)
 #define TEST_SHARE_VM         BIT(2)
+#define TEST_USERPTR          BIT(3)
 
 #define is_lmem(cfg)        (!((cfg)->flags & TEST_SMEM))
 #define do_unbind(cfg)      (!((cfg)->flags & TEST_SKIP_UNBIND))
 #define do_share_vm(cfg)    ((cfg)->flags & TEST_SHARE_VM)
+#define is_userptr(cfg)     ((cfg)->flags & TEST_USERPTR)
 
 struct test_cfg {
 	const char *name;
@@ -265,13 +267,21 @@ static void create_src_objs(int fd, struct test_cfg *cfg, uint32_t src[], uint32
 			    uint32_t num_cmds, void *src_addr[])
 {
 	int i;
-	struct igt_collection *set = get_region_set(fd, cfg);
-	uint32_t region;
 
-	for (i = 0; i < num_cmds; i++) {
-		region = igt_collection_get_value(set, i % set->size);
-		src[i] = gem_create_in_memory_regions(fd, size, region);
-		src_addr[i] = gem_mmap__cpu(fd, src[i], 0, size, PROT_WRITE);
+	if (is_userptr(cfg)) {
+		for (i = 0; i < num_cmds; i++) {
+			igt_assert(posix_memalign(&src_addr[i], SZ_2M, size) == 0);
+			gem_userptr(fd, src_addr[i], size, 0, 0, &src[i]);
+		}
+	} else {
+		struct igt_collection *set = get_region_set(fd, cfg);
+		uint32_t region;
+
+		for (i = 0; i < num_cmds; i++) {
+			region = igt_collection_get_value(set, i % set->size);
+			src[i] = gem_create_in_memory_regions(fd, size, region);
+			src_addr[i] = gem_mmap__cpu(fd, src[i], 0, size, PROT_WRITE);
+		}
 	}
 }
 
@@ -284,16 +294,25 @@ static void destroy_src_objs(int fd, struct test_cfg *cfg, uint32_t src[], uint3
 		igt_assert(gem_munmap(src_addr[i], size) == 0);
 		igt_debug("Closing object 0x%x\n", src[i]);
 		gem_close(fd, src[i]);
+		if (is_userptr(cfg))
+			free(src_addr[i]);
 	}
 }
 
 static uint32_t create_dst_obj(int fd, struct test_cfg *cfg, uint32_t size, void **dst_addr)
 {
 	uint32_t dst;
-	struct igt_collection *set = get_region_set(fd, cfg);
 
-	dst = gem_create_in_memory_regions(fd, size, igt_collection_get_value(set, 0));
-	*dst_addr = gem_mmap__cpu(fd, dst, 0, size, PROT_WRITE);
+	if (is_userptr(cfg)) {
+		igt_assert(posix_memalign(dst_addr, SZ_2M, size) == 0);
+
+		gem_userptr(fd, *dst_addr, size, 0, 0, &dst);
+	} else {
+		struct igt_collection *set = get_region_set(fd, cfg);
+
+		dst = gem_create_in_memory_regions(fd, size, igt_collection_get_value(set, 0));
+		*dst_addr = gem_mmap__cpu(fd, dst, 0, size, PROT_WRITE);
+	}
 
 	return dst;
 }
@@ -303,6 +322,9 @@ static void destroy_dst_obj(int fd, struct test_cfg *cfg, uint32_t dst, uint32_t
 	igt_assert(gem_munmap(dst_addr, size) == 0);
 	igt_debug("Closing object 0x%x\n", dst);
 	gem_close(fd, dst);
+
+	if (is_userptr(cfg))
+		free(dst_addr);
 }
 
 static void pattern_fill_buf(void *src_addr[], uint32_t size, uint32_t num_cmds, uint32_t npages)
@@ -469,6 +491,25 @@ static void run_test(int fd, const intel_ctx_t *base_ctx, struct test_cfg *cfg,
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
 static int vm_bind_version(int fd)
 {
 	struct drm_i915_getparam gp;
@@ -497,6 +538,7 @@ igt_main
 		{"2M", SZ_2M, 1, 1, 0},
 		{"smem", 0, 1, 1, TEST_SMEM},
 		{"smem_multi_cmds", 0, MAX_CMDS, 1, TEST_SMEM},
+		{"userptr", 0, 1, 1, TEST_USERPTR},
 		{ }
 	};
 	int fd;
@@ -526,6 +568,9 @@ igt_main
 			for_each_ctx_engine(fd, ctx, e) {
 				if (e->class == I915_ENGINE_CLASS_COPY) {
 					igt_dynamic(e->name) {
+						if (is_userptr(t))
+							igt_require(has_userptr(fd));
+
 						run_test(fd, ctx, t, e);
 					}
 				}
-- 
2.21.0.rc0.32.g243a4c7e27
