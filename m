Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B87B10E22A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 13:03:41 +0000 (UTC)
Message-ID: <51f70ac8-ce0a-c86f-ae65-296f04ce7d5d@amd.com>
Date: Tue, 18 Oct 2022 15:03:34 +0200
Content-Language: en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20221013132527.6104-1-vitaly.prosyak@amd.com>
 <20221013132527.6104-3-vitaly.prosyak@amd.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20221013132527.6104-3-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 3/6] lib/amdgpu: add deadlock helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vitaly,

On 13/10/2022 15:25, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> To validate amdgpu reset functionality.
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   lib/amdgpu/amd_deadlock_helpers.c | 260 ++++++++++++++++++++++++++++++
>   lib/amdgpu/amd_deadlock_helpers.h |  34 ++++
>   lib/meson.build                   |   3 +-
>   3 files changed, 296 insertions(+), 1 deletion(-)
>   create mode 100644 lib/amdgpu/amd_deadlock_helpers.c
>   create mode 100644 lib/amdgpu/amd_deadlock_helpers.h
> 
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> new file mode 100644
> index 000000000..c6528c6ad
> --- /dev/null
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -0,0 +1,260 @@
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + *  *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + *
> + */
> +#include <amdgpu.h>
> +#include "amdgpu_drm.h"
> +#include "amd_PM4.h"
> +#include "amd_sdma.h"
> +#include <unistd.h>
> +#include <pthread.h>
> +#include "amd_memory.h"
> +#include "amd_deadlock_helpers.h"
> +#include "amd_ip_blocks.h"
> +
> +static int use_uc_mtype = 0;
> +
> +static void *write_mem_address(void *data)
> +{
> +#define WRITE_MEM_ADDRESS_DELAY_MS 100
> +
> +	int i;
> +	uint32_t * ib_result_cpu = data;
> +
> +	/* useconds_t range is [0, 1,000,000] so use loop for waits > 1s */
> +	for (i = 0; i < WRITE_MEM_ADDRESS_DELAY_MS; i++)
> +		usleep(1000);
> +
> +	ib_result_cpu[256] = 0x1;
> +	/* printf("ib_result_cpu[256] = 0x1;\n"); */> +
> +	return 0;
> +}
> +
> +void
> +amdgpu_deadlock_helper(amdgpu_device_handle device_handle, unsigned ip_type, bool with_thread)
> +{
> +	amdgpu_context_handle context_handle;
> +	amdgpu_bo_handle ib_result_handle;
> +	void *ib_result_cpu;
> +	uint32_t *ib_result_cpu2;
> +	uint64_t ib_result_mc_address;
> +	struct amdgpu_cs_request ibs_request;
> +	struct amdgpu_cs_ib_info ib_info;
> +	struct amdgpu_cs_fence fence_status;
> +	uint32_t expired;
> +	int i, r;
> +	amdgpu_bo_list_handle bo_list;
> +	amdgpu_va_handle va_handle;
> +	int bo_cmd_size = 4096;
> +	pthread_t stress_thread = {0};
> +	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, bo_cmd_size,
> +			AMDGPU_GEM_DOMAIN_GTT, 0, use_uc_mtype ? AMDGPU_VM_MTYPE_UC : 0,
> +						    &ib_result_handle, &ib_result_cpu,
> +						    &ib_result_mc_address, &va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL,
> +			       &bo_list);
> +	igt_assert_eq(r, 0);
> +
> +	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
> +
> +	if (with_thread) {
> +			r = pthread_create(&stress_thread, NULL, &write_mem_address, ib_result_cpu);
> +			igt_assert_eq(r, 0);
> +	}
> +
> +	base_cmd->emit(base_cmd, PACKET3(PACKET3_WAIT_REG_MEM, 5));
> +
> +	base_cmd->emit(base_cmd, (WAIT_REG_MEM_MEM_SPACE(1)  /* memory */|
> +							  WAIT_REG_MEM_FUNCTION(4) /* != */|
> +							  WAIT_REG_MEM_ENGINE(0)/* me */));
> +
> +	base_cmd->emit(base_cmd, (ib_result_mc_address + 256*4) & 0xfffffffc);
> +	base_cmd->emit(base_cmd, ((ib_result_mc_address + 256*4) >> 32) & 0xffffffff);
> +
> +	base_cmd->emit(base_cmd, 0);/* reference value */
> +	base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
> +	base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
> +	base_cmd->emit_repeat(base_cmd, 0xffff1000, 16 - base_cmd->cdw);
> +
> +
> +	ib_result_cpu2 = ib_result_cpu;
> +	ib_result_cpu2[256] = 0x0; /* the memory we wait on to change */


