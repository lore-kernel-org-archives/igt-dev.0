Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FC6C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 13:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8F112B09;
	Mon, 22 Apr 2024 13:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPbTdtup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C35D112B08
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713794182; x=1745330182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q3QTqU4NH2bw3vcoNW8jj0l67Ou7wMjFVt7C2E02Jm4=;
 b=fPbTdtup+6Srt9O8qyZZ7KNRNSJl6WTR2e7BndZTld9k4tf/PKksog13
 UqHY9oSthrVUhnYJnHkQBJpqTdOAR8dlhc6692UWQRT2HZrW5w1KR1Bwa
 MWQL9jnDaSk5cbk5Oq07GxeBkerWBKbY/34c7U2FkRZJDA0+SoTJUOmUh
 JSgb0yRWlHm4cmu51pLehYrYXUamzGANduNi50BwaUEmOFfiR+7OY+v6B
 rdKiMJIsPhSEMQwwGaM/+1lf/R8AM0a9Sx9RZoWB+vjcuhtUz/1wm7yp7
 dMgarlSXXFq+UDYEsd2yFkNVSSFbjtTQuLhSCBAbjE24ldWvq1gSr5CI5 g==;
X-CSE-ConnectionGUID: 4FbjRL8NQl+/DuqDM08S6g==
X-CSE-MsgGUID: ZdPD11uFQxiwB+hE3n1ArA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9199517"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9199517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 06:56:22 -0700
X-CSE-ConnectionGUID: oZP4dLwaQyWMn9Y7/Kt/xw==
X-CSE-MsgGUID: ouHg9BqVQIiiGO2Fl4Gtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24072642"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 06:56:21 -0700
Date: Mon, 22 Apr 2024 15:56:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_evict|exec_threads: Use fd reopen to
 avoid corrupting global data
Message-ID: <20240422135604.fewegl3adby56fk2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
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
On 2024-04-17 at 16:26:07 +0200, Zbigniew Kempczyński wrote:
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
> ---
>  tests/intel/xe_evict.c        |  8 ++++----
>  tests/intel/xe_exec_threads.c | 22 ++++++++--------------
>  2 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 8ef55211f7..9b97cccab2 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -61,7 +61,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  	bo = calloc(n_execs / 2, sizeof(*bo));
>  	igt_assert(bo);
>  
> -	fd = drm_open_driver(DRIVER_XE);
> +	fd = drm_reopen_driver(fd);
>  

I checked xe_evict again just to be sure and there are
two opens (not counting one from fixture):
grep -n open_driver tests/intel/xe_evict.c
64:     fd = drm_reopen_driver(fd);
244:    fd = drm_open_driver(DRIVER_XE);

imho that second one could also be called in multi-threaded version
from thread() function, so line 244 should also be fixed into reopen.

You can keep my r-b with fixed version.

Regards,
Kamil

>  	vm = xe_vm_create(fd, 0, 0);
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
