Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F98C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 10:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF1710E5A5;
	Thu, 21 Mar 2024 10:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmd2FoAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5804410E5A0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015591; x=1742551591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZZgzOF+XlLrnZPoAzU4tpA8vLUokxbZuUZ5oPvGa5bE=;
 b=mmd2FoAitCt/On5r4b+JpayK5QRW4gatK5gBFm/+K30acNvx8AEyYv1/
 /3n0gdYp3KSb02SOhwGtuBmXhbt+Av2tfFOt3/9AS6/Lj8BAFhzbNZ9rz
 0e2HXcsqFDyupW8Nb9z68OQWELJSTJG8JXPjsnl8ETW0fLfnaQk75zB+Y
 MzugrNNYV7XJ9sww/mivxdBhkHhIfJoN47a3xbXUPDKN6xMGSKs0wNWrr
 NIdnNznID1EIW/rvjFvVdvt0kLIRNl+XlNqHIwHVP5xuggeGnRZRtgFjc
 aHrM5v0I8W2zWvr1/5tYMN+dCwtzRRg+ZhGLkrHAKJ3o8s0qAwelDQ6Ev w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5824425"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5824425"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19180717"
Received: from unknown (HELO localhost) ([10.245.246.249])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:06:29 -0700
Date: Thu, 21 Mar 2024 11:06:26 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_exec_compute_mode: Test to
 validate LR mode
Message-ID: <20240321100626.m6zexpfu7qdybcf3@zkempczy-mobl2>
References: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
 <20240320155430.11877-4-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320155430.11877-4-sai.gowtham.ch@intel.com>
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

On Wed, Mar 20, 2024 at 09:24:30PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test to validate LR mode flag by submitting workload for
> 30's.

Maybe:

"Validate job which is executed with LR mode flag on VM runs on GPU
long enough and is not prematurely killed."

> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 80 ++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 7dad71509..30cc7c105 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -400,6 +400,83 @@ static void non_block(int fd, int expect)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +#define LR_SPINNER_TIME 30
> +/**
> + * SUBTEST: lr-mode-workload
> + * Description: Stress LR mode workload for 30s.
> + * Test category: functionality test
> + */
> +static void lr_mode_workload(int fd)
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
> +	struct drm_xe_engine *engine;
> +	uint64_t vm_sync;
> +	size_t bo_size;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint64_t spin_addr;
> +	uint64_t ahnd;
> +	uint32_t bo;
> +	uint32_t ts_1, ts_2;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	bo_size = xe_bb_size(fd, sizeof(*spin));
> +	engine = xe_engine(fd, 1);
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
> +	spin = xe_bo_map(fd, bo, bo_size);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
> +							ALLOC_STRATEGY_LOW_TO_HIGH);
> +
> +	sync.addr = to_user_pointer(&vm_sync);
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, spin_addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +
> +	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
> +	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = spin_addr;
> +	xe_exec(fd, &exec);
> +	xe_spin_wait_started(spin);
> +
> +	/* Collect and check Timestamps before stopping the spinner */

s/Timestamps/timestamps/

> +	sleep(LR_SPINNER_TIME);
> +	ts_1 = spin->timestamp;
> +	sleep(1);
> +	ts_2 = spin->timestamp;
> +

Below assert should be glued to above code so remove this blank line
here.

> +	igt_assert(ts_1 != ts_2);

And add blank line here to separate block (similar to below assert).

> +	xe_spin_end(spin);
> +	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +
> +	/* Check timestamps to make sure spinner is stopped */
> +	ts_1 = spin->timestamp;
> +	sleep(1);
> +	ts_2 = spin->timestamp;
> +	igt_assert(ts_1 == ts_2);
> +
> +	sync.addr = to_user_pointer(&vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +	munmap(spin, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);

For purity close allocator by adding:

	put_ahnd(ahnd);

--
Zbigniew

> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -460,6 +537,9 @@ igt_main
>  	igt_subtest("non-blocking")
>  		non_block(fd, EWOULDBLOCK);
>  
> +	igt_subtest("lr-mode-workload")
> +		lr_mode_workload(fd);
> +
>  
>  	igt_fixture
>  		drm_close_driver(fd);
> -- 
> 2.39.1
> 
