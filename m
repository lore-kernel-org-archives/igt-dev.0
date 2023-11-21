Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02910E541
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 17:01:55 +0000 (UTC)
Date: Tue, 21 Nov 2023 18:01:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231121170150.ajz4s3puliuz6pw7@kamilkon-desk.igk.intel.com>
References: <20231116145348.7-1-francois.dugast@intel.com>
 <20231116145348.7-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231116145348.7-2-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH v1 01/13] drm-uapi/xe: Extend drm_xe_vm_bind_op
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Francois,
On 2023-11-16 at 14:53:36 +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Extend drm_xe_vm_bind_op")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index af32ec161..5ef16f16e 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -613,6 +613,9 @@ struct drm_xe_vm_destroy {
>  };
>  
>  struct drm_xe_vm_bind_op {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
>  	/**
>  	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
>  	 */
> -- 
> 2.34.1
> 
