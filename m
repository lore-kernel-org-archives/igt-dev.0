Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD774C41513
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 11:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671B710E8A1;
	Fri, 10 May 2024 11:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtaphLsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0A10E8A1
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715338931; x=1746874931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7sfLyOrJ76AEjQeuRsopP6hrVY86FJMFw/JvdWQexgQ=;
 b=QtaphLsWsx2Zhx+1arCYDtWyooxC0WpLJZsIPJc4yM96G4Gb97a1lNMY
 x51boUvdCMFpEFQUhrqSPAi0P9aYaV1hbThs9Dr6N4Xfobcu1d//FNGZH
 ebbSU9ZR8wtorIaQ+/XQto4u7OwkPQxCUAobiPArlNiRKbFeoOTWlEgz+
 5XzneFZGaXzOfG28ioCYar8MKPR2Ee3UkBVeRNJhK2zsbyOwGPWJ8jUBI
 +FXjfpKG9+LzYD5G8ISTIHEWY6N03J4a35MsCLSxhblWOXdd99H+Yt8+l
 1BxRY+pC1nJutfmfcOXYNRLuPvEWPfyuwX1JZ7uXxvqFdzyT5hJWKcmMH A==;
X-CSE-ConnectionGUID: //xNVVcnRZ6H/oVp3o+gfQ==
X-CSE-MsgGUID: RGd6t3qFRmG6S9hypbf+Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11444370"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="11444370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 04:02:11 -0700
X-CSE-ConnectionGUID: nYpRNU6CRNWznyaT1QBBuA==
X-CSE-MsgGUID: l5BCoQ4KT7iJa4pCFacchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="30137022"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 04:02:10 -0700
Date: Fri, 10 May 2024 13:01:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_tlb_invalidation: Test to validate
 TLB invalidation
Message-ID: <20240510110151.qtddnex2y2cyx5wy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com
References: <20240510051848.21049-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510051848.21049-1-sai.gowtham.ch@intel.com>
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

Hi Sai,
On 2024-05-10 at 10:48:48 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates TLB invallidation by binding different buffer objects
-------------------------^
s/ll/l

> with the same vma and submitting workload simultaniously, Ideally

s/simultaniously,/simultanously./

> expecting gpu to hanlde pages by invalidating and  avoding page faults.
------------------ ^^^^^^
s/hanlde/handle/

> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_tlb_invalidation.c | 178 ++++++++++++++++++++++++++++++
---------------------^^^^^^^^^^^^^
Could you make it shorter? imho xe_tlb.c is enough.

>  tests/meson.build                 |   1 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 tests/intel/xe_tlb_invalidation.c
> 
> diff --git a/tests/intel/xe_tlb_invalidation.c b/tests/intel/xe_tlb_invalidation.c
> new file mode 100644
> index 000000000..d9f68311e
> --- /dev/null
> +++ b/tests/intel/xe_tlb_invalidation.c
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright © 2023 Intel Corporation
-----------------^^^^
2024

> +*
> +* Authors:
> +*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> +*/
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe_drm.h"
> +
> +/**
> + * TEST: Tests to validate TLB Invalidation.

Please add here description with decipher of TLB:
Translation Lookaside Buffer (TLB)

> + * Category: Software building block
> + * Sub-category: CMD submission
> + * Functionality: TLB invalidate
> + * Test category: functionality test
> + */

Add newline.

Add also old style test description here.

> +struct data {
> +	uint32_t batch[16];
> +	uint32_t data;
> +	uint64_t addr;
> +};
> +
> +static void store_dword_batch(struct data *data, uint64_t addr, int value)
> +{
> +	int b;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = value;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	data->addr = batch_addr;
> +}
> +
> +const char *tlb_invalidation_trace_en_path =
> +				"/sys/kernel/debug/tracing/events/xe/enable";
> +const char *trace_path = "/sys/kernel/tracing/trace";
> +
> +static bool sysfs_write(const char *file, const char *value)
> +{
> +	FILE *fp = fopen(file, "w");
> +
> +	igt_assert_f(fp, "error in opening file %s\n", file);
> +	igt_assert_f(fwrite(value, 1, strlen(value), fp) == strlen(value),
> +			"failed to update sysfs tracing node %s\n", file);
> +	fclose(fp);
> +	return 0;
> +}
> +
> +static void start_tracing(void)
> +{
> +	sysfs_write(tlb_invalidation_trace_en_path, "1");
> +}
> +
> +static void validate_debugfs_trace(int fd)
> +{
> +	igt_assert(igt_debugfs_search(fd, trace_path, "tlb_invalidation_fence_create"));
----^^^^^^^^^^
This is problematic, see below.

> +}
> +
> +static void stop_tracing(void)
> +{
> +	sysfs_write(tlb_invalidation_trace_en_path, "0");
> +}
> +
> +/**
> + * SUBTEST: tlb-vma
> + * Description: Test to validate TLB Invalidation.
> + * Test category: functionality test 
> + */
> +static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct data *data1;
> +	struct data *data2;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bind_engine;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	int value1 = 0x123456;
> +	int value2 = 0x123465;
> +	uint64_t addr = 0x100000;
> +	uint32_t bo1, bo2;
> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync[0].handle = syncobj_create(fd, 0);
> +	sync[1].handle = syncobj;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data1);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo1 = xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo2 = xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	start_tracing();
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> +	xe_vm_bind_async(fd, vm, bind_engine, bo1, 0, addr, bo_size, sync, 1);
> +	data1 = xe_bo_map(fd, bo1, bo_size);
> +
> +	store_dword_batch(data1, addr, value1);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = data1->addr;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
----^^^^^^^^^^
You will left system with traing on.

> +
> +	xe_vm_bind_async(fd, vm, bind_engine, bo2, 0, addr, bo_size, sync, 1);
> +	data2 = xe_bo_map(fd, bo2, bo_size);
> +
> +	store_dword_batch(data2, addr, value2);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = data2->addr;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
--- ^^^
Same here.

> +
> +        igt_assert_eq(data1->data, value1);
--- ^^^
Same here.

> +        igt_assert_eq(data2->data, value2);
--- ^^^
Same here.

> +	validate_debugfs_trace(fd);
--- ^^^
Same here.

> +
> +	stop_tracing();
Add newline here, imho this stop_tracing() should be added
to at_exit.

> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data1, bo_size);
> +	munmap(data2, bo_size);
> +	gem_close(fd, bo1);
> +	gem_close(fd, bo2);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct drm_xe_engine *engine;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_subtest("tlb-vma") {
> +		engine = xe_engine(fd, 1);
> +		tlb_invalidation(fd, &engine->instance);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> +                                      
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..4b8bbdbe3 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -316,6 +316,7 @@ intel_xe_progs = [
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_scheduler',
> +	'xe_tlb_invalidation',
>  ]
>  
>  msm_progs = [
> -- 
> 2.39.1
> 
