Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD1C10E004
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Dec 2023 11:07:12 +0000 (UTC)
Message-ID: <58310ed4-8f7b-4c61-8fdf-85b346ec8003@linux.intel.com>
Date: Thu, 28 Dec 2023 12:07:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 2/3] lib/intel_compute: Add LNL compute preempt
 library support
Content-Language: en-US
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, nirmoy.das@intel.com
References: <20231228001510.1399329-1-janga.rahul.kumar@intel.com>
 <20231228001510.1399329-3-janga.rahul.kumar@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231228001510.1399329-3-janga.rahul.kumar@intel.com>
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

Hi Rahul,

On 12/28/2023 1:15 AM, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
> Add STATE_SIP instruction in compute pipeline.
> Add library support to submit long and short opencl kernels
> to exercise preemption scenario.
>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   lib/intel_compute.c | 238 +++++++++++++++++++++++++++++++++++++++++++-
>   lib/intel_compute.h |   2 +-
>   2 files changed, 237 insertions(+), 3 deletions(-)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index bf6a91109..b7bc17c1e 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -41,6 +41,7 @@
>   #define OFFSET_BINDING_TABLE		0x1000
>   
>   #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
> +#define OFFSET_STATE_SIP			0xFFFF0000
>   
>   struct bo_dict_entry {
>   	uint64_t addr;
> @@ -1160,7 +1161,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   					uint64_t addr_instruction_state_base,
>   					uint64_t addr_state_contect_data_base,
>   					uint64_t offset_indirect_data_start,
> -					uint64_t kernel_start_pointer)
> +					uint64_t kernel_start_pointer,
> +					uint64_t sip_start_pointer)
>   {
>   	int b = 0;
>   
> @@ -1172,6 +1174,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   	igt_debug("state context data base addr: %lx\n", addr_state_contect_data_base);
>   	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
>   	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
> +	igt_debug("sip start pointer: %lx\n", sip_start_pointer);
>   
>   	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
>   				    PIPELINE_SELECT_GPGPU;
> @@ -1220,6 +1223,13 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
>   	addr_bo_buffer_batch[b++] = 0x001ff000;
>   
> +#define XE2_STATE_SIP	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 17))
nit: Add this to a header file
> +	if (sip_start_pointer) {
> +		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
> +		addr_bo_buffer_batch[b++] = sip_start_pointer;
> +		addr_bo_buffer_batch[b++] = 0x00000000;
> +	}
> +
>   	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x26;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x00000040;
> @@ -1335,7 +1345,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>   				  ADDR_INSTRUCTION_STATE_BASE,
>   				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>   				  OFFSET_INDIRECT_DATA_START,
> -				  OFFSET_KERNEL);
> +				  OFFSET_KERNEL, 0);
>   
>   	bo_execenv_exec(&execenv, ADDR_BATCH);
>   
> @@ -1474,3 +1484,227 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
>   
>   	return __run_intel_compute_kernel(fd, eci);
>   }
> +
> +/**
> + * xe2lpg_compute_preempt_exec - run a pipeline compatible with XE2 and
> + * submit long and short kernels for preemption occurrence.
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @: size of @kernel.
This is incomplete.
> + */
> +static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel,
> +					unsigned int long_kernel_size,
> +					const unsigned char *short_kernel,
> +					unsigned int short_kernel_size,
> +					const unsigned char *sip_kernel,
> +					unsigned int sip_kernel_size)
> +{
> +#define XE2_BO_PREEMPT_DICT_ENTRIES 11
> +	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
> +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +		  .name = "instr state base"},
> +		{ .addr = ADDR_DYNAMIC_STATE_BASE,
> +		  .size = 0x100000,
> +		  .name = "dynamic state base"},
> +		{ .addr = ADDR_SURFACE_STATE_BASE,
> +		  .size = 0x1000,
> +		  .name = "surface state base"},
> +		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> +		  .size =  0x1000,
> +		  .name = "indirect object base"},
> +		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
> +		  .name = "addr input"},
> +		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
> +		  .name = "addr output" },
> +		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
> +		  .name = "general state base" },
> +		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
> +		  .size = 0x1000,
> +		  .name = "binding table" },
> +		{ .addr = ADDR_BATCH,
> +		  .size = SIZE_BATCH,
> +		  .name = "batch" },
> +		{ .addr = XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +		  .size = 0x10000,
> +		  .name = "state context data base"},
> +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_STATE_SIP,
> +		  .name = "sip kernel"},
> +	};
> +
> +	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
> +	struct bo_execenv execenv_short, execenv_long;
> +	float *dinput;
> +
> +	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
> +		bo_dict_short[i] = bo_dict_long[i];
> +
> +	bo_execenv_create(fd, &execenv_short, NULL);
> +	bo_execenv_create(fd, &execenv_long, NULL);
> +
> +	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
> +	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
> +
> +	bo_dict_long[10].size = ALIGN(sip_kernel_size, 0x1000);
> +	bo_dict_short[10].size = ALIGN(sip_kernel_size, 0x1000);
> +
> +	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
> +
> +	memcpy(bo_dict_long[0].data, long_kernel, long_kernel_size);
> +	memcpy(bo_dict_short[0].data, short_kernel, short_kernel_size);
> +
> +	memcpy(bo_dict_long[10].data, sip_kernel, sip_kernel_size);
> +	memcpy(bo_dict_short[10].data, sip_kernel, sip_kernel_size);
> +
> +	create_dynamic_state(bo_dict_long[1].data, OFFSET_KERNEL);
> +	xehp_create_surface_state(bo_dict_long[2].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_indirect_data(bo_dict_long[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_surface_state(bo_dict_long[7].data, ADDR_INPUT, ADDR_OUTPUT);
> +
> +	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
> +	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
> +
> +	dinput = (float *)bo_dict_long[4].data;
> +	srand(time(NULL));
> +
> +	for (int i = 0; i < SIZE_DATA; i++)
> +		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +
> +	dinput = (float *)bo_dict_short[4].data;
> +
> +	for (int i = 0; i < SIZE_DATA; i++)
> +		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +
> +	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
> +				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
> +				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
> +
> +	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
> +				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
> +				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
> +
> +	struct drm_xe_sync sync_long = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +
> +	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
> +
> +	struct drm_xe_sync sync_short = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +
> +	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
> +
> +	igt_assert(syncobj_wait(fd, &sync_short.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync_short.handle);
> +
> +	igt_assert(syncobj_wait(fd, &sync_long.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync_long.handle);
> +
> +	for (int i = 0; i < SIZE_DATA; i++) {
> +		float f1, f2;
> +
> +		f1 = ((float *) bo_dict_short[5].data)[i];
> +		f2 = ((float *) bo_dict_short[4].data)[i];
> +
> +		if (f1 != f2 * f2)
> +			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> +		igt_assert(f1 == f2 * f2);
> +	}
> +
> +	for (int i = 0; i < SIZE_DATA; i++) {
> +		float f1, f2;
> +
> +		f1 = ((float *) bo_dict_long[5].data)[i];
> +		f2 = ((float *) bo_dict_long[4].data)[i];
> +
> +		if (f1 != f2 * f2)
> +			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> +		igt_assert(f1 == f2 * f2);
> +	}

Above those check could go into a function.


Regards,

Nirmoy

> +
> +	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
> +
> +	bo_execenv_destroy(&execenv_short);
> +	bo_execenv_destroy(&execenv_long);
> +}
> +
> +static const struct {
> +	unsigned int ip_ver;
> +	void (*compute_exec)(int fd, const unsigned char *long_kernel,
> +			     unsigned int long_kernel_size,
> +			     const unsigned char *short_kernel,
> +			     unsigned int short_kernel_size,
> +			     const unsigned char *sip_kernel,
> +			     unsigned int sip_kernel_size);
> +	uint32_t compat;
> +} intel_compute_preempt_batches[] = {
> +	{
> +		.ip_ver = IP_VER(20, 04),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
> +};
> +
> +static bool __run_intel_compute_kernel_preempt(int fd)
> +{
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> +	enum intel_driver driver = get_intel_driver(fd);
> +
> +	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> +		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> +			break;
> +
> +
> +	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
> +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> +		return false;
> +	}
> +
> +	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_preempt_batches[batch].compat)) {
> +		igt_debug("Driver is not supported: flags %x & %x\n",
> +			  COMPAT_DRIVER_FLAG(driver),
> +			  intel_compute_preempt_batches[batch].compat);
> +		return false;
> +	}
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +
> +	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
> +		return 0;
> +
> +	intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
> +							  kernels->long_kernel_size,
> +							  kernels->kernel, kernels->size,
> +							  kernels->sip_kernel,
> +							  kernels->sip_kernel_size);
> +
> +	return true;
> +}
> +/**
> + * run_intel_compute_kernel_preempt - runs compute kernels to
> + * exercise preemption scenario.
> + *
> + * @fd: file descriptor of the opened DRM Xe device
> + *
> + * Returns true on success, false otherwise.
> + */
> +bool run_intel_compute_kernel_preempt(int fd)
> +{
> +	return __run_intel_compute_kernel_preempt(fd);
> +}
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 9ea87b528..bba8bed94 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -35,5 +35,5 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
>   
>   bool run_intel_compute_kernel(int fd);
>   bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
> -
> +bool run_intel_compute_kernel_preempt(int fd);
>   #endif	/* INTEL_COMPUTE_H */
