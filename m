Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 14:16:16 +0000
Message-Id: <20220221141620.2490914-3-matthew.auld@intel.com>
In-Reply-To: <20220221141620.2490914-1-matthew.auld@intel.com>
References: <20220221141620.2490914-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/6] lib/i915: wire up optional flags for
 gem_create_ext
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For now limit to direct callers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/i915/gem_create.c          |  9 ++++++---
 lib/i915/gem_create.h          |  5 +++--
 lib/i915/intel_memory_region.c |  2 +-
 tests/i915/gem_create.c        | 24 ++++++++++++------------
 tests/i915/gem_pxp.c           |  2 +-
 5 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/lib/i915/gem_create.c b/lib/i915/gem_create.c
index b2e8d559..d245a32e 100644
--- a/lib/i915/gem_create.c
+++ b/lib/i915/gem_create.c
@@ -48,11 +48,12 @@ uint32_t gem_create(int fd, uint64_t size)
 	return handle;
 }
 
-int __gem_create_ext(int fd, uint64_t *size, uint32_t *handle,
+int __gem_create_ext(int fd, uint64_t *size, uint32_t flags, uint32_t *handle,
 		     struct i915_user_extension *ext)
 {
 	struct drm_i915_gem_create_ext create = {
 		.size = *size,
+		.flags = flags,
 		.extensions = to_user_pointer(ext),
 	};
 	int err = 0;
@@ -73,6 +74,7 @@ int __gem_create_ext(int fd, uint64_t *size, uint32_t *handle,
  * gem_create_ext:
  * @fd: open i915 drm file descriptor
  * @size: desired size of the buffer
+ * @flags: optional flags
  * @ext: optional extensions chain
  *
  * This wraps the GEM_CREATE_EXT ioctl, which allocates a new gem buffer object
@@ -80,11 +82,12 @@ int __gem_create_ext(int fd, uint64_t *size, uint32_t *handle,
  *
  * Returns: The file-private handle of the created buffer object
  */
-uint32_t gem_create_ext(int fd, uint64_t size, struct i915_user_extension *ext)
+uint32_t gem_create_ext(int fd, uint64_t size, uint32_t flags,
+			struct i915_user_extension *ext)
 {
 	uint32_t handle;
 
-	igt_assert_eq(__gem_create_ext(fd, &size, &handle, ext), 0);
+	igt_assert_eq(__gem_create_ext(fd, &size, flags, &handle, ext), 0);
 
 	return handle;
 }
diff --git a/lib/i915/gem_create.h b/lib/i915/gem_create.h
index c2b531b4..02232693 100644
--- a/lib/i915/gem_create.h
+++ b/lib/i915/gem_create.h
@@ -12,8 +12,9 @@
 
 int __gem_create(int fd, uint64_t *size, uint32_t *handle);
 uint32_t gem_create(int fd, uint64_t size);
-int __gem_create_ext(int fd, uint64_t *size, uint32_t *handle,
+int __gem_create_ext(int fd, uint64_t *size, uint32_t flags, uint32_t *handle,
                      struct i915_user_extension *ext);
-uint32_t gem_create_ext(int fd, uint64_t size, struct i915_user_extension *ext);
+uint32_t gem_create_ext(int fd, uint64_t size, uint32_t flags,
+			struct i915_user_extension *ext);
 
 #endif /* GEM_CREATE_H */
diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index a8759e06..f0c8bc7c 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -208,7 +208,7 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 	};
 	int ret;
 
-	ret = __gem_create_ext(fd, size, handle, &ext_regions.base);
+	ret = __gem_create_ext(fd, size, 0, handle, &ext_regions.base);
 
 	/*
 	 * Provide fallback for stable kernels if region passed in the array
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 45804cde..a6c3c9d9 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -331,38 +331,38 @@ static void create_ext_placement_sanity_check(int fd)
 	 * behaviour.
 	 */
 	size = PAGE_SIZE;
-	igt_assert_eq(__gem_create_ext(fd, &size, &handle, 0), 0);
+	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle, 0), 0);
 	gem_close(fd, handle);
 
 	/* Try some uncreative invalid combinations */
 	setparam_region.regions = to_user_pointer(&region_smem);
 	setparam_region.num_regions = 0;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	setparam_region.regions = to_user_pointer(&region_smem);
 	setparam_region.num_regions = regions->num_regions + 1;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	setparam_region.regions = to_user_pointer(&region_smem);
 	setparam_region.num_regions = -1;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	setparam_region.regions = to_user_pointer(&region_invalid);
 	setparam_region.num_regions = 1;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	setparam_region.regions = to_user_pointer(&region_invalid);
 	setparam_region.num_regions = 0;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	uregions = calloc(regions->num_regions + 1, sizeof(uint32_t));
@@ -373,7 +373,7 @@ static void create_ext_placement_sanity_check(int fd)
 	setparam_region.regions = to_user_pointer(uregions);
 	setparam_region.num_regions = regions->num_regions + 1;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	if (regions->num_regions > 1)  {
@@ -386,7 +386,7 @@ static void create_ext_placement_sanity_check(int fd)
 			setparam_region.regions = to_user_pointer(dups);
 			setparam_region.num_regions = 2;
 			size = PAGE_SIZE;
-			igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+			igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 							&setparam_region.base), 0);
 		}
 	}
@@ -396,7 +396,7 @@ static void create_ext_placement_sanity_check(int fd)
 	setparam_region.regions = to_user_pointer(uregions);
 	setparam_region.num_regions = regions->num_regions;
 	size = PAGE_SIZE;
-	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 					&setparam_region.base), 0);
 
 	free(uregions);
@@ -412,7 +412,7 @@ static void create_ext_placement_sanity_check(int fd)
 				to_user_pointer(&setparam_region_next);
 
 		size = PAGE_SIZE;
-		igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+		igt_assert_neq(__gem_create_ext(fd, &size, 0, &handle,
 						&setparam_region.base), 0);
 		setparam_region.base.next_extension = 0;
 	}
@@ -444,7 +444,7 @@ static void create_ext_placement_all(int fd)
 	setparam_region.num_regions = regions->num_regions;
 
 	size = PAGE_SIZE;
-	igt_assert_eq(__gem_create_ext(fd, &size, &handle,
+	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle,
 				       &setparam_region.base), 0);
 	gem_close(fd, handle);
 	free(uregions);
@@ -473,7 +473,7 @@ static void create_ext_placement_each(int fd)
 		setparam_region.num_regions = 1;
 
 		size = PAGE_SIZE;
-		igt_assert_eq(__gem_create_ext(fd, &size, &handle,
+		igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle,
 					       &setparam_region.base), 0);
 		gem_close(fd, handle);
 	}
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 5f269bab..65618556 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -40,7 +40,7 @@ static int create_bo_ext(int i915, uint32_t size, bool protected_is_true, uint32
 		ext = &protected_ext.base;
 
 	*bo_out = 0;
-	ret = __gem_create_ext(i915, &size64, bo_out, ext);
+	ret = __gem_create_ext(i915, &size64, 0, bo_out, ext);
 
 	return ret;
 }
-- 
2.34.1
