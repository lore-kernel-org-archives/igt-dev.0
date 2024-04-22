Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA462C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 14:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E26112B56;
	Mon, 22 Apr 2024 14:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTqc1+Bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3775112B55
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713795606; x=1745331606;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=vfz2fT9HpOUU51ssgfUh0u3CUz8uYgb43Swf8N3Bpak=;
 b=dTqc1+Bxw/m2mPKKlZLhm14qCPtaEWpTGmB5DJKdHyE+g6VQpD8ZH684
 rwJdKynsx5so3bYlqGm++xlp2qoce1kGnWP6kroOh+JjqW19653Wi/l6h
 6L1tK5SwUSkMuSZw28IfEn0l8/EU+TeD0Py98gh0d/H7BrXBT65N0ODrH
 FgF58l6hcDagOifbyP79WVXemxIdfCYYi7Wd8AU/POtczudmAJZsk8Q+j
 v7h1lIHChGw1ad8MmBXnvt1v25PJKmUbQLFNKsxcWTjs8IKjmS2FJ94sH
 WCCqfA7x9QJ/29KnDXiSyo2TRCsl0kWvaWE1TJI/0hf5EmF/rGrdlk1fz g==;
X-CSE-ConnectionGUID: NVOMiBgOQMqfiJv4dmvphw==
X-CSE-MsgGUID: /QkTxhhCRSGuqqPCezZWgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9503318"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9503318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:20:06 -0700
X-CSE-ConnectionGUID: OAEsBTCJSXy3b0qI5L2puw==
X-CSE-MsgGUID: Ijx/xGVHQ8CXJzZYX+DtmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23905128"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:20:02 -0700
Date: Mon, 22 Apr 2024 16:19:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_evict|exec_threads: Use fd reopen to
 avoid corrupting global data
Message-ID: <20240422141956.u73ix5hsdqpfbre2@zkempczy-mobl2>
References: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
 <20240422135604.fewegl3adby56fk2@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422135604.fewegl3adby56fk2@kamilkon-DESK.igk.intel.com>
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

On Mon, Apr 22, 2024 at 03:56:04PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2024-04-17 at 16:26:07 +0200, Zbigniew Kempczyński wrote:
> > Device scanning and filtering was designed to work in multi-process
> > environment. Due to that opening the device with drm_open_driver()
> > in multiple threads lead to global device data corruption.
> > 
> > At the moment there's no easy way to redesign this so simplest thing
> > we may do is to just acquire device fd in main process and reopen it
> > (this doesn't involve any device scanning) in spawned threads.
> > 
> > Lets use drm_reopen_driver() to stop calling not thread-safe code.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_evict.c        |  8 ++++----
> >  tests/intel/xe_exec_threads.c | 22 ++++++++--------------
> >  2 files changed, 12 insertions(+), 18 deletions(-)
> > 
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> > index 8ef55211f7..9b97cccab2 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -61,7 +61,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> >  	bo = calloc(n_execs / 2, sizeof(*bo));
> >  	igt_assert(bo);
> >  
> > -	fd = drm_open_driver(DRIVER_XE);
> > +	fd = drm_reopen_driver(fd);
> >  
> 
> I checked xe_evict again just to be sure and there are
> two opens (not counting one from fixture):
> grep -n open_driver tests/intel/xe_evict.c
> 64:     fd = drm_reopen_driver(fd);
> 244:    fd = drm_open_driver(DRIVER_XE);
> 
> imho that second one could also be called in multi-threaded version
> from thread() function, so line 244 should also be fixed into reopen.
> 
> You can keep my r-b with fixed version.

Eh, good catch. I'll fix it and resend.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> >  	vm = xe_vm_create(fd, 0, 0);
> >  	if (flags & BIND_EXEC_QUEUE)
> > @@ -769,21 +769,21 @@ igt_main
> >  
> >  	for (const struct section *s = sections; s->name; s++) {
> >  		igt_subtest_f("evict-%s", s->name)
> > -			test_evict(-1, hwe, s->n_exec_queues, s->n_execs,
> > +			test_evict(fd, hwe, s->n_exec_queues, s->n_execs,
> >  				   calc_bo_size(vram_size, s->mul, s->div),
> >  				   s->flags, NULL);
> >  	}
> >  
> >  	for (const struct section_cm *s = sections_cm; s->name; s++) {
> >  		igt_subtest_f("evict-%s", s->name)
> > -			test_evict_cm(-1, hwe, s->n_exec_queues, s->n_execs,
> > +			test_evict_cm(fd, hwe, s->n_exec_queues, s->n_execs,
> >  				      calc_bo_size(vram_size, s->mul, s->div),
> >  				      s->flags, NULL);
> >  	}
> >  
> >  	for (const struct section_threads *s = sections_threads; s->name; s++) {
> >  		igt_subtest_f("evict-%s", s->name)
> > -			threads(-1, hwe, s->n_threads, s->n_exec_queues,
> > +			threads(fd, hwe, s->n_threads, s->n_exec_queues,
> >  				 s->n_execs,
> >  				 calc_bo_size(vram_size, s->mul, s->div),
> >  				 s->flags);
> > diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> > index 8083980f90..1e80842b98 100644
> > --- a/tests/intel/xe_exec_threads.c
> > +++ b/tests/intel/xe_exec_threads.c
> > @@ -71,8 +71,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  
> > -	if (!fd) {
> > -		fd = drm_open_driver(DRIVER_XE);
> > +	if (flags & FD) {
> > +		fd = drm_reopen_driver(fd);
> >  		owns_fd = true;
> >  	}
> >  
> > @@ -273,8 +273,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  
> > -	if (!fd) {
> > -		fd = drm_open_driver(DRIVER_XE);
> > +	if (flags & FD) {
> > +		fd = drm_reopen_driver(fd);
> >  		owns_fd = true;
> >  	}
> >  
> > @@ -477,8 +477,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> >  
> >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> >  
> > -	if (!fd) {
> > -		fd = drm_open_driver(DRIVER_XE);
> > +	if (flags & FD) {
> > +		fd = drm_reopen_driver(fd);
> >  		owns_fd = true;
> >  	}
> >  
> > @@ -995,10 +995,7 @@ static void threads(int fd, int flags)
> >  #define ADDRESS_SHIFT	39
> >  		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
> >  		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
> > -		if (flags & FD)
> > -			threads_data[i].fd = 0;
> > -		else
> > -			threads_data[i].fd = fd;
> > +		threads_data[i].fd = fd;
> >  		threads_data[i].vm_legacy_mode = vm_legacy_mode;
> >  		threads_data[i].vm_compute_mode = vm_compute_mode;
> >  		threads_data[i].eci = hwe;
> > @@ -1046,10 +1043,7 @@ static void threads(int fd, int flags)
> >  						threads_data[i].addr = addr;
> >  					threads_data[i].userptr = userptr |
> >  						(i << ADDRESS_SHIFT);
> > -					if (flags & FD)
> > -						threads_data[i].fd = 0;
> > -					else
> > -						threads_data[i].fd = fd;
> > +					threads_data[i].fd = fd;
> >  					threads_data[i].gt = gt;
> >  					threads_data[i].vm_legacy_mode =
> >  						vm_legacy_mode;
> > -- 
> > 2.34.1
> > 
