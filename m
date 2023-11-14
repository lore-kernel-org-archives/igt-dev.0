Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3D410E202
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:47:54 +0000 (UTC)
Date: Tue, 14 Nov 2023 08:47:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVN6hJq5/KwoLml7@intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
 <20231114134426.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114134426.7-4-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 3/8] drm-uapi/xe: Change rsvd to pad in
 struct drm_xe_class_instance
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

On Tue, Nov 14, 2023 at 01:44:21PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Change rsvd to pad in struct drm_xe_class_instance")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  include/drm-uapi/xe_drm.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 68d005202..32f6cf631 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -141,7 +141,8 @@ struct drm_xe_engine_class_instance {
>  
>  	__u16 engine_instance;
>  	__u16 gt_id;
> -	__u16 rsvd;
> +	/** @pad: MBZ */
> +	__u16 pad;
>  };
>  
>  /**
> -- 
> 2.34.1
> 
