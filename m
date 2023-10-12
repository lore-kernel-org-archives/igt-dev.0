Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BCB10E189
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 12:25:50 +0000 (UTC)
Date: Thu, 12 Oct 2023 14:25:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231012122545.tkrj5mof7lwuyzrv@kamilkon-desk.igk.intel.com>
References: <20231011211341.453878-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231011211341.453878-1-daniele.ceraolospurio@intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests/xe_huc_copy: Handle multiple GTs
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

Hi Daniele,
On 2023-10-11 at 14:13:40 -0700, Daniele Ceraolo Spurio wrote:
> The test currently only looks for video engines on GT0, which is a
> problem because newer platforms (like MTL) have their video engines on
> the media GT. ALso, it is technically possible to have 1 HuC per-GT,
> though we don't currently have any platform that supports this.
> To handle the media GT use-case and to future proof against multiple
> HuCs, we can just loop and repeat the test on any GT that has video
> engines.
> 
> v2: mark the test as skipped if no video engines are found (Kamil)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_huc_copy.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
> index c9891a729..2c12d9f07 100644
> --- a/tests/intel/xe_huc_copy.c
> +++ b/tests/intel/xe_huc_copy.c
> @@ -104,9 +104,9 @@ gen12_create_batch_huc_copy(uint32_t *batch,
>   */
>  
>  static void
> -test_huc_copy(int fd)
> +__test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
>  {
> -	uint32_t vm, exec_queue;
> +	uint32_t exec_queue;
>  	char *dinput;
>  	struct drm_xe_sync sync = { 0 };
>  
> @@ -117,8 +117,7 @@ test_huc_copy(int fd)
>  		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
>  	};
>  
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> -	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_VIDEO_DECODE);
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>  	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
>  	sync.handle = syncobj_create(fd, 0);
>  
> @@ -148,6 +147,27 @@ test_huc_copy(int fd)
>  
>  	syncobj_destroy(fd, sync.handle);
>  	xe_exec_queue_destroy(fd, exec_queue);
> +}
> +
> +static void
> +test_huc_copy(int fd)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	uint32_t vm;
> +	uint32_t tested_gts = 0;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +
> +	xe_for_each_hw_engine(fd, hwe) {
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
> +		    !(tested_gts & BIT(hwe->gt_id))) {
> +			tested_gts |= BIT(hwe->gt_id);
> +			__test_huc_copy(fd, vm, hwe);
> +		}
> +	}
> +
> +	igt_require_f(tested_gts, "No video class engines found\n");
--- ^^^^^^^^^^^^^

Could you move this after xe_vm_destroy() below?
With or without it you can keep my r-b,

Regards,
Kamil

> +
>  	xe_vm_destroy(fd, vm);
>  }
>  
> -- 
> 2.41.0
> 
