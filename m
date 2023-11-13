Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9939610E430
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 20:36:52 +0000 (UTC)
Date: Mon, 13 Nov 2023 15:36:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVKI3iFfrz8fvTB6@intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
 <20231110155211.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231110155211.7-2-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 1/7] drm-uapi/xe: Remove useless
 XE_QUERY_CONFIG_NUM_PARAM
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

On Fri, Nov 10, 2023 at 03:52:05PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Remove useless XE_QUERY_CONFIG_NUM_PARAM")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 66658d76c..b316868de 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -329,7 +329,6 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>  #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> -- 
> 2.34.1
> 
