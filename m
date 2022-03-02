Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28B710E885
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 12:24:25 +0000 (UTC)
Message-ID: <d6c55351-5972-05f0-20d3-1e4ef0b72787@intel.com>
Date: Wed, 2 Mar 2022 14:23:44 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
 <20220302080629.11562-2-zbigniew.kempczynski@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220302080629.11562-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_memory_regions: Add
 helper which creates supported dma-buf set
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

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Tested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

If the https://patchwork.freedesktop.org/series/100737/ patch (currently 
under review) is applied to the i915, you can see that the 
igt@prime_mmap test works normally in dg1.

On 3/2/22 10:06 AM, Zbigniew Kempczyński wrote:
> Not all systems supports dma-buf or supports it partially thus tests which
> relies on this functionality should be skipped. Partially means some
> memory regions can support it whereas other not. Add a helper function
> which will verify dma-buf support on memory regions and create a set of
> those supported.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/i915/intel_memory_region.c | 61 ++++++++++++++++++++++++++++++++++
>   lib/i915/intel_memory_region.h |  3 ++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index a8759e069..a2db74566 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -332,6 +332,67 @@ char *memregion_dynamic_subtest_name(struct igt_collection *set)
>   	return name;
>   }
>   
> +struct mmap_supported_region {
> +	uint32_t region;
> +	struct igt_list_head link;
> +};
> +
> +/**
> + * get_dma_buf_mmap_supported_set:
> + * @i915: i915 drm file descriptor
> + * @set: memory regions set
> + *
> + * Function constructs set with regions which supports dma-buf mapping.
> + *
> + * Returns: set of regions which allows do dma-buf mmap or NULL otherwise.
> + *
> + * Note: set (igt_collection) need to be destroyed after use.
> + */
> +struct igt_collection *
> +get_dma_buf_mmap_supported_set(int i915, struct igt_collection *set)
> +{
> +	struct igt_collection *region, *supported_set = NULL;
> +	uint32_t reg;
> +	int dma_buf_fd;
> +	char *ptr;
> +	uint32_t handle, bosize = 4096;
> +	int count = 0;
> +	struct mmap_supported_region *mreg, *tmp;
> +	IGT_LIST_HEAD(region_list);
> +
> +	for_each_combination(region, 1, set) {
> +		reg = igt_collection_get_value(region, 0);
> +		handle = gem_create_in_memory_regions(i915, bosize, reg);
> +
> +		dma_buf_fd = prime_handle_to_fd(i915, handle);
> +		ptr = mmap(NULL, bosize, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
> +		if (ptr != MAP_FAILED) {
> +			mreg = malloc(sizeof(*mreg));
> +			igt_assert(mreg);
> +			mreg->region = reg;
> +			igt_list_add_tail(&mreg->link, &region_list);
> +			count++;
> +		}
> +		munmap(ptr, bosize);
> +		gem_close(i915, handle);
> +		close(dma_buf_fd);
> +	}
> +
> +	if (count) {
> +		int i = 0;
> +
> +		supported_set = igt_collection_create(count);
> +
> +		igt_list_for_each_entry_safe(mreg, tmp, &region_list, link) {
> +			igt_collection_set_value(supported_set, i++, mreg->region);
> +			igt_list_del(&mreg->link);
> +			free(mreg);
> +		}
> +	}
> +
> +	return supported_set;
> +}
> +
>   /**
>    * intel_dump_gpu_meminfo:
>    * @info: pointer to drm_i915_query_memory_regions structure
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 936e7d1c8..bd92267b6 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -111,6 +111,9 @@ __get_memory_region_set(struct drm_i915_query_memory_regions *regions,
>   	__get_memory_region_set(regions, arr__, ARRAY_SIZE(arr__)); \
>   })
>   
> +struct igt_collection *
> +get_dma_buf_mmap_supported_set(int i915, struct igt_collection *set);
> +
>   char *memregion_dynamic_subtest_name(struct igt_collection *set);
>   
>   void intel_dump_gpu_meminfo(const struct drm_i915_query_memory_regions *info);
> 
