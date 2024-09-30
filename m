Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B44CF64B6
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 13:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14A110E44F;
	Mon, 30 Sep 2024 13:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOuwy8Hk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DA310E44D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 13:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727701523; x=1759237523;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=1LP4l58qCHtma4CwusJfCD1mFvhiPZuF11hFbbTL+30=;
 b=TOuwy8HkxsnR9kdjemjnjIXrSaYOyf59rAM/rHAnn2ehTRGiTTFx/9eD
 7wWCAfkfQp4LbAyGdoT7S5N08fNwgXxkg3v/LiVQUjUa4wHJC1MfZPJD9
 JnuOcGquJtc230RwIiwmK1irQ7CmxthwaMUXM2Zr2vCgRcAl8NaJDI+yW
 Ojt7YlLykRJ38h/DSh5MG+pqhhDDYcYwvnWd/tXwPNvt0nedbGwFuPTNN
 ENdElJYV02asubZ17rdGHVRyQN48VkjtflHZa61xVMfoghX/CenDDYw64
 XsJCSzF0Pu2TM496jtiAfJRjWomhF4FShKSC25mgiFdMUd7XkKYHGnbeC w==;
X-CSE-ConnectionGUID: r8dpg4GATK6viLwfJUiwQw==
X-CSE-MsgGUID: 4qc8w3edSeKXm2SD6pRecA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26741284"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26741284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:05:23 -0700
X-CSE-ConnectionGUID: 5mIMyIIBRP6OOIsIqtqFow==
X-CSE-MsgGUID: EQtrFQ/bQcin87GIgGLhig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78258452"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.194.204])
 ([10.245.194.204])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:05:21 -0700
Message-ID: <a161ca23-9aa8-417d-8d1d-cf8f22b67624@linux.intel.com>
Date: Mon, 30 Sep 2024 15:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
To: sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
References: <20240930115038.2045395-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240930115038.2045395-1-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 9/30/2024 1:50 PM, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>
> Test validates TLB invalidation by binding different buffer objects
> with the same vma and submitting workload simultaneously, Ideally
> expecting gpu to handle pages by invalidating and avoding page faults.
>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

Reviews from v1 is still stays/pending.

Make sure to use versioning(git format-patch -v <version_num>) which missing here.


> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_tlb.c | 162 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 163 insertions(+)
>  create mode 100644 tests/intel/xe_tlb.c
>
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> new file mode 100644
> index 000000000..8809d09ec
> --- /dev/null
> +++ b/tests/intel/xe_tlb.c
> @@ -0,0 +1,162 @@
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
> +static int tlb_count(int fd, int gt)
> +{
> +	char tlb_path[4096];
> +	char path[256];
> +	int count;
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
> +	igt_debugfs_dump(fd, path);
> +	igt_debugfs_read(fd, path, tlb_path);
> +
> +	sscanf(tlb_path, "%*[^:]: %d", &count);
> +	igt_info("%s\n", tlb_path);
> +
> +	return count;
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
> +	tlb_pre = tlb_count(fd, eci->gt_id);
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
> +	tlb_pos = tlb_count(fd, eci->gt_id);
> +	igt_assert_eq(data1->data, value1);
> +	igt_assert_eq(data2->data, value2);
> +	igt_assert(tlb_pos > tlb_pre);
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
> index 62bde353b..844de49d1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -317,6 +317,7 @@ intel_xe_progs = [
>  	'xe_sysfs_preempt_timeout',
>  	'xe_sysfs_scheduler',
>          'xe_sysfs_timeslice_duration',
> +        'xe_tlb',
>  ]
>  
>  intel_xe_eudebug_progs = [
