Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854BBC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 11:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C110F9E4;
	Tue, 19 Mar 2024 11:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dikZkphw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060F810F9E4
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710847258; x=1742383258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XjHsBoTWzmnwW0LSOTR8+wvQdKprXYKAqrBWZ8RYO48=;
 b=dikZkphwBV+/fhrR1GkdThn7aVXwNwsgo6Id5bf4/UD8zak6OgS9UsBP
 iTpxJ9Xus28gJUgVLx686xNidKJLJP5b3WvSyWa+3q1U1y5Iwxh+i90cv
 6vV6HiyF55UbZ7waeG8goY0Y9MJOITbr2ZdgG7sMc4+EnZ+nyKOGmSSOz
 5XsIP1OkoyjE+KsXWa+trlByas5r8bZOdi9vpFZFiQ1CcX7mCRgu9kFjP
 tHvJuudmEPUOJlhvk9TIrUigNEQziWM74zLGOlbcgdCdD/DkUqIZ5MiIZ
 zZN1BKmCzUkFLQjP1FA3MJeqIZYWGepxwGtg/8zOan2/QoDQf3RdpAjPc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16439173"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16439173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="36915658"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:20:56 -0700
Date: Tue, 19 Mar 2024 12:20:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Test to
 validate LR mode
Message-ID: <20240319112054.3jv4j3446t2f4mhd@zkempczy-mobl2>
References: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
 <20240315050438.21245-3-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315050438.21245-3-sai.gowtham.ch@intel.com>
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

On Fri, Mar 15, 2024 at 10:34:38AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test to validate LR mode flag by submitting workload for
> 30's.

First of all test is not working for me:

(xe_exec_compute_mode:12597) CRITICAL: Test assertion failure function lr_mode_workload, file ../tests/intel/xe_exec_compute_mode.c:464:
(xe_exec_compute_mode:12597) CRITICAL: Failed assertion: ts_1 != ts_2
Stack trace:
  #0 ../lib/igt_core.c:2204 __igt_fail_assert()
  #1 ../tests/intel/xe_exec_compute_mode.c:466 lr_mode_workload()
  #2 ../tests/intel/xe_exec_compute_mode.c:536 __igt_unique____real_main476()
  #3 ../tests/intel/xe_exec_compute_mode.c:476 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #6 [_start+0x25]
Subtest lr-mode-workload failed.

More comments below.

> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 76 ++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 7dad71509..7170bc746 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -400,6 +400,79 @@ static void non_block(int fd, int expect)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: lr-mode-workload
> + * Description: Stress LR mode workload for 30s.
> + * Test category: functionality test
> + */
> +static void lr_mode_workload(int fd)
> +{
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync[1] = {
> +		{.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		 .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		 .timeline_value = USER_FENCE_VALUE},
> +	};

What for you're using array here? Just sync is enough;

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

I see no reason to pack everything to data, especially
you're mapping this on gpu. Flattenize this to: spin,
vm_sync and exec_sync. As this is user fence userspace
pointer to it is enough.

> +	struct xe_spin_opts spin_opts;

You may use xe_spin_init_opts() and pass .addr and .write_timestamp
in one line. Apart of this this construction on the stack is error
prone.

> +	struct drm_xe_engine *engine;
> +	size_t bo_size;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bo;
> +	uint32_t ts_1, ts_2;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	bo_size = sizeof(*data);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	engine = xe_engine(fd, 1);
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
> +
> +	data = xe_bo_map(fd, bo, bo_size);

Mapping spin is enough, keep vm_sync and exec_sync away from it.

> +	memset(data, 0, bo_size);
> +	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +	spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;

Why you're using SPIN_DATA as an index if you're interested to have
single spinner here? This is very confusing as SPIN_DATA == 1, so you're
using only one spinner. Apart of this .addr should be equal to addr.

> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +	data[0].vm_sync = 0;

What for is zeroing vm_sync?

> +
> +	spin_opts.write_timestamp = true;
> +	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);

Use xe_spin_init_opts() for less lines.

> +	sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;

This should point to exec_sync.

> +	exec.exec_queue_id = exec_queue;
> +	exec.address = spin_opts.addr;
> +	xe_exec(fd, &exec);
> +	xe_spin_wait_started(&data[SPIN_DATA].spin);
> +	sleep(30);

Use some define, like:

#define LR_SPINNER_TIME 30

> +	ts_1 = data[SPIN_DATA].spin.time_stamp;
> +	sleep(10);


One second is enough.

> +	ts_2 = data[SPIN_DATA].spin.time_stamp;
> +	xe_spin_end(&data[SPIN_DATA].spin);
> +	igt_assert(ts_1 != ts_2);

Yes, this assert is essential for the test.

--
Zbigniew

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
> @@ -460,6 +533,9 @@ igt_main
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
