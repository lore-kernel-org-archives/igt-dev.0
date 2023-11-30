Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD6610E76F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 19:05:01 +0000 (UTC)
Date: Thu, 30 Nov 2023 14:04:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWjc0UMWsRV0B8X8@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
 <20231130184536.7-17-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130184536.7-17-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 16/21] drm-uapi/xe: Add Tile ID information
 to the GT info query
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

On Thu, Nov 30, 2023 at 06:45:31PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Add Tile ID information to the GT
> info query")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 0850e5ee5..b703dc7ce 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -377,6 +377,8 @@ struct drm_xe_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
>  	/** @type: GT type: Main or Media */
>  	__u16 type;
> +	/** @tile_id: Tile ID where this GT lives (Information only) */
> +	__u16 tile_id;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
>  	/** @reference_clock: A clock frequency for timestamp */
> -- 
> 2.34.1
> 
