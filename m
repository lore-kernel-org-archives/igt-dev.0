Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EADB10E14A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 18:46:54 +0000 (UTC)
Date: Fri, 17 Nov 2023 19:46:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231117184649.vi563jqpbifd45hq@kamilkon-desk.igk.intel.com>
References: <20231116145348.7-1-francois.dugast@intel.com>
 <20231116145348.7-11-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231116145348.7-11-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH v1 10/13] drm-uapi/xe: Align on a common way
 to return arrays (memory regions)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Francois,
On 2023-11-16 at 14:53:45 +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Align on a common way to return
> arrays (memory regions)")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

checkpatch.pl complains about missing space after ':':

ERROR: spaces required around that ':' (ctx:ExV)
#376: FILE: tests/intel/xe_query.c:225:
+                       :mem_regions->mem_regions[i].mem_class ==
                        ^

Regards,
Kamil

> ---
>  include/drm-uapi/xe_drm.h   | 22 ++++++++---------
>  lib/xe/xe_query.c           | 48 ++++++++++++++++++-------------------
>  lib/xe/xe_query.h           |  4 ++--
>  lib/xe/xe_util.c            |  6 ++---
>  tests/intel/xe_create.c     |  2 +-
>  tests/intel/xe_drm_fdinfo.c |  8 +++----
>  tests/intel/xe_pm.c         | 12 +++++-----
>  tests/intel/xe_query.c      | 44 +++++++++++++++++-----------------
>  tests/kms_plane.c           |  2 +-
>  9 files changed, 74 insertions(+), 74 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index aa66b62e2..61de386f5 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -182,10 +182,10 @@ enum drm_xe_memory_class {
>  };
>  
>  /**
> - * struct drm_xe_query_mem_region - Describes some region as known to
> + * struct drm_xe_mem_region - Describes some region as known to
>   * the driver.
>   */
> -struct drm_xe_query_mem_region {
> +struct drm_xe_mem_region {
>  	/**
>  	 * @mem_class: The memory class describing this region.
>  	 *
> @@ -315,19 +315,19 @@ struct drm_xe_query_engine_cycles {
>  };
>  
>  /**
> - * struct drm_xe_query_mem_regions - describe memory regions
> + * struct drm_xe_query_mem_region - describe memory regions
>   *
>   * If a query is made with a struct drm_xe_device_query where .query
> - * is equal to DRM_XE_DEVICE_QUERY_MEM_REGIONS, then the reply uses
> - * struct drm_xe_query_mem_regions in .data.
> + * is equal to DRM_XE_DEVICE_QUERY_MEM_REGION, then the reply uses
> + * struct drm_xe_query_mem_region in .data.
>   */
> -struct drm_xe_query_mem_regions {
> -	/** @num_regions: number of memory regions returned in @regions */
> -	__u32 num_regions;
> +struct drm_xe_query_mem_region {
> +	/** @num_mem_regions: number of memory regions returned in @mem_regions */
> +	__u32 num_mem_regions;
>  	/** @pad: MBZ */
>  	__u32 pad;
> -	/** @regions: The returned regions for this device */
> -	struct drm_xe_query_mem_region regions[];
> +	/** @mem_regions: The returned memory regions for this device */
> +	struct drm_xe_mem_region mem_regions[];
>  };
>  
>  /**
> @@ -493,7 +493,7 @@ struct drm_xe_device_query {
>  	__u64 extensions;
>  
>  #define DRM_XE_DEVICE_QUERY_ENGINES		0
> -#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
> +#define DRM_XE_DEVICE_QUERY_MEM_REGION		1
>  #define DRM_XE_DEVICE_QUERY_CONFIG		2
>  #define DRM_XE_DEVICE_QUERY_GT_LIST		3
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index f9dec1f7a..4aeeee928 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -97,12 +97,12 @@ xe_query_engines(int fd, unsigned int *num_engines)
>  	return engines;
>  }
>  
> -static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
> +static struct drm_xe_query_mem_region *xe_query_mem_regions_new(int fd)
>  {
> -	struct drm_xe_query_mem_regions *mem_regions;
> +	struct drm_xe_query_mem_region *mem_regions;
>  	struct drm_xe_device_query query = {
>  		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
> +		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
>  		.size = 0,
>  		.data = 0,
>  	};
> @@ -129,44 +129,44 @@ static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list,
>  	return region;
>  }
>  
> -static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
> +static uint64_t gt_vram_size(const struct drm_xe_query_mem_region *mem_regions,
>  			     const struct drm_xe_query_gt_list *gt_list, int gt)
>  {
>  	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
>  
> -	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
> -		return mem_regions->regions[region_idx].total_size;
> +	if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[region_idx]))
> +		return mem_regions->mem_regions[region_idx].total_size;
>  
>  	return 0;
>  }
>  
> -static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
> +static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_region *mem_regions,
>  				     const struct drm_xe_query_gt_list *gt_list, int gt)
>  {
>  	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
>  
> -	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
> -		return mem_regions->regions[region_idx].cpu_visible_size;
> +	if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[region_idx]))
> +		return mem_regions->mem_regions[region_idx].cpu_visible_size;
>  
>  	return 0;
>  }
>  
> -static bool __mem_has_vram(struct drm_xe_query_mem_regions *mem_regions)
> +static bool __mem_has_vram(struct drm_xe_query_mem_region *mem_regions)
>  {
> -	for (int i = 0; i < mem_regions->num_regions; i++)
> -		if (XE_IS_CLASS_VRAM(&mem_regions->regions[i]))
> +	for (int i = 0; i < mem_regions->num_mem_regions; i++)
> +		if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[i]))
>  			return true;
>  
>  	return false;
>  }
>  
> -static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_regions)
> +static uint32_t __mem_default_alignment(struct drm_xe_query_mem_region *mem_regions)
>  {
>  	uint32_t alignment = XE_DEFAULT_ALIGNMENT;
>  
> -	for (int i = 0; i < mem_regions->num_regions; i++)
> -		if (alignment < mem_regions->regions[i].min_page_size)
> -			alignment = mem_regions->regions[i].min_page_size;
> +	for (int i = 0; i < mem_regions->num_mem_regions; i++)
> +		if (alignment < mem_regions->mem_regions[i].min_page_size)
> +			alignment = mem_regions->mem_regions[i].min_page_size;
>  
>  	return alignment;
>  }
> @@ -454,16 +454,16 @@ struct drm_xe_query_engine_info *xe_engine(int fd, int idx)
>   *
>   * Returns memory region structure for @region mask.
>   */
> -struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
> +struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region)
>  {
>  	struct xe_device *xe_dev;
>  	int region_idx = ffs(region) - 1;
>  
>  	xe_dev = find_in_cache(fd);
>  	igt_assert(xe_dev);
> -	igt_assert(xe_dev->mem_regions->num_regions > region_idx);
> +	igt_assert(xe_dev->mem_regions->num_mem_regions > region_idx);
>  
> -	return &xe_dev->mem_regions->regions[region_idx];
> +	return &xe_dev->mem_regions->mem_regions[region_idx];
>  }
>  
>  /**
> @@ -501,7 +501,7 @@ const char *xe_region_name(uint64_t region)
>   */
>  uint16_t xe_region_class(int fd, uint64_t region)
>  {
> -	struct drm_xe_query_mem_region *memreg;
> +	struct drm_xe_mem_region *memreg;
>  
>  	memreg = xe_mem_region(fd, region);
>  
> @@ -593,21 +593,21 @@ uint64_t xe_vram_available(int fd, int gt)
>  {
>  	struct xe_device *xe_dev;
>  	int region_idx;
> -	struct drm_xe_query_mem_region *mem_region;
> -	struct drm_xe_query_mem_regions *mem_regions;
> +	struct drm_xe_mem_region *mem_region;
> +	struct drm_xe_query_mem_region *mem_regions;
>  
>  	xe_dev = find_in_cache(fd);
>  	igt_assert(xe_dev);
>  
>  	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
> -	mem_region = &xe_dev->mem_regions->regions[region_idx];
> +	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
>  
>  	if (XE_IS_CLASS_VRAM(mem_region)) {
>  		uint64_t available_vram;
>  
>  		mem_regions = xe_query_mem_regions_new(fd);
>  		pthread_mutex_lock(&cache.cache_mutex);
> -		mem_region->used = mem_regions->regions[region_idx].used;
> +		mem_region->used = mem_regions->mem_regions[region_idx].used;
>  		available_vram = mem_region->total_size - mem_region->used;
>  		pthread_mutex_unlock(&cache.cache_mutex);
>  		free(mem_regions);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index fede00036..1c76b0caf 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -39,7 +39,7 @@ struct xe_device {
>  	unsigned int number_engines;
>  
>  	/** @mem_regions: regions memory information and usage */
> -	struct drm_xe_query_mem_regions *mem_regions;
> +	struct drm_xe_query_mem_region *mem_regions;
>  
>  	/** @vram_size: array of vram sizes for all gt_list */
>  	uint64_t *vram_size;
> @@ -83,7 +83,7 @@ uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);
>  struct drm_xe_query_engine_info *xe_engines(int fd);
>  struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
> -struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
> +struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region);
>  const char *xe_region_name(uint64_t region);
>  uint16_t xe_region_class(int fd, uint64_t region);
>  uint32_t xe_min_page_size(int fd, uint64_t region);
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 742e6333e..1bb52b142 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -10,7 +10,7 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>  
> -static bool __region_belongs_to_regions_type(struct drm_xe_query_mem_region *region,
> +static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
>  					     uint32_t *mem_regions_type,
>  					     int num_regions)
>  {
> @@ -23,7 +23,7 @@ static bool __region_belongs_to_regions_type(struct drm_xe_query_mem_region *reg
>  struct igt_collection *
>  __xe_get_memory_region_set(int xe, uint32_t *mem_regions_type, int num_regions)
>  {
> -	struct drm_xe_query_mem_region *memregion;
> +	struct drm_xe_mem_region *memregion;
>  	struct igt_collection *set = NULL;
>  	uint64_t memreg = all_memory_regions(xe), region;
>  	int count = 0, pos = 0;
> @@ -78,7 +78,7 @@ char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set)
>  	igt_assert(name);
>  
>  	for_each_collection_data(data, set) {
> -		struct drm_xe_query_mem_region *memreg;
> +		struct drm_xe_mem_region *memreg;
>  		int r;
>  
>  		region = data->value;
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index b04a3443f..19582f94d 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -48,7 +48,7 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>   */
>  static void create_invalid_size(int fd)
>  {
> -	struct drm_xe_query_mem_region *memregion;
> +	struct drm_xe_mem_region *memregion;
>  	uint64_t memreg = all_memory_regions(fd), region;
>  	uint32_t vm;
>  	uint32_t handle;
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index cec3e0825..fc39649ea 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -42,7 +42,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo
>  /* Subtests */
>  static void test_active(int fd, struct drm_xe_query_engine_info *engine)
>  {
> -	struct drm_xe_query_mem_region *memregion;
> +	struct drm_xe_mem_region *memregion;
>  	uint64_t memreg = all_memory_regions(fd), region;
>  	struct drm_client_fdinfo info = { };
>  	uint32_t vm;
> @@ -169,7 +169,7 @@ static void test_active(int fd, struct drm_xe_query_engine_info *engine)
>  
>  static void test_shared(int xe)
>  {
> -	struct drm_xe_query_mem_region *memregion;
> +	struct drm_xe_mem_region *memregion;
>  	uint64_t memreg = all_memory_regions(xe), region;
>  	struct drm_client_fdinfo info = { };
>  	struct drm_gem_flink flink;
> @@ -214,7 +214,7 @@ static void test_shared(int xe)
>  
>  static void test_total_resident(int xe)
>  {
> -	struct drm_xe_query_mem_region *memregion;
> +	struct drm_xe_mem_region *memregion;
>  	uint64_t memreg = all_memory_regions(xe), region;
>  	struct drm_client_fdinfo info = { };
>  	uint32_t vm;
> @@ -262,7 +262,7 @@ static void test_total_resident(int xe)
>  
>  static void basic(int xe)
>  {
> -	struct drm_xe_query_mem_region *memregion;
> +	struct drm_xe_mem_region *memregion;
>  	uint64_t memreg = all_memory_regions(xe), region;
>  	struct drm_client_fdinfo info = { };
>  	unsigned int ret;
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index d78ca31a8..6cd4175ae 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -373,10 +373,10 @@ NULL));
>   */
>  static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  {
> -	struct drm_xe_query_mem_regions *mem_regions;
> +	struct drm_xe_query_mem_region *mem_regions;
>  	struct drm_xe_device_query query = {
>  		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
> +		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
>  		.size = 0,
>  		.data = 0,
>  	};
> @@ -400,10 +400,10 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	query.data = to_user_pointer(mem_regions);
>  	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> -	for (i = 0; i < mem_regions->num_regions; i++) {
> -		if (mem_regions->regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
> -			vram_used_mb +=  (mem_regions->regions[i].used / (1024 * 1024));
> -			vram_total_mb += (mem_regions->regions[i].total_size / (1024 * 1024));
> +	for (i = 0; i < mem_regions->num_mem_regions; i++) {
> +		if (mem_regions->mem_regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
> +			vram_used_mb +=  (mem_regions->mem_regions[i].used / (1024 * 1024));
> +			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
>  		}
>  	}
>  
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 48042337a..562ee2736 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -200,10 +200,10 @@ test_query_engines(int fd)
>  static void
>  test_query_mem_regions(int fd)
>  {
> -	struct drm_xe_query_mem_regions *mem_regions;
> +	struct drm_xe_query_mem_region *mem_regions;
>  	struct drm_xe_device_query query = {
>  		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
> +		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
>  		.size = 0,
>  		.data = 0,
>  	};
> @@ -218,34 +218,34 @@ test_query_mem_regions(int fd)
>  	query.data = to_user_pointer(mem_regions);
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  
> -	for (i = 0; i < mem_regions->num_regions; i++) {
> +	for (i = 0; i < mem_regions->num_mem_regions; i++) {
>  		igt_info("mem region %d: %s\t%#llx / %#llx\n", i,
> -			mem_regions->regions[i].mem_class ==
> +			mem_regions->mem_regions[i].mem_class ==
>  			DRM_XE_MEM_REGION_CLASS_SYSMEM ? "SYSMEM"
> -			:mem_regions->regions[i].mem_class ==
> +			:mem_regions->mem_regions[i].mem_class ==
>  			DRM_XE_MEM_REGION_CLASS_VRAM ? "VRAM" : "?",
> -			mem_regions->regions[i].used,
> -			mem_regions->regions[i].total_size
> +			mem_regions->mem_regions[i].used,
> +			mem_regions->mem_regions[i].total_size
>  		);
>  		igt_info("min_page_size=0x%x\n",
> -		       mem_regions->regions[i].min_page_size);
> +		       mem_regions->mem_regions[i].min_page_size);
>  
>  		igt_info("visible size=%lluMiB\n",
> -			 mem_regions->regions[i].cpu_visible_size >> 20);
> +			 mem_regions->mem_regions[i].cpu_visible_size >> 20);
>  		igt_info("visible used=%lluMiB\n",
> -			 mem_regions->regions[i].cpu_visible_used >> 20);
> -
> -		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_size,
> -				   mem_regions->regions[i].total_size);
> -		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_used,
> -				   mem_regions->regions[i].cpu_visible_size);
> -		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_used,
> -				   mem_regions->regions[i].used);
> -		igt_assert_lte_u64(mem_regions->regions[i].used,
> -				   mem_regions->regions[i].total_size);
> -		igt_assert_lte_u64(mem_regions->regions[i].used -
> -				   mem_regions->regions[i].cpu_visible_used,
> -				   mem_regions->regions[i].total_size);
> +			 mem_regions->mem_regions[i].cpu_visible_used >> 20);
> +
> +		igt_assert_lte_u64(mem_regions->mem_regions[i].cpu_visible_size,
> +				   mem_regions->mem_regions[i].total_size);
> +		igt_assert_lte_u64(mem_regions->mem_regions[i].cpu_visible_used,
> +				   mem_regions->mem_regions[i].cpu_visible_size);
> +		igt_assert_lte_u64(mem_regions->mem_regions[i].cpu_visible_used,
> +				   mem_regions->mem_regions[i].used);
> +		igt_assert_lte_u64(mem_regions->mem_regions[i].used,
> +				   mem_regions->mem_regions[i].total_size);
> +		igt_assert_lte_u64(mem_regions->mem_regions[i].used -
> +				   mem_regions->mem_regions[i].cpu_visible_used,
> +				   mem_regions->mem_regions[i].total_size);
>  	}
>  	dump_hex_debug(mem_regions, query.size);
>  	free(mem_regions);
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 24df7e8ca..419d4e9be 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -458,7 +458,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
>  	}
>  
>  	if (is_xe_device(data->drm_fd)) {
> -		struct drm_xe_query_mem_region *memregion;
> +		struct drm_xe_mem_region *memregion;
>  		uint64_t memreg = all_memory_regions(data->drm_fd), region;
>  
>  		xe_for_each_mem_region(data->drm_fd, memreg, region) {
> -- 
> 2.34.1
> 
