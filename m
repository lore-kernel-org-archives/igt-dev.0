Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0746410E850
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 11:06:17 +0000 (UTC)
Date: Thu, 2 Nov 2023 12:06:10 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20231102110610.l7lrnlkvenrcjcw5@zkempczy-mobl2>
References: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
 <20231101235303.4645-3-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231101235303.4645-3-niranjana.vishwanathapura@intel.com>
Subject: Re: [igt-dev] [RFC v2 i-g-t 2/3] lib/intel_compute: Update
 intel_compute to run on specified engine
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

On Wed, Nov 01, 2023 at 04:53:02PM -0700, Niranjana Vishwanathapura wrote:
> With CCS_MODE setting, available compute slices can be assigned
> to specific compute engines. Update itnel_compute library to

                                      ^^^ typo

Rest looks good to me - it is generalizing to allow use user
engine class instance keeping old interface intact.

So for this change:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> be able to run compute kernel on specified compute or render
> engine.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  lib/intel_compute.c | 76 +++++++++++++++++++++++++++++++--------------
>  lib/intel_compute.h |  3 ++
>  2 files changed, 56 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 7f1ea90e7..ba85d805d 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -16,7 +16,6 @@
>  #include "intel_compute.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> -#include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xehp_media.h"
> @@ -62,7 +61,8 @@ struct bo_execenv {
>  	struct drm_i915_gem_exec_object2 *obj;
>  };
>  
> -static void bo_execenv_create(int fd, struct bo_execenv *execenv)
> +static void bo_execenv_create(int fd, struct bo_execenv *execenv,
> +			      struct drm_xe_engine_class_instance *eci)
>  {
>  	igt_assert(execenv);
>  
> @@ -71,18 +71,23 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
>  	execenv->driver = get_intel_driver(fd);
>  
>  	if (execenv->driver == INTEL_DRIVER_XE) {
> -		uint16_t engine_class;
> -		uint32_t devid = intel_get_drm_devid(fd);
> -		const struct intel_device_info *info = intel_get_device_info(devid);
> -
> -		if (info->graphics_ver >= 12 && info->graphics_rel < 60)
> -			engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> -		else
> -			engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> -
>  		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> -		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
> -								 engine_class);
> +		if (eci) {
> +			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
> +								   eci, 0);
> +		} else {
> +			uint16_t engine_class;
> +			uint32_t devid = intel_get_drm_devid(fd);
> +			const struct intel_device_info *info = intel_get_device_info(devid);
> +
> +			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
> +				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> +			else
> +				engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> +
> +			execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
> +									 engine_class);
> +		}
>  	}
>  }
>  
> @@ -546,7 +551,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @size: size of @kernel.
>   */
>  static void tgl_compute_exec(int fd, const unsigned char *kernel,
> -			     unsigned int size)
> +			     unsigned int size,
> +			     struct drm_xe_engine_class_instance *eci)
>  {
>  #define TGL_BO_DICT_ENTRIES 7
>  	struct bo_dict_entry bo_dict[TGL_BO_DICT_ENTRIES] = {
> @@ -574,7 +580,7 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
>  	struct bo_execenv execenv;
>  	float *dinput;
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -814,7 +820,8 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @size: size of @kernel.
>   */
>  static void xehp_compute_exec(int fd, const unsigned char *kernel,
> -			     unsigned int size)
> +			      unsigned int size,
> +			      struct drm_xe_engine_class_instance *eci)
>  {
>  #define XEHP_BO_DICT_ENTRIES 9
>  	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
> @@ -844,7 +851,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	struct bo_execenv execenv;
>  	float *dinput;
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -1028,7 +1035,8 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @size: size of @kernel.
>   */
>  static void xehpc_compute_exec(int fd, const unsigned char *kernel,
> -			       unsigned int size)
> +			       unsigned int size,
> +			       struct drm_xe_engine_class_instance *eci)
>  {
>  #define XEHPC_BO_DICT_ENTRIES 6
>  	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
> @@ -1049,7 +1057,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	struct bo_execenv execenv;
>  	float *dinput;
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -1103,7 +1111,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  static const struct {
>  	unsigned int ip_ver;
>  	void (*compute_exec)(int fd, const unsigned char *kernel,
> -			     unsigned int size);
> +			     unsigned int size,
> +			     struct drm_xe_engine_class_instance *eci);
>  	uint32_t compat;
>  } intel_compute_batches[] = {
>  	{
> @@ -1123,7 +1132,8 @@ static const struct {
>  	},
>  };
>  
> -bool run_intel_compute_kernel(int fd)
> +static bool __run_intel_compute_kernel(int fd,
> +				       struct drm_xe_engine_class_instance *eci)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> @@ -1134,8 +1144,10 @@ bool run_intel_compute_kernel(int fd)
>  		if (ip_ver == intel_compute_batches[batch].ip_ver)
>  			break;
>  	}
> -	if (batch == ARRAY_SIZE(intel_compute_batches))
> +	if (batch == ARRAY_SIZE(intel_compute_batches)) {
> +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
>  		return false;
> +	}
>  
>  	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_batches[batch].compat)) {
>  		igt_debug("Driver is not supported: flags %x & %x\n",
> @@ -1153,7 +1165,25 @@ bool run_intel_compute_kernel(int fd)
>  		return 1;
>  
>  	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
> -						  kernels->size);
> +						  kernels->size, eci);
>  
>  	return true;
>  }
> +
> +bool run_intel_compute_kernel(int fd)
> +{
> +	return __run_intel_compute_kernel(fd, NULL);
> +}
> +
> +bool run_intel_compute_kernel_on_engine(int fd,
> +					struct drm_xe_engine_class_instance *eci)
> +{
> +	if (eci->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
> +	    eci->engine_class != DRM_XE_ENGINE_CLASS_RENDER) {
> +		igt_debug("%s engine class not supported\n",
> +			  xe_engine_class_string(eci->engine_class));
> +		return false;
> +	}
> +
> +	return __run_intel_compute_kernel(fd, eci);
> +}
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index ba153f064..5d81c3d62 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -9,6 +9,8 @@
>  #ifndef INTEL_COMPUTE_H
>  #define INTEL_COMPUTE_H
>  
> +#include "xe_drm.h"
> +
>  /*
>   * OpenCL Kernels are generated using:
>   *
> @@ -28,5 +30,6 @@ struct intel_compute_kernels {
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>  
>  bool run_intel_compute_kernel(int fd);
> +bool run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
>  
>  #endif	/* INTEL_COMPUTE_H */
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
