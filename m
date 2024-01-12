Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2810E083
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 13:09:55 +0000 (UTC)
Date: Fri, 12 Jan 2024 14:09:46 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] tests/intel: Sync headers to grab DUMPABLE changes.
Message-ID: <ZaE6Go7MdJkQyaCQ@fdugast-desk.home>
References: <20240112124043.166886-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240112124043.166886-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
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

Hi Maarten,

On Fri, Jan 12, 2024 at 01:40:42PM +0100, Maarten Lankhorst wrote:
> Required for devcoredump test.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..0f975f57f 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_DRM_H_
> -#define _XE_DRM_H_
> +#ifndef _UAPI_XE_DRM_H_
> +#define _UAPI_XE_DRM_H_

This ^ and __user below seem to indicate the header was copied from
KMD sources instead of being generated, for example with:

    $ make headers_install INSTALL_HDR_PATH=/tmp/headers

See https://www.kernel.org/doc/html/latest/kbuild/headers_install.html

Francois

>  
>  #include "drm.h"
>  
> @@ -130,7 +130,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the boundary with pointers encapsulated inside u64.
> + * the __user boundary with pointers encapsulated inside u64.
>   *
>   * Example chaining:
>   *
> @@ -832,7 +832,6 @@ struct drm_xe_vm_destroy {
>   *
>   * and the @flags can be:
>   *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_ASYNC
>   *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
>   *    MAP operation immediately rather than deferring the MAP to the page
>   *    fault handler.
> @@ -931,6 +930,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
>  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -1344,4 +1344,4 @@ struct drm_xe_wait_user_fence {
>  }
>  #endif
>  
> -#endif /* _XE_DRM_H_ */
> +#endif /* _UAPI_XE_DRM_H_ */
> -- 
> 2.40.1
> 
