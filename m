Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80705C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 07:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2205A10E885;
	Tue, 27 Feb 2024 07:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0oX7VO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C948910E885
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709018668; x=1740554668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qbGVJ5oFmhwPbov8DSeaarfW11cxd43Zlota/d2ZAS4=;
 b=O0oX7VO5ihHKnip+PGXnFqvfwOs7WoOKD9GS9wyMPEMvHfSu2KIaZWhe
 7v5CwZerXUkrHh4BDPiJ/ycD8UkE4g61c4hjucNu4o7kUI/gdt6ZEjrEO
 NgBLx8uWLaqFZaj4RsVDevumYuM+DN2JmTgBBKpmHdZ+OxvBSOCHJm81x
 gVwi8NFRY59/quezY5syJZCAxNejHt4JC7lv+y37PFxS2Fc8oSvAkv2le
 oeCBQic7nWceSQzNQYZn/rj9ATJoBBnlkPJsn7ZMaAQb0H98KvLW09GIr
 m3D3UPpih9KNRekUzMWbQyVa6B/+1eUgwSUl99S2eItHIsWehFHrgFz4/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13896932"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="13896932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 23:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11544181"
Received: from stemerk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.114.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 23:24:27 -0800
Date: Tue, 27 Feb 2024 08:24:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org, janga.rahul.kumar@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Stress test to
 validate long running workload on compute mode
Message-ID: <20240227072424.6vnvpdz3qccqnat4@zkempczy-mobl2>
References: <20240223063430.10135-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240223063430.10135-1-sai.gowtham.ch@intel.com>
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

On Fri, Feb 23, 2024 at 12:04:30PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates long running compute mode by submitting a spinner for 30s
> long.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 73 ++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 7dad71509..0a71bfdc5 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -400,6 +400,76 @@ static void non_block(int fd, int expect)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: lr-stress
> + * Description: Stress LR mode workload for 30s.
> + * Test category: functionality test
> + */
> +static void lr_stress(int fd)
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
> +	struct xe_spin_opts spin_opts = { .preempt = false };
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
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> +				addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +	data[0].vm_sync = 0;
> +
> +	spin_opts.addr = addr + (char *)&data[0].spin - (char *)data;
> +	xe_spin_init(&data[0].spin, &spin_opts);
> +	sync[0].addr = addr + (char *)&data[0].exec_sync - (char *)data;
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = spin_opts.addr;
> +	xe_exec(fd, &exec);
> +	xe_spin_wait_started(&data[0].spin);
> +	sleep(30);

May you prove spinner is still spinning at this point and job is not
killed?

--
Zbigniew

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
> @@ -460,6 +530,9 @@ igt_main
>  	igt_subtest("non-blocking")
>  		non_block(fd, EWOULDBLOCK);
>  
> +	igt_subtest("lr-stress")
> +		lr_stress(fd);
> +
>  
>  	igt_fixture
>  		drm_close_driver(fd);
> -- 
> 2.39.1
> 
