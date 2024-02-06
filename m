Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928CBC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 08:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C810F85C;
	Tue,  6 Feb 2024 08:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNXU168L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EF410FC0A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707208112; x=1738744112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ajYth4DLxxk6z4o4h7yTR9Xb0mZ2z/aZCbVSbucsIqQ=;
 b=DNXU168L6pLO+sNWYLgjJbyNATA60vJ5dPtXkSIiC7y7/QWkbzPlguv1
 uTLJyjSLOyXz19DoVxEMGr2OmLA0SNheeBy62MyyIovmhb0p5iSQKxeaJ
 gdjjLFDW0Ek41jv7SmX4+ucYm8462STvJFkyWmBGv0Z/8KJB+MDdUt6gT
 NwvBRqVTt4vpA1u4JvEBlTLL5ac4qQQ7kzsDwa/ElJ4xdkmISgETqOLpD
 jdql7cq7qKPEANe3J/PEZwplqjXmCzA3fach/98FnZJhlvaX9zX44FFgj
 AJLi/N87F77NvhykBOn/fhM4R7jJI4VqIM2HhzQ9eKyPGBV8Tr7c8yOwp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="862082"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="862082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 00:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5717323"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 00:28:27 -0800
Date: Tue, 6 Feb 2024 09:28:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH 2/3] lib/amdgpu: add a CS helper function
Message-ID: <20240206082805.6fuq5ph6cn4glfev@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
 <20240125034413.232349-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240125034413.232349-2-vitaly.prosyak@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Vitaly,

On 2024-01-24 at 22:44:12 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add a cs helper function.
> CS helper function works as RADV
> radv_amdgpu_cs_submit. We want to validate
> and ensure the integrity of the following
> functionalities when  the following method
> is called 'amdgpu_cs_submit_raw2':
> 
> 1. Gang submission when several different IPs are into
>    a single command, but those IPs are shared the
>    instance and ring numbers(ip_instance, ring).
> 2. Use 'AMDGPU_CHUNK_ID_BO_HANDLES' vs explicit parameter into 'amdgpu_cs_submit_raw2'.
> 3. Not use  'AMDGPU_CHUNK_ID_DEPENDENCIES'.
> 4. User fence always present except for multimedia ring commands.
> 
> RADV uses those scenarios.
> 
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

You forgot about a-b from Christian here, before push to gitlab
_check_ with 'git log' if _all_ you patches have acked-by or reviewed-by.

Regards,
Kamil

