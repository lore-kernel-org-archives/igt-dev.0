Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC22E10E038
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 20:05:04 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:03:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWjqlR98pdWYwkQO@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
 <20231130184536.7-12-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130184536.7-12-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 11/21] drm-uapi/xe: Align on a common way
 to return arrays (gt)
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

On Thu, Nov 30, 2023 at 06:45:26PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Align on a common way to return
> arrays (gt)")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 62e4d1c29..d37266072 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -356,14 +356,14 @@ struct drm_xe_query_config {
>  };
>  
>  /**
> - * struct drm_xe_query_gt - describe an individual GT.
> + * struct drm_xe_gt - describe an individual GT.
>   *
>   * To be used with drm_xe_query_gt_list, which will return a list with all the
>   * existing GT individual descriptions.
>   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
>   * implementing graphics and/or media operations.
>   */
> -struct drm_xe_query_gt {
> +struct drm_xe_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
>  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
>  	/** @type: GT type: Main or Media */
> @@ -403,7 +403,7 @@ struct drm_xe_query_gt_list {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  	/** @gt_list: The GT list returned for this device */
> -	struct drm_xe_query_gt gt_list[];
> +	struct drm_xe_gt gt_list[];
>  };
>  
>  /**
> -- 
> 2.34.1
> 
