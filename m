Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293D0C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 16:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD5B10FEFD;
	Tue, 12 Mar 2024 16:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fy+VTysk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6326610F918
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710260786; x=1741796786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W1mHVmx1prIib++V2AgmITvuZGcetOQii0Rjvsxucrg=;
 b=Fy+VTyskcf2J6l3SIFxaHA2AFtaQP6c6sLdfe3D4zD7ozed1ubWT6wBh
 j+k/B0oRsLE6XSJW4h2A2wd04EhQDdRfmm5wucBjnUjUAgpqnMiJEl0il
 mn/fGxrZqPJFvsHEqwRHrt+JgbLKOLKC0BkIs/S02XizATVnqICo5yTSc
 Wqp5jic65mli3Zv9ENVr/nWVIh0hT1Zy0Bu/2X2aOf/+pFvpme79rpXw1
 Q/8TX2gwiu9xdK9YK4r+xPA8/i3Kbvp0xaHIuNRF4iFLOYODsYHM6yTqg
 iPf8oA4qyOhTppWbCwyRmBkyqXIF7gOkPJ+rjk23OqUcDQzXb/MbKBB8T A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22500835"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22500835"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16241171"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:26:24 -0700
Date: Tue, 12 Mar 2024 17:26:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Long running
 test for fix duration of time.
Message-ID: <20240312162621.46wilgnxqdc5cpfk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240311064426.4985-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240311064426.4985-1-sai.gowtham.ch@intel.com>
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

Hi igt-dev,
On 2024-03-11 at 12:14:26 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Please remove dot from end of subject:
[PATCH i-g-t] tests/intel/xe_exec_compute_mode: Long running test for fix duration of time.

s/time\./time/

> 
> Test to validate LR mode flag for fixed duration of time.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 75 ++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 7dad71509..01850d2b7 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -400,6 +400,78 @@ static void non_block(int fd, int expect)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +#define DURATION_NS ((unsigned int)30000*NSEC_PER_SEC)
------------------------ ^^^^^^^^^^^^^
Why not 30ULL * NSEC_PER_SEC

Also maybe change name? What about:

#define DURATION_30_SEC (30ULL * NSEC_PER_SEC)

or just multiply at assignment?

> +/**
> + * SUBTEST: lr-with-duration
> + * Description: Stress LR mode workload for 30s.
> + * Test category: functionality test
> + */
> +static void lr_with_duration(int fd)
> +{
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync[1] = {
> +		{.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		 .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		 .timeline_value = USER_FENCE_VALUE},
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct  {
> +		struct xe_spin spin;
> +		uint64_t vm_sync;
> +		uint32_t data;
> +		uint64_t exec_sync;
> +	} *data;
> +	struct xe_spin_opts spin_opts;
> +	const uint64_t duration_ns = DURATION_NS;
> +	struct drm_xe_engine *engine;
> +	size_t bo_size;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bo;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bo_size = sizeof(*data);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	engine = xe_engine(fd, 1);
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
> +
> +	data = xe_bo_map(fd, bo, bo_size);
> +	memset(data, 0, bo_size);
> +	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +	spin_opts.addr = addr + (char *)&data[0].spin - (char *)data;
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> +				spin_opts.addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +	data[0].vm_sync = 0;
> +
> +	spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
> +	xe_spin_init(&data[0].spin, &spin_opts);
> +	sync[0].addr = addr + (char *)&data[0].exec_sync - (char *)data;
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = spin_opts.addr;
> +	xe_exec(fd, &exec);
> +	xe_spin_wait_started(&data[0].spin);
> +
> +	xe_spin_end(&data[0].spin);
> +	xe_wait_ufence(fd, &data[0].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -460,6 +532,9 @@ igt_main
>  	igt_subtest("non-blocking")
>  		non_block(fd, EWOULDBLOCK);
>  
> +	igt_subtest("lr-with-duration")
> +		lr_with_duration(fd);
> +

How are you verifing it took 30seconds to run?
Also, how are you verifing that it was running during that period?

Regards,
Kamil

>  
>  	igt_fixture
>  		drm_close_driver(fd);
> -- 
> 2.39.1
> 