> ---
>  lib/amdgpu/amd_cs_radv.c   | 172 +++++++++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_cs_radv.h   |  61 +++++++++++++
>  lib/amdgpu/amd_ip_blocks.h |   2 +
>  lib/meson.build            |   1 +
>  4 files changed, 236 insertions(+)
>  create mode 100644 lib/amdgpu/amd_cs_radv.c
>  create mode 100644 lib/amdgpu/amd_cs_radv.h
> 
> diff --git a/lib/amdgpu/amd_cs_radv.c b/lib/amdgpu/amd_cs_radv.c
> new file mode 100644
> index 000000000..3c51ff7ef
> --- /dev/null
> +++ b/lib/amdgpu/amd_cs_radv.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +#include <time.h>
> +#include <sys/time.h>
> +
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_sdma.h"
> +#include "lib/amdgpu/amd_PM4.h"
> +#include "lib/amdgpu/amd_cs_radv.h"
> +
> +#define TIME_MONOTONIC 2
> +#define OS_TIMEOUT_INFINITE 0xffffffffffffffffull
> +
> +enum { MAX_RINGS_PER_TYPE = 8 };
> +
> +static bool
> +amdgpu_cs_has_user_fence(struct amdgpu_cs_request_radv *request)
> +{
> +	/* TODO */
> +	return false;
> +}
> +
> +static int64_t
> +os_time_get_nano(void)
> +{
> +	struct timespec ts;
> +
> +	timespec_get(&ts, TIME_MONOTONIC);
> +	return ts.tv_nsec + ts.tv_sec*INT64_C(1000000000);
> +}
> +
> +static int64_t
> +os_time_get_absolute_timeout(uint64_t timeout)
> +{
> +	int64_t time, abs_timeout;
> +
> +	/* Also check for the type upper bound. */
> +	if (timeout == OS_TIMEOUT_INFINITE || timeout > INT64_MAX)
> +		return OS_TIMEOUT_INFINITE;
> +
> +	time = os_time_get_nano();
> +	abs_timeout = time + (int64_t)timeout;
> +
> +	/* Check for overflow. */
> +	if (abs_timeout < time)
> +		return OS_TIMEOUT_INFINITE;
> +
> +	return abs_timeout;
> +}
> +
> +static void
> +os_time_sleep(int64_t usecs)
> +{
> +	struct timespec time;
> +
> +	time.tv_sec = usecs / 1000000;
> +	time.tv_nsec = (usecs % 1000000) * 1000;
> +	while (clock_nanosleep(CLOCK_MONOTONIC, 0, &time, &time) == EINTR)
> +		;
> +}
> +
> +uint32_t
> +amdgpu_get_bo_handle(struct amdgpu_bo *bo)
> +{
> +	uint32_t handle;
> +	int r;
> +
> +	r = amdgpu_bo_export(bo, amdgpu_bo_handle_type_kms, &handle);
> +	igt_assert_eq(r, 0);
> +	return handle;
> +}
> +
> +uint32_t
> +amdgpu_cs_submit_radv(amdgpu_device_handle dev, struct amdgpu_ring_context *ring_context,
> +		struct amdgpu_cs_request_radv *request)
> +{
> +	int r, num_chunks,  size, i;
> +	struct drm_amdgpu_cs_chunk *chunks;
> +	struct drm_amdgpu_cs_chunk_data *chunk_data;
> +	struct drm_amdgpu_bo_list_in bo_list_in;
> +	uint32_t result = 0;
> +	uint64_t abs_timeout_ns;
> +	bool has_user_fence;
> +
> +	has_user_fence = amdgpu_cs_has_user_fence(request);
> +	size = request->number_of_ibs + 1 + (has_user_fence ? 1 : 0) + 1 /* bo list */ + 3;
> +	chunks = malloc(sizeof(chunks[0]) * size);
> +	size = request->number_of_ibs + (has_user_fence ? 1 : 0);
> +	chunk_data = malloc(sizeof(chunk_data[0]) * size);
> +
> +	num_chunks = request->number_of_ibs;
> +	for (i = 0; i < request->number_of_ibs; i++) {
> +
> +		struct amdgpu_cs_ib_info_radv *ib;
> +
> +		chunks[i].chunk_id = AMDGPU_CHUNK_ID_IB;
> +		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
> +		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
> +
> +		ib = &request->ibs[i];
> +		assert(ib->size);
> +
> +		chunk_data[i].ib_data._pad = 0;
> +		chunk_data[i].ib_data.va_start = ib->ib_mc_address;
> +		chunk_data[i].ib_data.ib_bytes = ib->size * 4;
> +		chunk_data[i].ib_data.ip_type = ib->ip_type;
> +		chunk_data[i].ib_data.flags = ib->flags;
> +
> +		chunk_data[i].ib_data.ip_instance = request->ip_instance;
> +		chunk_data[i].ib_data.ring = request->ring;
> +	}
> +
> +	assert(chunk_data[request->number_of_ibs - 1].ib_data.ip_type == request->ip_type);
> +
> +	if (has_user_fence) {
> +		i = num_chunks++;
> +		chunks[i].chunk_id = AMDGPU_CHUNK_ID_FENCE;
> +		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_fence) / 4;
> +		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
> +
> +			/* fence bo handle */
> +		chunk_data[i].fence_data.handle = amdgpu_get_bo_handle(request->fence_info.handle);
> +			/* offset */
> +		chunk_data[i].fence_data.offset =
> +					request->fence_info.offset * sizeof(uint64_t);
> +	}
> +
> +	bo_list_in.operation = ~0;
> +	bo_list_in.list_handle = ~0;
> +	bo_list_in.bo_number = request->num_handles;
> +	bo_list_in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
> +	bo_list_in.bo_info_ptr = (uint64_t)(uintptr_t)request->handles;
> +
> +	chunks[num_chunks].chunk_id = AMDGPU_CHUNK_ID_BO_HANDLES;
> +	chunks[num_chunks].length_dw = sizeof(struct drm_amdgpu_bo_list_in) / 4;
> +	chunks[num_chunks].chunk_data = (uintptr_t)&bo_list_in;
> +	num_chunks++;
> +
> +	/* The kernel returns -ENOMEM with many parallel processes using GDS such as test suites quite
> +	 * often, but it eventually succeeds after enough attempts. This happens frequently with dEQP
> +	 * using NGG streamout.
> +	 */
> +	 abs_timeout_ns = os_time_get_absolute_timeout(1000000000ull); /* 1s */
> +
> +	r = 0;
> +	do {
> +		/* Wait 1 ms and try again. */
> +		if (r == -ENOMEM)
> +			os_time_sleep(1000);
> +
> +		r = amdgpu_cs_submit_raw2(dev, ring_context->context_handle, 0,
> +				num_chunks, chunks, &request->seq_no);
> +	} while (r == -ENOMEM && os_time_get_nano() < abs_timeout_ns);
> +
> +	if (r) {
> +		if (r == -ENOMEM) {
> +			igt_info("igt/amdgpu: Not enough memory for command submission.\n");
> +			result = ENOMEM;
> +		} else if (r == -ECANCELED) {
> +			igt_info("igt/amdgpu: The CS has been cancelled because the context is lost.\n");
> +			result = ECANCELED;
> +		} else {
> +			igt_info("igt/amdgpu: The CS has been rejected, see dmesg for more information (%i).\n", r);
> +			result = EINVAL;
> +		}
> +	}
> +	free(chunks);
> +	free(chunk_data);
> +	return result;
> +}
> diff --git a/lib/amdgpu/amd_cs_radv.h b/lib/amdgpu/amd_cs_radv.h
> new file mode 100644
> index 000000000..8b6dcaaa2
> --- /dev/null
> +++ b/lib/amdgpu/amd_cs_radv.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef AMD_CS_RADV
> +#define AMD_CS_RADV
> +
> +#include "amd_ip_blocks.h"
> +#define AMDGPU_CS_GANG_SIZE	4
> +
> +struct amdgpu_cs_ib_info_radv {
> +	int64_t flags;
> +	uint64_t ib_mc_address;
> +	uint32_t size;
> +	enum amd_ip_block_type ip_type;
> +};
> +
> +struct amdgpu_cs_request_radv {
> +	/** Specify HW IP block type to which to send the IB. */
> +	uint32_t ip_type;
> +
> +	/** IP instance index if there are several IPs of the same type. */
> +	uint32_t ip_instance;
> +
> +	/**
> +	 * Specify ring index of the IP. We could have several rings
> +	 * in the same IP. E.g. 0 for SDMA0 and 1 for SDMA1.
> +	 */
> +	uint32_t ring;
> +
> +	/**
> +	 * BO list handles used by this request.
> +	 */
> +	struct drm_amdgpu_bo_list_entry *handles;
> +	uint32_t num_handles;
> +
> +	/** Number of IBs to submit in the field ibs. */
> +	uint32_t number_of_ibs;
> +
> +	/**
> +	 * IBs to submit. Those IBs will be submitted together as single entity
> +	 */
> +	struct amdgpu_cs_ib_info_radv ibs[AMDGPU_CS_GANG_SIZE];
> +	/**
> +	 * The returned sequence number for the command submission
> +	 */
> +	uint64_t seq_no;
> +	/**
> +	 * The fence information
> +	 */
> +	struct amdgpu_cs_fence_info fence_info;
> +};
> +
> +uint32_t
> +amdgpu_get_bo_handle(struct amdgpu_bo *bo);
> +
> +uint32_t
> +amdgpu_cs_submit_radv(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> +		struct amdgpu_cs_request_radv *request);
> +
> +#endif
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 4cad30d1e..97a9ad489 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -20,7 +20,9 @@ enum amd_ip_block_type {
>  	AMD_IP_UVD_ENC,
>  	AMD_IP_VCN_DEC,
>  	AMD_IP_VCN_ENC,
> +	AMD_IP_VCN_UNIFIED = AMD_IP_VCN_ENC,
>  	AMD_IP_VCN_JPEG,
> +	AMD_IP_VPE,
>  	AMD_IP_MAX,
>  };
>  
> diff --git a/lib/meson.build b/lib/meson.build
> index 0fc11b26c..6122861d8 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -144,6 +144,7 @@ if libdrm_amdgpu.found()
>  		'amdgpu/amd_memory.c',
>  		'amdgpu/amd_command_submission.c',
>  		'amdgpu/amd_compute.c',
> +		'amdgpu/amd_cs_radv.c',
>  		'amdgpu/amd_gfx.c',
>  		'amdgpu/amd_ip_blocks.c',
>  		'amdgpu/amd_shaders.c',
> -- 
> 2.25.1
> 
