Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 19 May 2021 15:53:36 +0100
Message-Id: <20210519145337.255167-9-matthew.auld@intel.com>
In-Reply-To: <20210519145337.255167-1-matthew.auld@intel.com>
References: <20210519145337.255167-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 8/9] tests/i915/gem_create: exercise
 placements extension
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, Dominik Grzegorzek <dominik.grzegorzek@intel.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add some explicit testcases for the create_ext placements extension.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_create.c | 188 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 8acc2f52..167d7d28 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -290,6 +290,184 @@ static void size_update(int fd)
 	igt_assert_neq(create.size, size_initial_nonaligned);
 }
 
+static void create_ext_placement_sanity_check(int fd)
+{
+	struct drm_i915_query_memory_regions *regions;
+	struct drm_i915_gem_create_ext_memory_regions setparam_region = {
+		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+	};
+	struct drm_i915_gem_memory_class_instance *uregions;
+	struct drm_i915_gem_memory_class_instance region_smem = {
+		.memory_class = I915_MEMORY_CLASS_SYSTEM,
+		.memory_instance = 0,
+	};
+	struct drm_i915_gem_memory_class_instance region_invalid = {
+		.memory_class = -1,
+		.memory_instance = -1,
+	};
+	uint64_t size;
+	uint32_t handle;
+	int i;
+
+	regions = gem_get_query_memory_regions(fd);
+	igt_assert(regions);
+	igt_assert(regions->num_regions);
+
+	/*
+	 * extensions should be optional, giving us the normal gem_create
+	 * behaviour.
+	 */
+	size = PAGE_SIZE;
+	igt_assert_eq(__gem_create_ext(fd, &size, &handle, 0), 0);
+	gem_close(fd, handle);
+
+	/* Try some uncreative invalid combinations */
+	setparam_region.regions = to_user_pointer(&region_smem);
+	setparam_region.num_regions = 0;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	setparam_region.regions = to_user_pointer(&region_smem);
+	setparam_region.num_regions = regions->num_regions + 1;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	setparam_region.regions = to_user_pointer(&region_smem);
+	setparam_region.num_regions = -1;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	setparam_region.regions = to_user_pointer(&region_invalid);
+	setparam_region.num_regions = 1;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	setparam_region.regions = to_user_pointer(&region_invalid);
+	setparam_region.num_regions = 0;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	uregions = calloc(regions->num_regions + 1, sizeof(uint32_t));
+
+	for (i = 0; i < regions->num_regions; i++)
+		uregions[i] = regions->regions[i].region;
+
+	setparam_region.regions = to_user_pointer(uregions);
+	setparam_region.num_regions = regions->num_regions + 1;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	if (regions->num_regions > 1)  {
+		for (i = 0; i < regions->num_regions; i++) {
+			struct drm_i915_gem_memory_class_instance dups[] = {
+				regions->regions[i].region,
+				regions->regions[i].region,
+			};
+
+			setparam_region.regions = to_user_pointer(dups);
+			setparam_region.num_regions = 2;
+			size = PAGE_SIZE;
+			igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+							&setparam_region.base), 0);
+		}
+	}
+
+	uregions[rand() % regions->num_regions].memory_class = -1;
+	uregions[rand() % regions->num_regions].memory_instance = -1;
+	setparam_region.regions = to_user_pointer(uregions);
+	setparam_region.num_regions = regions->num_regions;
+	size = PAGE_SIZE;
+	igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+					&setparam_region.base), 0);
+
+	free(uregions);
+
+	{
+		struct drm_i915_gem_create_ext_memory_regions setparam_region_next;
+
+		setparam_region.regions = to_user_pointer(&region_smem);
+		setparam_region.num_regions = 1;
+
+		setparam_region_next = setparam_region;
+		setparam_region.base.next_extension =
+				to_user_pointer(&setparam_region_next);
+
+		size = PAGE_SIZE;
+		igt_assert_neq(__gem_create_ext(fd, &size, &handle,
+						&setparam_region.base), 0);
+		setparam_region.base.next_extension = 0;
+	}
+
+	free(regions);
+}
+
+static void create_ext_placement_all(int fd)
+{
+	struct drm_i915_query_memory_regions *regions;
+	struct drm_i915_gem_create_ext_memory_regions setparam_region = {
+		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+	};
+	struct drm_i915_gem_memory_class_instance *uregions;
+	uint64_t size;
+	uint32_t handle;
+	int i;
+
+	regions = gem_get_query_memory_regions(fd);
+	igt_assert(regions);
+	igt_assert(regions->num_regions);
+
+	uregions = calloc(regions->num_regions, sizeof(*uregions));
+
+	for (i = 0; i < regions->num_regions; i++)
+		uregions[i] = regions->regions[i].region;
+
+	setparam_region.regions = to_user_pointer(uregions);
+	setparam_region.num_regions = regions->num_regions;
+
+	size = PAGE_SIZE;
+	igt_assert_eq(__gem_create_ext(fd, &size, &handle,
+				       &setparam_region.base), 0);
+	gem_close(fd, handle);
+	free(uregions);
+	free(regions);
+}
+
+static void create_ext_placement_each(int fd)
+{
+	struct drm_i915_query_memory_regions *regions;
+	struct drm_i915_gem_create_ext_memory_regions setparam_region = {
+		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+	};
+	int i;
+
+	regions = gem_get_query_memory_regions(fd);
+	igt_assert(regions);
+	igt_assert(regions->num_regions);
+
+	for (i = 0; i < regions->num_regions; i++) {
+		struct drm_i915_gem_memory_class_instance region =
+			regions->regions[i].region;
+		uint64_t size;
+		uint32_t handle;
+
+		setparam_region.regions = to_user_pointer(&region);
+		setparam_region.num_regions = 1;
+
+		size = PAGE_SIZE;
+		igt_assert_eq(__gem_create_ext(fd, &size, &handle,
+					       &setparam_region.base), 0);
+		gem_close(fd, handle);
+	}
+
+	free(regions);
+}
+
 igt_main
 {
 	int fd = -1;
@@ -315,4 +493,14 @@ igt_main
 
 	igt_subtest("busy-create")
 		busy_create(fd, 30);
+
+	igt_subtest("create-ext-placement-sanity-check")
+		create_ext_placement_sanity_check(fd);
+
+	igt_subtest("create-ext-placement-each")
+		create_ext_placement_each(fd);
+
+	igt_subtest("create-ext-placement-all")
+		create_ext_placement_all(fd);
+
 }
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
