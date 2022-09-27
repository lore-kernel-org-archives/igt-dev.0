Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BD810E3A7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 14:44:56 +0000 (UTC)
Date: Tue, 27 Sep 2022 16:44:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzMMZCeHrJWfF8mc@kamilkon-desk1>
References: <20220927091727.36470-1-zbigniew.kempczynski@intel.com>
 <20220927091727.36470-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220927091727.36470-4-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/intel_memory_region: Remove
 function which returns batch size in regions
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

Hi Zbigniew,

On 2022-09-27 at 11:17:27 +0200, Zbigniew Kempczyński wrote:
> Function gem_get_batch_size() is confusing as it might return different
> size thus deceiving reader of object real size created in different
> memory regions.
> 
> Let's remove it and enforce igt user to be aware altered by kernel size
> where it is necessary.

Maybe some word reoder here: to be aware that kernel may alter size
where it is necessary.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/i915/intel_memory_region.c | 14 --------------
>  lib/i915/intel_memory_region.h |  1 -
>  2 files changed, 15 deletions(-)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 568bace949..d80cb3a061 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -92,20 +92,6 @@ const char *get_memory_region_name(uint32_t region)
>  	igt_assert_f(false, "Unknown memory region");
>  }
>  
> -/**
> - *  gem_get_batch_size:
> - *  @fd: open i915 drm file descriptor
> - *  @mem_region_type: used memory_region type
> - *
> - *  With introduction of LMEM we observe different page sizes for those two
> - *  memory regions. Without this helper funtion we may be prone to forget
> - *  about setting proper page size.
> - */
> -uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type)
> -{
> -	return (mem_region_type == I915_MEMORY_CLASS_DEVICE) ? 65536 : 4096;
> -}
> -
>  /**
>   * gem_get_query_memory_regions:
>   * @fd: open i915 drm file descriptor
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index fd04df83b5..425bda0ec7 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -56,7 +56,6 @@
>  bool gem_has_query_support(int fd);
>  
>  const char *get_memory_region_name(uint32_t region);
> -uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type);
>  
>  struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd);
>  
> -- 
> 2.34.1
> 
