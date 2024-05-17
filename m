Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A9C25B7A
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 19:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3FD10EF5C;
	Fri, 17 May 2024 19:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYEiJoYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC9810EF5B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715974782; x=1747510782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vIpugwBUNIHeQ7+zp6NDcYRJJCKWSDZx0exPg4xuzzI=;
 b=TYEiJoYNoxsKfUArWCk0WY4a/ZzqLecsBri7MLELe2XtozSD9UsLw4S4
 xh30y7s7YTIkEqD88Dmo7OvrnzmAeNV1W9CHLCiqC0uF5hFco2R4mUICW
 pTC0W5MF0gKJM0oD04Of8G9p5hDoRubgLbvFZ9sx6l53EN9V3nvi6F8ZC
 E6gdrR1EwfYUiUPmDEWNx7TVo4j4TpADmbGgrDD54Aij1kYZxFtx0dkJH
 2/rEpyd2YDMP7WIrfVJuZA/IVzukUQ2stc92N+9FzRoIXx1L7jSPKZskP
 LrJkRRyHrt1SLaepCP2XN0lbKnpw/50XGKUHkk1MlzON00YZutNXTajbJ A==;
X-CSE-ConnectionGUID: QCRvfEtOT1qe5d7KLrY89Q==
X-CSE-MsgGUID: UqJJaCDQRkydiKHDjGOe+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16003982"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="16003982"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 12:39:41 -0700
X-CSE-ConnectionGUID: bHMi5xPuQ/OIdMLiYHXlcw==
X-CSE-MsgGUID: ZyXWdab4R/qTmZdivXgoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36311312"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 12:39:40 -0700
Date: Fri, 17 May 2024 21:39:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_tlb: Test to validate TLB
 invalidation
Message-ID: <20240517193923.3nizqvikxgzwwyvr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com
References: <20240515070154.6511-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515070154.6511-1-sai.gowtham.ch@intel.com>
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

On 2024-05-15 at 12:31:54 +0530, sai.gowtham.ch@intel.com wrote:

please improve subject, was:

[PATCH i-g-t] tests/intel/xe_tlb: Test to validate TLB invalidation
----------------------------------------- ^^^^^^^^ ---- ^^^^^^^^^^^

imho better:
[PATCH i-g-t] tests/intel/xe_tlb: Check TLB invalidation

> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates TLB invalidation by binding different buffer objects
------ ^^^^^^^^^ --- ^^^^^^^^^^^^
Same here.

> with the same vma and submitting workload simultaneously, Ideally
> expecting gpu to handle pages by invalidating and  avoding page faults.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_tlb.c | 178 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 tests/intel/xe_tlb.c
> 
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> new file mode 100644
> index 000000000..d737d9348
> --- /dev/null
> +++ b/tests/intel/xe_tlb.c
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright © 2024 Intel Corporation
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
> + * TEST: Tests to validate Translation Lookaside Buffer Invalidation.
> + * Category: Software building block
> + * Sub-category: CMD submission
> + * Functionality: TLB invalidate
> + * Test category: functionality test

imho here is missing 'Mega feature:'

> + */
> +
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
--------------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
imho better:
const char *xe_trace_enable_path =

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
> +}
> +
> +static void stop_tracing(void)
> +{
> +	sysfs_write(tlb_invalidation_trace_en_path, "0");
> +}
> +
> +/**
> + * SUBTEST: tlb-vma

Why not just basic?

> + * Description: Test to validate Translation Lookaside Buffer Invalidation.
------------------ ^^^^^^^^^^^^^^^^
imho better: 'Check ...'

> + * Test category: functionality test
----- ^^^^^^^^^^^^^
You do not need this here.

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

After this assert you will leave tracing on.

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
> +
> +	igt_assert_eq(data1->data, value1);
> +	igt_assert_eq(data2->data, value2);
> +	validate_debugfs_trace(fd);
> +	stop_tracing();
> +
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
-------------------------------^
Why 1 here?

> +		tlb_invalidation(fd, &engine->instance);
> +	}
> +
> +	igt_fixture {

Add stop tracing here, it can still fail (in case of fatal
error only at_exit would be called, but this is better than
nothing).

Regards,
Kamil

> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..e4fee5ca0 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -316,6 +316,7 @@ intel_xe_progs = [
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_scheduler',
> +	'xe_tlb',
>  ]
>  
>  msm_progs = [
> -- 
> 2.39.1
> 
