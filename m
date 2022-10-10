Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8E910E6F8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 07:00:10 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  9 Oct 2022 23:59:26 -0700
Message-Id: <20221010065929.32110-9-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
References: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 08/11] tests/i915/vm_bind: Add userptr
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_basic.c | 73 ++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/tests/i915/i915_vm_bind_basic.c b/tests/i915/i915_vm_bind_basic.c
index 3c944bcd5f..03b1079a15 100644
--- a/tests/i915/i915_vm_bind_basic.c
+++ b/tests/i915/i915_vm_bind_basic.c
@@ -80,10 +80,12 @@ struct mapping {
 #define TEST_LMEM             BIT(0)
 #define TEST_SKIP_UNBIND      BIT(1)
 #define TEST_SHARE_VM         BIT(2)
+#define TEST_USERPTR          BIT(3)
 
 #define is_lmem(cfg)        ((cfg)->flags & TEST_LMEM)
 #define do_unbind(cfg)      (!((cfg)->flags & TEST_SKIP_UNBIND))
 #define do_share_vm(cfg)    ((cfg)->flags & TEST_SHARE_VM)
+#define is_userptr(cfg)     ((cfg)->flags & TEST_USERPTR)
 
 struct test_cfg {
 	const char *name;
@@ -265,15 +267,24 @@ static void create_src_objs(int fd, struct test_cfg *cfg, uint32_t src[], uint32
 			    uint32_t num_cmds, void *src_addr[])
 {
 	int i;
-	struct igt_collection *set = get_region_set(fd, cfg, is_lmem(cfg) && (num_cmds == 1));
-	uint32_t region;
 
-	for (i = 0; i < num_cmds; i++) {
-		region = igt_collection_get_value(set, i % set->size);
-		src[i] = gem_create_in_memory_regions(fd, size, region);
-		igt_info("Src obj 0x%x created in region 0x%x:0x%x\n", src[i],
-			 MEMORY_TYPE_FROM_REGION(region), MEMORY_INSTANCE_FROM_REGION(region));
-		src_addr[i] = gem_mmap__cpu(fd, src[i], 0, size, PROT_WRITE);
+	if (is_userptr(cfg)) {
+		for (i = 0; i < num_cmds; i++) {
+			igt_assert(posix_memalign(&src_addr[i], SZ_2M * MAX_CTXTS, size) == 0);
+			gem_userptr(fd, src_addr[i], size, 0, 0, &src[i]);
+			igt_info("Src userptr obj 0x%x created\n", src[i]);
+		}
+	} else {
+		struct igt_collection *set = get_region_set(fd, cfg, is_lmem(cfg) && (num_cmds == 1));
+		uint32_t region;
+
+		for (i = 0; i < num_cmds; i++) {
+			region = igt_collection_get_value(set, i % set->size);
+			src[i] = gem_create_in_memory_regions(fd, size, region);
+			igt_info("Src obj 0x%x created in region 0x%x:0x%x\n", src[i],
+				 MEMORY_TYPE_FROM_REGION(region), MEMORY_INSTANCE_FROM_REGION(region));
+			src_addr[i] = gem_mmap__cpu(fd, src[i], 0, size, PROT_WRITE);
+		}
 	}
 }
 
@@ -286,19 +297,29 @@ static void destroy_src_objs(int fd, struct test_cfg *cfg, uint32_t src[], uint3
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
-	struct igt_collection *set = get_region_set(fd, cfg, is_lmem(cfg));
-	uint32_t region = igt_collection_get_value(set, 0);
 
-	dst = gem_create_in_memory_regions(fd, size, region);
-	igt_info("Dst obj 0x%x created in region 0x%x:0x%x\n", dst,
-		 MEMORY_TYPE_FROM_REGION(region), MEMORY_INSTANCE_FROM_REGION(region));
-	*dst_addr = gem_mmap__cpu(fd, dst, 0, size, PROT_WRITE);
+	if (is_userptr(cfg)) {
+		igt_assert(posix_memalign(dst_addr, SZ_2M * MAX_CTXTS, size) == 0);
+
+		gem_userptr(fd, *dst_addr, size, 0, 0, &dst);
+		igt_info("Dst userptr obj 0x%x created\n", dst);
+	} else {
+		struct igt_collection *set = get_region_set(fd, cfg, is_lmem(cfg));
+		uint32_t region = igt_collection_get_value(set, 0);
+
+		dst = gem_create_in_memory_regions(fd, size, igt_collection_get_value(set, 0));
+		igt_info("Dst obj 0x%x created in region 0x%x:0x%x\n", dst,
+			 MEMORY_TYPE_FROM_REGION(region), MEMORY_INSTANCE_FROM_REGION(region));
+		*dst_addr = gem_mmap__cpu(fd, dst, 0, size, PROT_WRITE);
+	}
 
 	return dst;
 }
@@ -308,6 +329,9 @@ static void destroy_dst_obj(int fd, struct test_cfg *cfg, uint32_t dst, uint32_t
 	igt_assert(gem_munmap(dst_addr, size) == 0);
 	igt_debug("Closing object 0x%x\n", dst);
 	gem_close(fd, dst);
+
+	if (is_userptr(cfg))
+		free(dst_addr);
 }
 
 static void pattern_fill_buf(void *src_addr[], uint32_t size, uint32_t num_cmds, uint32_t npages)
@@ -477,6 +501,25 @@ static void run_test(int fd, const intel_ctx_t *base_ctx, struct test_cfg *cfg,
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
@@ -511,6 +554,7 @@ igt_main
 	} *m, mem_type[] = {
 			    {"smem", 0},
 			    {"lmem", TEST_LMEM},
+			    {"userptr", TEST_USERPTR},
 			    { }
 	};
 	int fd;
@@ -541,6 +585,7 @@ igt_main
 
 				cfg.flags |= m->flag;
 				igt_skip_on(!has_lmem && is_lmem(&cfg));
+				igt_require(!is_userptr(&cfg) || has_userptr(fd));
 				for_each_ctx_engine(fd, ctx, e) {
 					if (e->class == I915_ENGINE_CLASS_COPY) {
 						igt_dynamic(e->name) {
-- 
2.21.0.rc0.32.g243a4c7e27
