Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB28F10E0C7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 13:56:13 +0000 (UTC)
Date: Fri, 8 Sep 2023 15:56:01 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZPsn8YLFt9jbxoWj@fdugast-desk.home>
References: <20230905133309.365109-1-zbigniew.kempczynski@intel.com>
 <20230905133309.365109-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230905133309.365109-9-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 8/9] lib/intel_compute: Adding pvc
 compute pipeline implementation
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

On Tue, Sep 05, 2023 at 03:33:08PM +0200, Zbigniew Kempczyński wrote:
> Add square compute pipeline which works on PVC. Currently limited
> to Xe driver.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c                | 218 ++++++++++++++++++++++++++++-
>  lib/intel_compute_square_kernels.c |  39 ++++++
>  2 files changed, 256 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 29a5ec168f..4a232ce72b 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -71,9 +71,18 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
>  	execenv->driver = get_intel_driver(fd);
>  
>  	if (execenv->driver == INTEL_DRIVER_XE) {
> +		uint16_t engine_class;
> +		uint32_t devid = intel_get_drm_devid(fd);
> +		const struct intel_device_info *info = intel_get_device_info(devid);
> +
> +		if (info->graphics_ver >= 12 && info->graphics_rel < 60)
> +			engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> +		else
> +			engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> +
>  		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>  		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
> -								 DRM_XE_ENGINE_CLASS_RENDER);
> +								 engine_class);
>  	}
>  }
>  
> @@ -877,6 +886,208 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				       uint64_t addr_input,
> +				       uint64_t addr_output)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +}
> +
> +static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> +				       uint64_t addr_general_state_base,
> +				       uint64_t addr_surface_state_base,
> +				       uint64_t addr_dynamic_state_base,
> +				       uint64_t addr_instruction_state_base,
> +				       uint64_t offset_indirect_data_start,
> +				       uint64_t kernel_start_pointer)
> +{
> +	int b = 0;
> +
> +	igt_debug("general   state base: %lx\n", addr_general_state_base);
> +	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
> +	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
> +	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
> +	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
> +	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
> +	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
> +
> +	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> +				    PIPELINE_SELECT_GPGPU;
> +
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
> +	addr_bo_buffer_batch[b++] = 0xE0186010;
> +
> +	addr_bo_buffer_batch[b++] = XEHP_CFE_STATE | 0x4;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x10008800;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
> +	addr_bo_buffer_batch[b++] = 0x00002580;
> +	addr_bo_buffer_batch[b++] = 0x00060002;
> +
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
> +	addr_bo_buffer_batch[b++] = (addr_general_state_base & 0xffffffff) | 0x41;
> +	addr_bo_buffer_batch[b++] = addr_general_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00044000;
> +	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x41;
> +	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x41;
> +	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (addr_instruction_state_base & 0xffffffff) | 0x41;
> +	addr_bo_buffer_batch[b++] = addr_instruction_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = 0xfffff001;
> +	addr_bo_buffer_batch[b++] = 0x00010001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0xfffff001;
> +	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x41;
> +	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00007fbf;
> +	addr_bo_buffer_batch[b++] = 0x00000041;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x25;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000040;
> +	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
> +	addr_bo_buffer_batch[b++] = 0xbe040000;
> +	addr_bo_buffer_batch[b++] = 0xffffffff;
> +	addr_bo_buffer_batch[b++] = 0x0000003f;
> +	addr_bo_buffer_batch[b++] = 0x00000010;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00180000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x0c000020;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000008;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00001047;
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH;
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000040;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> +}
> +
> +/**
> + * xehpc_compute_exec - run a pipeline compatible with XEHP
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @kernel: GPU Kernel binary to be executed
> + * @size: size of @kernel.
> + */
> +static void xehpc_compute_exec(int fd, const unsigned char *kernel,
> +			       unsigned int size)
> +{
> +#define XEHPC_BO_DICT_ENTRIES 6
> +	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
> +		{ .addr = XEHP_ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +		  .name = "instr state base"},
> +		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> +		  .size =  0x10000,
> +		  .name = "indirect object base"},
> +		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
> +		  .name = "addr input"},
> +		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
> +		  .name = "addr output" },
> +		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE, .size = 0x10000,
> +		  .name = "general state base" },
> +		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
> +		  .name = "batch" },
> +	};
> +	struct bo_execenv execenv;
> +	float *dinput;
> +
> +	bo_execenv_create(fd, &execenv);
> +
> +	/* Sets Kernel size */
> +	bo_dict[0].size = ALIGN(size, 0x1000);
> +
> +	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> +
> +	memcpy(bo_dict[0].data, kernel, size);
> +	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT);
> +
> +	dinput = (float *)bo_dict[2].data;
> +	srand(time(NULL));
> +	for (int i = 0; i < SIZE_DATA; i++)
> +		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +
> +	xehpc_compute_exec_compute(bo_dict[5].data,
> +				   XEHP_ADDR_GENERAL_STATE_BASE,
> +				   ADDR_SURFACE_STATE_BASE,
> +				   ADDR_DYNAMIC_STATE_BASE,
> +				   XEHP_ADDR_INSTRUCTION_STATE_BASE,
> +				   OFFSET_INDIRECT_DATA_START,
> +				   OFFSET_KERNEL);
> +
> +	bo_execenv_exec(&execenv, ADDR_BATCH);
> +
> +	for (int i = 0; i < SIZE_DATA; i++) {
> +		float f1, f2;
> +
> +		f1 = ((float *) bo_dict[3].data)[i];
> +		f2 = ((float *) bo_dict[2].data)[i];
> +		if (f1 != f2 * f2)
> +			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> +		igt_assert(f1 == f2 * f2);
> +	}
> +
> +	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> +	bo_execenv_destroy(&execenv);
> +}
> +
>  /*
>   * Compatibility flags.
>   *
> @@ -905,6 +1116,11 @@ static const struct {
>  		.compute_exec = xehp_compute_exec,
>  		.compat = COMPAT_I915,
>  	},
> +	{
> +		.ip_ver = IP_VER(12, 60),
> +		.compute_exec = xehpc_compute_exec,
> +		.compat = COMPAT_XE,
> +	},
>  };
>  
>  bool run_compute_kernel(int fd)
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index da73a3747c..de93a3bdfd 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -112,6 +112,40 @@ static const unsigned char xehp_kernel_square_bin[] = {
>  	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
>  
> +static const unsigned char xehpc_kernel_square_bin[] = {
> +	0x65, 0xa1, 0x00, 0x80, 0x20, 0x82, 0x05, 0x7f, 0x04, 0x00, 0x00, 0x02,
> +	0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80, 0x20, 0x82, 0x05, 0x7f,
> +	0x04, 0x7f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x31, 0x22, 0x03, 0x00,
> +	0x00, 0x00, 0x0c, 0x04, 0x8f, 0x7f, 0x00, 0xfa, 0x03, 0x00, 0x34, 0xf6,
> +	0x66, 0x09, 0x84, 0xb4, 0x80, 0x80, 0x00, 0x4c, 0x41, 0x22, 0x03, 0x80,
> +	0x60, 0x06, 0x01, 0x20, 0xd4, 0x04, 0x00, 0x01, 0x14, 0x00, 0x00, 0x00,
> +	0x53, 0x80, 0x00, 0x80, 0x60, 0x06, 0x05, 0x02, 0xd4, 0x04, 0x00, 0x06,
> +	0x14, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00, 0x60, 0x06, 0x04, 0x05,
> +	0x04, 0x02, 0x0e, 0x01, 0x04, 0x01, 0x04, 0x04, 0x70, 0x19, 0x14, 0x00,
> +	0x20, 0x02, 0x01, 0x00, 0x04, 0x05, 0x10, 0x52, 0xc4, 0x04, 0x00, 0x00,
> +	0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00,
> +	0x78, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x6c, 0x13, 0x05, 0x00, 0x00,
> +	0x61, 0x00, 0x08, 0x6c, 0x15, 0x06, 0x00, 0x00, 0x69, 0x1a, 0x00, 0xf9,
> +	0x17, 0x13, 0x20, 0x00, 0x69, 0x1a, 0x08, 0xf9, 0x19, 0x15, 0x20, 0x00,
> +	0x40, 0x1a, 0x00, 0x20, 0x07, 0x17, 0x60, 0x04, 0x40, 0x1a, 0x08, 0x20,
> +	0x09, 0x19, 0x60, 0x04, 0x31, 0x23, 0x15, 0x00, 0x00, 0x00, 0x14, 0x0b,
> +	0x24, 0x07, 0x00, 0xfb, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x20,
> +	0x0f, 0x17, 0x30, 0x04, 0x40, 0x00, 0x08, 0x20, 0x11, 0x19, 0x30, 0x04,
> +	0x41, 0x83, 0x14, 0x2c, 0x0d, 0x0b, 0x10, 0x0b, 0x31, 0x24, 0x15, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x24, 0x0f, 0x08, 0xfb, 0x14, 0x0d, 0x00, 0x00,
> +	0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x1c, 0x34, 0x7f, 0x00, 0x00, 0x00,
> +	0x31, 0x11, 0x0c, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x30,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +};
> +
>  const struct compute_kernels compute_square_kernels[] = {
>  	{
>  		.ip_ver = IP_VER(12, 0),
> @@ -123,5 +157,10 @@ const struct compute_kernels compute_square_kernels[] = {
>  		.size = sizeof(xehp_kernel_square_bin),
>  		.kernel = xehp_kernel_square_bin,
>  	},
> +	{
> +		.ip_ver = IP_VER(12, 60),
> +		.size = sizeof(xehpc_kernel_square_bin),
> +		.kernel = xehpc_kernel_square_bin,
> +	},
>  	{}
>  };
> -- 
> 2.34.1
> 