Maybe "stress_thread" execution has finished already, so the following IB
will never see the value switching to 1.

> +
> +
> +
> +	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
> +	ib_info.ib_mc_address = ib_result_mc_address;
> +	ib_info.size = base_cmd->cdw;
> +
> +	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
> +	ibs_request.ip_type = ip_type;
> +	ibs_request.ring = 0;
> +	ibs_request.number_of_ibs = 1;
> +	ibs_request.ibs = &ib_info;
> +	ibs_request.resources = bo_list;
> +	ibs_request.fence_info.handle = NULL;
> +	for (i = 0; i < 200; i++) {

What's the point of repeating the same submission 200 times?

Also the naming of the function and its "with_thread" argument is a bit odd.

The function signature could be modified to something like this:

   void
   amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type, bool cause_deadlock)

and the same signature could also cover the SDMA case:
     amdgpu_wait_memory_helper(..., AMDGPU_HW_IP_GFX, ...);
     amdgpu_wait_memory_helper(..., AMDGPU_HW_IP_COMPUTE, ...);
     amdgpu_wait_memory_helper(..., AMDGPU_HW_IP_DMA, ...);

Then, the test itself could be simplified to to something
like this:

   * create bo and initialize it to 0
   * submit the cs with the PACKET3_WAIT_REG_MEM packet
   * if (!cause_deadlock) ((uint32_t*)ib_result_cpu)[256] = 1;
   * wait for the fence

No need for a loop, nor a thread.

Pierre-Eric

