Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE0910E634
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 17:29:49 +0000 (UTC)
Message-ID: <1907d36f-145c-1b47-f667-36e8afbacefc@intel.com>
Date: Wed, 26 Oct 2022 18:29:43 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
 <20221025065941.13397-2-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221025065941.13397-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v5 01/12] include/drm-uapi: memory
 region gtt_alignment support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 25/10/2022 07:59, Niranjana Vishwanathapura wrote:
> Pull in gtt_alignment addition in drm_i915_memory_region_info
> uapi and update library to include this field.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   include/drm-uapi/i915_drm.h    | 30 ++++++++++++++++++++++++++++--
>   lib/i915/intel_memory_region.c |  1 +
>   lib/i915/intel_memory_region.h |  1 +
>   3 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index ae9558b3d9..b3a200fc5d 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -3215,8 +3215,34 @@ struct drm_i915_memory_region_info {
>   	/** @region: The class:instance pair encoding */
>   	struct drm_i915_gem_memory_class_instance region;
>   
> -	/** @rsvd0: MBZ */
> -	__u32 rsvd0;
> +	union {
> +		/** @rsvd0: MBZ */
> +		__u32 rsvd0;
> +
> +		/**
> +		 * @gtt_alignment:
> +		 *
> +		 * The minimum required GTT alignment for this type of memory.
> +		 * When allocating a GTT address it must be aligned to this
> +		 * value or larger. On some platforms the kernel might opt to
> +		 * using 64K pages for I915_MEMORY_CLASS_DEVICE, where 64K GTT
> +		 * pages can then be used if we also use 64K GTT alignment.
> +		 *
> +		 * NOTE: If this is zero then this must be an older
> +		 * kernel which lacks support for this field.
> +		 *
> +		 * Side note: For larger objects (especially for
> +		 * I915_MEMORY_CLASS_DEVICE), like 2M+ in size, userspace should
> +		 * consider potentially bumping the GTT alignment to say 2M,
> +		 * which could potentially increase the likelihood of the kernel
> +		 * being able to utilise 2M GTT pages underneath, if the layout
> +		 * of the physical pages allows it.  On some configurations we
> +		 * can then also use a more efficient page-table layout, if we
> +		 * can't use the more desirable 2M GTT page, so long as we know
> +		 * that the entire page-table will be used by this object.
> +		 */
> +		__u32 gtt_alignment;
> +	};
>   
>   	/**
>   	 * @probed_size: Memory probed by the driver
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 84e1bceb38..cbe27d6714 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -944,6 +944,7 @@ struct gem_memory_region *__gem_get_memory_regions(int i915)
>   
>   		r->ci = info->regions[i].region;
>   		r->size = info->regions[i].probed_size;
> +		r->gtt_alignment = info->regions[i].gtt_alignment;

I made a big mess here since this change needs to be temporarily 
reverted[1]. Sorry about that. For now we could maybe just do something 
like:

gtt_alignment = HAS_64K_PAGES() && ci.memory_type == DEVICE ? 64K : 4K;

I can then fix this up when adding back the gtt_alignment, if your 
series is merged first.

[1] https://patchwork.freedesktop.org/series/110041/

>   		r->cpu_size = info->regions[i].probed_cpu_visible_size;
>   		if (r->size == -1ull)
>   			r->size = igt_get_avail_ram_mb() << 20;
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 425bda0ec7..84abb95b1a 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -174,6 +174,7 @@ struct gem_memory_region {
>   	char *name;
>   
>   	struct drm_i915_gem_memory_class_instance ci;
> +	uint64_t gtt_alignment;
>   	uint64_t size;
>   	uint64_t cpu_size;
>   };
