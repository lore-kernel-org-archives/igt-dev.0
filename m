Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CBD10E50D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 18:36:39 +0000 (UTC)
Date: Thu, 12 Oct 2023 20:36:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231012183635.dcuahq3js4pal4ek@kamilkon-desk.igk.intel.com>
References: <20231011141841.7-1-francois.dugast@intel.com>
 <20231011141841.7-12-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231011141841.7-12-francois.dugast@intel.com>
Subject: Re: [igt-dev] [RFC v1 11/20] drm-uapi/xe: Remove GT_TYPE_REMOTE.
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

Hi Francois,
On 2023-10-11 at 14:18:32 +0000, Francois Dugast wrote:

Remove dot from end of subject:
[RFC v1 11/20] drm-uapi/xe: Remove GT_TYPE_REMOTE.
-------------------------------------------------^

This should be:
[RFC v1 11/20] drm-uapi/xe: Remove GT_TYPE_REMOTE

Regards,
Kamil

> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with commit ("drm/xe/uapi: Remove GT_TYPE_REMOTE")
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 2fc4278ae..09e6bef79 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -376,9 +376,8 @@ struct drm_xe_query_config {
>   */
>  struct drm_xe_query_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
> -#define DRM_XE_QUERY_GT_TYPE_REMOTE		1
> -#define DRM_XE_QUERY_GT_TYPE_MEDIA		2
> -	/** @type: GT type: Main, Remote, or Media */
> +#define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> +	/** @type: GT type: Main or Media */
>  	__u16 type;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> -- 
> 2.34.1
> 