> +		r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
> +		if (r != 0 && r != -ECANCELED)
> +			igt_assert(0);
> +	}
> +
> +	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
> +	fence_status.context = context_handle;
> +	fence_status.ip_type = ip_type;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.fence = ibs_request.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(&fence_status,
> +			AMDGPU_TIMEOUT_INFINITE,0, &expired);
> +	if (r != 0 && r != -ECANCELED)
> +		igt_assert(0);
> +
> +	if (with_thread)
> +		pthread_join(stress_thread, NULL);
> +
> +	amdgpu_bo_list_destroy(bo_list);
> +
> +	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
> +				     ib_result_mc_address, 4096);
> +
> +	amdgpu_cs_ctx_free(context_handle);
> +
> +	free_cmd_base(base_cmd);
> +}
> +
> +void
> +amdgpu_deadlock_sdma(amdgpu_device_handle device_handle, bool with_thread)
> +{
> +	amdgpu_context_handle context_handle;
> +	amdgpu_bo_handle ib_result_handle;
> +	void *ib_result_cpu;
> +	uint32_t *ib_result_cpu2;
> +	uint64_t ib_result_mc_address;
> +	struct amdgpu_cs_request ibs_request;
> +	struct amdgpu_cs_ib_info ib_info;
> +	struct amdgpu_cs_fence fence_status;
> +	uint32_t expired;
> +	int i, r;
> +	amdgpu_bo_list_handle bo_list;
> +	amdgpu_va_handle va_handle;
> +	struct drm_amdgpu_info_hw_ip info;
> +	uint32_t ring_id;
> +	pthread_t stress_thread = {0};
> +	int bo_cmd_size = 4096;
> +	struct amdgpu_cmd_base * base_cmd;
> +
> +	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
> +
> +		r = amdgpu_bo_alloc_and_map_raw(device_handle, 4096, 4096,
> +				AMDGPU_GEM_DOMAIN_GTT, 0, use_uc_mtype ? AMDGPU_VM_MTYPE_UC : 0,
> +							    &ib_result_handle, &ib_result_cpu,
> +							    &ib_result_mc_address, &va_handle);
> +		igt_assert_eq(r, 0);
> +
> +		if (with_thread) {
> +			r = pthread_create(&stress_thread, NULL, &write_mem_address, ib_result_cpu);
> +			igt_assert_eq(r, 0);
> +		}
> +
> +		r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL,
> +				       &bo_list);
> +		igt_assert_eq(r, 0);
> +
> +		base_cmd = get_cmd_base();
> +		base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
> +
> +		base_cmd->emit(base_cmd, SDMA_PKT_HEADER_OP(SDMA_OP_POLL_REGMEM) |
> +					(0 << 26) | /* WAIT_REG_MEM */(4 << 28) | /* != */(1 << 31)
> +					/* memory */);
> +
> +		base_cmd->emit(base_cmd, (ib_result_mc_address + 256*4) & 0xfffffffc);
> +
> +		base_cmd->emit(base_cmd, ((ib_result_mc_address + 256*4) >> 32) & 0xffffffff);
> +
> +		base_cmd->emit(base_cmd, 0); /* reference value */
> +		base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
> +
> +		base_cmd->emit(base_cmd,  4 | /* poll interval */(0xfff << 16)/* retry count */);
> +
> +		base_cmd->emit_repeat(base_cmd, 0, 16 - base_cmd->cdw);
> +
> +		ib_result_cpu2 = ib_result_cpu;
> +		ib_result_cpu2[256] = 0x0; /* the memory we wait on to change */
> +
> +		memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
> +		ib_info.ib_mc_address = ib_result_mc_address;
> +		ib_info.size = base_cmd->cdw;
> +
> +		memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
> +		ibs_request.ip_type = AMDGPU_HW_IP_DMA;
> +		ibs_request.ring = ring_id;
> +		ibs_request.number_of_ibs = 1;
> +		ibs_request.ibs = &ib_info;
> +		ibs_request.resources = bo_list;
> +		ibs_request.fence_info.handle = NULL;
> +
> +		for (i = 0; i < 200; i++) {
> +			r = amdgpu_cs_submit(context_handle, 0,&ibs_request, 1);
> +			if (r != 0 && r != -ECANCELED)
> +				igt_assert(0);
> +		}
> +
> +		memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
> +		fence_status.context = context_handle;
> +		fence_status.ip_type = AMDGPU_HW_IP_DMA;
> +		fence_status.ip_instance = 0;
> +		fence_status.ring = ring_id;
> +		fence_status.fence = ibs_request.seq_no;
> +
> +		r = amdgpu_cs_query_fence_status(&fence_status,
> +				AMDGPU_TIMEOUT_INFINITE,0, &expired);
> +		if (r != 0 && r != -ECANCELED)
> +			igt_assert(0);
> +
> +		if (with_thread)
> +			pthread_join(stress_thread, NULL);
> +
> +		r = amdgpu_bo_list_destroy(bo_list);
> +		igt_assert_eq(r, 0);
> +
> +		amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
> +					     ib_result_mc_address, 4096);
> +		free_cmd_base(base_cmd);
> +	}
> +	amdgpu_cs_ctx_free(context_handle);
> +}
> diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
> new file mode 100644
> index 000000000..91dcf8bb2
> --- /dev/null
> +++ b/lib/amdgpu/amd_deadlock_helpers.h
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + *
> + */
> +#ifndef __AMD_DEADLOCK_HELPERS_H__
> +#define __AMD_DEADLOCK_HELPERS_H__
> +
> +void
> +amdgpu_deadlock_helper(amdgpu_device_handle device_handle, unsigned ip_type, bool with_thread);
> +
> +void
> +amdgpu_deadlock_sdma(amdgpu_device_handle device_handle, bool with_thread);
> +
> +#endif
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index c665bd250..ed27ca10e 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -137,7 +137,8 @@ if libdrm_amdgpu.found()
>   		'amdgpu/amd_gfx_v8_0.c',
>   		'amdgpu/amd_gfx_v9_0.c',
>   		'amdgpu/amd_dispatch_helpers.c',
> -		'amdgpu/amd_dispatch.c'
> +		'amdgpu/amd_dispatch.c',
> +		'amdgpu/amd_deadlock_helpers.c'
>   	]
>   endif
>   
