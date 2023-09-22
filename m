Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956B210E65C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 12:45:50 +0000 (UTC)
Date: Fri, 22 Sep 2023 14:45:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230922124546.fnv4xugbmxj4jyei@kamilkon-desk.igk.intel.com>
References: <20230921220001.3793008-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230921220001.3793008-1-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_query.c : Add
 query-l3-bank-count subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jonathan,

please split this into two patches, first with drm-uapi change
and second with test update. Also describe in first one from what
kernel/drm-next come the change (link + subject of change).

Btw see below one spelling error spotted by checkpatch.pl

On 2023-09-21 at 15:00:01 -0700, Jonathan Cavitt wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add a subtest to query L3 Bank count for each engine.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  include/drm-uapi/i915_drm.h |  13 ++++
>  tests/intel/i915_query.c    | 135 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 148 insertions(+)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index a0876ee413..edf3b1e445 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -2813,6 +2813,7 @@ struct drm_i915_query_item {
>  	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
>  	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>  	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
> +	 *  - %DRM_I915_QUERY_L3BANK_COUNT (see `L3 Bank Count Query uAPI`)
>  	 */
>  	__u64 query_id;
>  #define DRM_I915_QUERY_TOPOLOGY_INFO		1
> @@ -2821,6 +2822,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_MEMORY_REGIONS		4
>  #define DRM_I915_QUERY_HWCONFIG_BLOB		5
>  #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
> +#define DRM_I915_QUERY_L3BANK_COUNT		7
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> @@ -3502,6 +3504,17 @@ struct drm_i915_gem_create_ext {
>  	__u64 extensions;
>  };
>  
> +/**
> + * DOC: L3 Bank Count Query uAPI
> + *
> + * The L3 bank count query called through the query id
> + * DRM_I915_QUERY_L3BANK_COUNT and returns the count of
> + * the available L3 Banks on a given engine.
> + *
> + * The count itself is an integer, and since no additional
> + * data is returned, the count is returned as such.
> + */
> +
>  /**
>   * struct drm_i915_gem_create_ext_memory_regions - The
>   * I915_GEM_CREATE_EXT_MEMORY_REGIONS extension.
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index f97379b83b..8b9dc5f796 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -25,6 +25,7 @@
>  #include "intel_hwconfig_types.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> +#include "igt_sysfs.h"
>  
>  #include <limits.h>
>  /**
> @@ -121,6 +122,18 @@
>   * SUBTEST: test-query-geometry-subslices
>   * Description: Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query
>   * Feature: gem_core
> + *
> + * SUBTEST: query-l3-bank-count
> + * Description: Test DRM_I915_QUERY_L3BANK_COUNT query
> + * Feature: gem_core
> + *
> + * SUBTEST: query-l3-bank-count-invalid
> + * Description: Test DRM_I915_QUERY_L3BANK_COUNT query fails when an invaild engine is passed

WARNING: 'invaild' may be misspelled - perhaps 'invalid'?
#75: FILE: tests/intel/i915_query.c:131:
+ * Description: Test DRM_I915_QUERY_L3BANK_COUNT query fails when an invaild engine is passed
                                                                      ^^^^^^^
Regards,
Kamil

> + * Feature: gem_core
> + *
> + * SUBTEST: query-l3-bank-count-support
> + * Description: Test DRM_I915_QUERY_L3BANK_COUNT query fails when it is not supported
> + * Feature: gem_core
>   */
>  
>  IGT_TEST_DESCRIPTION("Testing the i915 query uAPI.");
> @@ -1474,6 +1487,107 @@ static void query_parse_and_validate_hwconfig_table(int i915)
>  	free(data);
>  }
>  
> +static int __get_l3_count(int i915, const struct i915_engine_class_instance engine, uint64_t *out)
> +{
> +	struct drm_i915_query_item item;
> +
> +	memset(&item, 0, sizeof(item));
> +	item.query_id = DRM_I915_QUERY_L3BANK_COUNT;
> +	item.flags = ((engine.engine_instance << 8) | engine.engine_class);
> +	item.data_ptr = to_user_pointer(out);
> +
> +	i915_query_items(i915, &item, 1);
> +	return item.length < 0 ? item.length : 0;
> +}
> +
> +static bool query_l3_count_supported(int i915)
> +{
> +	struct i915_engine_class_instance *engines;
> +	unsigned int engines_count;
> +	uint32_t class;
> +	uint64_t val;
> +	int ret;
> +
> +	class = 0xFF;
> +	engines = gem_list_engines(i915, 1u << 0, class, &engines_count);
> +	if (!engines) {
> +		igt_warn("Failed to get the engines list per tile\n");
> +		return false;
> +	}
> +
> +	ret = __get_l3_count(i915, engines[0], &val);
> +	free(engines);
> +
> +	return ret == 0;
> +}
> +
> +static void test_l3_count_support(int i915)
> +{
> +	int devid = intel_get_drm_devid(i915);
> +	bool supported = intel_graphics_ver(devid) >= IP_VER(12, 0);
> +
> +	igt_assert(supported == query_l3_count_supported(i915));
> +}
> +
> +static void test_l3_count_invalid(int i915)
> +{
> +	struct i915_engine_class_instance engine = {
> +		.engine_class = 0xDEAD,
> +		.engine_instance = 0xBEEF
> +	};
> +	uint64_t val;
> +
> +	igt_assert_eq(__get_l3_count(i915, engine, &val), -EINVAL);
> +}
> +
> +static void test_l3_count(int i915)
> +{
> +	struct i915_engine_class_instance *engines;
> +	uint32_t class;
> +	unsigned int engines_count;
> +	uint64_t expected_bank_count;
> +	int num_gts;
> +
> +	class = 0xFF; // checking for all 8 classes
> +	expected_bank_count = 0;
> +
> +	num_gts = igt_sysfs_get_num_gt(i915);
> +
> +	for (int gt = 0; gt < num_gts; gt++) {
> +		engines = gem_list_engines(i915, 1u << gt, class, &engines_count);
> +
> +		igt_fail_on_f(!engines, "Failed to get the engines list per tile");
> +
> +		for (int i = 0 ; i < engines_count ; i++) {
> +			uint64_t l3_count;
> +
> +			igt_assert_eq(__get_l3_count(i915, engines[i], &l3_count), 0);
> +
> +			if (IS_METEORLAKE(i915)) // ARROWLAKE (ARL) to be added
> +				igt_assert((l3_count%2) == 0);
> +			else if (IS_PONTEVECCHIO(i915))
> +				igt_assert((l3_count%4) == 0);
> +			else if (IS_DG2(i915))
> +				igt_assert((l3_count%8) == 0);
> +
> +			igt_debug("class=%u instance=%u l3 bank count=%lu\n",
> +					engines[i].engine_class,
> +					engines[i].engine_instance,
> +					l3_count);
> +
> +			if (i == 0) {
> +				expected_bank_count = l3_count;
> +				continue;
> +			}
> +
> +			igt_assert_eq(l3_count, expected_bank_count);
> +
> +		}
> +
> +		free(engines);
> +	}
> +}
> +
>  igt_main
>  {
>  	int fd = -1;
> @@ -1574,4 +1688,25 @@ igt_main
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> +
> +	igt_describe("Test to check DRM_I915_QUERY_L3BANK_COUNT support.");
> +	igt_subtest("query-l3-bank-count-support") {
> +		test_l3_count_support(fd);
> +	}
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(query_l3_count_supported(fd));
> +		}
> +
> +		igt_describe("Basic test to query l3 bank count");
> +		igt_subtest("query-l3-bank-count") {
> +			test_l3_count(fd);
> +		}
> +
> +		igt_describe("Negative test for DRM_I915_QUERY_L3BANK_COUNT");
> +		igt_subtest("query-l3-bank-count-invalid") {
> +			test_l3_count_invalid(fd);
> +		}
> +	}
>  }
> -- 
> 2.25.1
> 
