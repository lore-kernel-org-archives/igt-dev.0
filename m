Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7810E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 11:09:34 +0000 (UTC)
Date: Wed, 14 Jun 2023 13:09:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614110928.n5ro45g6dzilip7y@kamilkon-desk1>
References: <20230613220636.229517-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230613220636.229517-1-vitaly.prosyak@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add sync object tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, michael.strawbridge@amd.com,
 christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vitaly,

On 2023-06-13 at 18:06:36 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Using worker thread to wait on point and then signal point on other thread.
> Another test uses a worker thread to signal point and wait on the main
> thread using amdgpu_cs_syncobj_timeline_wait.
> 
> The command consists of two chunks :
> 1. AMDGPU_CHUNK_ID_IB uses GFX_COMPUTE_NOP  or SDMA_NOP.
> 2. The second chunk is AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT
>    or AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL which has the
>    point number .
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_syncobj.c | 293 +++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build   |   1 +
>  2 files changed, 294 insertions(+)
>  create mode 100644 tests/amdgpu/amd_syncobj.c
> 
> diff --git a/tests/amdgpu/amd_syncobj.c b/tests/amdgpu/amd_syncobj.c
> new file mode 100644
> index 000000000..d178c2600
> --- /dev/null
> +++ b/tests/amdgpu/amd_syncobj.c
> @@ -0,0 +1,293 @@
> +/* SPDX-License-Identifier: MIT
-- ^^
Should be '//'
See for example tests/device_reset.c

Please use checkpatch.pl from Linux kernel scripts for finding
some problems, you can ignore 'line too long'.

> + * Copyright 2017 Advanced Micro Devices, Inc.
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
----- ^
Delete this, it is replaced by SPDX above and the reason for
using SPDX was to drop such full licence texts.

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
----- ^

> + *
> +*/
-- ^^
Add space before so as to keep '*' aligned.

> +
> +
> +#include "igt.h"
----------- ^
Move igt includes after system ones.

> +#include "drmtest.h"
------------ ^
Sort includes alpabetically (in their sections).

> +#include "lib/amdgpu/amd_PM4.h" // GFX_COMPUTE_NOP
---------------------------------- ^
Maybe better to add comments before ?

> +#include "lib/amdgpu/amd_sdma.h"	// SDMA_NOP
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>

Put system includes first.

> +#include "lib/amdgpu/amd_memory.h"
----------- ^^
Move to igt include section.

> +#include <pthread.h>
> +
> +struct syncobj_point {
> +	amdgpu_device_handle device;
> +	uint32_t syncobj_handle;
> +	uint64_t point;
> +};
> +
> +
> +static bool
> +syncobj_timeline_enable(int fd)
> +{
> +	int r;
> +	bool ret = false;
> +	uint64_t cap = 0;
> +
> +	r = drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE, &cap);
> +	if (r || cap == 0)
> +		return ret;
> +	ret = true;
> +
> +	return ret;
> +}
> +
> +static int
> +syncobj_command_submission_helper(amdgpu_device_handle device_handle,
------------------------------------ ^
> +								  uint32_t syncobj_handle, bool wait_or_signal,
----------------------------------------------------------------- ^
Align it to above amdgpu_device

> +								  uint64_t point)
Same here, align.

> +{
> +	amdgpu_context_handle context_handle;
> +	amdgpu_bo_handle ib_result_handle;
> +	void *ib_result_cpu;
> +	uint64_t ib_result_mc_address;
> +	struct drm_amdgpu_cs_chunk chunks[2];
> +	struct drm_amdgpu_cs_chunk_data chunk_data;
> +	struct drm_amdgpu_cs_chunk_syncobj syncobj_data;
> +	struct amdgpu_cs_fence fence_status;
> +	amdgpu_bo_list_handle bo_list;
> +	amdgpu_va_handle va_handle;
> +	uint32_t expired;
> +	int i, r;
> +	uint64_t seq_no;
> +	uint32_t *ptr;
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device_handle, 4096, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT, 0,
> +				    &ib_result_handle, &ib_result_cpu,
> +				    &ib_result_mc_address, &va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo_list);
> +	igt_assert_eq(r, 0);
> +
> +	ptr = ib_result_cpu;
> +
> +	for (i = 0; i < 16; ++i)
> +		ptr[i] = wait_or_signal ? GFX_COMPUTE_NOP: SDMA_NOP;
-------------------------------------------------------- ^
Add space before ':'

> +
> +	chunks[0].chunk_id = AMDGPU_CHUNK_ID_IB;
> +	chunks[0].length_dw = sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
> +	chunks[0].chunk_data = (uint64_t)(uintptr_t)&chunk_data;
> +	chunk_data.ib_data._pad = 0;
> +	chunk_data.ib_data.va_start = ib_result_mc_address;
> +	chunk_data.ib_data.ib_bytes = 16 * 4;
> +	chunk_data.ib_data.ip_type = wait_or_signal ? AMDGPU_HW_IP_GFX : AMDGPU_HW_IP_DMA;
> +	chunk_data.ib_data.ip_instance = 0;
> +	chunk_data.ib_data.ring = 0;
> +	chunk_data.ib_data.flags = 0;
> +
> +	chunks[1].chunk_id = wait_or_signal ?
> +		AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT :
> +		AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL;
> +	chunks[1].length_dw = sizeof(struct drm_amdgpu_cs_chunk_syncobj) / 4;
> +	chunks[1].chunk_data = (uint64_t)(uintptr_t)&syncobj_data;
> +	syncobj_data.handle = syncobj_handle;
> +	syncobj_data.point = point;
> +	syncobj_data.flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;
> +
> +	r = amdgpu_cs_submit_raw(device_handle,
> +				 context_handle,
> +				 bo_list,
> +				 2,
> +				 chunks,
> +				 &seq_no);
> +	igt_assert_eq(r, 0);
> +
> +	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
> +	fence_status.context = context_handle;
> +	fence_status.ip_type = wait_or_signal ? AMDGPU_HW_IP_GFX : AMDGPU_HW_IP_DMA;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.fence = seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(&fence_status,
> +			AMDGPU_TIMEOUT_INFINITE,0, &expired);
----------------------------------------------- ^
Space after ","

> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_list_destroy(bo_list);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
> +				     ib_result_mc_address, 4096);
> +
> +	r = amdgpu_cs_ctx_free(context_handle);
> +	igt_assert_eq(r, 0);
--------------------- ^  ^
> +
> +	return r;

Why do you need to return 0 ? imho better make this a void
function.

> +}
> +
> +static void *
> +syncobj_wait(void *data)
> +{
> +	struct syncobj_point *sp = (struct syncobj_point *)data;
> +	int r;
> +
> +	r = syncobj_command_submission_helper(sp->device, sp->syncobj_handle, true,
> +					      sp->point);
> +	igt_assert_eq(r, 0);
> +
> +	return (void *)(long)r;
> +}
> +
> +static void *
> +syncobj_signal(void *data)
> +{
> +	struct syncobj_point *sp = (struct syncobj_point *)data;
> +	int r;
> +
> +	r = syncobj_command_submission_helper(sp->device,sp->syncobj_handle, false,
-------------------------------------------------------- ^
Space after ","

> +					      sp->point);
> +	igt_assert_eq(r, 0);
> +
> +	return (void *)(long)r;
> +}
> +
> +static void
> +amdgpu_syncobj_timeline(amdgpu_device_handle device_handle)
> +{
> +	static pthread_t wait_thread;
> +	static pthread_t signal_thread;
> +	static pthread_t c_thread;
> +	struct syncobj_point sp1, sp2, sp3;
> +	uint32_t syncobj_handle;
> +	uint64_t payload;
> +	uint64_t wait_point, signal_point;
> +	uint64_t timeout;
> +	struct timespec tp;
> +	int r, sync_fd;
> +	void *tmp, *tmp2;
> +
> +	r =  amdgpu_cs_create_syncobj2(device_handle, 0, &syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	// wait on point 5
> +	sp1.syncobj_handle = syncobj_handle;
> +	sp1.device = device_handle;
> +	sp1.point = 5;
> +	r = pthread_create(&wait_thread, NULL, syncobj_wait, &sp1);
> +	igt_assert_eq(r, 0);
> +
> +	// signal on point 10
> +	sp2.syncobj_handle = syncobj_handle;
> +	sp2.device = device_handle;
> +	sp2.point = 10;
> +	r = pthread_create(&signal_thread, NULL, syncobj_signal, &sp2);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_join(signal_thread, &tmp);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_join(wait_thread, &tmp2);
> +	igt_assert_eq(r, 0);
> +
> +	//query timeline payload
> +	r = amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 10);
> +
> +	//signal on point 16
> +	sp3.syncobj_handle = syncobj_handle;
> +	sp3.device = device_handle;
> +	sp3.point = 16;
> +	r = pthread_create(&c_thread, NULL, syncobj_signal, &sp3);
> +	igt_assert_eq(r, 0);
> +
> +	//CPU wait on point 16
> +	wait_point = 16;
> +	timeout = 0;
> +	clock_gettime(CLOCK_MONOTONIC, &tp);
> +	timeout = tp.tv_sec * 1000000000ULL + tp.tv_nsec;
----------------------------- ^^^^^^^^^^^^^
> +	timeout += 0x10000000000; //10s
------------------ ^^^
This is hex and above you use decimal ? Maybe use define or const.

> +	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &syncobj_handle,
> +					    &wait_point, 1, timeout,
> +					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +					    NULL);
> +
> +	igt_assert_eq(r, 0);
> +	r = pthread_join(c_thread, &tmp);
> +	igt_assert_eq(r, 0);
> +
> +	// export point 16 and import to point 18
> +	r = amdgpu_cs_syncobj_export_sync_file2(device_handle, syncobj_handle,
> +						16,
> +						DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +						&sync_fd);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
> +						18, sync_fd);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 18);
> +
> +	// CPU signal on point 20
> +	signal_point = 20;
> +	r = amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
> +					      &signal_point, 1);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 20);
> +
> +	r = amdgpu_cs_destroy_syncobj(device_handle, syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +}
> +
> +igt_main
> +{
> +	amdgpu_device_handle device;
> +	int fd = -1;
> +
> +	igt_fixture {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +		igt_require(syncobj_timeline_enable(fd));
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +
> +	}
> +
> +	igt_subtest("amdgpu_syncobj_timeline")
> +	amdgpu_syncobj_timeline(device);
------- ^
Add additional tab before, like
	igt_subtest("amdgpu_syncobj_timeline")
		amdgpu_syncobj_timeline(device);

> +
> +	igt_fixture {
> +		amdgpu_device_deinitialize(device);
> +		close(fd);
--------------- ^
		drm_close_driver(fd);

Regards,
Kamil

> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 7fff7602f..7342bb714 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -5,6 +5,7 @@ if libdrm_amdgpu.found()
>  	amdgpu_progs += [ 'amd_abm',
>  			  'amd_assr',
>  			  'amd_basic',
> +			  'amd_syncobj',
>  			  'amd_bypass',
>  			  'amd_deadlock',
>  			  'amd_pci_unplug',
> -- 
> 2.25.1
> 
