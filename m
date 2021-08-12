Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EB86E33F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Aug 2021 09:07:43 +0000 (UTC)
Date: Thu, 12 Aug 2021 11:07:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210812090738.GB27582@zkempczy-mobl2>
References: <20210812090032.117930-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210812090032.117930-1-janusz.krzysztofik@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_memory_region: Constify info
 structures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 12, 2021 at 11:00:32AM +0200, Janusz Krzysztofik wrote:
> Functions which extract information from drm_i915_query_memory_regions
> structures passed via their pointer as an argument don't modify those
> structures, let them accept that content declared as constant.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Looks safe: 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
> ---
>  lib/i915/intel_memory_region.c | 12 ++++++------
>  lib/i915/intel_memory_region.h | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 72e337af3..3de405493 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -309,7 +309,7 @@ char *memregion_dynamic_subtest_name(struct igt_collection *set)
>   *
>   * Outputs memory regions and their sizes.
>   */
> -void intel_dump_gpu_meminfo(struct drm_i915_query_memory_regions *info)
> +void intel_dump_gpu_meminfo(const struct drm_i915_query_memory_regions *info)
>  {
>  	int i;
>  
> @@ -336,7 +336,7 @@ void intel_dump_gpu_meminfo(struct drm_i915_query_memory_regions *info)
>   *
>   * Returns: number of regions for type @memory_class
>   */
> -uint32_t gpu_meminfo_region_count(struct drm_i915_query_memory_regions *info,
> +uint32_t gpu_meminfo_region_count(const struct drm_i915_query_memory_regions *info,
>  				  uint16_t memory_class)
>  {
>  	uint32_t num = 0;
> @@ -359,7 +359,7 @@ uint32_t gpu_meminfo_region_count(struct drm_i915_query_memory_regions *info,
>   * Returns: total size of all regions which are type @memory_class, -1 when the
>   * size of at least one region is unknown
>   */
> -uint64_t gpu_meminfo_region_total_size(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_total_size(const struct drm_i915_query_memory_regions *info,
>  				       uint16_t memory_class)
>  {
>  	uint64_t total = 0;
> @@ -386,7 +386,7 @@ uint64_t gpu_meminfo_region_total_size(struct drm_i915_query_memory_regions *inf
>   * Returns: available size of all regions which are type @memory_class, -1 when
>   * the size of at least one region cannot be estimated
>   */
> -uint64_t gpu_meminfo_region_total_available(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_total_available(const struct drm_i915_query_memory_regions *info,
>  					    uint16_t memory_class)
>  {
>  	uint64_t avail = 0;
> @@ -414,7 +414,7 @@ uint64_t gpu_meminfo_region_total_available(struct drm_i915_query_memory_regions
>   * Returns: available size of @memory_instance which type is @memory_class, -1
>   * when the size is unknown
>   */
> -uint64_t gpu_meminfo_region_size(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_size(const struct drm_i915_query_memory_regions *info,
>  				 uint16_t memory_class,
>  				 uint16_t memory_instance)
>  {
> @@ -439,7 +439,7 @@ uint64_t gpu_meminfo_region_size(struct drm_i915_query_memory_regions *info,
>   * Returns: available size of @memory_instance region which type is
>   * @memory_class, -1 when the size cannot be estimated
>   */
> -uint64_t gpu_meminfo_region_available(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_available(const struct drm_i915_query_memory_regions *info,
>  				      uint16_t memory_class,
>  				      uint16_t memory_instance)
>  {
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 8cd18ea0e..70b74944b 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -113,19 +113,19 @@ __get_memory_region_set(struct drm_i915_query_memory_regions *regions,
>  
>  char *memregion_dynamic_subtest_name(struct igt_collection *set);
>  
> -void intel_dump_gpu_meminfo(struct drm_i915_query_memory_regions *info);
> +void intel_dump_gpu_meminfo(const struct drm_i915_query_memory_regions *info);
>  
> -uint32_t gpu_meminfo_region_count(struct drm_i915_query_memory_regions *info,
> +uint32_t gpu_meminfo_region_count(const struct drm_i915_query_memory_regions *info,
>  				  uint16_t region_class);
> -uint64_t gpu_meminfo_region_total_size(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_total_size(const struct drm_i915_query_memory_regions *info,
>  				       uint16_t region_class);
> -uint64_t gpu_meminfo_region_total_available(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_total_available(const struct drm_i915_query_memory_regions *info,
>  					    uint16_t region_type);
>  
> -uint64_t gpu_meminfo_region_size(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_size(const struct drm_i915_query_memory_regions *info,
>  				 uint16_t memory_class,
>  				 uint16_t memory_instance);
> -uint64_t gpu_meminfo_region_available(struct drm_i915_query_memory_regions *info,
> +uint64_t gpu_meminfo_region_available(const struct drm_i915_query_memory_regions *info,
>  				      uint16_t memory_class,
>  				      uint16_t memory_instance);
>  
> -- 
> 2.25.1
> 
