Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F35A10E152
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 11:48:53 +0000 (UTC)
Message-ID: <1e7d2378-d48a-de95-f45e-047f3dc48f97@intel.com>
Date: Wed, 5 Jul 2023 13:48:39 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
 <20230704090104.120219-3-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230704090104.120219-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 02/12] lib/xe_query: Add
 xe_region_class() helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 4.07.2023 11:00, Zbigniew Kempczyński wrote:
> In the common code we often need to be aware of region class.
> Add helper which returns it from region id.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

I think this could be merged with 04/12, but I'm fine with the separate 
patch as well:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   lib/xe/xe_query.c | 16 ++++++++++++++++
>   lib/xe/xe_query.h |  1 +
>   2 files changed, 17 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 830b7e401d..f535ad8534 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -467,6 +467,22 @@ const char *xe_region_name(uint64_t region)
>   	return vrams[region_idx];
>   }
>   
> +/**
> + * xe_region_class:
> + * @fd: xe device fd
> + * @region: region mask
> + *
> + * Returns class of memory region structure for @region mask.
> + */
> +uint16_t xe_region_class(int fd, uint64_t region)
> +{
> +	struct drm_xe_query_mem_region *memreg;
> +
> +	memreg = xe_mem_region(fd, region);
> +
> +	return memreg->mem_class;
> +}
> +
>   /**
>    * xe_min_page_size:
>    * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index ff328ab942..68ca5a680c 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -85,6 +85,7 @@ struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
>   struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
>   struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
>   const char *xe_region_name(uint64_t region);
> +uint16_t xe_region_class(int fd, uint64_t region);
>   uint32_t xe_min_page_size(int fd, uint64_t region);
>   struct drm_xe_query_config *xe_config(int fd);
>   unsigned int xe_number_hw_engines(int fd);
