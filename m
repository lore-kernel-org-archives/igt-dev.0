Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7E0CF857A
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 11:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C17A10E802;
	Thu,  3 Oct 2024 11:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBY8nPKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752CF10E180
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727953441; x=1759489441;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SUYZbjFtynE6ZEjn9SypzMpLrALmkU9irLZJSd6lJWA=;
 b=VBY8nPKWig+g4cDH1mKV9PBq3/ZdjUGB1kDbrZmmgf7H6DqVvY6OEv5K
 1J+hFTQYn/+qXiUMc+EY131OjEvHq4cIYoUjiA9s4egMEACasEpt1kT1H
 Gj4aAcLZH0ac7Sz/N/RRl170LNisAZ9AJcbrx3mSjHr2SIga+G/rxddJp
 rXJJulkbai8CEczYeqC0T5VAZ/JQOn5yNIDnHEpm3Ca1Z8a+gd4tQJ2vY
 Tfiog1d7RGAeSjE79EUc/nsSIRvwe7ZLBjYYU0+PgRt51pr0X+q1AtOL1
 AG/R96ZcGf4UTsmcESjxofzfCU01mRHJa4gXYkYpnxYfvIkGeJKq4gbAq A==;
X-CSE-ConnectionGUID: X0IA8f1KQ6GKUiZtbwfVrA==
X-CSE-MsgGUID: 43780QYrSuaY5fvL7iCzWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30013929"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="30013929"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:04:00 -0700
X-CSE-ConnectionGUID: pJw0BdD1QFeOGHFMHzW3cA==
X-CSE-MsgGUID: ZzgPl57USveLoJ6lspkDPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="78864780"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.147])
 ([10.245.244.147])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:03:59 -0700
Message-ID: <276fc42d-af3f-41ab-94d2-6f3a34f4856a@intel.com>
Date: Thu, 3 Oct 2024 12:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_tlb: Add test to check TLB
 invalidation
To: sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org,
 nirmoy.das@intel.com
References: <20240930162609.2089507-1-sai.gowtham.ch@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240930162609.2089507-1-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/09/2024 17:26, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates TLB invalidation by binding different buffer objects
> with the same vma and submitting workload simultaneously, Ideally
> expecting gpu to handle pages by invalidating and avoding page faults.
> 
> v2: Validating tlb_invalidation counts with pre and post increment counter
>      values, rather complete stats.
> 
> v3: Move xe_tlb_count to lib making it generic to all stat entries. which returns
>      the counter of a given stat.
> 
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   lib/xe/xe_gt.c       |  25 ++++++++
>   lib/xe/xe_gt.h       |   1 +
>   tests/intel/xe_tlb.c | 148 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   4 files changed, 175 insertions(+)
>   create mode 100644 tests/intel/xe_tlb.c
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 36e8fde36..dfc60e2ff 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -141,3 +141,28 @@ void xe_post_hang_ring(int fd, igt_hang_t arg)
>   	xe_vm_destroy(fd, arg.spin->vm);
>   }
>   
> +/**
> + * xe_tlb_count:
> + * @fd: open xe drm file descriptor
> + * @gt: gt_id
> + *
> + * This function returns the counter for a given stat.
> + */
> +int xe_tlb_count(int fd, int gt, const char *stat)
> +{
> +	FILE *f;
> +	char tlb_path[4096];
> +	char path[256];
> +	int count;
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
> +	f = fopen(path, "r");
> +
> +	while (fgets(tlb_path, sizeof(tlb_path), f)) {
> +		if (strstr(tlb_path, stat) != NULL) {
> +			sscanf(tlb_path, "%*[^:]: %d", &count);
> +			break;
> +		}
> +	}
> +	return count;
> +}
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 6fa05d6a9..7910587ac 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -13,3 +13,4 @@ void xe_force_gt_reset_all(int fd);
>   igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>   				unsigned int flags);
>   void xe_post_hang_ring(int fd, igt_hang_t arg);
> +int xe_tlb_count(int fd, int gt, const char *stat);
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> new file mode 100644
> index 000000000..399384f5b
> --- /dev/null
> +++ b/tests/intel/xe_tlb.c
> @@ -0,0 +1,148 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright © 2024 Intel Corporation
> +*
> +* Authors:
> +*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> +*/
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe/xe_gt.c"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe_drm.h"
> +#include "igt_debugfs.h"
> +
> +/**
> + * TEST: Check Translation Lookaside Buffer Invalidation.
> + * Category: Software building block
> + * Mega feature: General Core features
> + * Sub-category: CMD submission
> + * Functionality: TLB invalidate
> + * Test category: functionality test
> + */
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
> +/**
> + * SUBTEST: basic-tlb
> + * Description: Check Translation Lookaside Buffer Invalidation.
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
> +	int tlb_pre, tlb_pos;
> +	const char *stat = "tlb_inval_count";
> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync[0].handle = syncobj_create(fd, 0);
> +	sync[1].handle = syncobj;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data1);
> +	bo_size = xe_bb_size(fd, bo_size);
> +	bo1 = xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo2 = xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	tlb_pre = xe_tlb_count(fd, eci->gt_id, stat);
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
> +	tlb_pos = xe_tlb_count(fd, eci->gt_id, stat);
> +	igt_assert_eq(data1->data, value1);
> +	igt_assert_eq(data2->data, value2);
> +	igt_assert(tlb_pos > tlb_pre);

Can't this overflow? Should we not check for that? See here:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2922.

It is possible kmd is missing an invalidation, but seems pretty 
unlikely? Also strange that is only triggers on dg2.

> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data1, bo_size);
> +	munmap(data2, bo_size);
> +	gem_close(fd, bo1);
> +	gem_close(fd, bo2);
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
> +	igt_subtest("basic-tlb") {
> +		engine = xe_engine(fd, 0);
> +		tlb_invalidation(fd, &engine->instance);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0782d3cc7..b0a490ccb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -317,6 +317,7 @@ intel_xe_progs = [
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',
>           'xe_sysfs_timeslice_duration',
> +        'xe_tlb',
>   ]
>   
>   intel_xe_eudebug_progs = [
