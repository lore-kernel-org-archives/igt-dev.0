Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5A510E879
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 11:56:23 +0000 (UTC)
Date: Thu, 7 Dec 2023 12:56:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/3] lib/intel_compute: Update
 intel_compute to run on specified engine
Message-ID: <20231207115618.xojuxvgphjqe2sme@kamilkon-desk.igk.intel.com>
References: <20231206200055.20417-1-niranjana.vishwanathapura@intel.com>
 <20231206200055.20417-3-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206200055.20417-3-niranjana.vishwanathapura@intel.com>
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

Hi Niranjana,
On 2023-12-06 at 12:00:54 -0800, Niranjana Vishwanathapura wrote:
> With CCS_MODE setting, available compute slices can be assigned
> to specific compute engines. Update intel_compute library to
> be able to run compute kernel on specified compute or render
> engine.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_compute.c | 85 ++++++++++++++++++++++++++++++++-------------
>  lib/intel_compute.h |  3 ++
>  2 files changed, 63 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 0beab471b..79dffc50e 100644
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
> @@ -64,7 +63,8 @@ struct bo_execenv {
>  	struct drm_i915_gem_exec_object2 *obj;
>  };
>  
> -static void bo_execenv_create(int fd, struct bo_execenv *execenv)
> +static void bo_execenv_create(int fd, struct bo_execenv *execenv,
> +			      struct drm_xe_engine_class_instance *eci)
>  {
>  	igt_assert(execenv);
>  
> @@ -73,18 +73,24 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
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
>  		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> -		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
> -								 engine_class);
> +
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
> @@ -588,9 +594,11 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @fd: file descriptor of the opened DRM device
>   * @kernel: GPU Kernel binary to be executed
>   * @size: size of @kernel.
> + * @eci: engine class instance
>   */
>  static void compute_exec(int fd, const unsigned char *kernel,
> -			 unsigned int size)
> +			 unsigned int size,
> +			 struct drm_xe_engine_class_instance *eci)
>  {
>  #define BO_DICT_ENTRIES 7
>  	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
> @@ -619,7 +627,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	float *dinput;
>  	uint16_t devid = intel_get_drm_devid(fd);
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -865,9 +873,11 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @fd: file descriptor of the opened DRM device
>   * @kernel: GPU Kernel binary to be executed
>   * @size: size of @kernel.
> + * @eci: engine class instance
>   */
>  static void xehp_compute_exec(int fd, const unsigned char *kernel,
> -			     unsigned int size)
> +			      unsigned int size,
> +			      struct drm_xe_engine_class_instance *eci)
>  {
>  #define XEHP_BO_DICT_ENTRIES 9
>  	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
> @@ -897,7 +907,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	struct bo_execenv execenv;
>  	float *dinput;
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -1079,9 +1089,11 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @fd: file descriptor of the opened DRM device
>   * @kernel: GPU Kernel binary to be executed
>   * @size: size of @kernel.
> + * @eci: engine class instance
>   */
>  static void xehpc_compute_exec(int fd, const unsigned char *kernel,
> -			       unsigned int size)
> +			       unsigned int size,
> +			       struct drm_xe_engine_class_instance *eci)
>  {
>  #define XEHPC_BO_DICT_ENTRIES 6
>  	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
> @@ -1102,7 +1114,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	struct bo_execenv execenv;
>  	float *dinput;
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -1261,7 +1273,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   * @size: size of @kernel.
>   */
>  static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
> -				unsigned int size)
> +				unsigned int size,
> +				struct drm_xe_engine_class_instance *eci)
>  {
>  #define XE2_BO_DICT_ENTRIES 10
>  	struct bo_dict_entry bo_dict[XE2_BO_DICT_ENTRIES] = {
> @@ -1296,7 +1309,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	struct bo_execenv execenv;
>  	float *dinput;
>  
> -	bo_execenv_create(fd, &execenv);
> +	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
>  	bo_dict[0].size = ALIGN(size, 0x1000);
> @@ -1356,7 +1369,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  static const struct {
>  	unsigned int ip_ver;
>  	void (*compute_exec)(int fd, const unsigned char *kernel,
> -			     unsigned int size);
> +			     unsigned int size,
> +			     struct drm_xe_engine_class_instance *eci);
>  	uint32_t compat;
>  } intel_compute_batches[] = {
>  	{
> @@ -1386,7 +1400,8 @@ static const struct {
>  	},
>  };
>  
> -bool run_intel_compute_kernel(int fd)
> +static bool __run_intel_compute_kernel(int fd,
> +				       struct drm_xe_engine_class_instance *eci)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> @@ -1397,8 +1412,10 @@ bool run_intel_compute_kernel(int fd)
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
> @@ -1416,7 +1433,25 @@ bool run_intel_compute_kernel(int fd)
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

With this it looks like Xe only header.

> +
>  /*
>   * OpenCL Kernels are generated using:
>   *
> @@ -28,5 +30,6 @@ struct intel_compute_kernels {
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>  
>  bool run_intel_compute_kernel(int fd);
> +bool run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);

What about using *void here?

>  
>  #endif	/* INTEL_COMPUTE_H */
> -- 
> 2.21.0.rc0.32.g243a4c7e27
--  ^^
Please update your git to at least 2.3x or 2.4x (current lastest is 2.43.0).

Regards,
Kamil
