Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07ACE6816F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 10:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F8310E034;
	Tue, 17 Feb 2026 10:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf62GR3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB31E10E034
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771325976; x=1802861976;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=u0TEiP0JILu2ZyCfdjIoURqhRXKGMnE2gTjJLgr4Vqw=;
 b=Hf62GR3YV6uhm05sFwXGt06/swnMc+lB47DbmsRvcqsntzA/LwOTOCjn
 HWPL1+X63yRjjvyWnQ51jY26MEAjnmgFbxVTTVMKKQxo6w7EhkJRMaahT
 uc7ZarlyO+8OIvHVif8vbGWy6I/aSzR59ADw2UxPHCBre8U/Ue4NR0TZa
 brBbmqrDPXwjWeaofKoP8Wt+Z1LJK+BJncVDgbQFhIIjA09XDBHnjryap
 iczFSDzP6S5NzOnb78dXUBNiRf8Swgp9l+jDPSXDAHDaxSMVJ8xFyHnjp
 3Hmob+aKFrdJKlAJblI/ieYAcBEEloJN7/ryy8Om/uJPEQQfzz7nPVrKl g==;
X-CSE-ConnectionGUID: GPPZdLeHSLOUZoi4PkLSCQ==
X-CSE-MsgGUID: XWyORsIaQvabeyPE/m9/pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89976215"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89976215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 02:59:36 -0800
X-CSE-ConnectionGUID: lsXhT/DoRsqS998j5ZW74g==
X-CSE-MsgGUID: Ty9ddxblRe6QE6C+tmr98w==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 02:59:34 -0800
Message-ID: <ed280b0c-72b1-4d27-ae65-6565bf3e7056@intel.com>
Date: Tue, 17 Feb 2026 10:59:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] tests/xe_pat: Add false-sharing subtest
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
 <20260213084603.1404162-2-priyanka.dandamudi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260213084603.1404162-2-priyanka.dandamudi@intel.com>
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

