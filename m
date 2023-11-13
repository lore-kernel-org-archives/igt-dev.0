Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A114610E22C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 22:27:44 +0000 (UTC)
Date: Mon, 13 Nov 2023 15:26:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVJAIWFa+KIgOBu6@DUT025-TGLU.fm.intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
 <20231110155211.7-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231110155211.7-6-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 5/7] drm-uapi/xe: Remove unused
 QUERY_CONFIG_MEM_REGION_COUNT
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

On Fri, Nov 10, 2023 at 03:52:09PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 4 ++--
>  tests/intel/xe_query.c    | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 68317a82e..db883fb6b 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -311,6 +311,7 @@ struct drm_xe_query_mem_usage {
>   * If a query is made with a struct drm_xe_device_query where .query
>   * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>   * struct drm_xe_query_config in .data.
> + *
>   */
>  struct drm_xe_query_config {
>  	/** @num_params: number of parameters returned in info */
> @@ -325,8 +326,7 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
> -#define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> -#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
> +#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index e6258ff01..66a714518 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -376,8 +376,6 @@ test_query_config(int fd)
>  		config->info[XE_QUERY_CONFIG_VA_BITS]);
>  	igt_info("XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
>  		config->info[XE_QUERY_CONFIG_GT_COUNT]);
> -	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
> -		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
>  	igt_info("XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
>  		config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
>  	dump_hex_debug(config, query.size);
> -- 
> 2.34.1
> 
