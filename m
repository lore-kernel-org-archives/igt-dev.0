Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F8610E7A0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 18:44:06 +0000 (UTC)
Date: Wed, 17 Jan 2024 19:44:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v5 2/3] lib/xe/xe_query: Fix compilation -Wshadow
 warning
Message-ID: <20240117184401.kmbyrhisxbaglhsi@kamilkon-desk.igk.intel.com>
References: <20240117172848.21144-1-nirmoy.das@intel.com>
 <20240117172848.21144-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117172848.21144-2-nirmoy.das@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,
On 2024-01-17 at 18:28:45 +0100, Nirmoy Das wrote:
> Fix -Wshadow warning when xe_for_each_engine() and
> xe_for_each_mem_region are used together.
> 
> v2: Use igt_unique(Kamil)
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_query.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 1e3a7bdb9..2460384c9 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -58,8 +58,8 @@ struct xe_device {
>  };
>  
>  #define xe_for_each_engine(__fd, __hwe) \
> -	for (int __i = 0; __i < xe_number_engines(__fd) && \
> -	     (__hwe = &xe_engine(__fd, __i)->instance); ++__i)
> +	for (int igt_unique(__i) = 0; igt_unique(__i) < xe_number_engines(__fd) && \
> +	     (__hwe = &xe_engine(__fd, igt_unique(__i))->instance); ++igt_unique(__i))
>  #define xe_for_each_engine_class(__class) \
>  	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>  	     ++__class)
> @@ -67,8 +67,8 @@ struct xe_device {
>  	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
>  
>  #define xe_for_each_mem_region(__fd, __memreg, __r) \
> -	for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
> -		for_if(__r = (__memreg & (1ull << __i)))
> +	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
> +		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
>  
>  #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
> -- 
> 2.42.0
> 
