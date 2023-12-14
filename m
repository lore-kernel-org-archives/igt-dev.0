Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F2210E092
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 10:41:01 +0000 (UTC)
Message-ID: <80221e0c-da76-473f-84bd-767191f004a9@linux.intel.com>
Date: Thu, 14 Dec 2023 11:40:51 +0100
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v3 1/1] tests/intel/xe_create: create-contexts
 subtest
Content-Language: en-US
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
References: <20231214085041.16866-1-lukasz.laguna@intel.com>
 <20231214085041.16866-2-lukasz.laguna@intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231214085041.16866-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 12/14/2023 9:50 AM, Lukasz Laguna wrote:
> Validates the creation of significant number of HW contexts (4096 as
> default). The number of contexts to create can be adjusted using command
> line '-Q' parameter representing resource quantity.
> 
> v2: print iteration number in case of an error (Marcin)
> v3: use __xe_exec() (Marcin)
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_create.c | 88 ++++++++++++++++++++++++++++++++++-------
>   1 file changed, 74 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 09355cc5c..75f802247 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -12,6 +12,7 @@
>   #include <string.h>
>   
>   #include "igt.h"
> +#include "igt_syncobj.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> @@ -19,11 +20,11 @@
>   #define PAGE_SIZE 0x1000
>   
>   static struct param {
> -	unsigned int size_mb;
> -	unsigned int vram_percent;
> +	unsigned int quantity;
> +	unsigned int percent;
>   } params = {
> -	.size_mb = 0,
> -	.vram_percent = 100,
> +	.quantity = 0,
> +	.percent = 100,
>   };
>   
>   static int __ioctl_create(int fd, struct drm_xe_gem_create *create)
> @@ -266,8 +267,8 @@ static void create_big_vram(int fd, int gt)
>   	visible_avail_size = xe_visible_available_vram_size(fd, gt);
>   	igt_require(visible_avail_size);
>   
> -	bo_size = params.size_mb ? params.size_mb * 1024ULL * 1024ULL
> -		  : ALIGN_DOWN(visible_avail_size * params.vram_percent / 100, alignment);
> +	bo_size = params.quantity ? params.quantity * 1024ULL * 1024ULL
> +		  : ALIGN_DOWN(visible_avail_size * params.percent / 100, alignment);
>   	igt_require(bo_size);
>   	igt_info("gt%u bo_size=%lu visible_available_vram_size=%lu\n",
>   		gt, bo_size, visible_avail_size);
> @@ -290,16 +291,71 @@ static void create_big_vram(int fd, int gt)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: create-contexts
> + * Functionality: contexts creation
> + * Test category: functionality test
> + * Description: Verifies the creation of substantial number of HW contexts
> + *		(4096 as default).
> + */
> +static void create_contexts(int fd)
> +{
> +	unsigned int i, n = params.quantity ? params.quantity : 4096;
> +	uint64_t bo_size = xe_get_default_alignment(fd), bo_addr = 0x1a0000;
> +	uint32_t vm, bo, *batch, exec_queues[n];
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +		.address = bo_addr,
> +		.num_batch_buffer = 1,
> +	};
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
> +
> +	batch = xe_bo_map(fd, bo, bo_size);
> +	*batch = MI_BATCH_BUFFER_END;
> +	munmap(batch, bo_size);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, bo_addr, bo_size);
> +
> +	for (i = 0; i < n; i++) {
> +		int err = __xe_exec_queue_create(fd, vm, &xe_engine(fd, 0)->instance, 0,
> +						 &exec_queues[i]);
> +		igt_assert_f(!err, "Failed to create exec queue (%d), iteration: %d\n", err,
> +			     i + 1);
> +
> +		exec.exec_queue_id = exec_queues[i];
> +		err = __xe_exec(fd, &exec);
> +		igt_assert_f(!err, "Failed to execute batch (%d), iteration: %d\n", err, i + 1);
> +
> +		err = syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		igt_assert_f(err, "Timeout while waiting for syncobj signal, iteration: %d\n",
> +			     i + 1);
> +	}
> +
> +	for (i = 0; i < n; i++)
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	switch (opt) {
> -	case 'S':
> -		params.size_mb = atoi(optarg);
> -		igt_debug("Size MB: %d\n", params.size_mb);
> +	case 'Q':
> +		params.quantity = atoi(optarg);
> +		igt_debug("Resource quantity (memory in MB): %d\n", params.quantity);
>   		break;
>   	case 'p':
> -		params.vram_percent = atoi(optarg);
> -		igt_debug("Percent of VRAM: %d\n", params.vram_percent);
> +		params.percent = atoi(optarg);
> +		igt_debug("Percent of available resource: %d\n", params.percent);
>   		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
> @@ -309,11 +365,11 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> -	"  -S\tBO size in MB\n"
> -	"  -p\tPercent of VRAM for BO\n"
> +	"  -Q\tresource quantity (memory in MB)\n"
> +	"  -p\tpercent of available resource\n"
>   	;
>   
> -igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
> +igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
>   {
>   	int xe;
>   
> @@ -347,6 +403,10 @@ igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
>   				create_big_vram(xe, gt);
>   	}
>   
> +	igt_subtest("create-contexts") {
> +		create_contexts(xe);
> +	}
> +
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   	igt_subtest("multigpu-create-massive-size") {
>   		int gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
>   
