Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E496C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063651131C5;
	Tue, 23 Apr 2024 08:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1BExPRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175421131CC
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713859917; x=1745395917;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ViDt/cKp+1PE0kRzGxi8lnJKKTdJvdvLxPWrGDv46A0=;
 b=k1BExPRH+oz97HM6W1ONW85VDMbXNM3YXcrmnR5jeNpPoILkV8bO/CNT
 nOCWPTjA3+gIGhb5efGkKo2P2bfn8WyEOhbZgY2f6tIMuQb5k3DLuBy0o
 SkoQLYcn6gEF6ok8RBQpuDB9zeX3i9ZhDuWtRGC2BO8Nb/TgtI/lReyRV
 3GRC3jpo/el/qY1xHVbc8UySEC7J8Tb/FcDyXrEDly1hAYzE2/lM9PNjG
 Ek1HFRQ+fzI6CZw79Gk3hsVPyCdmPujpFQ8/uMVnAb9NuU+g8oNIFLtVQ
 Rne9UtBmpOdtB2AyKP0p6bpto6YwlskJ3J8a6y06qENLkMfnNUlMQd3+0 A==;
X-CSE-ConnectionGUID: PCxbKWEvQ12z6XVPV4wPJw==
X-CSE-MsgGUID: 4JTRIGQFR6aX0afQI+QoDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34828799"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="34828799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:11:56 -0700
X-CSE-ConnectionGUID: 2p1PvithQ4WRsFBy8zVPpg==
X-CSE-MsgGUID: zurrcfLxRTi/FtMiLzWdBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29100633"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 01:11:55 -0700
Date: Tue, 23 Apr 2024 10:11:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_evict|exec_threads: Use fd reopen to
 avoid corrupting global data
Message-ID: <20240423081134.qjk4rugiptg7pjio@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240422144713.76025-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422144713.76025-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-04-22 at 16:47:13 +0200, Zbigniew Kempczyński wrote:
> Device scanning and filtering was designed to work in multi-process
> environment. Due to that opening the device with drm_open_driver()
> in multiple threads lead to global device data corruption.
> 
> At the moment there's no easy way to redesign this so simplest thing
> we may do is to just acquire device fd in main process and reopen it
> (this doesn't involve any device scanning) in spawned threads.
> 
> Lets use drm_reopen_driver() to stop calling not thread-safe code.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> ---
> v2: Add reopen in test_evict_cm() (Kamil)
> ---
>  tests/intel/xe_evict.c        | 10 +++++-----
>  tests/intel/xe_exec_threads.c | 22 ++++++++--------------
>  2 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 8ef55211f7..5994ebb142 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -61,7 +61,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  	bo = calloc(n_execs / 2, sizeof(*bo));
>  	igt_assert(bo);
>  
> -	fd = drm_open_driver(DRIVER_XE);
> +	fd = drm_reopen_driver(fd);
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	if (flags & BIND_EXEC_QUEUE)
> @@ -241,7 +241,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  	bo = calloc(n_execs / 2, sizeof(*bo));
>  	igt_assert(bo);
>  
> -	fd = drm_open_driver(DRIVER_XE);
> +	fd = drm_reopen_driver(fd);
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	if (flags & BIND_EXEC_QUEUE)
> @@ -769,21 +769,21 @@ igt_main
>  
>  	for (const struct section *s = sections; s->name; s++) {
>  		igt_subtest_f("evict-%s", s->name)
> -			test_evict(-1, hwe, s->n_exec_queues, s->n_execs,
> +			test_evict(fd, hwe, s->n_exec_queues, s->n_execs,
>  				   calc_bo_size(vram_size, s->mul, s->div),
>  				   s->flags, NULL);
>  	}
>  
>  	for (const struct section_cm *s = sections_cm; s->name; s++) {
>  		igt_subtest_f("evict-%s", s->name)
> -			test_evict_cm(-1, hwe, s->n_exec_queues, s->n_execs,
> +			test_evict_cm(fd, hwe, s->n_exec_queues, s->n_execs,
>  				      calc_bo_size(vram_size, s->mul, s->div),
>  				      s->flags, NULL);
>  	}
>  
>  	for (const struct section_threads *s = sections_threads; s->name; s++) {
>  		igt_subtest_f("evict-%s", s->name)
> -			threads(-1, hwe, s->n_threads, s->n_exec_queues,
> +			threads(fd, hwe, s->n_threads, s->n_exec_queues,
>  				 s->n_execs,
>  				 calc_bo_size(vram_size, s->mul, s->div),
>  				 s->flags);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 8083980f90..1e80842b98 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -71,8 +71,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  
> -	if (!fd) {
> -		fd = drm_open_driver(DRIVER_XE);
> +	if (flags & FD) {
> +		fd = drm_reopen_driver(fd);
>  		owns_fd = true;
>  	}
>  
> @@ -273,8 +273,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  
> -	if (!fd) {
> -		fd = drm_open_driver(DRIVER_XE);
> +	if (flags & FD) {
> +		fd = drm_reopen_driver(fd);
>  		owns_fd = true;
>  	}
>  
> @@ -477,8 +477,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  
> -	if (!fd) {
> -		fd = drm_open_driver(DRIVER_XE);
> +	if (flags & FD) {
> +		fd = drm_reopen_driver(fd);
>  		owns_fd = true;
>  	}
>  
> @@ -995,10 +995,7 @@ static void threads(int fd, int flags)
>  #define ADDRESS_SHIFT	39
>  		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>  		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
> -		if (flags & FD)
> -			threads_data[i].fd = 0;
> -		else
> -			threads_data[i].fd = fd;
> +		threads_data[i].fd = fd;
>  		threads_data[i].vm_legacy_mode = vm_legacy_mode;
>  		threads_data[i].vm_compute_mode = vm_compute_mode;
>  		threads_data[i].eci = hwe;
> @@ -1046,10 +1043,7 @@ static void threads(int fd, int flags)
>  						threads_data[i].addr = addr;
>  					threads_data[i].userptr = userptr |
>  						(i << ADDRESS_SHIFT);
> -					if (flags & FD)
> -						threads_data[i].fd = 0;
> -					else
> -						threads_data[i].fd = fd;
> +					threads_data[i].fd = fd;
>  					threads_data[i].gt = gt;
>  					threads_data[i].vm_legacy_mode =
>  						vm_legacy_mode;
> -- 
> 2.34.1
> 
