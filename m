Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED03710E0AC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 10:30:39 +0000 (UTC)
Date: Wed, 6 Dec 2023 11:30:22 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZXBNPu8mOBLdw37a@fdugast-desk.home>
References: <20231206064800.11398-1-krishnaiah.bommu@intel.com>
 <20231206064800.11398-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206064800.11398-2-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/2] drm-uapi/xe: add exec_queue_id member
 to drm_xe_wait_user_fence structurei
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

Hi Bommu,

Existing IGT code must be updated as the same time as xe_drm.h, otherwise
applying only this patch breaks IGT build as num_engines and instances have
been removed from the header but not from xe_ioctl.c (for example).

Overlapping work had been proposed by Rodrigo, maybe some of it can be
reused:
https://patchwork.freedesktop.org/patch/566918/?series=126204&rev=1

Nit: there is an extra 'i' at the end of the commit message.

Please update xe_drm.h again after the alignment fix in kernel.

Thanks,
Francois

On Wed, Dec 06, 2023 at 12:17:59PM +0530, Bommu Krishnaiah wrote:
> remove the num_engines/instances members from drm_xe_wait_user_fence structure
> and add a exec_queue_id member
> 
> Right now this is only checking if the engine list is sane and nothing
> else. In the end every operation with this IOCTL is a soft check.
> So, let's formalize that and only use this IOCTL to wait on the fence.
> 
> exec_queue_id member will help to user space to get proper error code
> from kernel while in exec_queue reset
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 590f7b7af..a1c6d8932 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1024,8 +1024,7 @@ struct drm_xe_wait_user_fence {
>  	/** @op: wait operation (type of comparison) */
>  	__u16 op;
>  
> -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
>  	/** @flags: wait flags */
>  	__u16 flags;
>  
> @@ -1058,17 +1057,10 @@ struct drm_xe_wait_user_fence {
>  	 */
>  	__s64 timeout;
>  
> -	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> +	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl
> +	  * exec_queue_id is help to find exec_queue reset status
>  	 */
> -	__u64 instances;
> +	__u32 exec_queue_id;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.25.1
> 
