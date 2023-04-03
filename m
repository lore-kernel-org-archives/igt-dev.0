Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4923D10E3EF
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:49:46 +0000 (UTC)
Date: Mon, 3 Apr 2023 12:49:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230403104941.dv5dtjef3gqoj73r@zkempczy-mobl2>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
 <20230327134119.2429388-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327134119.2429388-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] xe/xe_compute: place OpenCL kernel
 on a separate file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 03:41:16PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> In order to prepare for supporting multiple Kernels, move
> the tgllp to a separate file.
> 
> While here, address a few coding style nitpicks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/meson.build                    |   1 +
>  lib/xe/xe_compute.c                | 234 ++++++++++++++++++++---------
>  lib/xe/xe_compute.h                |  31 ++--
>  lib/xe/xe_compute_square_kernels.c |  71 +++++++++
>  tests/xe/xe_compute.c              | 108 +------------
>  5 files changed, 256 insertions(+), 189 deletions(-)
>  create mode 100644 lib/xe/xe_compute_square_kernels.c
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index ad9e2abef4c3..ad68089dcf43 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -99,6 +99,7 @@ lib_sources = [
>  	'igt_msm.c',
>  	'igt_dsc.c',
>  	'xe/xe_compute.c',
> +	'xe/xe_compute_square_kernels.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_query.c',
>  	'xe/xe_spin.c'
> diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
> index 2165eada8931..7259b888eb9e 100644
> --- a/lib/xe/xe_compute.c
> +++ b/lib/xe/xe_compute.c
> @@ -6,71 +6,51 @@
>   *    Francois Dugast <francois.dugast@intel.com>
>   */
>  
> +#include <stdint.h>
> +
> +#include "igt.h"
> +#include "xe_drm.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +
>  #include "xe_compute.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  #define PIPE_CONTROL			0x7a000004
> -#define MI_LOAD_REGISTER_IMM		0x11000001
> -#define PIPELINE_SELECT			0x69040302
> +#define MEDIA_STATE_FLUSH		0x0
> +#define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
> +#define SIZE_DATA			64
> +#define SIZE_BATCH			0x1000
> +#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> +#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> +#define ADDR_BATCH			0x100000
> +#define ADDR_INPUT			0x200000UL
> +#define ADDR_OUTPUT			0x300000UL
> +#define ADDR_SURFACE_STATE_BASE		0x400000UL
> +#define ADDR_DYNAMIC_STATE_BASE		0x500000UL
> +#define ADDR_INDIRECT_OBJECT_BASE	0x800100000000
> +#define OFFSET_INDIRECT_DATA_START	0xFFFDF000
> +#define OFFSET_KERNEL			0xFFFEF000
> +
> +#undef MEDIA_VFE_STATE
>  #define MEDIA_VFE_STATE			0x70000007
> +#undef STATE_BASE_ADDRESS
>  #define STATE_BASE_ADDRESS		0x61010014
> -#define MEDIA_STATE_FLUSH		0x0
> +#undef MEDIA_INTERFACE_DESCRIPTOR_LOAD
>  #define MEDIA_INTERFACE_DESCRIPTOR_LOAD	0x70020002
> +#undef GPGPU_WALKER
>  #define GPGPU_WALKER			0x7105000d
> -#define MI_BATCH_BUFFER_END		(0xA << 23)
> -
> -// generated with:
> -// ocloc -file opencl/compute_square_kernel.cl -device tgllp && xxd -i compute_square_kernel_Gen12LPlp.bin
> -unsigned char tgllp_kernel_square_bin[] = {
> -	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> -	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> -	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> -	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
> -	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
> -	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
> -	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
> -	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> -	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> -	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> -	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> -	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
> -	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
> -	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> -	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> -	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
> -	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
> -	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> -	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> -	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
> -	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x14, 0x12, 0x02, 0xcc, 0x14, 0x1a, 0x96, 0x00,
> -	0x25, 0x00, 0x05, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00,
> -	0x31, 0x44, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x1c, 0x0c, 0x03, 0x00, 0xa0,
> -	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
> -	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> -	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> -	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +
> +struct bo_dict_entry {
> +	uint64_t addr;
> +	uint32_t size;
> +	void *data;
>  };
> -unsigned int tgllp_kernel_square_length = sizeof(tgllp_kernel_square_bin);
> +
> +/*
> + * TGL compatible batch
> + */
>  
>  /**
>   * tgllp_create_indirect_data:
> @@ -80,8 +60,9 @@ unsigned int tgllp_kernel_square_length = sizeof(tgllp_kernel_square_bin);
>   *
>   * Prepares indirect data for compute pipeline.
>   */
> -void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> -				uint64_t addr_input, uint64_t addr_output)
> +static void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				       uint64_t addr_input,
> +				       uint64_t addr_output)
>  {
>  	int b = 0;
>  
> @@ -183,8 +164,9 @@ void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>   *
>   * Prepares surface state for compute pipeline.
>   */
> -void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> -				uint64_t addr_input, uint64_t addr_output)
> +static void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> +				       uint64_t addr_input,
> +				       uint64_t addr_output)
>  {
>  	int b = 0;
>  
> @@ -261,8 +243,8 @@ void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
>   *
>   * Prepares dynamic state for compute pipeline.
>   */
> -void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> -				uint64_t offset_kernel)
> +static void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> +				       uint64_t offset_kernel)
>  {
>  	int b = 0;
>  
> @@ -280,7 +262,7 @@ void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
>  }
>  
>  /**
> - * tgllp_create_batch_compute:
> + * tgllp_compute_exec_compute:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @addr_surface_state_base: gpu offset of surface state data
>   * @addr_dynamic_state_base: gpu offset of dynamic state data
> @@ -289,19 +271,19 @@ void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
>   *
>   * Prepares compute pipeline.
>   */
> -void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
> -				uint64_t addr_surface_state_base,
> -				uint64_t addr_dynamic_state_base,
> -				uint64_t addr_indirect_object_base,
> -				uint64_t offset_indirect_data_start)
> +static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> +				       uint64_t addr_surface_state_base,
> +				       uint64_t addr_dynamic_state_base,
> +				       uint64_t addr_indirect_object_base,
> +				       uint64_t offset_indirect_data_start)
>  {
>  	int b = 0;
>  
> -	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
>  	addr_bo_buffer_batch[b++] = 0x00002580;
>  	addr_bo_buffer_batch[b++] = 0x00060002;
>  	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
> -	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
>  	addr_bo_buffer_batch[b++] = 0x00007034;
>  	addr_bo_buffer_batch[b++] = 0x60000321;
>  	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> @@ -310,7 +292,7 @@ void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
>  	addr_bo_buffer_batch[b++] = 0x0000E404;
>  	addr_bo_buffer_batch[b++] = 0x00000100;
>  	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> @@ -405,3 +387,111 @@ void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
>  }
> +
> +/**
> + * tgl_compute_exec - run a pipeline compatible with Tiger Lake
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @kernel: GPU Kernel binary to be executed
> + * @size: size of @kernel.
> + */
> +static void tgl_compute_exec(int fd, const unsigned char *kernel,
> +			     unsigned int size)
> +{
> +	uint32_t vm, engine;
> +	float *dinput;
> +	struct drm_xe_sync sync = { 0 };
> +#define TGL_BO_DICT_ENTRIES 7
> +	struct bo_dict_entry bo_dict[TGL_BO_DICT_ENTRIES] = {
> +		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL}, // kernel
> +		{ .addr = ADDR_DYNAMIC_STATE_BASE, .size =  0x1000}, // dynamic state
> +		{ .addr = ADDR_SURFACE_STATE_BASE, .size =  0x1000}, // surface state
> +		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START, .size =  0x10000}, // indirect data
> +		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT }, // input
> +		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT }, // output
> +		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
> +	};
> +
> +	/* Sets Kernel size */
> +	bo_dict[0].size = ALIGN(size, 0x1000);
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_RENDER);
> +	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
> +	sync.handle = syncobj_create(fd, 0);
> +
> +	for (int i = 0; i < TGL_BO_DICT_ENTRIES; i++) {
> +		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
> +		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> +		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		memset(bo_dict[i].data, 0, bo_dict[i].size);
> +	}
> +	memcpy(bo_dict[0].data, kernel, size);
> +	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> +	tgllp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> +	tgllp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	dinput = (float *)bo_dict[4].data;
> +	srand(time(NULL));
> +
> +	for (int i = 0; i < SIZE_DATA; i++)
> +		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +
> +	tgllp_compute_exec_compute(bo_dict[6].data, ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE, ADDR_INDIRECT_OBJECT_BASE, OFFSET_INDIRECT_DATA_START);
> +
> +	xe_exec_wait(fd, engine, ADDR_BATCH);
> +
> +	for (int i = 0; i < SIZE_DATA; i++)
> +		igt_assert(((float *)bo_dict[5].data)[i] == ((float *)bo_dict[4].data)[i] * ((float *) bo_dict[4].data)[i]);
> +
> +	for (int i = 0; i < TGL_BO_DICT_ENTRIES; i++) {
> +		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> +		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +		free(bo_dict[i].data);
> +	}
> +
> +	syncobj_destroy(fd, sync.handle);
> +	xe_engine_destroy(fd, engine);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/*
> + * Generic code
> + */
> +
> +static const struct {
> +	unsigned int ip_ver;
> +	void (*compute_exec)(int fd, const unsigned char *kernel,
> +			     unsigned int size);
> +} xe_compute_batches[] = {
> +	{
> +		.ip_ver = IP_VER(12, 0),
> +		.compute_exec = tgl_compute_exec,
> +	},
> +};
> +
> +int run_xe_compute_kernel(int fd)
> +{
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +	const struct xe_compute_kernels *kernels = xe_compute_square_kernels;
> +
> +	for (batch = 0; batch < ARRAY_SIZE(xe_compute_batches); batch++) {
> +		if (ip_ver == xe_compute_batches[batch].ip_ver)
> +			break;
> +	}
> +	if (batch == ARRAY_SIZE(xe_compute_batches))
> +		return 1;
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +	if (!kernels->kernel)
> +		return 1;
> +
> +	xe_compute_batches[batch].compute_exec(fd, kernels->kernel,
> +					       kernels->size);
> +
> +	return 0;
> +}
> diff --git a/lib/xe/xe_compute.h b/lib/xe/xe_compute.h
> index de763101da90..5faa3713c40e 100644
> --- a/lib/xe/xe_compute.h
> +++ b/lib/xe/xe_compute.h
> @@ -9,21 +9,24 @@
>  #ifndef XE_COMPUTE_H
>  #define XE_COMPUTE_H
>  
> -#include <stdint.h>
> +/*
> + * OpenCL Kernels are generated using:
> + *
> + * GPU=tgllp &&                                                         \
> + *      ocloc -file opencl/compute_square_kernel.cl -device $GPU &&     \
> + *      xxd -i compute_square_kernel_Gen12LPlp.bin
> + *
> + * For each GPU model desired. A list of supported models can be obtained with: ocloc compile --help
> + */
> +
> +struct xe_compute_kernels {
> +	int ip_ver;
> +	unsigned int size;
> +	const unsigned char *kernel;
> +};
>  
> -void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> -				uint64_t addr_input, uint64_t addr_output);
> -void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> -				uint64_t addr_input, uint64_t addr_output);
> -void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> -				uint64_t offset_kernel);
> -void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
> -				uint64_t addr_surface_state_base,
> -				uint64_t addr_dynamic_state_base,
> -				uint64_t addr_indirect_object_base,
> -				uint64_t offset_indirect_data_start);
> +extern const struct xe_compute_kernels xe_compute_square_kernels[];
>  
> -extern unsigned char tgllp_kernel_square_bin[];
> -extern unsigned int tgllp_kernel_square_length;
> +int run_xe_compute_kernel(int fd);
>  
>  #endif	/* XE_COMPUTE_H */
> diff --git a/lib/xe/xe_compute_square_kernels.c b/lib/xe/xe_compute_square_kernels.c
> new file mode 100644
> index 000000000000..f9c07dc778bd
> --- /dev/null
> +++ b/lib/xe/xe_compute_square_kernels.c
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Authors:
> + *		Francois Dugast <francois.dugast@intel.com>
> + */
> +
> +#include "intel_chipset.h"
> +#include "lib/xe/xe_compute.h"
> +
> +static const unsigned char tgllp_kernel_square_bin[] = {
> +	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> +	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> +	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> +	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
> +	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
> +	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
> +	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
> +	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> +	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> +	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> +	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> +	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
> +	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
> +	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> +	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> +	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
> +	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
> +	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> +	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> +	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
> +	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x14, 0x12, 0x02, 0xcc, 0x14, 0x1a, 0x96, 0x00,
> +	0x25, 0x00, 0x05, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00,
> +	0x31, 0x44, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x1c, 0x0c, 0x03, 0x00, 0xa0,
> +	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
> +	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> +	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +};
> +
> +const struct xe_compute_kernels xe_compute_square_kernels[] = {
> +	{
> +		.ip_ver = IP_VER(12, 0),
> +		.size = sizeof(tgllp_kernel_square_bin),
> +		.kernel = tgllp_kernel_square_bin,
> +	},
> +	{}
> +};
> diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
> index 138d80671435..202d318c60c0 100644
> --- a/tests/xe/xe_compute.c
> +++ b/tests/xe/xe_compute.c
> @@ -14,117 +14,21 @@
>  #include <string.h>
>  
>  #include "igt.h"
> -#include "lib/igt_syncobj.h"
> -#include "xe_drm.h"
> -#include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_compute.h"
>  
> -#define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
> -#define SIZE_DATA			64
> -#define SIZE_BATCH			0x1000
> -#define SIZE_KERNEL			0x1000
> -#define SIZE_BUFFER_INPUT		MAX(sizeof(float)*SIZE_DATA, 0x1000)
> -#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float)*SIZE_DATA, 0x1000)
> -#define ADDR_BATCH			0x100000
> -#define ADDR_INPUT			(unsigned long)0x200000
> -#define ADDR_OUTPUT			(unsigned long)0x300000
> -#define ADDR_SURFACE_STATE_BASE		(unsigned long)0x400000
> -#define ADDR_DYNAMIC_STATE_BASE		(unsigned long)0x500000
> -#define ADDR_INDIRECT_OBJECT_BASE	0x800100000000
> -#define OFFSET_INDIRECT_DATA_START	0xFFFDF000
> -#define OFFSET_KERNEL			0xFFFEF000
> -
> -struct bo_dict_entry {
> -	uint64_t addr;
> -	uint32_t size;
> -	void *data;
> -};
> -
>  /**
>   * SUBTEST: compute-square
> - * GPU requirement: only works on TGL_GT2 with device ID: 0x9a49
> + * GPU requirement: only works on TGL
>   * Description:
> - * 	This test shows how to create a batch to execute a
> - * 	compute kernel. For now it supports tgllp only.
> + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> + *	for an input dataset..
>   * TODO: extend test to cover other platforms
>   */
>  static void
>  test_compute_square(int fd)
>  {
> -	uint32_t vm, engine;
> -	float *dinput;
> -	struct drm_xe_sync sync = { 0 };
> -
> -#define BO_DICT_ENTRIES 7
> -	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
> -		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL, .size = SIZE_KERNEL }, // kernel
> -		{ .addr = ADDR_DYNAMIC_STATE_BASE, .size =  0x1000}, // dynamic state
> -		{ .addr = ADDR_SURFACE_STATE_BASE, .size =  0x1000}, // surface state
> -		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START, .size =  0x10000}, // indirect data
> -		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT }, // input
> -		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT }, // output
> -		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
> -	};
> -
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> -	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_RENDER);
> -	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
> -	sync.handle = syncobj_create(fd, 0);
> -
> -	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
> -		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
> -		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> -		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> -		memset(bo_dict[i].data, 0, bo_dict[i].size);
> -	}
> -	memcpy(bo_dict[0].data, tgllp_kernel_square_bin, tgllp_kernel_square_length);
> -	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	tgllp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	tgllp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> -	dinput = (float *)bo_dict[4].data;
> -	srand(time(NULL));
> -	for(int i=0; i < SIZE_DATA; i++) {
> -		((float*) dinput)[i] = rand()/(float)RAND_MAX;
> -	}
> -	tgllp_create_batch_compute(bo_dict[6].data, ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE, ADDR_INDIRECT_OBJECT_BASE, OFFSET_INDIRECT_DATA_START);
> -
> -	xe_exec_wait(fd, engine, ADDR_BATCH);
> -	for(int i = 0; i < SIZE_DATA; i++) {
> -		igt_assert(((float*) bo_dict[5].data)[i] == ((float*) bo_dict[4].data)[i] * ((float*) bo_dict[4].data)[i]);
> -	}
> -
> -	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
> -		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> -		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> -		free(bo_dict[i].data);
> -	}
> -
> -	syncobj_destroy(fd, sync.handle);
> -	xe_engine_destroy(fd, engine);
> -	xe_vm_destroy(fd, vm);
> -}
> -
> -static bool
> -is_device_supported(int fd)
> -{
> -	struct drm_xe_query_config *config;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_CONFIG,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	config = malloc(query.size);
> -	igt_assert(config);
> -
> -	query.data = to_user_pointer(config);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	return (config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff) == 0x9a49;
> +	igt_require_f(!run_xe_compute_kernel(fd), "GPU not supported\n");

This looks weird. I interpret this "require NOT run xe compute kernel".
I think run_xe_compute_kernel() should return bool (true) if succeed,
false otherwise.

With this fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  igt_main
> @@ -136,10 +40,8 @@ igt_main
>  		xe_device_get(xe);
>  	}
>  
> -	igt_subtest("compute-square") {
> -		igt_skip_on(!is_device_supported(xe));
> +	igt_subtest("compute-square")
>  		test_compute_square(xe);
> -	}
>  
>  	igt_fixture {
>  		xe_device_put(xe);
> -- 
> 2.39.2
> 

