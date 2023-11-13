Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22CC10E3A3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 22:23:53 +0000 (UTC)
Date: Mon, 13 Nov 2023 15:22:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVI/ODv9bdImni5x@DUT025-TGLU.fm.intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
 <20231110155211.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231110155211.7-3-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 2/7] drm-uapi/xe: Remove GT_TYPE_REMOTE.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 03:52:06PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with commit ("drm/xe/uapi: Remove GT_TYPE_REMOTE")
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index b316868de..8a18e1726 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -343,9 +343,8 @@ struct drm_xe_query_config {
>   */
>  struct drm_xe_query_gt {
>  #define XE_QUERY_GT_TYPE_MAIN		0
> -#define XE_QUERY_GT_TYPE_REMOTE		1
> -#define XE_QUERY_GT_TYPE_MEDIA		2
> -	/** @type: GT type: Main, Remote, or Media */
> +#define XE_QUERY_GT_TYPE_MEDIA		1
> +	/** @type: GT type: Main or Media */
>  	__u16 type;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> -- 
> 2.34.1
> 
