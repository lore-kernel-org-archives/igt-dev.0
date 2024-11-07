Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB1ED5AE6B
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEAC10E1E5;
	Thu,  7 Nov 2024 07:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7zabZcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6457A10E1E5
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 07:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730964317; x=1762500317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7wJhhq1nqtnq5rmOzdWpj6MDVmHmbSdAAP4t2LVSMAE=;
 b=E7zabZcxz0AMosax4lNzY1iHw5ltsVtWrFXuCUvQIXEydwR78iM6nUHm
 KtEo+QnJ8aMXlXB5Akr7i0QoDgKPHPdbn89yq+dAuE/UdlIgSiLIP1KkS
 p3BLE70ZiD9OsspTc+fMwHUTmNiZ6ZMMF3wQs3FWWeeq0kQtPMx3W9gRH
 XC2dYb0BJEQ76yn9TaxQ9ZSvQnNGDq2O6vFw7u5Ao8ZV+Xq2k+WPRBY2k
 RpOijmdev9piZWD01rQwelDP5LWA/qJsZoNG+vDsh/LscyYlvINT3yE/I
 L5hvdVw9NQj5coE9c5+45GcK+wsiodIUlvLxucOsxgOSyuB/hCftL8bEn g==;
X-CSE-ConnectionGUID: X4uCFLUgSEOmaBWHmg2MLw==
X-CSE-MsgGUID: k/T4SGimRt+aeHkMSVhBAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30650251"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30650251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:25:17 -0800
X-CSE-ConnectionGUID: UyzCMFP8ThmTQBfR5BK0AA==
X-CSE-MsgGUID: SjsvcaPGS0e1XknVGTjBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84519811"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:25:15 -0800
Date: Thu, 7 Nov 2024 08:25:13 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/xe_spin_batch: Add spin-timestamp-check
Message-ID: <20241107072513.k33razbujdzgyrd4@zkempczy-mobl2>
References: <20241105092805.317286-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105092805.317286-1-pravalika.gurram@intel.com>
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

On Tue, Nov 05, 2024 at 02:58:05PM +0530, Pravalika Gurram wrote:
> check the ctx_timestamp register post gt reset for each engine.
> 
> Reference: VLK-64943
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_spin_batch.c | 158 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 9314e229e..547cb1c5b 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -309,6 +309,158 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  	put_ahnd(ahnd);
>  }
>  
> +static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
> +		       bool hang)
> +{
> +	uint64_t ahnd, bb_size, bb_addr;
> +	uint32_t vm, exec_queue, bb;
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync syncobj = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = USER_FENCE_VALUE,
> +	};
> +
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&syncobj),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +	} *data;
> +	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
> +	int64_t timeout = NSEC_PER_SEC;
> +	int i, ret;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	bb_size = xe_bb_size(fd, sizeof(*data));
> +	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
> +	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
> +						      ALLOC_STRATEGY_LOW_TO_HIGH);
> +	data = xe_bo_map(fd, bb, bb_size);
> +	syncobj.addr = to_user_pointer(&data->vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bb, 0, bb_addr, bb_size, &syncobj, 1);
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +
> +	batch_offset = (char *)&data->batch - (char *)data;
> +	batch_addr = bb_addr + batch_offset;
> +	sdi_offset = (char *)&data->data - (char *)data;
> +	sdi_addr = bb_addr + sdi_offset;
> +
> +	i = 0;
> +
> +	data->batch[i++] = MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[i++] = sdi_addr;
> +	data->batch[i++] = sdi_addr >> 32;
> +	data->batch[i++] = 0;
> +	if (!hang)
> +		data->batch[i++] = MI_BATCH_BUFFER_END;
> +	igt_assert(i <= ARRAY_SIZE(data->batch));
> +
> +	syncobj.addr = bb_addr + (char *)&data->exec_sync - (char *)data;
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +	ret = __xe_exec(fd, &exec);

Just call xe_exec() here, it must succeed.

--
Zbigniew

> +	ret = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE, 0, &timeout);
> +	igt_assert(hang ? ret < 0 : ret == 0);
> +
> +	munmap(data, bb_size);
> +	gem_close(fd, bb);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +
> +	put_ahnd(ahnd);
> +}
> +
> +static void run_spinner(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = USER_FENCE_VALUE,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct xe_spin *spin;
> +	uint64_t vm_sync;
> +	size_t bo_size;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint64_t spin_addr;
> +	uint64_t ahnd;
> +	uint32_t bo;
> +	uint32_t ts_1, ts_2;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	bo_size = xe_bb_size(fd, sizeof(*spin));
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
> +	spin = xe_bo_map(fd, bo, bo_size);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
> +						ALLOC_STRATEGY_LOW_TO_HIGH);
> +
> +	sync.addr = to_user_pointer(&vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, spin_addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +
> +
> +	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
> +	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = spin_addr;
> +	xe_exec(fd, &exec);
> +	xe_spin_wait_started(spin);
> +
> +	/* Collect and check timestamps before stopping the spinner */
> +	usleep(50000);
> +	ts_1 = spin->timestamp;
> +	usleep(50000);
> +	ts_2 = spin->timestamp;
> +	igt_assert_neq_u32(ts_1, ts_2);
> +
> +	xe_spin_end(spin);
> +	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +
> +	sync.addr = to_user_pointer(&vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	munmap(spin, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +	put_ahnd(ahnd);
> +}
> +
> +/**
> + * SUBTEST: spin-timestamp-check
> + * Description: Intiate gt reset then check the timestamp register for each engine.
> + * Test category: functionality test
> + */
> +static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +
> +	exec_store(fd, eci, false);
> +
> +	exec_store(fd, eci, true);
> +
> +	run_spinner(fd, eci);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -343,6 +495,12 @@ igt_main
>  			xe_for_each_engine_class(class)
>  				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
>  
> +	igt_subtest_with_dynamic("spin-timestamp-check")
> +		xe_for_each_engine(fd, hwe) {
> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> +				xe_spin_timestamp_check(fd, hwe);
> +		}
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.34.1
> 