On 13/02/2026 08:45, priyanka.dandamudi@intel.com wrote:
> From: Zbigniew Kempczyński  <zbigniew.kempczynski@intel.com>
> 
> Exercise access to cache line simultaneously from cpu and gpu and
> verify there's coherency on gpu:uc with non- and 1-way coherency.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>   tests/intel/xe_pat.c | 180 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 21547c84e..59d9ba4ad 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -14,6 +14,7 @@
>   #include <fcntl.h>
>   
>   #include "igt.h"
> +#include "igt_syncobj.h"
>   #include "igt_vgem.h"
>   #include "intel_blt.h"
>   #include "intel_mocs.h"
> @@ -1275,6 +1276,179 @@ static void subtest_pat_index_modes_with_regions(int fd,
>   	}
>   }
>   
> +struct fs_pat_entry {
> +	uint8_t pat_index;
> +	const char *name;
> +	uint16_t cpu_caching;
> +	bool exp_result;
> +};
> +
> +const struct fs_pat_entry fs_xe2_integrated[] = {
> +	{ 2, "cpu-wb-gpu-l3-2way", DRM_XE_GEM_CPU_CACHING_WB, true },
> +	{ 3, "cpu-wc-gpu-uc-non-coh", DRM_XE_GEM_CPU_CACHING_WC, false },
> +	{ 5, "cpu-wb-gpu-uc-1way", DRM_XE_GEM_CPU_CACHING_WB, false },
> +};
> +
> +const struct fs_pat_entry fs_xe2_discrete[] = {
> +	{ 2, "cpu-wb-gpu-l3-2way", DRM_XE_GEM_CPU_CACHING_WB, true },
> +	{ 3, "cpu-wc-gpu-uc-non-coh", DRM_XE_GEM_CPU_CACHING_WC, true },
> +	{ 5, "cpu-wb-gpu-uc-1way", DRM_XE_GEM_CPU_CACHING_WB, true },
> +};
> +
> +#define CPUDW_INC   0x0
> +#define GPUDW_WRITE 0x4
> +#define GPUDW_READY 0x40
> +#define READY_VAL   0xabcd
> +#define FINISH_VAL  0x0bae
> +
> +static void __false_sharing(int fd, const struct fs_pat_entry *fs_entry)
> +{
> +	size_t size = xe_get_default_alignment(fd), bb_size;
> +	uint32_t vm, exec_queue, bo, bb, *map, *batch;
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_sync sync = {
> +	    .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	uint64_t addr = 0x40000;
> +	uint64_t bb_addr = 0x100000;
> +	uint32_t loops = 0x0, gpu_exp_value;
> +	uint32_t region = system_memory(fd);
> +	int loop_addr, i = 0;
> +	int pat_index = fs_entry->pat_index;
> +	int inc_idx, write_idx, ready_idx;
> +	bool result;
> +
> +	inc_idx = CPUDW_INC / sizeof(*map);
> +	write_idx = GPUDW_WRITE / sizeof(*map);
> +	ready_idx = GPUDW_READY / sizeof(*map);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	bo = xe_bo_create_caching(fd, 0, size, region, 0, fs_entry->cpu_caching);
> +	map = xe_bo_map(fd, bo, size);
> +
> +	bb_size = xe_bb_size(fd, SZ_4K);
> +	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> +	batch = xe_bo_map(fd, bb, bb_size);
> +
> +	sync.handle = syncobj_create(fd, 0);
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, addr,
> +				   size, DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
> +				   pat_index, 0),
> +			0);
> +	igt_assert_eq(syncobj_wait_err(fd, &sync.handle, 1, INT64_MAX, 0), 0);
> +
> +	syncobj_reset(fd, &sync.handle, 1);
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bb, 0, bb_addr,
> +				   bb_size, DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
> +				   DEFAULT_PAT_INDEX, 0),
> +			0);
> +	igt_assert_eq(syncobj_wait_err(fd, &sync.handle, 1, INT64_MAX, 0), 0);
> +
> +	/* Unblock cpu wait */
> +	batch[i++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[i++] = addr + GPUDW_READY;
> +	batch[i++] = addr >> 32;
> +	batch[i++] = READY_VAL;
> +
> +	/* Unblock after cpu started to spin */
> +	batch[i++] = MI_SEMAPHORE_WAIT_CMD | MI_SEMAPHORE_POLL |
> +		     MI_SEMAPHORE_SAD_NEQ_SDD | (4 - 2);
> +	batch[i++] = 0;
> +	batch[i++] = addr + CPUDW_INC;
> +	batch[i++] = addr >> 32;
> +
> +	loop_addr = i;
> +	batch[i++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[i++] = addr + GPUDW_WRITE;
> +	batch[i++] = addr >> 32;
> +	batch[i++] = READY_VAL;
> +
> +	batch[i++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | MAD_EQ_IDD | 2;
> +	batch[i++] = READY_VAL;
> +	batch[i++] = addr + GPUDW_READY;
> +	batch[i++] = addr >> 32;
> +
> +	batch[i++] = MI_BATCH_BUFFER_START | 1 << 8 | 1;
> +	batch[i++] = bb_addr + loop_addr * sizeof(uint32_t);
> +	batch[i++] = bb_addr >> 32;
> +
> +	batch[i++] = MI_BATCH_BUFFER_END;
> +
> +	xe_for_each_engine(fd, hwe)
> +		break;
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = bb_addr;
> +	syncobj_reset(fd, &sync.handle, 1);
> +	xe_exec(fd, &exec);
> +
> +	while(READ_ONCE(map[ready_idx]) != READY_VAL);
> +
> +	igt_until_timeout(2) {
> +		WRITE_ONCE(map[inc_idx], map[inc_idx] + 1);
> +		loops++;
> +	}
> +
> +	WRITE_ONCE(map[ready_idx], FINISH_VAL);
> +
> +	igt_assert_eq(syncobj_wait_err(fd, &sync.handle, 1, INT64_MAX, 0), 0);
> +
> +	igt_debug("[%d]: %08x (cpu) [loops: %08x] | [%d]: %08x (gpu) | [%d]: %08x (ready)\n",
> +		  inc_idx, map[inc_idx], loops, write_idx, map[write_idx],
> +		  ready_idx, map[ready_idx]);
> +
> +	result = map[inc_idx] == loops;
> +	gpu_exp_value = map[ready_idx];
> +	igt_debug("got: %d, expected: %d\n", result, fs_entry->exp_result);
> +
> +	xe_vm_unbind_sync(fd, vm, 0, addr, size);
> +	xe_vm_unbind_sync(fd, vm, 0, bb_addr, bb_size);
> +	gem_munmap(batch, bb_size);
> +	gem_munmap(map, size);
> +	gem_close(fd, bo);
> +	gem_close(fd, bb);
> +
> +	xe_vm_destroy(fd, vm);
> +
> +	igt_assert_eq(result, fs_entry->exp_result);

Did you remember if we ever saw any flakyness with this one on lnl? In 
particular for the case where we expect to always detect the broken 
partial cacheline merging?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	igt_assert_eq(gpu_exp_value, FINISH_VAL);
> +}
> +
> +/**
> + * SUBTEST: false-sharing
> + * Test category: functionality test
> + * Description: Check cache line coherency on 1way/coh_none
> + */
> +
> +static void false_sharing(int fd)
> +{
> +	bool is_dgfx = xe_has_vram(fd);
> +
> +	const struct fs_pat_entry *fs_entries;
> +	int num_entries;
> +
> +	if (is_dgfx) {
> +		num_entries = ARRAY_SIZE(fs_xe2_discrete);
> +		fs_entries = fs_xe2_discrete;
> +	} else {
> +		num_entries = ARRAY_SIZE(fs_xe2_integrated);
> +		fs_entries = fs_xe2_integrated;
> +	}
> +
> +	for (int i = 0; i < num_entries; i++) {
> +		igt_dynamic_f("%s", fs_entries[i].name) {
> +			__false_sharing(fd, &fs_entries[i]);
> +		}
> +	}
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	switch (opt) {
> @@ -1360,6 +1534,12 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("display-vs-wb-transient")
>   		display_vs_wb_transient(fd);
>   
> +	igt_subtest_with_dynamic("false-sharing") {
> +		igt_require(intel_get_device_info(dev_id)->graphics_ver == 20);
> +
> +		false_sharing(fd);
> +	}
> +
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }

