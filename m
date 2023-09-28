Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E222010E046
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 11:27:23 +0000 (UTC)
Date: Thu, 28 Sep 2023 13:27:16 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <ZRVjFJaSZ6t0ljA7@fdugast-desk.home>
References: <20230928110516.7-1-francois.dugast@intel.com>
 <20230928110516.7-15-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928110516.7-15-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 14/14] drm-uapi/xe: Fix naming of
 XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:05:16AM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with kernel commit
> ("drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 4 ++--
>  tests/intel/xe_query.c    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 652879eb2..6ff1106e4 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -328,8 +328,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> -#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> +#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
> +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 30fc367c8..2cff75414 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -380,8 +380,8 @@ test_query_config(int fd)
>  		config->info[XE_QUERY_CONFIG_GT_COUNT]);
>  	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
>  		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
> -	igt_info("XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY\t%llu\n",
> -		config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY]);
> +	igt_info("XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
> +		config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
>  	dump_hex_debug(config, query.size);
>  
>  	free(config);
> -- 
> 2.34.1
> 
