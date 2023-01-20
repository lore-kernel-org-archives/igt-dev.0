Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC0710EA03
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 10:15:08 +0000 (UTC)
Message-ID: <6dd731fd-2e80-ea02-0dd4-ffdc26586643@intel.com>
Date: Fri, 20 Jan 2023 11:14:44 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230120100750.24122-1-nirmoy.das@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20230120100750.24122-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/intel_memory_region: Add
 gem_has_smallbar
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 1/20/2023 11:07 AM, Nirmoy Das wrote:
> Add gem_has_smallbar() to detect a device with smallbar.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   lib/i915/intel_memory_region.c | 32 ++++++++++++++++++++++++++++++++
>   lib/i915/intel_memory_region.h |  1 +
>   2 files changed, 33 insertions(+)
>
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 84e1bceb3..655720819 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -183,6 +183,38 @@ bool gem_has_lmem(int fd)
>   	return gem_get_lmem_region_count(fd) > 0;
>   }
>   
> +/**
> + * gem_has_smallbar:
> + * @fd: open i915 drm file descriptor
> + *
> + * Helper function to check if the device comes with small-bar.
> + *
> + * Returns: True if at least one lmem region was found.


oops left over from gem_has_lmem() I will wait for reviews before 
resending it.

> + */
> +bool gem_has_smallbar(int fd)
> +{
> +	struct drm_i915_query_memory_regions *info;
> +	struct drm_i915_memory_region_info *rf;
> +	bool ret = false;
> +
> +	info = gem_get_query_memory_regions(fd);
> +	igt_assert(info);
> +
> +	for (int i = 0; i < info->num_regions; i++) {
> +		rf = &info->regions[i];
> +		if (rf->region.memory_class == I915_MEMORY_CLASS_DEVICE) {
> +			if (rf->probed_size > rf->probed_cpu_visible_size) {
> +				ret = true;
> +				break;
> +			}
> +		}
> +	}
> +	free(info);
> +
> +	return ret;
> +}
> +
> +
>   /* A version of gem_create_in_memory_region_list which can be allowed to
>      fail so that the object creation can be retried */
>   int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 425bda0ec..9e24bd8fb 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -62,6 +62,7 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd);
>   unsigned int gem_get_lmem_region_count(int fd);
>   
>   bool gem_has_lmem(int fd);
> +bool gem_has_smallbar(int fd);
>   
>   int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
>   				       const struct drm_i915_gem_memory_class_instance *mem_regions,
